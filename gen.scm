#!/usr/bin/env -S guile --no-auto-compile -e main
!#
(use-modules
 (ice-9 textual-ports)
 (ice-9 pretty-print)
 (ice-9 match)
 (ice-9 popen)
 (ice-9 string-fun)
 (srfi srfi-1)
 (srfi srfi-71)
 (srfi srfi-26)
 (oop goops))

(define c2ffi-program
  (make-parameter "c2ffi"))


(define (handle-arg x)
  (match (typedef-remap (syntax->datum x))
    (':void #'ffi:void)
    ((':pointer ':char)
     #''*)
    ((':pointer ':void)
     #''*)
    ((':pointer _)
     #''*)
    (':function-pointer
     #''*)
    ((':enum _)
     #'ffi:int)
    ((':array _ _)
     #''*)
    (':int #'ffi:int)
    (':unsigned-int #'ffi:unsigned-int)
    (':double #'ffi:double)
    ('int32_t #'ffi:int32)
    ('uint32_t #'ffi:uint32)
    ('uint64_t #'ffi:uint64)
    ('size_t #'ffi:size_t)
    (else (error "handle-arg" x))))

(define (handle-arg/bs x)
  (match (typedef-remap (syntax->datum x))
    ('uint32_t #'uint32)
    ('uint64_t #'uint64)
    (':void #'void)
    ((':pointer ':char)
     #'cstring-pointer*)
    ((':pointer ':void)
     #'(bs:pointer 'void))
    ((':pointer ((or 'struct ':struct) (find-scm-struct o)))
     #'(bs:pointer o))
    (':function-pointer
     #'(bs:pointer '*))
    ((':array arg length)
     (datum->syntax
      x
      `(bs:vector ,length ,(handle-arg/bs (datum->syntax x arg)) )))
    ((':enum _)
     #'int32)
    (':int #'int)
    (':float #'float)
    (':unsigned-int #'unsigned-int)

    ('size_t #'size_t)
    (else (error "handle-arg/bs" x))
    ))



(define-method (_->- (v <string>))
  (string-replace-substring v "_" "-"))
(define-method (_->- (v <symbol>))
  (string->symbol (_->- (symbol->string v))))
(define (hand x proc)
  (datum->syntax
   x
   (proc (syntax->datum x))))


(define* (make-bytestructure-class name #:optional fields)
  (define* (make-bs:struct #:optional fields)
    (if fields
        (with-syntax ((((name value) ...)
                       (map (lambda (a) `(,(first a) ,(handle-arg/bs (second a))))
                            fields)))
          #`(bs:struct `((name ,value) ...)))
        #'(bs:unknow)))
  (let ((base-name (hand name _->-)))
    (with-syntax ((%name (hand base-name (cut symbol-append '% <> '-struct)))
                  (class-name (hand base-name (cut symbol-append '< <> '>) ))
                  (wrap (hand base-name (cut symbol-append 'wrap- <>)))
                  (unwrap (hand base-name (cut symbol-append 'unwrap- <>)))
                  (is? (hand base-name (cut symbol-append <> '?))))
      #`(begin (define-public %name #,(make-bs:struct fields))
               (define-bytestructure-class class-name ()
                 %name wrap unwrap is?
                 #,@(if fields
                        (map (lambda (a)
                               (let* ((v (syntax->datum (car a)))
                                      (accessor (symbol-append '. v)))

                                 (datum->syntax
                                  (car a)
                                  (list v
                                        #:init-keyword
                                        (symbol->keyword v)
                                        #:accessor
                                        accessor)))
                               )
                             fields)
                        #'()))
               #,@(if fields
                      (list (cons #'export
                                  (map
                                   (lambda (a)
                                     (hand (car a)
                                           (cut symbol-append '. <>)))
                                   fields)))
                      #'())))))

(define (make-%enum-name o)
  ((compose _->- (cut symbol-append '% <> '-enum)) o))
(define %struct-table (make-hash-table 100))
(define (add-struct name scm-name)
  (hashq-set! %struct-table name scm-name))
(define (find-scm-struct name)
  (hashq-ref %struct-table name))

(define (find-wrap name)
  (and=> (find-scm-struct name) (cut symbol-append 'wrap- <>)))

(define (find-unwrap name)
  (and=> (find-scm-struct name) (cut symbol-append 'unwrap- <>)))

(define (unwrap-arg n x)
  (define o (match (typedef-remap (syntax->datum x))
              ((':pointer ':char)
               #'ffi:string->pointer)
              ((or 'size_t
                   'uint32_t
                   ':int
                   ':unsigned-int
                   ':void
                   ':function-pointer
                   ':double)
               #f)
              ((':pointer ':void) #f)
              ((':pointer ((or 'struct ':struct) o))
               (datum->syntax
                x
                (find-unwrap o)))
              ((':pointer o)
               #f)
              ((':array type length)
               (datum->syntax
                x
                `(lambda (a)
                   (ffi:bytevector->pointer
                    (bytestructure-bytevector
                     (bytestructure
                      (bs:vector ,length
                                 ,(handle-arg/bs
                                   (datum->syntax x type)))

                      (cond ((vector? a) a)
                            ((list? a) (list->vector a)))))))))
              ((':enum name)
               (datum->syntax
                x
                (symbol-append (make-%enum-name name) '->number)))
              (else (error "unwrap-arg" x))))
  (if o (list o n) n))

(define (wrap-arg n type)
  (define wrap-func (match (typedef-remap (syntax->datum type))
                      (':void #f)
                      ((':pointer ':char)
                       #'pointer->string*)
                      ((':pointer ((or 'struct ':struct) o))
                       (datum->syntax
                        type
                        (find-wrap o)))
                      (o #f)))
  (if wrap-func
      (list wrap-func n)
      n))

;; typedef
(define %typedef-table (make-hash-table 20))

(define (typedef-remap o)
  (hashq-ref %typedef-table o o))

(define (add-typedef name v)
  (hashq-set! %typedef-table name v))

(define (handle-f x)
  (syntax-case x (struct enum function typedef extern)
    ((struct <name>)

     (begin (add-struct (syntax->datum #'<name>) (_->- (syntax->datum #'<name>)))
            (make-bytestructure-class #'<name>)))

    ((struct <name> (<entry-name> <entry-value>) ...)

     (begin (add-struct (syntax->datum #'<name>)
                        (_->- (syntax->datum #'<name>) ))
            (make-bytestructure-class #'<name>
                                      #'((<entry-name> <entry-value>) ...))))
    ((enum <enum-name> (<entry-name> <entry-value>) ...)
     (with-syntax ((<scm-enum-name> (hand #'<enum-name> make-%enum-name)))
       (with-syntax ((<->num> (hand #'<scm-enum-name>
                                    (cut symbol-append <> '->number))))
         #'(begin (define-public <scm-enum-name>
                    (bs:enum '((<entry-name> <entry-value>) ...)))
                  (define-public <entry-name> <entry-value>) ...
                  (define-public (<->num> o)
                    (bs:enum->integer <scm-enum-name> o))))))

    ((function <name> ((s-name type) ...) return>)
     (with-syntax ((func-name (hand #'<name> (compose _->- string->symbol)))
                   ((ffi:args ...) (map handle-arg #'(type ...)))
                   (ffi:return (handle-arg #'return>))
                   ((handle-args ...) (map (lambda (o)
                                             (apply unwrap-arg o))
                                           #'((s-name type) ...))  ))
       #`(define-public func-name
           (let ((%func (ffi:pointer->procedure
                         ffi:return (dynamic-func <name> (force %libinput))
                         (list ffi:args ...))))
             (lambda (s-name ...)
               #,(wrap-arg #'(%func handle-args ...) #'return>))))))

    ((function f-name ((s-name type) ...) return :variadic)
     #f)
    ((function f-name ((type) ...) return)
     #f)

    ((typedef o f)
     (begin (add-typedef (syntax->datum #'o) (syntax->datum #'f))
            (with-syntax ((ff (handle-arg/bs #'f)))
              #'(define-public o ff))))
    ((extern o ...)
     #f)))

(define-method (prefix? (s <string>) (s2 <string>))
  (string-prefix? s s2))
(define-method (prefix? s (s2 <symbol>))
  (prefix? s (symbol->string s2)))

(define (main- port)
  (define out (let loop ((value (read-syntax port))
                         (out '()))
                (if (eof-object? value)
                    (reverse out)

                    (loop (read-syntax port)
                          (if (let ((name (second (syntax->datum value))))
                                (prefix? "libinput" name))
                              (cons (handle-f value) out)
                              out)))))
  (close-port port)
  out)

(define* (main self #:optional
               (file "/gnu/store/5zvwpqwlgxfi317ly8v52irbvjdhc1np-libinput-1.19.4/include/libinput.h")
               #:rest arg)
  (pretty-print `(define-module (libinput)
                   #:use-module (bytestructure-class)
                   #:use-module ((system foreign) #:prefix ffi:)
                   #:use-module (bytestructures guile)
                   #:use-module (oop goops)
                   #:use-module (libinput config)))
  (pretty-print `(define (pointer->string* ptr)
                   (if (ffi:null-pointer? ptr)
                       #f
                       (ffi:pointer->string ptr))))
  (for-each (lambda (o)
              (when o
                (pretty-print (syntax->datum o))))
            (parameterize ((current-error-port (%make-void-port "w")))
              (let ((port (open-pipe*
                           OPEN_READ
                           (c2ffi-program) "-D" "sexp" file)))
                (set-port-filename! port #f)
                (main- port)))))
