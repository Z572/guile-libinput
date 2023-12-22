;;; maybe need sudo

(use-modules (libinput)
             (oop goops)
             (system foreign ))

(let (( li (libinput-path-create-context
            (lambda (path flags)
              (pk 'open path (open-fdes path flags))
              )
            (lambda (fd)
              (pk fd 'close-restricted)
              (close-fdes fd)))))
  (libinput-path-add-device li "/dev/input/event3")
  (while #t
    (libinput-dispatch li)
    (let ((event (libinput-get-event li)))
      (when event
        (let ((x (libinput-event-get-type event)))
          (when (equal? x 'LIBINPUT_EVENT_KEYBOARD_KEY)
            (pk
             (libinput-event-keyboard-get-key
              (libinput-event-get-keyboard-event event))))
          (when (equal? x 'LIBINPUT_EVENT_POINTER_BUTTON)
            (exit 1)))))))
