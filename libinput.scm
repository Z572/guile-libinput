(define-module (libinput)
  #:use-module (bytestructure-class)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (system foreign-library)
  #:use-module (bytestructures guile)
  #:use-module (oop goops)
  #:use-module (rnrs base)
  #:use-module (libinput config))

(load-extension "libguile_libinput" "init_libinput")
(define-syntax define-libinput-procedure
  (lambda (x)
    (syntax-case x ()
      ((_ (name args ...) (c-return c-name c-args) body ...)
       (with-syntax ((% (datum->syntax x '%)))
         (syntax
          (define-public name
            (let ((% (ffi:pointer->procedure
                      c-return
                      (dynamic-func c-name (force %libinput))
                      c-args)))
              (lambda* (args ...) body ...)))))))))
(define (pointer->string* ptr)
  (if (ffi:null-pointer? ptr) #f (ffi:pointer->string ptr)))
(define non-zero? (negate zero?))
(begin
  (define-public %libinput-struct (bs:unknow))
  (define-bytestructure-class
    <libinput>
    ()
    %libinput-struct
    wrap-libinput
    unwrap-libinput
    libinput?))
(begin
  (define-public %libinput-device-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-device>
    ()
    %libinput-device-struct
    wrap-libinput-device
    unwrap-libinput-device
    libinput-device?))
(begin
  (define-public %libinput-device-group-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-device-group>
    ()
    %libinput-device-group-struct
    wrap-libinput-device-group
    unwrap-libinput-device-group
    libinput-device-group?))
(begin
  (define-public %libinput-seat-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-seat>
    ()
    %libinput-seat-struct
    wrap-libinput-seat
    unwrap-libinput-seat
    libinput-seat?))
(begin
  (define-public %libinput-tablet-tool-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-tablet-tool>
    ()
    %libinput-tablet-tool-struct
    wrap-libinput-tablet-tool
    unwrap-libinput-tablet-tool
    libinput-tablet-tool?))
(begin
  (define-public %libinput-event-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event>
    ()
    %libinput-event-struct
    wrap-libinput-event
    unwrap-libinput-event
    libinput-event?))
(begin
  (define-public %libinput-event-device-notify-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-device-notify>
    ()
    %libinput-event-device-notify-struct
    wrap-libinput-event-device-notify
    unwrap-libinput-event-device-notify
    libinput-event-device-notify?))
(begin
  (define-public %libinput-event-keyboard-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-keyboard>
    ()
    %libinput-event-keyboard-struct
    wrap-libinput-event-keyboard
    unwrap-libinput-event-keyboard
    libinput-event-keyboard?))
(begin
  (define-public %libinput-event-pointer-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-pointer>
    ()
    %libinput-event-pointer-struct
    wrap-libinput-event-pointer
    unwrap-libinput-event-pointer
    libinput-event-pointer?))
(begin
  (define-public %libinput-event-touch-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-touch>
    ()
    %libinput-event-touch-struct
    wrap-libinput-event-touch
    unwrap-libinput-event-touch
    libinput-event-touch?))
(begin
  (define-public %libinput-event-tablet-tool-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-tablet-tool>
    ()
    %libinput-event-tablet-tool-struct
    wrap-libinput-event-tablet-tool
    unwrap-libinput-event-tablet-tool
    libinput-event-tablet-tool?))
(begin
  (define-public %libinput-event-tablet-pad-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-tablet-pad>
    ()
    %libinput-event-tablet-pad-struct
    wrap-libinput-event-tablet-pad
    unwrap-libinput-event-tablet-pad
    libinput-event-tablet-pad?))
(begin
  (define-public %libinput-log-priority-enum
    (bs:enum
      '((LIBINPUT_LOG_PRIORITY_DEBUG 10)
        (LIBINPUT_LOG_PRIORITY_INFO 20)
        (LIBINPUT_LOG_PRIORITY_ERROR 30))))
  (define-public LIBINPUT_LOG_PRIORITY_DEBUG 10)
  (define-public LIBINPUT_LOG_PRIORITY_INFO 20)
  (define-public LIBINPUT_LOG_PRIORITY_ERROR 30)
  (define-public (number->%libinput-log-priority-enum o)
    (or (assq-ref
          '((10 . LIBINPUT_LOG_PRIORITY_DEBUG)
            (20 . LIBINPUT_LOG_PRIORITY_INFO)
            (30 . LIBINPUT_LOG_PRIORITY_ERROR))
          o)
        (error "not found" '%libinput-log-priority-enum o)))
  (define-public (%libinput-log-priority-enum->number o)
    (bs:enum->integer %libinput-log-priority-enum o)))
(begin
  (define-public %libinput-device-capability-enum
    (bs:enum
      '((LIBINPUT_DEVICE_CAP_KEYBOARD 0)
        (LIBINPUT_DEVICE_CAP_POINTER 1)
        (LIBINPUT_DEVICE_CAP_TOUCH 2)
        (LIBINPUT_DEVICE_CAP_TABLET_TOOL 3)
        (LIBINPUT_DEVICE_CAP_TABLET_PAD 4)
        (LIBINPUT_DEVICE_CAP_GESTURE 5)
        (LIBINPUT_DEVICE_CAP_SWITCH 6))))
  (define-public LIBINPUT_DEVICE_CAP_KEYBOARD 0)
  (define-public LIBINPUT_DEVICE_CAP_POINTER 1)
  (define-public LIBINPUT_DEVICE_CAP_TOUCH 2)
  (define-public LIBINPUT_DEVICE_CAP_TABLET_TOOL 3)
  (define-public LIBINPUT_DEVICE_CAP_TABLET_PAD 4)
  (define-public LIBINPUT_DEVICE_CAP_GESTURE 5)
  (define-public LIBINPUT_DEVICE_CAP_SWITCH 6)
  (define-public (number->%libinput-device-capability-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_DEVICE_CAP_KEYBOARD)
            (1 . LIBINPUT_DEVICE_CAP_POINTER)
            (2 . LIBINPUT_DEVICE_CAP_TOUCH)
            (3 . LIBINPUT_DEVICE_CAP_TABLET_TOOL)
            (4 . LIBINPUT_DEVICE_CAP_TABLET_PAD)
            (5 . LIBINPUT_DEVICE_CAP_GESTURE)
            (6 . LIBINPUT_DEVICE_CAP_SWITCH))
          o)
        (error "not found" '%libinput-device-capability-enum o)))
  (define-public (%libinput-device-capability-enum->number o)
    (bs:enum->integer %libinput-device-capability-enum o)))
(begin
  (define-public %libinput-key-state-enum
    (bs:enum
      '((LIBINPUT_KEY_STATE_RELEASED 0) (LIBINPUT_KEY_STATE_PRESSED 1))))
  (define-public LIBINPUT_KEY_STATE_RELEASED 0)
  (define-public LIBINPUT_KEY_STATE_PRESSED 1)
  (define-public (number->%libinput-key-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_KEY_STATE_RELEASED) (1 . LIBINPUT_KEY_STATE_PRESSED))
          o)
        (error "not found" '%libinput-key-state-enum o)))
  (define-public (%libinput-key-state-enum->number o)
    (bs:enum->integer %libinput-key-state-enum o)))
(begin
  (define-public %libinput-led-enum
    (bs:enum
      '((LIBINPUT_LED_NUM_LOCK 1)
        (LIBINPUT_LED_CAPS_LOCK 2)
        (LIBINPUT_LED_SCROLL_LOCK 4))))
  (define-public LIBINPUT_LED_NUM_LOCK 1)
  (define-public LIBINPUT_LED_CAPS_LOCK 2)
  (define-public LIBINPUT_LED_SCROLL_LOCK 4)
  (define-public (number->%libinput-led-enum o)
    (or (assq-ref
          '((1 . LIBINPUT_LED_NUM_LOCK)
            (2 . LIBINPUT_LED_CAPS_LOCK)
            (4 . LIBINPUT_LED_SCROLL_LOCK))
          o)
        (error "not found" '%libinput-led-enum o)))
  (define-public (%libinput-led-enum->number o)
    (bs:enum->integer %libinput-led-enum o)))
(begin
  (define-public %libinput-button-state-enum
    (bs:enum
      '((LIBINPUT_BUTTON_STATE_RELEASED 0) (LIBINPUT_BUTTON_STATE_PRESSED 1))))
  (define-public LIBINPUT_BUTTON_STATE_RELEASED 0)
  (define-public LIBINPUT_BUTTON_STATE_PRESSED 1)
  (define-public (number->%libinput-button-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_BUTTON_STATE_RELEASED)
            (1 . LIBINPUT_BUTTON_STATE_PRESSED))
          o)
        (error "not found" '%libinput-button-state-enum o)))
  (define-public (%libinput-button-state-enum->number o)
    (bs:enum->integer %libinput-button-state-enum o)))
(begin
  (define-public %libinput-pointer-axis-enum
    (bs:enum
      '((LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL 0)
        (LIBINPUT_POINTER_AXIS_SCROLL_HORIZONTAL 1))))
  (define-public LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL 0)
  (define-public LIBINPUT_POINTER_AXIS_SCROLL_HORIZONTAL 1)
  (define-public (number->%libinput-pointer-axis-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL)
            (1 . LIBINPUT_POINTER_AXIS_SCROLL_HORIZONTAL))
          o)
        (error "not found" '%libinput-pointer-axis-enum o)))
  (define-public (%libinput-pointer-axis-enum->number o)
    (bs:enum->integer %libinput-pointer-axis-enum o)))
(begin
  (define-public %libinput-pointer-axis-source-enum
    (bs:enum
      '((LIBINPUT_POINTER_AXIS_SOURCE_WHEEL 1)
        (LIBINPUT_POINTER_AXIS_SOURCE_FINGER 2)
        (LIBINPUT_POINTER_AXIS_SOURCE_CONTINUOUS 3)
        (LIBINPUT_POINTER_AXIS_SOURCE_WHEEL_TILT 4))))
  (define-public LIBINPUT_POINTER_AXIS_SOURCE_WHEEL 1)
  (define-public LIBINPUT_POINTER_AXIS_SOURCE_FINGER 2)
  (define-public LIBINPUT_POINTER_AXIS_SOURCE_CONTINUOUS 3)
  (define-public LIBINPUT_POINTER_AXIS_SOURCE_WHEEL_TILT 4)
  (define-public (number->%libinput-pointer-axis-source-enum o)
    (or (assq-ref
          '((1 . LIBINPUT_POINTER_AXIS_SOURCE_WHEEL)
            (2 . LIBINPUT_POINTER_AXIS_SOURCE_FINGER)
            (3 . LIBINPUT_POINTER_AXIS_SOURCE_CONTINUOUS)
            (4 . LIBINPUT_POINTER_AXIS_SOURCE_WHEEL_TILT))
          o)
        (error "not found" '%libinput-pointer-axis-source-enum o)))
  (define-public (%libinput-pointer-axis-source-enum->number o)
    (bs:enum->integer %libinput-pointer-axis-source-enum o)))
(begin
  (define-public %libinput-tablet-pad-ring-axis-source-enum
    (bs:enum
      '((LIBINPUT_TABLET_PAD_RING_SOURCE_UNKNOWN 1)
        (LIBINPUT_TABLET_PAD_RING_SOURCE_FINGER 2))))
  (define-public LIBINPUT_TABLET_PAD_RING_SOURCE_UNKNOWN 1)
  (define-public LIBINPUT_TABLET_PAD_RING_SOURCE_FINGER 2)
  (define-public (number->%libinput-tablet-pad-ring-axis-source-enum o)
    (or (assq-ref
          '((1 . LIBINPUT_TABLET_PAD_RING_SOURCE_UNKNOWN)
            (2 . LIBINPUT_TABLET_PAD_RING_SOURCE_FINGER))
          o)
        (error "not found" '%libinput-tablet-pad-ring-axis-source-enum o)))
  (define-public (%libinput-tablet-pad-ring-axis-source-enum->number o)
    (bs:enum->integer %libinput-tablet-pad-ring-axis-source-enum o)))
(begin
  (define-public %libinput-tablet-pad-strip-axis-source-enum
    (bs:enum
      '((LIBINPUT_TABLET_PAD_STRIP_SOURCE_UNKNOWN 1)
        (LIBINPUT_TABLET_PAD_STRIP_SOURCE_FINGER 2))))
  (define-public LIBINPUT_TABLET_PAD_STRIP_SOURCE_UNKNOWN 1)
  (define-public LIBINPUT_TABLET_PAD_STRIP_SOURCE_FINGER 2)
  (define-public (number->%libinput-tablet-pad-strip-axis-source-enum o)
    (or (assq-ref
          '((1 . LIBINPUT_TABLET_PAD_STRIP_SOURCE_UNKNOWN)
            (2 . LIBINPUT_TABLET_PAD_STRIP_SOURCE_FINGER))
          o)
        (error "not found" '%libinput-tablet-pad-strip-axis-source-enum o)))
  (define-public (%libinput-tablet-pad-strip-axis-source-enum->number o)
    (bs:enum->integer %libinput-tablet-pad-strip-axis-source-enum o)))
(begin
  (define-public %libinput-tablet-tool-type-enum
    (bs:enum
      '((LIBINPUT_TABLET_TOOL_TYPE_PEN 1)
        (LIBINPUT_TABLET_TOOL_TYPE_ERASER 2)
        (LIBINPUT_TABLET_TOOL_TYPE_BRUSH 3)
        (LIBINPUT_TABLET_TOOL_TYPE_PENCIL 4)
        (LIBINPUT_TABLET_TOOL_TYPE_AIRBRUSH 5)
        (LIBINPUT_TABLET_TOOL_TYPE_MOUSE 6)
        (LIBINPUT_TABLET_TOOL_TYPE_LENS 7)
        (LIBINPUT_TABLET_TOOL_TYPE_TOTEM 8))))
  (define-public LIBINPUT_TABLET_TOOL_TYPE_PEN 1)
  (define-public LIBINPUT_TABLET_TOOL_TYPE_ERASER 2)
  (define-public LIBINPUT_TABLET_TOOL_TYPE_BRUSH 3)
  (define-public LIBINPUT_TABLET_TOOL_TYPE_PENCIL 4)
  (define-public LIBINPUT_TABLET_TOOL_TYPE_AIRBRUSH 5)
  (define-public LIBINPUT_TABLET_TOOL_TYPE_MOUSE 6)
  (define-public LIBINPUT_TABLET_TOOL_TYPE_LENS 7)
  (define-public LIBINPUT_TABLET_TOOL_TYPE_TOTEM 8)
  (define-public (number->%libinput-tablet-tool-type-enum o)
    (or (assq-ref
          '((1 . LIBINPUT_TABLET_TOOL_TYPE_PEN)
            (2 . LIBINPUT_TABLET_TOOL_TYPE_ERASER)
            (3 . LIBINPUT_TABLET_TOOL_TYPE_BRUSH)
            (4 . LIBINPUT_TABLET_TOOL_TYPE_PENCIL)
            (5 . LIBINPUT_TABLET_TOOL_TYPE_AIRBRUSH)
            (6 . LIBINPUT_TABLET_TOOL_TYPE_MOUSE)
            (7 . LIBINPUT_TABLET_TOOL_TYPE_LENS)
            (8 . LIBINPUT_TABLET_TOOL_TYPE_TOTEM))
          o)
        (error "not found" '%libinput-tablet-tool-type-enum o)))
  (define-public (%libinput-tablet-tool-type-enum->number o)
    (bs:enum->integer %libinput-tablet-tool-type-enum o)))
(begin
  (define-public %libinput-tablet-tool-proximity-state-enum
    (bs:enum
      '((LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_OUT 0)
        (LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_IN 1))))
  (define-public LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_OUT 0)
  (define-public LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_IN 1)
  (define-public (number->%libinput-tablet-tool-proximity-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_OUT)
            (1 . LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_IN))
          o)
        (error "not found" '%libinput-tablet-tool-proximity-state-enum o)))
  (define-public (%libinput-tablet-tool-proximity-state-enum->number o)
    (bs:enum->integer %libinput-tablet-tool-proximity-state-enum o)))
(begin
  (define-public %libinput-tablet-tool-tip-state-enum
    (bs:enum
      '((LIBINPUT_TABLET_TOOL_TIP_UP 0) (LIBINPUT_TABLET_TOOL_TIP_DOWN 1))))
  (define-public LIBINPUT_TABLET_TOOL_TIP_UP 0)
  (define-public LIBINPUT_TABLET_TOOL_TIP_DOWN 1)
  (define-public (number->%libinput-tablet-tool-tip-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_TABLET_TOOL_TIP_UP)
            (1 . LIBINPUT_TABLET_TOOL_TIP_DOWN))
          o)
        (error "not found" '%libinput-tablet-tool-tip-state-enum o)))
  (define-public (%libinput-tablet-tool-tip-state-enum->number o)
    (bs:enum->integer %libinput-tablet-tool-tip-state-enum o)))
(begin
  (define-public %libinput-tablet-pad-mode-group-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-tablet-pad-mode-group>
    ()
    %libinput-tablet-pad-mode-group-struct
    wrap-libinput-tablet-pad-mode-group
    unwrap-libinput-tablet-pad-mode-group
    libinput-tablet-pad-mode-group?))
(define-libinput-procedure
  (libinput-device-tablet-pad-get-num-mode-groups device)
  (ffi:int "libinput_device_tablet_pad_get_num_mode_groups" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-tablet-pad-get-mode-group device index)
  ('* "libinput_device_tablet_pad_get_mode_group" (list '* ffi:unsigned-int))
  (wrap-libinput-tablet-pad-mode-group
    (% (unwrap-libinput-device device) index)))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-get-index group)
  (ffi:unsigned-int "libinput_tablet_pad_mode_group_get_index" (list '*))
  (% (unwrap-libinput-tablet-pad-mode-group group)))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-get-num-modes group)
  (ffi:unsigned-int "libinput_tablet_pad_mode_group_get_num_modes" (list '*))
  (% (unwrap-libinput-tablet-pad-mode-group group)))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-get-mode group)
  (ffi:unsigned-int "libinput_tablet_pad_mode_group_get_mode" (list '*))
  (% (unwrap-libinput-tablet-pad-mode-group group)))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-has-button group button)
  (ffi:int
    "libinput_tablet_pad_mode_group_has_button"
    (list '* ffi:unsigned-int))
  (non-zero? (% (unwrap-libinput-tablet-pad-mode-group group) button)))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-has-ring group ring)
  (ffi:int
    "libinput_tablet_pad_mode_group_has_ring"
    (list '* ffi:unsigned-int))
  (non-zero? (% (unwrap-libinput-tablet-pad-mode-group group) ring)))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-has-strip group strip)
  (ffi:int
    "libinput_tablet_pad_mode_group_has_strip"
    (list '* ffi:unsigned-int))
  (non-zero? (% (unwrap-libinput-tablet-pad-mode-group group) strip)))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-button-is-toggle group button)
  (ffi:int
    "libinput_tablet_pad_mode_group_button_is_toggle"
    (list '* ffi:unsigned-int))
  (% (unwrap-libinput-tablet-pad-mode-group group) button))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-ref group)
  ('* "libinput_tablet_pad_mode_group_ref" (list '*))
  (wrap-libinput-tablet-pad-mode-group
    (% (unwrap-libinput-tablet-pad-mode-group group))))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-unref group)
  ('* "libinput_tablet_pad_mode_group_unref" (list '*))
  (wrap-libinput-tablet-pad-mode-group
    (% (unwrap-libinput-tablet-pad-mode-group group))))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-set-user-data group user_data)
  (ffi:void "libinput_tablet_pad_mode_group_set_user_data" (list '* '*))
  (% (unwrap-libinput-tablet-pad-mode-group group) user_data))
(define-libinput-procedure
  (libinput-tablet-pad-mode-group-get-user-data group)
  ('* "libinput_tablet_pad_mode_group_get_user_data" (list '*))
  (% (unwrap-libinput-tablet-pad-mode-group group)))
(begin
  (define-public %libinput-switch-state-enum
    (bs:enum '((LIBINPUT_SWITCH_STATE_OFF 0) (LIBINPUT_SWITCH_STATE_ON 1))))
  (define-public LIBINPUT_SWITCH_STATE_OFF 0)
  (define-public LIBINPUT_SWITCH_STATE_ON 1)
  (define-public (number->%libinput-switch-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_SWITCH_STATE_OFF) (1 . LIBINPUT_SWITCH_STATE_ON))
          o)
        (error "not found" '%libinput-switch-state-enum o)))
  (define-public (%libinput-switch-state-enum->number o)
    (bs:enum->integer %libinput-switch-state-enum o)))
(begin
  (define-public %libinput-switch-enum
    (bs:enum '((LIBINPUT_SWITCH_LID 1) (LIBINPUT_SWITCH_TABLET_MODE 2))))
  (define-public LIBINPUT_SWITCH_LID 1)
  (define-public LIBINPUT_SWITCH_TABLET_MODE 2)
  (define-public (number->%libinput-switch-enum o)
    (or (assq-ref
          '((1 . LIBINPUT_SWITCH_LID) (2 . LIBINPUT_SWITCH_TABLET_MODE))
          o)
        (error "not found" '%libinput-switch-enum o)))
  (define-public (%libinput-switch-enum->number o)
    (bs:enum->integer %libinput-switch-enum o)))
(begin
  (define-public %libinput-event-switch-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-switch>
    ()
    %libinput-event-switch-struct
    wrap-libinput-event-switch
    unwrap-libinput-event-switch
    libinput-event-switch?))
(begin
  (define-public %libinput-event-type-enum
    (bs:enum
      '((LIBINPUT_EVENT_NONE 0)
        (LIBINPUT_EVENT_DEVICE_ADDED 1)
        (LIBINPUT_EVENT_DEVICE_REMOVED 2)
        (LIBINPUT_EVENT_KEYBOARD_KEY 300)
        (LIBINPUT_EVENT_POINTER_MOTION 400)
        (LIBINPUT_EVENT_POINTER_MOTION_ABSOLUTE 401)
        (LIBINPUT_EVENT_POINTER_BUTTON 402)
        (LIBINPUT_EVENT_POINTER_AXIS 403)
        (LIBINPUT_EVENT_POINTER_SCROLL_WHEEL 404)
        (LIBINPUT_EVENT_POINTER_SCROLL_FINGER 405)
        (LIBINPUT_EVENT_POINTER_SCROLL_CONTINUOUS 406)
        (LIBINPUT_EVENT_TOUCH_DOWN 500)
        (LIBINPUT_EVENT_TOUCH_UP 501)
        (LIBINPUT_EVENT_TOUCH_MOTION 502)
        (LIBINPUT_EVENT_TOUCH_CANCEL 503)
        (LIBINPUT_EVENT_TOUCH_FRAME 504)
        (LIBINPUT_EVENT_TABLET_TOOL_AXIS 600)
        (LIBINPUT_EVENT_TABLET_TOOL_PROXIMITY 601)
        (LIBINPUT_EVENT_TABLET_TOOL_TIP 602)
        (LIBINPUT_EVENT_TABLET_TOOL_BUTTON 603)
        (LIBINPUT_EVENT_TABLET_PAD_BUTTON 700)
        (LIBINPUT_EVENT_TABLET_PAD_RING 701)
        (LIBINPUT_EVENT_TABLET_PAD_STRIP 702)
        (LIBINPUT_EVENT_TABLET_PAD_KEY 703)
        (LIBINPUT_EVENT_GESTURE_SWIPE_BEGIN 800)
        (LIBINPUT_EVENT_GESTURE_SWIPE_UPDATE 801)
        (LIBINPUT_EVENT_GESTURE_SWIPE_END 802)
        (LIBINPUT_EVENT_GESTURE_PINCH_BEGIN 803)
        (LIBINPUT_EVENT_GESTURE_PINCH_UPDATE 804)
        (LIBINPUT_EVENT_GESTURE_PINCH_END 805)
        (LIBINPUT_EVENT_GESTURE_HOLD_BEGIN 806)
        (LIBINPUT_EVENT_GESTURE_HOLD_END 807)
        (LIBINPUT_EVENT_SWITCH_TOGGLE 900))))
  (define-public LIBINPUT_EVENT_NONE 0)
  (define-public LIBINPUT_EVENT_DEVICE_ADDED 1)
  (define-public LIBINPUT_EVENT_DEVICE_REMOVED 2)
  (define-public LIBINPUT_EVENT_KEYBOARD_KEY 300)
  (define-public LIBINPUT_EVENT_POINTER_MOTION 400)
  (define-public LIBINPUT_EVENT_POINTER_MOTION_ABSOLUTE 401)
  (define-public LIBINPUT_EVENT_POINTER_BUTTON 402)
  (define-public LIBINPUT_EVENT_POINTER_AXIS 403)
  (define-public LIBINPUT_EVENT_POINTER_SCROLL_WHEEL 404)
  (define-public LIBINPUT_EVENT_POINTER_SCROLL_FINGER 405)
  (define-public LIBINPUT_EVENT_POINTER_SCROLL_CONTINUOUS 406)
  (define-public LIBINPUT_EVENT_TOUCH_DOWN 500)
  (define-public LIBINPUT_EVENT_TOUCH_UP 501)
  (define-public LIBINPUT_EVENT_TOUCH_MOTION 502)
  (define-public LIBINPUT_EVENT_TOUCH_CANCEL 503)
  (define-public LIBINPUT_EVENT_TOUCH_FRAME 504)
  (define-public LIBINPUT_EVENT_TABLET_TOOL_AXIS 600)
  (define-public LIBINPUT_EVENT_TABLET_TOOL_PROXIMITY 601)
  (define-public LIBINPUT_EVENT_TABLET_TOOL_TIP 602)
  (define-public LIBINPUT_EVENT_TABLET_TOOL_BUTTON 603)
  (define-public LIBINPUT_EVENT_TABLET_PAD_BUTTON 700)
  (define-public LIBINPUT_EVENT_TABLET_PAD_RING 701)
  (define-public LIBINPUT_EVENT_TABLET_PAD_STRIP 702)
  (define-public LIBINPUT_EVENT_TABLET_PAD_KEY 703)
  (define-public LIBINPUT_EVENT_GESTURE_SWIPE_BEGIN 800)
  (define-public LIBINPUT_EVENT_GESTURE_SWIPE_UPDATE 801)
  (define-public LIBINPUT_EVENT_GESTURE_SWIPE_END 802)
  (define-public LIBINPUT_EVENT_GESTURE_PINCH_BEGIN 803)
  (define-public LIBINPUT_EVENT_GESTURE_PINCH_UPDATE 804)
  (define-public LIBINPUT_EVENT_GESTURE_PINCH_END 805)
  (define-public LIBINPUT_EVENT_GESTURE_HOLD_BEGIN 806)
  (define-public LIBINPUT_EVENT_GESTURE_HOLD_END 807)
  (define-public LIBINPUT_EVENT_SWITCH_TOGGLE 900)
  (define-public (number->%libinput-event-type-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_EVENT_NONE)
            (1 . LIBINPUT_EVENT_DEVICE_ADDED)
            (2 . LIBINPUT_EVENT_DEVICE_REMOVED)
            (300 . LIBINPUT_EVENT_KEYBOARD_KEY)
            (400 . LIBINPUT_EVENT_POINTER_MOTION)
            (401 . LIBINPUT_EVENT_POINTER_MOTION_ABSOLUTE)
            (402 . LIBINPUT_EVENT_POINTER_BUTTON)
            (403 . LIBINPUT_EVENT_POINTER_AXIS)
            (404 . LIBINPUT_EVENT_POINTER_SCROLL_WHEEL)
            (405 . LIBINPUT_EVENT_POINTER_SCROLL_FINGER)
            (406 . LIBINPUT_EVENT_POINTER_SCROLL_CONTINUOUS)
            (500 . LIBINPUT_EVENT_TOUCH_DOWN)
            (501 . LIBINPUT_EVENT_TOUCH_UP)
            (502 . LIBINPUT_EVENT_TOUCH_MOTION)
            (503 . LIBINPUT_EVENT_TOUCH_CANCEL)
            (504 . LIBINPUT_EVENT_TOUCH_FRAME)
            (600 . LIBINPUT_EVENT_TABLET_TOOL_AXIS)
            (601 . LIBINPUT_EVENT_TABLET_TOOL_PROXIMITY)
            (602 . LIBINPUT_EVENT_TABLET_TOOL_TIP)
            (603 . LIBINPUT_EVENT_TABLET_TOOL_BUTTON)
            (700 . LIBINPUT_EVENT_TABLET_PAD_BUTTON)
            (701 . LIBINPUT_EVENT_TABLET_PAD_RING)
            (702 . LIBINPUT_EVENT_TABLET_PAD_STRIP)
            (703 . LIBINPUT_EVENT_TABLET_PAD_KEY)
            (800 . LIBINPUT_EVENT_GESTURE_SWIPE_BEGIN)
            (801 . LIBINPUT_EVENT_GESTURE_SWIPE_UPDATE)
            (802 . LIBINPUT_EVENT_GESTURE_SWIPE_END)
            (803 . LIBINPUT_EVENT_GESTURE_PINCH_BEGIN)
            (804 . LIBINPUT_EVENT_GESTURE_PINCH_UPDATE)
            (805 . LIBINPUT_EVENT_GESTURE_PINCH_END)
            (806 . LIBINPUT_EVENT_GESTURE_HOLD_BEGIN)
            (807 . LIBINPUT_EVENT_GESTURE_HOLD_END)
            (900 . LIBINPUT_EVENT_SWITCH_TOGGLE))
          o)
        (error "not found" '%libinput-event-type-enum o)))
  (define-public (%libinput-event-type-enum->number o)
    (bs:enum->integer %libinput-event-type-enum o)))

(define %libinput_event_destroy
  (delay (foreign-library-pointer (force %libinput) "libinput_event_destroy")))

(define-libinput-procedure
  (libinput-event-get-type event)
  (ffi:int32 "libinput_event_get_type" (list '*))
  (number->%libinput-event-type-enum (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-context event)
  ('* "libinput_event_get_context" (list '*))
  (wrap-libinput (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-device event)
  ('* "libinput_event_get_device" (list '*))
  (wrap-libinput-device (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-pointer-event event)
  ('* "libinput_event_get_pointer_event" (list '*))
  (wrap-libinput-event-pointer (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-keyboard-event event)
  ('* "libinput_event_get_keyboard_event" (list '*))
  (wrap-libinput-event-keyboard (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-touch-event event)
  ('* "libinput_event_get_touch_event" (list '*))
  (wrap-libinput-event-touch (% (unwrap-libinput-event event))))
(begin
  (define-public %libinput-event-gesture-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-gesture>
    ()
    %libinput-event-gesture-struct
    wrap-libinput-event-gesture
    unwrap-libinput-event-gesture
    libinput-event-gesture?))
(define-libinput-procedure
  (libinput-event-get-gesture-event event)
  ('* "libinput_event_get_gesture_event" (list '*))
  (wrap-libinput-event-gesture (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-tablet-tool-event event)
  ('* "libinput_event_get_tablet_tool_event" (list '*))
  (wrap-libinput-event-tablet-tool (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-tablet-pad-event event)
  ('* "libinput_event_get_tablet_pad_event" (list '*))
  (wrap-libinput-event-tablet-pad (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-switch-event event)
  ('* "libinput_event_get_switch_event" (list '*))
  (wrap-libinput-event-switch (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-get-device-notify-event event)
  ('* "libinput_event_get_device_notify_event" (list '*))
  (wrap-libinput-event-device-notify (% (unwrap-libinput-event event))))
(define-libinput-procedure
  (libinput-event-device-notify-get-base-event event)
  ('* "libinput_event_device_notify_get_base_event" (list '*))
  (wrap-libinput-event (% (unwrap-libinput-event-device-notify event))))
(define-libinput-procedure
  (libinput-event-keyboard-get-time event)
  (ffi:uint32 "libinput_event_keyboard_get_time" (list '*))
  (% (unwrap-libinput-event-keyboard event)))
(define-libinput-procedure
  (libinput-event-keyboard-get-time-usec event)
  (ffi:uint64 "libinput_event_keyboard_get_time_usec" (list '*))
  (% (unwrap-libinput-event-keyboard event)))
(define-libinput-procedure
  (libinput-event-keyboard-get-key event)
  (ffi:uint32 "libinput_event_keyboard_get_key" (list '*))
  (% (unwrap-libinput-event-keyboard event)))
(define-libinput-procedure
  (libinput-event-keyboard-get-key-state event)
  (ffi:int32 "libinput_event_keyboard_get_key_state" (list '*))
  (number->%libinput-key-state-enum
    (% (unwrap-libinput-event-keyboard event))))
(define-libinput-procedure
  (libinput-event-keyboard-get-base-event event)
  ('* "libinput_event_keyboard_get_base_event" (list '*))
  (wrap-libinput-event (% (unwrap-libinput-event-keyboard event))))
(define-libinput-procedure
  (libinput-event-keyboard-get-seat-key-count event)
  (ffi:uint32 "libinput_event_keyboard_get_seat_key_count" (list '*))
  (% (unwrap-libinput-event-keyboard event)))
(define-libinput-procedure
  (libinput-event-pointer-get-time event)
  (ffi:uint32 "libinput_event_pointer_get_time" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-time-usec event)
  (ffi:uint64 "libinput_event_pointer_get_time_usec" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-dx event)
  (ffi:double "libinput_event_pointer_get_dx" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-dy event)
  (ffi:double "libinput_event_pointer_get_dy" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-dx-unaccelerated event)
  (ffi:double "libinput_event_pointer_get_dx_unaccelerated" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-dy-unaccelerated event)
  (ffi:double "libinput_event_pointer_get_dy_unaccelerated" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-absolute-x event)
  (ffi:double "libinput_event_pointer_get_absolute_x" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-absolute-y event)
  (ffi:double "libinput_event_pointer_get_absolute_y" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-absolute-x-transformed event width)
  (ffi:double
    "libinput_event_pointer_get_absolute_x_transformed"
    (list '* ffi:uint32))
  (% (unwrap-libinput-event-pointer event) width))
(define-libinput-procedure
  (libinput-event-pointer-get-absolute-y-transformed event height)
  (ffi:double
    "libinput_event_pointer_get_absolute_y_transformed"
    (list '* ffi:uint32))
  (% (unwrap-libinput-event-pointer event) height))
(define-libinput-procedure
  (libinput-event-pointer-get-button event)
  (ffi:uint32 "libinput_event_pointer_get_button" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-get-button-state event)
  (ffi:int32 "libinput_event_pointer_get_button_state" (list '*))
  (number->%libinput-button-state-enum
    (% (unwrap-libinput-event-pointer event))))
(define-libinput-procedure
  (libinput-event-pointer-get-seat-button-count event)
  (ffi:uint32 "libinput_event_pointer_get_seat_button_count" (list '*))
  (% (unwrap-libinput-event-pointer event)))
(define-libinput-procedure
  (libinput-event-pointer-has-axis event axis)
  (ffi:int "libinput_event_pointer_has_axis" (list '* ffi:int32))
  (non-zero?
    (% (unwrap-libinput-event-pointer event)
       (%libinput-pointer-axis-enum->number axis))))
(define-libinput-procedure
  (libinput-event-pointer-get-axis-value event axis)
  (ffi:double "libinput_event_pointer_get_axis_value" (list '* ffi:int32))
  (% (unwrap-libinput-event-pointer event)
     (%libinput-pointer-axis-enum->number axis)))
(define-libinput-procedure
  (libinput-event-pointer-get-axis-source event)
  (ffi:int32 "libinput_event_pointer_get_axis_source" (list '*))
  (number->%libinput-pointer-axis-source-enum
    (% (unwrap-libinput-event-pointer event))))
(define-libinput-procedure
  (libinput-event-pointer-get-axis-value-discrete event axis)
  (ffi:double
    "libinput_event_pointer_get_axis_value_discrete"
    (list '* ffi:int32))
  (% (unwrap-libinput-event-pointer event)
     (%libinput-pointer-axis-enum->number axis)))
(define-libinput-procedure
  (libinput-event-pointer-get-scroll-value event axis)
  (ffi:double "libinput_event_pointer_get_scroll_value" (list '* ffi:int32))
  (% (unwrap-libinput-event-pointer event)
     (%libinput-pointer-axis-enum->number axis)))
(define-libinput-procedure
  (libinput-event-pointer-get-scroll-value-v120 event axis)
  (ffi:double
    "libinput_event_pointer_get_scroll_value_v120"
    (list '* ffi:int32))
  (% (unwrap-libinput-event-pointer event)
     (%libinput-pointer-axis-enum->number axis)))
(define-libinput-procedure
  (libinput-event-pointer-get-base-event event)
  ('* "libinput_event_pointer_get_base_event" (list '*))
  (wrap-libinput-event (% (unwrap-libinput-event-pointer event))))
(define-libinput-procedure
  (libinput-event-touch-get-time event)
  (ffi:uint32 "libinput_event_touch_get_time" (list '*))
  (% (unwrap-libinput-event-touch event)))
(define-libinput-procedure
  (libinput-event-touch-get-time-usec event)
  (ffi:uint64 "libinput_event_touch_get_time_usec" (list '*))
  (% (unwrap-libinput-event-touch event)))
(define-libinput-procedure
  (libinput-event-touch-get-slot event)
  (ffi:int32 "libinput_event_touch_get_slot" (list '*))
  (% (unwrap-libinput-event-touch event)))
(define-libinput-procedure
  (libinput-event-touch-get-seat-slot event)
  (ffi:int32 "libinput_event_touch_get_seat_slot" (list '*))
  (% (unwrap-libinput-event-touch event)))
(define-libinput-procedure
  (libinput-event-touch-get-x event)
  (ffi:double "libinput_event_touch_get_x" (list '*))
  (% (unwrap-libinput-event-touch event)))
(define-libinput-procedure
  (libinput-event-touch-get-y event)
  (ffi:double "libinput_event_touch_get_y" (list '*))
  (% (unwrap-libinput-event-touch event)))
(define-libinput-procedure
  (libinput-event-touch-get-x-transformed event width)
  (ffi:double "libinput_event_touch_get_x_transformed" (list '* ffi:uint32))
  (% (unwrap-libinput-event-touch event) width))
(define-libinput-procedure
  (libinput-event-touch-get-y-transformed event height)
  (ffi:double "libinput_event_touch_get_y_transformed" (list '* ffi:uint32))
  (% (unwrap-libinput-event-touch event) height))
(define-libinput-procedure
  (libinput-event-touch-get-base-event event)
  ('* "libinput_event_touch_get_base_event" (list '*))
  (wrap-libinput-event (% (unwrap-libinput-event-touch event))))
(define-libinput-procedure
  (libinput-event-gesture-get-time event)
  (ffi:uint32 "libinput_event_gesture_get_time" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-time-usec event)
  (ffi:uint64 "libinput_event_gesture_get_time_usec" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-base-event event)
  ('* "libinput_event_gesture_get_base_event" (list '*))
  (wrap-libinput-event (% (unwrap-libinput-event-gesture event))))
(define-libinput-procedure
  (libinput-event-gesture-get-finger-count event)
  (ffi:int "libinput_event_gesture_get_finger_count" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-cancelled event)
  (ffi:int "libinput_event_gesture_get_cancelled" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-dx event)
  (ffi:double "libinput_event_gesture_get_dx" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-dy event)
  (ffi:double "libinput_event_gesture_get_dy" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-dx-unaccelerated event)
  (ffi:double "libinput_event_gesture_get_dx_unaccelerated" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-dy-unaccelerated event)
  (ffi:double "libinput_event_gesture_get_dy_unaccelerated" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-scale event)
  (ffi:double "libinput_event_gesture_get_scale" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-gesture-get-angle-delta event)
  (ffi:double "libinput_event_gesture_get_angle_delta" (list '*))
  (% (unwrap-libinput-event-gesture event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-base-event event)
  ('* "libinput_event_tablet_tool_get_base_event" (list '*))
  (wrap-libinput-event (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-x-has-changed event)
  (ffi:int "libinput_event_tablet_tool_x_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-y-has-changed event)
  (ffi:int "libinput_event_tablet_tool_y_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-pressure-has-changed event)
  (ffi:int "libinput_event_tablet_tool_pressure_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-distance-has-changed event)
  (ffi:int "libinput_event_tablet_tool_distance_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-tilt-x-has-changed event)
  (ffi:int "libinput_event_tablet_tool_tilt_x_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-tilt-y-has-changed event)
  (ffi:int "libinput_event_tablet_tool_tilt_y_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-rotation-has-changed event)
  (ffi:int "libinput_event_tablet_tool_rotation_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-slider-has-changed event)
  (ffi:int "libinput_event_tablet_tool_slider_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-size-major-has-changed event)
  (ffi:int "libinput_event_tablet_tool_size_major_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-size-minor-has-changed event)
  (ffi:int "libinput_event_tablet_tool_size_minor_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-wheel-has-changed event)
  (ffi:int "libinput_event_tablet_tool_wheel_has_changed" (list '*))
  (non-zero? (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-x event)
  (ffi:double "libinput_event_tablet_tool_get_x" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-y event)
  (ffi:double "libinput_event_tablet_tool_get_y" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-dx event)
  (ffi:double "libinput_event_tablet_tool_get_dx" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-dy event)
  (ffi:double "libinput_event_tablet_tool_get_dy" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-pressure event)
  (ffi:double "libinput_event_tablet_tool_get_pressure" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-distance event)
  (ffi:double "libinput_event_tablet_tool_get_distance" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-tilt-x event)
  (ffi:double "libinput_event_tablet_tool_get_tilt_x" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-tilt-y event)
  (ffi:double "libinput_event_tablet_tool_get_tilt_y" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-rotation event)
  (ffi:double "libinput_event_tablet_tool_get_rotation" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-slider-position event)
  (ffi:double "libinput_event_tablet_tool_get_slider_position" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-size-major event)
  (ffi:double "libinput_event_tablet_tool_get_size_major" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-size-minor event)
  (ffi:double "libinput_event_tablet_tool_get_size_minor" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-wheel-delta event)
  (ffi:double "libinput_event_tablet_tool_get_wheel_delta" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-wheel-delta-discrete event)
  (ffi:int "libinput_event_tablet_tool_get_wheel_delta_discrete" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-x-transformed event width)
  (ffi:double
    "libinput_event_tablet_tool_get_x_transformed"
    (list '* ffi:uint32))
  (% (unwrap-libinput-event-tablet-tool event) width))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-y-transformed event height)
  (ffi:double
    "libinput_event_tablet_tool_get_y_transformed"
    (list '* ffi:uint32))
  (% (unwrap-libinput-event-tablet-tool event) height))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-tool event)
  ('* "libinput_event_tablet_tool_get_tool" (list '*))
  (wrap-libinput-tablet-tool (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-proximity-state event)
  (ffi:int32 "libinput_event_tablet_tool_get_proximity_state" (list '*))
  (number->%libinput-tablet-tool-proximity-state-enum
    (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-tip-state event)
  (ffi:int32 "libinput_event_tablet_tool_get_tip_state" (list '*))
  (number->%libinput-tablet-tool-tip-state-enum
    (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-button event)
  (ffi:uint32 "libinput_event_tablet_tool_get_button" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-button-state event)
  (ffi:int32 "libinput_event_tablet_tool_get_button_state" (list '*))
  (number->%libinput-button-state-enum
    (% (unwrap-libinput-event-tablet-tool event))))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-seat-button-count event)
  (ffi:uint32 "libinput_event_tablet_tool_get_seat_button_count" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-time event)
  (ffi:uint32 "libinput_event_tablet_tool_get_time" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-event-tablet-tool-get-time-usec event)
  (ffi:uint64 "libinput_event_tablet_tool_get_time_usec" (list '*))
  (% (unwrap-libinput-event-tablet-tool event)))
(define-libinput-procedure
  (libinput-tablet-tool-get-type tool)
  (ffi:int32 "libinput_tablet_tool_get_type" (list '*))
  (number->%libinput-tablet-tool-type-enum
    (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-get-tool-id tool)
  (ffi:uint64 "libinput_tablet_tool_get_tool_id" (list '*))
  (% (unwrap-libinput-tablet-tool tool)))
(define-libinput-procedure
  (libinput-tablet-tool-ref tool)
  ('* "libinput_tablet_tool_ref" (list '*))
  (wrap-libinput-tablet-tool (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-unref tool)
  ('* "libinput_tablet_tool_unref" (list '*))
  (wrap-libinput-tablet-tool (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-has-pressure tool)
  (ffi:int "libinput_tablet_tool_has_pressure" (list '*))
  (non-zero? (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-has-distance tool)
  (ffi:int "libinput_tablet_tool_has_distance" (list '*))
  (non-zero? (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-has-tilt tool)
  (ffi:int "libinput_tablet_tool_has_tilt" (list '*))
  (non-zero? (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-has-rotation tool)
  (ffi:int "libinput_tablet_tool_has_rotation" (list '*))
  (non-zero? (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-has-slider tool)
  (ffi:int "libinput_tablet_tool_has_slider" (list '*))
  (non-zero? (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-has-size tool)
  (ffi:int "libinput_tablet_tool_has_size" (list '*))
  (non-zero? (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-has-wheel tool)
  (ffi:int "libinput_tablet_tool_has_wheel" (list '*))
  (non-zero? (% (unwrap-libinput-tablet-tool tool))))
(define-libinput-procedure
  (libinput-tablet-tool-has-button tool code)
  (ffi:int "libinput_tablet_tool_has_button" (list '* ffi:uint32))
  (non-zero? (% (unwrap-libinput-tablet-tool tool) code)))
(define-libinput-procedure
  (libinput-tablet-tool-is-unique tool)
  (ffi:int "libinput_tablet_tool_is_unique" (list '*))
  (% (unwrap-libinput-tablet-tool tool)))
(define-libinput-procedure
  (libinput-tablet-tool-get-serial tool)
  (ffi:uint64 "libinput_tablet_tool_get_serial" (list '*))
  (% (unwrap-libinput-tablet-tool tool)))
(define-libinput-procedure
  (libinput-tablet-tool-get-user-data tool)
  ('* "libinput_tablet_tool_get_user_data" (list '*))
  (% (unwrap-libinput-tablet-tool tool)))
(define-libinput-procedure
  (libinput-tablet-tool-set-user-data tool user_data)
  (ffi:void "libinput_tablet_tool_set_user_data" (list '* '*))
  (% (unwrap-libinput-tablet-tool tool) user_data))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-base-event event)
  ('* "libinput_event_tablet_pad_get_base_event" (list '*))
  (wrap-libinput-event (% (unwrap-libinput-event-tablet-pad event))))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-ring-position event)
  (ffi:double "libinput_event_tablet_pad_get_ring_position" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-ring-number event)
  (ffi:unsigned-int "libinput_event_tablet_pad_get_ring_number" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-ring-source event)
  (ffi:int32 "libinput_event_tablet_pad_get_ring_source" (list '*))
  (number->%libinput-tablet-pad-ring-axis-source-enum
    (% (unwrap-libinput-event-tablet-pad event))))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-strip-position event)
  (ffi:double "libinput_event_tablet_pad_get_strip_position" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-strip-number event)
  (ffi:unsigned-int "libinput_event_tablet_pad_get_strip_number" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-strip-source event)
  (ffi:int32 "libinput_event_tablet_pad_get_strip_source" (list '*))
  (number->%libinput-tablet-pad-strip-axis-source-enum
    (% (unwrap-libinput-event-tablet-pad event))))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-button-number event)
  (ffi:uint32 "libinput_event_tablet_pad_get_button_number" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-button-state event)
  (ffi:int32 "libinput_event_tablet_pad_get_button_state" (list '*))
  (number->%libinput-button-state-enum
    (% (unwrap-libinput-event-tablet-pad event))))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-key event)
  (ffi:uint32 "libinput_event_tablet_pad_get_key" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-key-state event)
  (ffi:int32 "libinput_event_tablet_pad_get_key_state" (list '*))
  (number->%libinput-key-state-enum
    (% (unwrap-libinput-event-tablet-pad event))))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-mode event)
  (ffi:unsigned-int "libinput_event_tablet_pad_get_mode" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-mode-group event)
  ('* "libinput_event_tablet_pad_get_mode_group" (list '*))
  (wrap-libinput-tablet-pad-mode-group
    (% (unwrap-libinput-event-tablet-pad event))))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-time event)
  (ffi:uint32 "libinput_event_tablet_pad_get_time" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-tablet-pad-get-time-usec event)
  (ffi:uint64 "libinput_event_tablet_pad_get_time_usec" (list '*))
  (% (unwrap-libinput-event-tablet-pad event)))
(define-libinput-procedure
  (libinput-event-switch-get-switch event)
  (ffi:int32 "libinput_event_switch_get_switch" (list '*))
  (number->%libinput-switch-enum (% (unwrap-libinput-event-switch event))))
(define-libinput-procedure
  (libinput-event-switch-get-switch-state event)
  (ffi:int32 "libinput_event_switch_get_switch_state" (list '*))
  (number->%libinput-switch-state-enum
    (% (unwrap-libinput-event-switch event))))
(define-libinput-procedure
  (libinput-event-switch-get-base-event event)
  ('* "libinput_event_switch_get_base_event" (list '*))
  (wrap-libinput-event (% (unwrap-libinput-event-switch event))))
(define-libinput-procedure
  (libinput-event-switch-get-time event)
  (ffi:uint32 "libinput_event_switch_get_time" (list '*))
  (% (unwrap-libinput-event-switch event)))
(define-libinput-procedure
  (libinput-event-switch-get-time-usec event)
  (ffi:uint64 "libinput_event_switch_get_time_usec" (list '*))
  (% (unwrap-libinput-event-switch event)))
(begin
  (define-public %libinput-interface-struct
    (bs:struct
      `((open-restricted ,(bs:pointer '*))
        (close-restricted ,(bs:pointer '*)))))
  (define-bytestructure-class
    <libinput-interface>
    ()
    %libinput-interface-struct
    wrap-libinput-interface
    unwrap-libinput-interface
    libinput-interface?
    (open-restricted
      #:init-keyword
      #:open-restricted
      #:accessor
      .open-restricted)
    (close-restricted
      #:init-keyword
      #:close-restricted
      #:accessor
      .close-restricted))
  (export .open-restricted .close-restricted))
(define-libinput-procedure
  (libinput-udev-create-context interface user_data udev)
  ('* "libinput_udev_create_context" (list '* '* '*))
  (wrap-libinput (% (unwrap-libinput-interface interface) user_data udev)))
(define-libinput-procedure
  (libinput-udev-assign-seat libinput seat_id)
  (ffi:int "libinput_udev_assign_seat" (list '* '*))
  (% (unwrap-libinput libinput) (ffi:string->pointer seat_id)))

(define-public (libinput-path-create-context open-restricted close-restricted)
  (assert (procedure? open-restricted))
  (assert (procedure? close-restricted))
  (wrap-libinput
   (%libinput-path-create-context open-restricted close-restricted)))

(define-libinput-procedure
  (libinput-path-add-device libinput path)
  ('* "libinput_path_add_device" (list '* '*))
  (wrap-libinput-device
    (% (unwrap-libinput libinput) (ffi:string->pointer path))))
(define-libinput-procedure
  (libinput-path-remove-device device)
  (ffi:void "libinput_path_remove_device" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-get-fd libinput)
  (ffi:int "libinput_get_fd" (list '*))
  (% (unwrap-libinput libinput)))
(define-libinput-procedure
  (libinput-dispatch libinput)
  (ffi:int "libinput_dispatch" (list '*))
  (% (unwrap-libinput libinput)))

(define-libinput-procedure (libinput-get-event libinput)
  ('* "libinput_get_event" (list '*))
  (let ((o (% (unwrap-libinput libinput))))
    (ffi:set-pointer-finalizer! o (force %libinput_event_destroy))
    (wrap-libinput-event o)))

(define-libinput-procedure
  (libinput-next-event-type libinput)
  (ffi:int32 "libinput_next_event_type" (list '*))
  (number->%libinput-event-type-enum (% (unwrap-libinput libinput))))
(define-libinput-procedure
  (libinput-set-user-data libinput user_data)
  (ffi:void "libinput_set_user_data" (list '* '*))
  (% (unwrap-libinput libinput) user_data))
(define-libinput-procedure
  (libinput-get-user-data libinput)
  ('* "libinput_get_user_data" (list '*))
  (% (unwrap-libinput libinput)))
(define-libinput-procedure
  (libinput-resume libinput)
  (ffi:int "libinput_resume" (list '*))
  (% (unwrap-libinput libinput)))
(define-libinput-procedure
  (libinput-suspend libinput)
  (ffi:void "libinput_suspend" (list '*))
  (% (unwrap-libinput libinput)))
(define-libinput-procedure
  (libinput-ref libinput)
  ('* "libinput_ref" (list '*))
  (wrap-libinput (% (unwrap-libinput libinput))))
(define-libinput-procedure
  (libinput-unref libinput)
  ('* "libinput_unref" (list '*))
  (wrap-libinput (% (unwrap-libinput libinput))))
(define-libinput-procedure
  (libinput-log-set-priority libinput priority)
  (ffi:void "libinput_log_set_priority" (list '* ffi:int32))
  (% (unwrap-libinput libinput)
     (%libinput-log-priority-enum->number priority)))
(define-libinput-procedure
  (libinput-log-get-priority libinput)
  (ffi:int32 "libinput_log_get_priority" (list '*))
  (number->%libinput-log-priority-enum (% (unwrap-libinput libinput))))
(define-public libinput_log_handler (bs:pointer '*))
(define-libinput-procedure
  (libinput-log-set-handler libinput log_handler)
  (ffi:void "libinput_log_set_handler" (list '* '*))
  (% (unwrap-libinput libinput) log_handler))
(define-libinput-procedure
  (libinput-seat-ref seat)
  ('* "libinput_seat_ref" (list '*))
  (wrap-libinput-seat (% (unwrap-libinput-seat seat))))
(define-libinput-procedure
  (libinput-seat-unref seat)
  ('* "libinput_seat_unref" (list '*))
  (wrap-libinput-seat (% (unwrap-libinput-seat seat))))
(define-libinput-procedure
  (libinput-seat-set-user-data seat user_data)
  (ffi:void "libinput_seat_set_user_data" (list '* '*))
  (% (unwrap-libinput-seat seat) user_data))
(define-libinput-procedure
  (libinput-seat-get-user-data seat)
  ('* "libinput_seat_get_user_data" (list '*))
  (% (unwrap-libinput-seat seat)))
(define-libinput-procedure
  (libinput-seat-get-context seat)
  ('* "libinput_seat_get_context" (list '*))
  (wrap-libinput (% (unwrap-libinput-seat seat))))
(define-libinput-procedure
  (libinput-seat-get-physical-name seat)
  ('* "libinput_seat_get_physical_name" (list '*))
  (pointer->string* (% (unwrap-libinput-seat seat))))
(define-libinput-procedure
  (libinput-seat-get-logical-name seat)
  ('* "libinput_seat_get_logical_name" (list '*))
  (pointer->string* (% (unwrap-libinput-seat seat))))
(define-libinput-procedure
  (libinput-device-ref device)
  ('* "libinput_device_ref" (list '*))
  (wrap-libinput-device (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-unref device)
  ('* "libinput_device_unref" (list '*))
  (wrap-libinput-device (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-set-user-data device user_data)
  (ffi:void "libinput_device_set_user_data" (list '* '*))
  (% (unwrap-libinput-device device) user_data))
(define-libinput-procedure
  (libinput-device-get-user-data device)
  ('* "libinput_device_get_user_data" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-get-context device)
  ('* "libinput_device_get_context" (list '*))
  (wrap-libinput (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-get-device-group device)
  ('* "libinput_device_get_device_group" (list '*))
  (wrap-libinput-device-group (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-get-sysname device)
  ('* "libinput_device_get_sysname" (list '*))
  (pointer->string* (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-get-name device)
  ('* "libinput_device_get_name" (list '*))
  (pointer->string* (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-get-id-product device)
  (ffi:unsigned-int "libinput_device_get_id_product" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-get-id-vendor device)
  (ffi:unsigned-int "libinput_device_get_id_vendor" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-get-output-name device)
  ('* "libinput_device_get_output_name" (list '*))
  (pointer->string* (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-get-seat device)
  ('* "libinput_device_get_seat" (list '*))
  (wrap-libinput-seat (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-set-seat-logical-name device name)
  (ffi:int "libinput_device_set_seat_logical_name" (list '* '*))
  (% (unwrap-libinput-device device) (ffi:string->pointer name)))
(define-libinput-procedure
  (libinput-device-get-udev-device device)
  ('* "libinput_device_get_udev_device" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-led-update device leds)
  (ffi:void "libinput_device_led_update" (list '* ffi:int32))
  (% (unwrap-libinput-device device) (%libinput-led-enum->number leds)))
(define-libinput-procedure
  (libinput-device-has-capability device capability)
  (ffi:int "libinput_device_has_capability" (list '* ffi:int32))
  (non-zero?
    (% (unwrap-libinput-device device)
       (%libinput-device-capability-enum->number capability))))
(define-libinput-procedure
  (libinput-device-get-size device width height)
  (ffi:int "libinput_device_get_size" (list '* '* '*))
  (% (unwrap-libinput-device device) width height))
(define-libinput-procedure
  (libinput-device-pointer-has-button device code)
  (ffi:int "libinput_device_pointer_has_button" (list '* ffi:uint32))
  (non-zero? (% (unwrap-libinput-device device) code)))
(define-libinput-procedure
  (libinput-device-keyboard-has-key device code)
  (ffi:int "libinput_device_keyboard_has_key" (list '* ffi:uint32))
  (non-zero? (% (unwrap-libinput-device device) code)))
(define-libinput-procedure
  (libinput-device-touch-get-touch-count device)
  (ffi:int "libinput_device_touch_get_touch_count" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-switch-has-switch device sw)
  (ffi:int "libinput_device_switch_has_switch" (list '* ffi:int32))
  (non-zero?
    (% (unwrap-libinput-device device) (%libinput-switch-enum->number sw))))
(define-libinput-procedure
  (libinput-device-tablet-pad-get-num-buttons device)
  (ffi:int "libinput_device_tablet_pad_get_num_buttons" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-tablet-pad-get-num-rings device)
  (ffi:int "libinput_device_tablet_pad_get_num_rings" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-tablet-pad-get-num-strips device)
  (ffi:int "libinput_device_tablet_pad_get_num_strips" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-tablet-pad-has-key device code)
  (ffi:int "libinput_device_tablet_pad_has_key" (list '* ffi:uint32))
  (non-zero? (% (unwrap-libinput-device device) code)))
(define-libinput-procedure
  (libinput-device-group-ref group)
  ('* "libinput_device_group_ref" (list '*))
  (wrap-libinput-device-group (% (unwrap-libinput-device-group group))))
(define-libinput-procedure
  (libinput-device-group-unref group)
  ('* "libinput_device_group_unref" (list '*))
  (wrap-libinput-device-group (% (unwrap-libinput-device-group group))))
(define-libinput-procedure
  (libinput-device-group-set-user-data group user_data)
  (ffi:void "libinput_device_group_set_user_data" (list '* '*))
  (% (unwrap-libinput-device-group group) user_data))
(define-libinput-procedure
  (libinput-device-group-get-user-data group)
  ('* "libinput_device_group_get_user_data" (list '*))
  (% (unwrap-libinput-device-group group)))
(begin
  (define-public %libinput-config-status-enum
    (bs:enum
      '((LIBINPUT_CONFIG_STATUS_SUCCESS 0)
        (LIBINPUT_CONFIG_STATUS_UNSUPPORTED 1)
        (LIBINPUT_CONFIG_STATUS_INVALID 2))))
  (define-public LIBINPUT_CONFIG_STATUS_SUCCESS 0)
  (define-public LIBINPUT_CONFIG_STATUS_UNSUPPORTED 1)
  (define-public LIBINPUT_CONFIG_STATUS_INVALID 2)
  (define-public (number->%libinput-config-status-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_STATUS_SUCCESS)
            (1 . LIBINPUT_CONFIG_STATUS_UNSUPPORTED)
            (2 . LIBINPUT_CONFIG_STATUS_INVALID))
          o)
        (error "not found" '%libinput-config-status-enum o)))
  (define-public (%libinput-config-status-enum->number o)
    (bs:enum->integer %libinput-config-status-enum o)))
(define-libinput-procedure
  (libinput-config-status-to-str status)
  ('* "libinput_config_status_to_str" (list ffi:int32))
  (pointer->string* (% (%libinput-config-status-enum->number status))))
(begin
  (define-public %libinput-config-tap-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_TAP_DISABLED 0) (LIBINPUT_CONFIG_TAP_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_TAP_DISABLED 0)
  (define-public LIBINPUT_CONFIG_TAP_ENABLED 1)
  (define-public (number->%libinput-config-tap-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_TAP_DISABLED)
            (1 . LIBINPUT_CONFIG_TAP_ENABLED))
          o)
        (error "not found" '%libinput-config-tap-state-enum o)))
  (define-public (%libinput-config-tap-state-enum->number o)
    (bs:enum->integer %libinput-config-tap-state-enum o)))
(define-libinput-procedure
  (libinput-device-config-tap-get-finger-count device)
  (ffi:int "libinput_device_config_tap_get_finger_count" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-tap-set-enabled device enable)
  (ffi:int32 "libinput_device_config_tap_set_enabled" (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-tap-state-enum->number enable))))
(define-libinput-procedure
  (libinput-device-config-tap-get-enabled device)
  (ffi:int32 "libinput_device_config_tap_get_enabled" (list '*))
  (number->%libinput-config-tap-state-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-tap-get-default-enabled device)
  (ffi:int32 "libinput_device_config_tap_get_default_enabled" (list '*))
  (number->%libinput-config-tap-state-enum
    (% (unwrap-libinput-device device))))
(begin
  (define-public %libinput-config-tap-button-map-enum
    (bs:enum
      '((LIBINPUT_CONFIG_TAP_MAP_LRM 0) (LIBINPUT_CONFIG_TAP_MAP_LMR 1))))
  (define-public LIBINPUT_CONFIG_TAP_MAP_LRM 0)
  (define-public LIBINPUT_CONFIG_TAP_MAP_LMR 1)
  (define-public (number->%libinput-config-tap-button-map-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_TAP_MAP_LRM)
            (1 . LIBINPUT_CONFIG_TAP_MAP_LMR))
          o)
        (error "not found" '%libinput-config-tap-button-map-enum o)))
  (define-public (%libinput-config-tap-button-map-enum->number o)
    (bs:enum->integer %libinput-config-tap-button-map-enum o)))
(define-libinput-procedure
  (libinput-device-config-tap-set-button-map device map)
  (ffi:int32 "libinput_device_config_tap_set_button_map" (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-tap-button-map-enum->number map))))
(define-libinput-procedure
  (libinput-device-config-tap-get-button-map device)
  (ffi:int32 "libinput_device_config_tap_get_button_map" (list '*))
  (number->%libinput-config-tap-button-map-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-tap-get-default-button-map device)
  (ffi:int32 "libinput_device_config_tap_get_default_button_map" (list '*))
  (number->%libinput-config-tap-button-map-enum
    (% (unwrap-libinput-device device))))
(begin
  (define-public %libinput-config-drag-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_DRAG_DISABLED 0) (LIBINPUT_CONFIG_DRAG_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_DRAG_DISABLED 0)
  (define-public LIBINPUT_CONFIG_DRAG_ENABLED 1)
  (define-public (number->%libinput-config-drag-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_DRAG_DISABLED)
            (1 . LIBINPUT_CONFIG_DRAG_ENABLED))
          o)
        (error "not found" '%libinput-config-drag-state-enum o)))
  (define-public (%libinput-config-drag-state-enum->number o)
    (bs:enum->integer %libinput-config-drag-state-enum o)))
(define-libinput-procedure
  (libinput-device-config-tap-set-drag-enabled device enable)
  (ffi:int32 "libinput_device_config_tap_set_drag_enabled" (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-drag-state-enum->number enable))))
(define-libinput-procedure
  (libinput-device-config-tap-get-drag-enabled device)
  (ffi:int32 "libinput_device_config_tap_get_drag_enabled" (list '*))
  (number->%libinput-config-drag-state-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-tap-get-default-drag-enabled device)
  (ffi:int32 "libinput_device_config_tap_get_default_drag_enabled" (list '*))
  (number->%libinput-config-drag-state-enum
    (% (unwrap-libinput-device device))))
(begin
  (define-public %libinput-config-drag-lock-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_DRAG_LOCK_DISABLED 0)
        (LIBINPUT_CONFIG_DRAG_LOCK_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_DRAG_LOCK_DISABLED 0)
  (define-public LIBINPUT_CONFIG_DRAG_LOCK_ENABLED 1)
  (define-public (number->%libinput-config-drag-lock-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_DRAG_LOCK_DISABLED)
            (1 . LIBINPUT_CONFIG_DRAG_LOCK_ENABLED))
          o)
        (error "not found" '%libinput-config-drag-lock-state-enum o)))
  (define-public (%libinput-config-drag-lock-state-enum->number o)
    (bs:enum->integer %libinput-config-drag-lock-state-enum o)))
(define-libinput-procedure
  (libinput-device-config-tap-set-drag-lock-enabled device enable)
  (ffi:int32
    "libinput_device_config_tap_set_drag_lock_enabled"
    (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-drag-lock-state-enum->number enable))))
(define-libinput-procedure
  (libinput-device-config-tap-get-drag-lock-enabled device)
  (ffi:int32 "libinput_device_config_tap_get_drag_lock_enabled" (list '*))
  (number->%libinput-config-drag-lock-state-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-tap-get-default-drag-lock-enabled device)
  (ffi:int32
    "libinput_device_config_tap_get_default_drag_lock_enabled"
    (list '*))
  (number->%libinput-config-drag-lock-state-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-calibration-has-matrix device)
  (ffi:int "libinput_device_config_calibration_has_matrix" (list '*))
  (non-zero? (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-calibration-set-matrix device matrix)
  (ffi:int32 "libinput_device_config_calibration_set_matrix" (list '* '*))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       ((lambda (a)
          (ffi:bytevector->pointer
            (bytestructure-bytevector
              (bytestructure
                (bs:vector 6 float)
                (cond ((vector? a) a) ((list? a) (list->vector a)))))))
        matrix))))
(define-libinput-procedure
  (libinput-device-config-calibration-get-matrix device matrix)
  (ffi:int "libinput_device_config_calibration_get_matrix" (list '* '*))
  (% (unwrap-libinput-device device)
     ((lambda (a)
        (ffi:bytevector->pointer
          (bytestructure-bytevector
            (bytestructure
              (bs:vector 6 float)
              (cond ((vector? a) a) ((list? a) (list->vector a)))))))
      matrix)))
(define-libinput-procedure
  (libinput-device-config-calibration-get-default-matrix device matrix)
  (ffi:int
    "libinput_device_config_calibration_get_default_matrix"
    (list '* '*))
  (% (unwrap-libinput-device device)
     ((lambda (a)
        (ffi:bytevector->pointer
          (bytestructure-bytevector
            (bytestructure
              (bs:vector 6 float)
              (cond ((vector? a) a) ((list? a) (list->vector a)))))))
      matrix)))
(begin
  (define-public %libinput-config-send-events-mode-enum
    (bs:enum
      '((LIBINPUT_CONFIG_SEND_EVENTS_ENABLED 0)
        (LIBINPUT_CONFIG_SEND_EVENTS_DISABLED 1)
        (LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE 2))))
  (define-public LIBINPUT_CONFIG_SEND_EVENTS_ENABLED 0)
  (define-public LIBINPUT_CONFIG_SEND_EVENTS_DISABLED 1)
  (define-public LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE 2)
  (define-public (number->%libinput-config-send-events-mode-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_SEND_EVENTS_ENABLED)
            (1 . LIBINPUT_CONFIG_SEND_EVENTS_DISABLED)
            (2 . LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE))
          o)
        (error "not found" '%libinput-config-send-events-mode-enum o)))
  (define-public (%libinput-config-send-events-mode-enum->number o)
    (bs:enum->integer %libinput-config-send-events-mode-enum o)))
(define-libinput-procedure
  (libinput-device-config-send-events-get-modes device)
  (ffi:uint32 "libinput_device_config_send_events_get_modes" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-send-events-set-mode device mode)
  (ffi:int32
    "libinput_device_config_send_events_set_mode"
    (list '* ffi:uint32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device) mode)))
(define-libinput-procedure
  (libinput-device-config-send-events-get-mode device)
  (ffi:uint32 "libinput_device_config_send_events_get_mode" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-send-events-get-default-mode device)
  (ffi:uint32 "libinput_device_config_send_events_get_default_mode" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-accel-is-available device)
  (ffi:int "libinput_device_config_accel_is_available" (list '*))
  (non-zero? (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-accel-set-speed device speed)
  (ffi:int32 "libinput_device_config_accel_set_speed" (list '* ffi:double))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device) speed)))
(define-libinput-procedure
  (libinput-device-config-accel-get-speed device)
  (ffi:double "libinput_device_config_accel_get_speed" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-accel-get-default-speed device)
  (ffi:double "libinput_device_config_accel_get_default_speed" (list '*))
  (% (unwrap-libinput-device device)))
(begin
  (define-public %libinput-config-accel-profile-enum
    (bs:enum
      '((LIBINPUT_CONFIG_ACCEL_PROFILE_NONE 0)
        (LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT 1)
        (LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE 2))))
  (define-public LIBINPUT_CONFIG_ACCEL_PROFILE_NONE 0)
  (define-public LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT 1)
  (define-public LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE 2)
  (define-public (number->%libinput-config-accel-profile-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_ACCEL_PROFILE_NONE)
            (1 . LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT)
            (2 . LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE))
          o)
        (error "not found" '%libinput-config-accel-profile-enum o)))
  (define-public (%libinput-config-accel-profile-enum->number o)
    (bs:enum->integer %libinput-config-accel-profile-enum o)))
(define-libinput-procedure
  (libinput-device-config-accel-get-profiles device)
  (ffi:uint32 "libinput_device_config_accel_get_profiles" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-accel-set-profile device profile)
  (ffi:int32 "libinput_device_config_accel_set_profile" (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-accel-profile-enum->number profile))))
(define-libinput-procedure
  (libinput-device-config-accel-get-profile device)
  (ffi:int32 "libinput_device_config_accel_get_profile" (list '*))
  (number->%libinput-config-accel-profile-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-accel-get-default-profile device)
  (ffi:int32 "libinput_device_config_accel_get_default_profile" (list '*))
  (number->%libinput-config-accel-profile-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-scroll-has-natural-scroll device)
  (ffi:int "libinput_device_config_scroll_has_natural_scroll" (list '*))
  (non-zero? (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-scroll-set-natural-scroll-enabled device enable)
  (ffi:int32
    "libinput_device_config_scroll_set_natural_scroll_enabled"
    (list '* ffi:int))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device) enable)))
(define-libinput-procedure
  (libinput-device-config-scroll-get-natural-scroll-enabled device)
  (ffi:int
    "libinput_device_config_scroll_get_natural_scroll_enabled"
    (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-scroll-get-default-natural-scroll-enabled device)
  (ffi:int
    "libinput_device_config_scroll_get_default_natural_scroll_enabled"
    (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-left-handed-is-available device)
  (ffi:int "libinput_device_config_left_handed_is_available" (list '*))
  (non-zero? (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-left-handed-set device left_handed)
  (ffi:int32 "libinput_device_config_left_handed_set" (list '* ffi:int))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device) left_handed)))
(define-libinput-procedure
  (libinput-device-config-left-handed-get device)
  (ffi:int "libinput_device_config_left_handed_get" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-left-handed-get-default device)
  (ffi:int "libinput_device_config_left_handed_get_default" (list '*))
  (% (unwrap-libinput-device device)))
(begin
  (define-public %libinput-config-click-method-enum
    (bs:enum
      '((LIBINPUT_CONFIG_CLICK_METHOD_NONE 0)
        (LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS 1)
        (LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER 2))))
  (define-public LIBINPUT_CONFIG_CLICK_METHOD_NONE 0)
  (define-public LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS 1)
  (define-public LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER 2)
  (define-public (number->%libinput-config-click-method-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_CLICK_METHOD_NONE)
            (1 . LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS)
            (2 . LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER))
          o)
        (error "not found" '%libinput-config-click-method-enum o)))
  (define-public (%libinput-config-click-method-enum->number o)
    (bs:enum->integer %libinput-config-click-method-enum o)))
(define-libinput-procedure
  (libinput-device-config-click-get-methods device)
  (ffi:uint32 "libinput_device_config_click_get_methods" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-click-set-method device method)
  (ffi:int32 "libinput_device_config_click_set_method" (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-click-method-enum->number method))))
(define-libinput-procedure
  (libinput-device-config-click-get-method device)
  (ffi:int32 "libinput_device_config_click_get_method" (list '*))
  (number->%libinput-config-click-method-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-click-get-default-method device)
  (ffi:int32 "libinput_device_config_click_get_default_method" (list '*))
  (number->%libinput-config-click-method-enum
    (% (unwrap-libinput-device device))))
(begin
  (define-public %libinput-config-middle-emulation-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_MIDDLE_EMULATION_DISABLED 0)
        (LIBINPUT_CONFIG_MIDDLE_EMULATION_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_MIDDLE_EMULATION_DISABLED 0)
  (define-public LIBINPUT_CONFIG_MIDDLE_EMULATION_ENABLED 1)
  (define-public (number->%libinput-config-middle-emulation-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_MIDDLE_EMULATION_DISABLED)
            (1 . LIBINPUT_CONFIG_MIDDLE_EMULATION_ENABLED))
          o)
        (error "not found" '%libinput-config-middle-emulation-state-enum o)))
  (define-public (%libinput-config-middle-emulation-state-enum->number o)
    (bs:enum->integer %libinput-config-middle-emulation-state-enum o)))
(define-libinput-procedure
  (libinput-device-config-middle-emulation-is-available device)
  (ffi:int "libinput_device_config_middle_emulation_is_available" (list '*))
  (non-zero? (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-middle-emulation-set-enabled device enable)
  (ffi:int32
    "libinput_device_config_middle_emulation_set_enabled"
    (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-middle-emulation-state-enum->number enable))))
(define-libinput-procedure
  (libinput-device-config-middle-emulation-get-enabled device)
  (ffi:int32 "libinput_device_config_middle_emulation_get_enabled" (list '*))
  (number->%libinput-config-middle-emulation-state-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-middle-emulation-get-default-enabled device)
  (ffi:int32
    "libinput_device_config_middle_emulation_get_default_enabled"
    (list '*))
  (number->%libinput-config-middle-emulation-state-enum
    (% (unwrap-libinput-device device))))
(begin
  (define-public %libinput-config-scroll-method-enum
    (bs:enum
      '((LIBINPUT_CONFIG_SCROLL_NO_SCROLL 0)
        (LIBINPUT_CONFIG_SCROLL_2FG 1)
        (LIBINPUT_CONFIG_SCROLL_EDGE 2)
        (LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN 4))))
  (define-public LIBINPUT_CONFIG_SCROLL_NO_SCROLL 0)
  (define-public LIBINPUT_CONFIG_SCROLL_2FG 1)
  (define-public LIBINPUT_CONFIG_SCROLL_EDGE 2)
  (define-public LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN 4)
  (define-public (number->%libinput-config-scroll-method-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_SCROLL_NO_SCROLL)
            (1 . LIBINPUT_CONFIG_SCROLL_2FG)
            (2 . LIBINPUT_CONFIG_SCROLL_EDGE)
            (4 . LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN))
          o)
        (error "not found" '%libinput-config-scroll-method-enum o)))
  (define-public (%libinput-config-scroll-method-enum->number o)
    (bs:enum->integer %libinput-config-scroll-method-enum o)))
(define-libinput-procedure
  (libinput-device-config-scroll-get-methods device)
  (ffi:uint32 "libinput_device_config_scroll_get_methods" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-scroll-set-method device method)
  (ffi:int32 "libinput_device_config_scroll_set_method" (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-scroll-method-enum->number method))))
(define-libinput-procedure
  (libinput-device-config-scroll-get-method device)
  (ffi:int32 "libinput_device_config_scroll_get_method" (list '*))
  (number->%libinput-config-scroll-method-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-scroll-get-default-method device)
  (ffi:int32 "libinput_device_config_scroll_get_default_method" (list '*))
  (number->%libinput-config-scroll-method-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-scroll-set-button device button)
  (ffi:int32 "libinput_device_config_scroll_set_button" (list '* ffi:uint32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device) button)))
(define-libinput-procedure
  (libinput-device-config-scroll-get-button device)
  (ffi:uint32 "libinput_device_config_scroll_get_button" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-scroll-get-default-button device)
  (ffi:uint32 "libinput_device_config_scroll_get_default_button" (list '*))
  (% (unwrap-libinput-device device)))
(begin
  (define-public %libinput-config-scroll-button-lock-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_DISABLED 0)
        (LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_DISABLED 0)
  (define-public LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_ENABLED 1)
  (define-public (number->%libinput-config-scroll-button-lock-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_DISABLED)
            (1 . LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_ENABLED))
          o)
        (error "not found" '%libinput-config-scroll-button-lock-state-enum o)))
  (define-public (%libinput-config-scroll-button-lock-state-enum->number o)
    (bs:enum->integer %libinput-config-scroll-button-lock-state-enum o)))
(define-libinput-procedure
  (libinput-device-config-scroll-set-button-lock device state)
  (ffi:int32
    "libinput_device_config_scroll_set_button_lock"
    (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-scroll-button-lock-state-enum->number state))))
(define-libinput-procedure
  (libinput-device-config-scroll-get-button-lock device)
  (ffi:int32 "libinput_device_config_scroll_get_button_lock" (list '*))
  (number->%libinput-config-scroll-button-lock-state-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-scroll-get-default-button-lock device)
  (ffi:int32 "libinput_device_config_scroll_get_default_button_lock" (list '*))
  (number->%libinput-config-scroll-button-lock-state-enum
    (% (unwrap-libinput-device device))))
(begin
  (define-public %libinput-config-dwt-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_DWT_DISABLED 0) (LIBINPUT_CONFIG_DWT_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_DWT_DISABLED 0)
  (define-public LIBINPUT_CONFIG_DWT_ENABLED 1)
  (define-public (number->%libinput-config-dwt-state-enum o)
    (or (assq-ref
          '((0 . LIBINPUT_CONFIG_DWT_DISABLED)
            (1 . LIBINPUT_CONFIG_DWT_ENABLED))
          o)
        (error "not found" '%libinput-config-dwt-state-enum o)))
  (define-public (%libinput-config-dwt-state-enum->number o)
    (bs:enum->integer %libinput-config-dwt-state-enum o)))
(define-libinput-procedure
  (libinput-device-config-dwt-is-available device)
  (ffi:int "libinput_device_config_dwt_is_available" (list '*))
  (non-zero? (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-dwt-set-enabled device enable)
  (ffi:int32 "libinput_device_config_dwt_set_enabled" (list '* ffi:int32))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device)
       (%libinput-config-dwt-state-enum->number enable))))
(define-libinput-procedure
  (libinput-device-config-dwt-get-enabled device)
  (ffi:int32 "libinput_device_config_dwt_get_enabled" (list '*))
  (number->%libinput-config-dwt-state-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-dwt-get-default-enabled device)
  (ffi:int32 "libinput_device_config_dwt_get_default_enabled" (list '*))
  (number->%libinput-config-dwt-state-enum
    (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-rotation-is-available device)
  (ffi:int "libinput_device_config_rotation_is_available" (list '*))
  (non-zero? (% (unwrap-libinput-device device))))
(define-libinput-procedure
  (libinput-device-config-rotation-set-angle device degrees_cw)
  (ffi:int32
    "libinput_device_config_rotation_set_angle"
    (list '* ffi:unsigned-int))
  (number->%libinput-config-status-enum
    (% (unwrap-libinput-device device) degrees_cw)))
(define-libinput-procedure
  (libinput-device-config-rotation-get-angle device)
  (ffi:unsigned-int "libinput_device_config_rotation_get_angle" (list '*))
  (% (unwrap-libinput-device device)))
(define-libinput-procedure
  (libinput-device-config-rotation-get-default-angle device)
  (ffi:unsigned-int
    "libinput_device_config_rotation_get_default_angle"
    (list '*))
  (% (unwrap-libinput-device device)))
