(define-module (guile-libinput-package)
  #:use-module (guile-bytestructure-class-package)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages gettext)
  #:use-module (guix gexp)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages freedesktop))

(define-public guile-libinput
  (package
    (name "guile-libinput")
    (version "git")
    (source (local-file "../.." "guile-libinput-checkout"
                        #:recursive? #t
                        #:select? (or (git-predicate
                                       (string-append
                                        (current-source-directory)
                                        "/../.."))
                                      (const #t))))
    (build-system gnu-build-system)
    (arguments
     (list #:make-flags #~(list "GUILE_AUTO_COMPILE=0")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-extension-path
                 (lambda* (#:key outputs #:allow-other-keys)
                   (substitute* (find-files "." "\\.scm")
                     (("\\(load-extension \"libguile_libinput\" *\"(.*)\"\\)" _ o)
                      (string-append
                       (object->string
                        `(or (false-if-exception
                              (load-extension "libguile_libinput" ,o))
                             (load-extension
                              ,(string-append
                                #$output
                                "/lib/libguile_libinput.so")
                              ,o)))))))))))
    (native-inputs
     (list autoconf automake
           pkg-config
           libtool
           guile-3.0-latest))
    (inputs (list guile-3.0-latest libinput))
    (propagated-inputs
     (list
      guile-bytestructure-class
      guile-bytestructures))
    (synopsis "")
    (description "")
    (home-page "")
    (license license:gpl3+)))

guile-libinput
