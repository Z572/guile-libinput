(define-module
  (libinput)
  #:use-module
  (bytestructure-class)
  #:use-module
  ((system foreign) #:prefix ffi:)
  #:use-module
  (bytestructures guile)
  #:use-module
  (oop goops)
  #:use-module
  (libinput config))
(define (pointer->string* ptr)
  (if (ffi:null-pointer? ptr) #f (ffi:pointer->string ptr)))
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
  (define-public (%libinput-device-capability-enum->number o)
    (bs:enum->integer %libinput-device-capability-enum o)))
(begin
  (define-public %libinput-key-state-enum
    (bs:enum
      '((LIBINPUT_KEY_STATE_RELEASED 0) (LIBINPUT_KEY_STATE_PRESSED 1))))
  (define-public LIBINPUT_KEY_STATE_RELEASED 0)
  (define-public LIBINPUT_KEY_STATE_PRESSED 1)
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
  (define-public (%libinput-led-enum->number o)
    (bs:enum->integer %libinput-led-enum o)))
(begin
  (define-public %libinput-button-state-enum
    (bs:enum
      '((LIBINPUT_BUTTON_STATE_RELEASED 0) (LIBINPUT_BUTTON_STATE_PRESSED 1))))
  (define-public LIBINPUT_BUTTON_STATE_RELEASED 0)
  (define-public LIBINPUT_BUTTON_STATE_PRESSED 1)
  (define-public (%libinput-button-state-enum->number o)
    (bs:enum->integer %libinput-button-state-enum o)))
(begin
  (define-public %libinput-pointer-axis-enum
    (bs:enum
      '((LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL 0)
        (LIBINPUT_POINTER_AXIS_SCROLL_HORIZONTAL 1))))
  (define-public LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL 0)
  (define-public LIBINPUT_POINTER_AXIS_SCROLL_HORIZONTAL 1)
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
  (define-public (%libinput-pointer-axis-source-enum->number o)
    (bs:enum->integer %libinput-pointer-axis-source-enum o)))
(begin
  (define-public %libinput-tablet-pad-ring-axis-source-enum
    (bs:enum
      '((LIBINPUT_TABLET_PAD_RING_SOURCE_UNKNOWN 1)
        (LIBINPUT_TABLET_PAD_RING_SOURCE_FINGER 2))))
  (define-public LIBINPUT_TABLET_PAD_RING_SOURCE_UNKNOWN 1)
  (define-public LIBINPUT_TABLET_PAD_RING_SOURCE_FINGER 2)
  (define-public (%libinput-tablet-pad-ring-axis-source-enum->number o)
    (bs:enum->integer %libinput-tablet-pad-ring-axis-source-enum o)))
(begin
  (define-public %libinput-tablet-pad-strip-axis-source-enum
    (bs:enum
      '((LIBINPUT_TABLET_PAD_STRIP_SOURCE_UNKNOWN 1)
        (LIBINPUT_TABLET_PAD_STRIP_SOURCE_FINGER 2))))
  (define-public LIBINPUT_TABLET_PAD_STRIP_SOURCE_UNKNOWN 1)
  (define-public LIBINPUT_TABLET_PAD_STRIP_SOURCE_FINGER 2)
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
  (define-public (%libinput-tablet-tool-type-enum->number o)
    (bs:enum->integer %libinput-tablet-tool-type-enum o)))
(begin
  (define-public %libinput-tablet-tool-proximity-state-enum
    (bs:enum
      '((LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_OUT 0)
        (LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_IN 1))))
  (define-public LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_OUT 0)
  (define-public LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_IN 1)
  (define-public (%libinput-tablet-tool-proximity-state-enum->number o)
    (bs:enum->integer %libinput-tablet-tool-proximity-state-enum o)))
(begin
  (define-public %libinput-tablet-tool-tip-state-enum
    (bs:enum
      '((LIBINPUT_TABLET_TOOL_TIP_UP 0) (LIBINPUT_TABLET_TOOL_TIP_DOWN 1))))
  (define-public LIBINPUT_TABLET_TOOL_TIP_UP 0)
  (define-public LIBINPUT_TABLET_TOOL_TIP_DOWN 1)
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
(define-public libinput-device-tablet-pad-get-num-mode-groups
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_tablet_pad_get_num_mode_groups"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-tablet-pad-get-mode-group
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_device_tablet_pad_get_mode_group"
                   (force %libinput))
                 (list '* ffi:unsigned-int))))
    (lambda (device index)
      (wrap-libinput-tablet-pad-mode-group
        (%func (unwrap-libinput-device device) index)))))
(define-public libinput-tablet-pad-mode-group-get-index
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_get_index"
                   (force %libinput))
                 (list '*))))
    (lambda (group) (%func (unwrap-libinput-tablet-pad-mode-group group)))))
(define-public libinput-tablet-pad-mode-group-get-num-modes
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_get_num_modes"
                   (force %libinput))
                 (list '*))))
    (lambda (group) (%func (unwrap-libinput-tablet-pad-mode-group group)))))
(define-public libinput-tablet-pad-mode-group-get-mode
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_get_mode"
                   (force %libinput))
                 (list '*))))
    (lambda (group) (%func (unwrap-libinput-tablet-pad-mode-group group)))))
(define-public libinput-tablet-pad-mode-group-has-button
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_has_button"
                   (force %libinput))
                 (list '* ffi:unsigned-int))))
    (lambda (group button)
      (%func (unwrap-libinput-tablet-pad-mode-group group) button))))
(define-public libinput-tablet-pad-mode-group-has-ring
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_has_ring"
                   (force %libinput))
                 (list '* ffi:unsigned-int))))
    (lambda (group ring)
      (%func (unwrap-libinput-tablet-pad-mode-group group) ring))))
(define-public libinput-tablet-pad-mode-group-has-strip
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_has_strip"
                   (force %libinput))
                 (list '* ffi:unsigned-int))))
    (lambda (group strip)
      (%func (unwrap-libinput-tablet-pad-mode-group group) strip))))
(define-public libinput-tablet-pad-mode-group-button-is-toggle
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_button_is_toggle"
                   (force %libinput))
                 (list '* ffi:unsigned-int))))
    (lambda (group button)
      (%func (unwrap-libinput-tablet-pad-mode-group group) button))))
(define-public libinput-tablet-pad-mode-group-ref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_ref"
                   (force %libinput))
                 (list '*))))
    (lambda (group)
      (wrap-libinput-tablet-pad-mode-group
        (%func (unwrap-libinput-tablet-pad-mode-group group))))))
(define-public libinput-tablet-pad-mode-group-unref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_unref"
                   (force %libinput))
                 (list '*))))
    (lambda (group)
      (wrap-libinput-tablet-pad-mode-group
        (%func (unwrap-libinput-tablet-pad-mode-group group))))))
(define-public libinput-tablet-pad-mode-group-set-user-data
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_set_user_data"
                   (force %libinput))
                 (list '* '*))))
    (lambda (group user_data)
      (%func (unwrap-libinput-tablet-pad-mode-group group) user_data))))
(define-public libinput-tablet-pad-mode-group-get-user-data
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_tablet_pad_mode_group_get_user_data"
                   (force %libinput))
                 (list '*))))
    (lambda (group) (%func (unwrap-libinput-tablet-pad-mode-group group)))))
(begin
  (define-public %libinput-switch-state-enum
    (bs:enum '((LIBINPUT_SWITCH_STATE_OFF 0) (LIBINPUT_SWITCH_STATE_ON 1))))
  (define-public LIBINPUT_SWITCH_STATE_OFF 0)
  (define-public LIBINPUT_SWITCH_STATE_ON 1)
  (define-public (%libinput-switch-state-enum->number o)
    (bs:enum->integer %libinput-switch-state-enum o)))
(begin
  (define-public %libinput-switch-enum
    (bs:enum '((LIBINPUT_SWITCH_LID 1) (LIBINPUT_SWITCH_TABLET_MODE 2))))
  (define-public LIBINPUT_SWITCH_LID 1)
  (define-public LIBINPUT_SWITCH_TABLET_MODE 2)
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
  (define-public (%libinput-event-type-enum->number o)
    (bs:enum->integer %libinput-event-type-enum o)))
(define-public libinput-event-destroy
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func "libinput_event_destroy" (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event event)))))
(define-public libinput-event-get-type
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func "libinput_event_get_type" (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event event)))))
(define-public libinput-event-get-context
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_event_get_context" (force %libinput))
                 (list '*))))
    (lambda (event) (wrap-libinput (%func (unwrap-libinput-event event))))))
(define-public libinput-event-get-device
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_event_get_device" (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-device (%func (unwrap-libinput-event event))))))
(define-public libinput-event-get-pointer-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_get_pointer_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event-pointer (%func (unwrap-libinput-event event))))))
(define-public libinput-event-get-keyboard-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_get_keyboard_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event-keyboard (%func (unwrap-libinput-event event))))))
(define-public libinput-event-get-touch-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_get_touch_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event-touch (%func (unwrap-libinput-event event))))))
(begin
  (define-public %libinput-event-gesture-struct (bs:unknow))
  (define-bytestructure-class
    <libinput-event-gesture>
    ()
    %libinput-event-gesture-struct
    wrap-libinput-event-gesture
    unwrap-libinput-event-gesture
    libinput-event-gesture?))
(define-public libinput-event-get-gesture-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_get_gesture_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event-gesture (%func (unwrap-libinput-event event))))))
(define-public libinput-event-get-tablet-tool-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_get_tablet_tool_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event-tablet-tool
        (%func (unwrap-libinput-event event))))))
(define-public libinput-event-get-tablet-pad-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_get_tablet_pad_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event-tablet-pad (%func (unwrap-libinput-event event))))))
(define-public libinput-event-get-switch-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_get_switch_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event-switch (%func (unwrap-libinput-event event))))))
(define-public libinput-event-get-device-notify-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_get_device_notify_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event-device-notify
        (%func (unwrap-libinput-event event))))))
(define-public libinput-event-device-notify-get-base-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_device_notify_get_base_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event
        (%func (unwrap-libinput-event-device-notify event))))))
(define-public libinput-event-keyboard-get-time
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_keyboard_get_time"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-keyboard event)))))
(define-public libinput-event-keyboard-get-time-usec
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_event_keyboard_get_time_usec"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-keyboard event)))))
(define-public libinput-event-keyboard-get-key
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_keyboard_get_key"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-keyboard event)))))
(define-public libinput-event-keyboard-get-key-state
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_keyboard_get_key_state"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-keyboard event)))))
(define-public libinput-event-keyboard-get-base-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_keyboard_get_base_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event (%func (unwrap-libinput-event-keyboard event))))))
(define-public libinput-event-keyboard-get-seat-key-count
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_keyboard_get_seat_key_count"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-keyboard event)))))
(define-public libinput-event-pointer-get-time
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_pointer_get_time"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-time-usec
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_event_pointer_get_time_usec"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-dx
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_dx"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-dy
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_dy"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-dx-unaccelerated
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_dx_unaccelerated"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-dy-unaccelerated
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_dy_unaccelerated"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-absolute-x
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_absolute_x"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-absolute-y
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_absolute_y"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-absolute-x-transformed
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_absolute_x_transformed"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (event width)
      (%func (unwrap-libinput-event-pointer event) width))))
(define-public libinput-event-pointer-get-absolute-y-transformed
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_absolute_y_transformed"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (event height)
      (%func (unwrap-libinput-event-pointer event) height))))
(define-public libinput-event-pointer-get-button
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_pointer_get_button"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-button-state
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_pointer_get_button_state"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-seat-button-count
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_pointer_get_seat_button_count"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-has-axis
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_pointer_has_axis"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (event axis)
      (%func (unwrap-libinput-event-pointer event)
             (%libinput-pointer-axis-enum->number axis)))))
(define-public libinput-event-pointer-get-axis-value
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_axis_value"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (event axis)
      (%func (unwrap-libinput-event-pointer event)
             (%libinput-pointer-axis-enum->number axis)))))
(define-public libinput-event-pointer-get-axis-source
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_pointer_get_axis_source"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-pointer event)))))
(define-public libinput-event-pointer-get-axis-value-discrete
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_axis_value_discrete"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (event axis)
      (%func (unwrap-libinput-event-pointer event)
             (%libinput-pointer-axis-enum->number axis)))))
(define-public libinput-event-pointer-get-scroll-value
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_scroll_value"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (event axis)
      (%func (unwrap-libinput-event-pointer event)
             (%libinput-pointer-axis-enum->number axis)))))
(define-public libinput-event-pointer-get-scroll-value-v120
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_pointer_get_scroll_value_v120"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (event axis)
      (%func (unwrap-libinput-event-pointer event)
             (%libinput-pointer-axis-enum->number axis)))))
(define-public libinput-event-pointer-get-base-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_pointer_get_base_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event (%func (unwrap-libinput-event-pointer event))))))
(define-public libinput-event-touch-get-time
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_touch_get_time"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-touch event)))))
(define-public libinput-event-touch-get-time-usec
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_event_touch_get_time_usec"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-touch event)))))
(define-public libinput-event-touch-get-slot
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_touch_get_slot"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-touch event)))))
(define-public libinput-event-touch-get-seat-slot
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_touch_get_seat_slot"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-touch event)))))
(define-public libinput-event-touch-get-x
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func "libinput_event_touch_get_x" (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-touch event)))))
(define-public libinput-event-touch-get-y
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func "libinput_event_touch_get_y" (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-touch event)))))
(define-public libinput-event-touch-get-x-transformed
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_touch_get_x_transformed"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (event width) (%func (unwrap-libinput-event-touch event) width))))
(define-public libinput-event-touch-get-y-transformed
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_touch_get_y_transformed"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (event height)
      (%func (unwrap-libinput-event-touch event) height))))
(define-public libinput-event-touch-get-base-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_touch_get_base_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event (%func (unwrap-libinput-event-touch event))))))
(define-public libinput-event-gesture-get-time
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_gesture_get_time"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-time-usec
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_event_gesture_get_time_usec"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-base-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_gesture_get_base_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event (%func (unwrap-libinput-event-gesture event))))))
(define-public libinput-event-gesture-get-finger-count
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_gesture_get_finger_count"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-cancelled
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_gesture_get_cancelled"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-dx
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_gesture_get_dx"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-dy
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_gesture_get_dy"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-dx-unaccelerated
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_gesture_get_dx_unaccelerated"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-dy-unaccelerated
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_gesture_get_dy_unaccelerated"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-scale
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_gesture_get_scale"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-gesture-get-angle-delta
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_gesture_get_angle_delta"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-gesture event)))))
(define-public libinput-event-tablet-tool-get-base-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_tablet_tool_get_base_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event
        (%func (unwrap-libinput-event-tablet-tool event))))))
(define-public libinput-event-tablet-tool-x-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_x_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-y-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_y_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-pressure-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_pressure_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-distance-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_distance_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-tilt-x-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_tilt_x_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-tilt-y-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_tilt_y_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-rotation-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_rotation_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-slider-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_slider_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-size-major-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_size_major_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-size-minor-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_size_minor_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-wheel-has-changed
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_wheel_has_changed"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-x
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_x"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-y
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_y"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-dx
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_dx"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-dy
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_dy"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-pressure
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_pressure"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-distance
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_distance"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-tilt-x
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_tilt_x"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-tilt-y
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_tilt_y"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-rotation
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_rotation"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-slider-position
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_slider_position"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-size-major
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_size_major"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-size-minor
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_size_minor"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-wheel-delta
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_wheel_delta"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-wheel-delta-discrete
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_event_tablet_tool_get_wheel_delta_discrete"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-x-transformed
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_x_transformed"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (event width)
      (%func (unwrap-libinput-event-tablet-tool event) width))))
(define-public libinput-event-tablet-tool-get-y-transformed
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_tool_get_y_transformed"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (event height)
      (%func (unwrap-libinput-event-tablet-tool event) height))))
(define-public libinput-event-tablet-tool-get-tool
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_tablet_tool_get_tool"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-tablet-tool
        (%func (unwrap-libinput-event-tablet-tool event))))))
(define-public libinput-event-tablet-tool-get-proximity-state
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_tablet_tool_get_proximity_state"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-tip-state
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_tablet_tool_get_tip_state"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-button
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_tablet_tool_get_button"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-button-state
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_tablet_tool_get_button_state"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-seat-button-count
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_tablet_tool_get_seat_button_count"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-time
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_tablet_tool_get_time"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-event-tablet-tool-get-time-usec
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_event_tablet_tool_get_time_usec"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-tool event)))))
(define-public libinput-tablet-tool-get-type
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_tablet_tool_get_type"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-get-tool-id
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_tablet_tool_get_tool_id"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-ref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_tablet_tool_ref" (force %libinput))
                 (list '*))))
    (lambda (tool)
      (wrap-libinput-tablet-tool (%func (unwrap-libinput-tablet-tool tool))))))
(define-public libinput-tablet-tool-unref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_tablet_tool_unref" (force %libinput))
                 (list '*))))
    (lambda (tool)
      (wrap-libinput-tablet-tool (%func (unwrap-libinput-tablet-tool tool))))))
(define-public libinput-tablet-tool-has-pressure
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_has_pressure"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-has-distance
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_has_distance"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-has-tilt
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_has_tilt"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-has-rotation
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_has_rotation"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-has-slider
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_has_slider"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-has-size
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_has_size"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-has-wheel
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_has_wheel"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-has-button
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_has_button"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (tool code) (%func (unwrap-libinput-tablet-tool tool) code))))
(define-public libinput-tablet-tool-is-unique
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_tablet_tool_is_unique"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-get-serial
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_tablet_tool_get_serial"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-get-user-data
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_tablet_tool_get_user_data"
                   (force %libinput))
                 (list '*))))
    (lambda (tool) (%func (unwrap-libinput-tablet-tool tool)))))
(define-public libinput-tablet-tool-set-user-data
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func
                   "libinput_tablet_tool_set_user_data"
                   (force %libinput))
                 (list '* '*))))
    (lambda (tool user_data)
      (%func (unwrap-libinput-tablet-tool tool) user_data))))
(define-public libinput-event-tablet-pad-get-base-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_tablet_pad_get_base_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event (%func (unwrap-libinput-event-tablet-pad event))))))
(define-public libinput-event-tablet-pad-get-ring-position
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_pad_get_ring_position"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-ring-number
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_event_tablet_pad_get_ring_number"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-ring-source
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_tablet_pad_get_ring_source"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-strip-position
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_event_tablet_pad_get_strip_position"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-strip-number
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_event_tablet_pad_get_strip_number"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-strip-source
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_tablet_pad_get_strip_source"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-button-number
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_tablet_pad_get_button_number"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-button-state
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_tablet_pad_get_button_state"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-key
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_tablet_pad_get_key"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-key-state
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_tablet_pad_get_key_state"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-mode
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_event_tablet_pad_get_mode"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-mode-group
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_tablet_pad_get_mode_group"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-tablet-pad-mode-group
        (%func (unwrap-libinput-event-tablet-pad event))))))
(define-public libinput-event-tablet-pad-get-time
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_tablet_pad_get_time"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-tablet-pad-get-time-usec
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_event_tablet_pad_get_time_usec"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-tablet-pad event)))))
(define-public libinput-event-switch-get-switch
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_switch_get_switch"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-switch event)))))
(define-public libinput-event-switch-get-switch-state
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_event_switch_get_switch_state"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-switch event)))))
(define-public libinput-event-switch-get-base-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_event_switch_get_base_event"
                   (force %libinput))
                 (list '*))))
    (lambda (event)
      (wrap-libinput-event (%func (unwrap-libinput-event-switch event))))))
(define-public libinput-event-switch-get-time
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_event_switch_get_time"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-switch event)))))
(define-public libinput-event-switch-get-time-usec
  (let ((%func (ffi:pointer->procedure
                 ffi:uint64
                 (dynamic-func
                   "libinput_event_switch_get_time_usec"
                   (force %libinput))
                 (list '*))))
    (lambda (event) (%func (unwrap-libinput-event-switch event)))))
(begin
  (define-public %libinput-interface-struct
    (bs:struct
      `((open_restricted ,(bs:pointer '*))
        (close_restricted ,(bs:pointer '*)))))
  (define-bytestructure-class
    <libinput-interface>
    ()
    %libinput-interface-struct
    wrap-libinput-interface
    unwrap-libinput-interface
    libinput-interface?
    (open_restricted
      #:init-keyword
      #:open_restricted
      #:accessor
      .open_restricted)
    (close_restricted
      #:init-keyword
      #:close_restricted
      #:accessor
      .close_restricted))
  (export .open_restricted .close_restricted))
(define-public libinput-udev-create-context
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_udev_create_context"
                   (force %libinput))
                 (list '* '* '*))))
    (lambda (interface user_data udev)
      (wrap-libinput
        (%func (unwrap-libinput-interface interface) user_data udev)))))
(define-public libinput-udev-assign-seat
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func "libinput_udev_assign_seat" (force %libinput))
                 (list '* '*))))
    (lambda (libinput seat_id)
      (%func (unwrap-libinput libinput) (ffi:string->pointer seat_id)))))
(define-public libinput-path-create-context
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_path_create_context"
                   (force %libinput))
                 (list '* '*))))
    (lambda (interface user_data)
      (wrap-libinput
        (%func (unwrap-libinput-interface interface) user_data)))))
(define-public libinput-path-add-device
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_path_add_device" (force %libinput))
                 (list '* '*))))
    (lambda (libinput path)
      (wrap-libinput-device
        (%func (unwrap-libinput libinput) (ffi:string->pointer path))))))
(define-public libinput-path-remove-device
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func "libinput_path_remove_device" (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-get-fd
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func "libinput_get_fd" (force %libinput))
                 (list '*))))
    (lambda (libinput) (%func (unwrap-libinput libinput)))))
(define-public libinput-dispatch
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func "libinput_dispatch" (force %libinput))
                 (list '*))))
    (lambda (libinput) (%func (unwrap-libinput libinput)))))
(define-public libinput-get-event
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_get_event" (force %libinput))
                 (list '*))))
    (lambda (libinput)
      (wrap-libinput-event (%func (unwrap-libinput libinput))))))
(define-public libinput-next-event-type
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func "libinput_next_event_type" (force %libinput))
                 (list '*))))
    (lambda (libinput) (%func (unwrap-libinput libinput)))))
(define-public libinput-set-user-data
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func "libinput_set_user_data" (force %libinput))
                 (list '* '*))))
    (lambda (libinput user_data)
      (%func (unwrap-libinput libinput) user_data))))
(define-public libinput-get-user-data
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_get_user_data" (force %libinput))
                 (list '*))))
    (lambda (libinput) (%func (unwrap-libinput libinput)))))
(define-public libinput-resume
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func "libinput_resume" (force %libinput))
                 (list '*))))
    (lambda (libinput) (%func (unwrap-libinput libinput)))))
(define-public libinput-suspend
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func "libinput_suspend" (force %libinput))
                 (list '*))))
    (lambda (libinput) (%func (unwrap-libinput libinput)))))
(define-public libinput-ref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_ref" (force %libinput))
                 (list '*))))
    (lambda (libinput) (wrap-libinput (%func (unwrap-libinput libinput))))))
(define-public libinput-unref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_unref" (force %libinput))
                 (list '*))))
    (lambda (libinput) (wrap-libinput (%func (unwrap-libinput libinput))))))
(define-public libinput-log-set-priority
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func "libinput_log_set_priority" (force %libinput))
                 (list '* ffi:int32))))
    (lambda (libinput priority)
      (%func (unwrap-libinput libinput)
             (%libinput-log-priority-enum->number priority)))))
(define-public libinput-log-get-priority
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func "libinput_log_get_priority" (force %libinput))
                 (list '*))))
    (lambda (libinput) (%func (unwrap-libinput libinput)))))
(define-public libinput_log_handler (bs:pointer '*))
(define-public libinput-log-set-handler
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func "libinput_log_set_handler" (force %libinput))
                 (list '* '*))))
    (lambda (libinput log_handler)
      (%func (unwrap-libinput libinput) log_handler))))
(define-public libinput-seat-ref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_seat_ref" (force %libinput))
                 (list '*))))
    (lambda (seat) (wrap-libinput-seat (%func (unwrap-libinput-seat seat))))))
(define-public libinput-seat-unref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_seat_unref" (force %libinput))
                 (list '*))))
    (lambda (seat) (wrap-libinput-seat (%func (unwrap-libinput-seat seat))))))
(define-public libinput-seat-set-user-data
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func "libinput_seat_set_user_data" (force %libinput))
                 (list '* '*))))
    (lambda (seat user_data) (%func (unwrap-libinput-seat seat) user_data))))
(define-public libinput-seat-get-user-data
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_seat_get_user_data" (force %libinput))
                 (list '*))))
    (lambda (seat) (%func (unwrap-libinput-seat seat)))))
(define-public libinput-seat-get-context
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_seat_get_context" (force %libinput))
                 (list '*))))
    (lambda (seat) (wrap-libinput (%func (unwrap-libinput-seat seat))))))
(define-public libinput-seat-get-physical-name
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_seat_get_physical_name"
                   (force %libinput))
                 (list '*))))
    (lambda (seat) (pointer->string* (%func (unwrap-libinput-seat seat))))))
(define-public libinput-seat-get-logical-name
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_seat_get_logical_name"
                   (force %libinput))
                 (list '*))))
    (lambda (seat) (pointer->string* (%func (unwrap-libinput-seat seat))))))
(define-public libinput-device-ref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_device_ref" (force %libinput))
                 (list '*))))
    (lambda (device)
      (wrap-libinput-device (%func (unwrap-libinput-device device))))))
(define-public libinput-device-unref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_device_unref" (force %libinput))
                 (list '*))))
    (lambda (device)
      (wrap-libinput-device (%func (unwrap-libinput-device device))))))
(define-public libinput-device-set-user-data
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func
                   "libinput_device_set_user_data"
                   (force %libinput))
                 (list '* '*))))
    (lambda (device user_data)
      (%func (unwrap-libinput-device device) user_data))))
(define-public libinput-device-get-user-data
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_device_get_user_data"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-get-context
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_device_get_context" (force %libinput))
                 (list '*))))
    (lambda (device) (wrap-libinput (%func (unwrap-libinput-device device))))))
(define-public libinput-device-get-device-group
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_device_get_device_group"
                   (force %libinput))
                 (list '*))))
    (lambda (device)
      (wrap-libinput-device-group (%func (unwrap-libinput-device device))))))
(define-public libinput-device-get-sysname
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_device_get_sysname" (force %libinput))
                 (list '*))))
    (lambda (device)
      (pointer->string* (%func (unwrap-libinput-device device))))))
(define-public libinput-device-get-name
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_device_get_name" (force %libinput))
                 (list '*))))
    (lambda (device)
      (pointer->string* (%func (unwrap-libinput-device device))))))
(define-public libinput-device-get-id-product
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_device_get_id_product"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-get-id-vendor
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_device_get_id_vendor"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-get-output-name
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_device_get_output_name"
                   (force %libinput))
                 (list '*))))
    (lambda (device)
      (pointer->string* (%func (unwrap-libinput-device device))))))
(define-public libinput-device-get-seat
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_device_get_seat" (force %libinput))
                 (list '*))))
    (lambda (device)
      (wrap-libinput-seat (%func (unwrap-libinput-device device))))))
(define-public libinput-device-set-seat-logical-name
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_set_seat_logical_name"
                   (force %libinput))
                 (list '* '*))))
    (lambda (device name)
      (%func (unwrap-libinput-device device) (ffi:string->pointer name)))))
(define-public libinput-device-get-udev-device
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_device_get_udev_device"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-led-update
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func "libinput_device_led_update" (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device leds)
      (%func (unwrap-libinput-device device)
             (%libinput-led-enum->number leds)))))
(define-public libinput-device-has-capability
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_has_capability"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device capability)
      (%func (unwrap-libinput-device device)
             (%libinput-device-capability-enum->number capability)))))
(define-public libinput-device-get-size
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func "libinput_device_get_size" (force %libinput))
                 (list '* '* '*))))
    (lambda (device width height)
      (%func (unwrap-libinput-device device) width height))))
(define-public libinput-device-pointer-has-button
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_pointer_has_button"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (device code) (%func (unwrap-libinput-device device) code))))
(define-public libinput-device-keyboard-has-key
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_keyboard_has_key"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (device code) (%func (unwrap-libinput-device device) code))))
(define-public libinput-device-touch-get-touch-count
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_touch_get_touch_count"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-switch-has-switch
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_switch_has_switch"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device sw)
      (%func (unwrap-libinput-device device)
             (%libinput-switch-enum->number sw)))))
(define-public libinput-device-tablet-pad-get-num-buttons
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_tablet_pad_get_num_buttons"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-tablet-pad-get-num-rings
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_tablet_pad_get_num_rings"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-tablet-pad-get-num-strips
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_tablet_pad_get_num_strips"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-tablet-pad-has-key
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_tablet_pad_has_key"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (device code) (%func (unwrap-libinput-device device) code))))
(define-public libinput-device-group-ref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_device_group_ref" (force %libinput))
                 (list '*))))
    (lambda (group)
      (wrap-libinput-device-group
        (%func (unwrap-libinput-device-group group))))))
(define-public libinput-device-group-unref
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func "libinput_device_group_unref" (force %libinput))
                 (list '*))))
    (lambda (group)
      (wrap-libinput-device-group
        (%func (unwrap-libinput-device-group group))))))
(define-public libinput-device-group-set-user-data
  (let ((%func (ffi:pointer->procedure
                 ffi:void
                 (dynamic-func
                   "libinput_device_group_set_user_data"
                   (force %libinput))
                 (list '* '*))))
    (lambda (group user_data)
      (%func (unwrap-libinput-device-group group) user_data))))
(define-public libinput-device-group-get-user-data
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_device_group_get_user_data"
                   (force %libinput))
                 (list '*))))
    (lambda (group) (%func (unwrap-libinput-device-group group)))))
(begin
  (define-public %libinput-config-status-enum
    (bs:enum
      '((LIBINPUT_CONFIG_STATUS_SUCCESS 0)
        (LIBINPUT_CONFIG_STATUS_UNSUPPORTED 1)
        (LIBINPUT_CONFIG_STATUS_INVALID 2))))
  (define-public LIBINPUT_CONFIG_STATUS_SUCCESS 0)
  (define-public LIBINPUT_CONFIG_STATUS_UNSUPPORTED 1)
  (define-public LIBINPUT_CONFIG_STATUS_INVALID 2)
  (define-public (%libinput-config-status-enum->number o)
    (bs:enum->integer %libinput-config-status-enum o)))
(define-public libinput-config-status-to-str
  (let ((%func (ffi:pointer->procedure
                 '*
                 (dynamic-func
                   "libinput_config_status_to_str"
                   (force %libinput))
                 (list ffi:int32))))
    (lambda (status)
      (pointer->string*
        (%func (%libinput-config-status-enum->number status))))))
(begin
  (define-public %libinput-config-tap-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_TAP_DISABLED 0) (LIBINPUT_CONFIG_TAP_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_TAP_DISABLED 0)
  (define-public LIBINPUT_CONFIG_TAP_ENABLED 1)
  (define-public (%libinput-config-tap-state-enum->number o)
    (bs:enum->integer %libinput-config-tap-state-enum o)))
(define-public libinput-device-config-tap-get-finger-count
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_tap_get_finger_count"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-tap-set-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_set_enabled"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device enable)
      (%func (unwrap-libinput-device device)
             (%libinput-config-tap-state-enum->number enable)))))
(define-public libinput-device-config-tap-get-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_get_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-tap-get-default-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_get_default_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(begin
  (define-public %libinput-config-tap-button-map-enum
    (bs:enum
      '((LIBINPUT_CONFIG_TAP_MAP_LRM 0) (LIBINPUT_CONFIG_TAP_MAP_LMR 1))))
  (define-public LIBINPUT_CONFIG_TAP_MAP_LRM 0)
  (define-public LIBINPUT_CONFIG_TAP_MAP_LMR 1)
  (define-public (%libinput-config-tap-button-map-enum->number o)
    (bs:enum->integer %libinput-config-tap-button-map-enum o)))
(define-public libinput-device-config-tap-set-button-map
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_set_button_map"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device map)
      (%func (unwrap-libinput-device device)
             (%libinput-config-tap-button-map-enum->number map)))))
(define-public libinput-device-config-tap-get-button-map
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_get_button_map"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-tap-get-default-button-map
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_get_default_button_map"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(begin
  (define-public %libinput-config-drag-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_DRAG_DISABLED 0) (LIBINPUT_CONFIG_DRAG_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_DRAG_DISABLED 0)
  (define-public LIBINPUT_CONFIG_DRAG_ENABLED 1)
  (define-public (%libinput-config-drag-state-enum->number o)
    (bs:enum->integer %libinput-config-drag-state-enum o)))
(define-public libinput-device-config-tap-set-drag-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_set_drag_enabled"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device enable)
      (%func (unwrap-libinput-device device)
             (%libinput-config-drag-state-enum->number enable)))))
(define-public libinput-device-config-tap-get-drag-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_get_drag_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-tap-get-default-drag-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_get_default_drag_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(begin
  (define-public %libinput-config-drag-lock-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_DRAG_LOCK_DISABLED 0)
        (LIBINPUT_CONFIG_DRAG_LOCK_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_DRAG_LOCK_DISABLED 0)
  (define-public LIBINPUT_CONFIG_DRAG_LOCK_ENABLED 1)
  (define-public (%libinput-config-drag-lock-state-enum->number o)
    (bs:enum->integer %libinput-config-drag-lock-state-enum o)))
(define-public libinput-device-config-tap-set-drag-lock-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_set_drag_lock_enabled"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device enable)
      (%func (unwrap-libinput-device device)
             (%libinput-config-drag-lock-state-enum->number enable)))))
(define-public libinput-device-config-tap-get-drag-lock-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_get_drag_lock_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-tap-get-default-drag-lock-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_tap_get_default_drag_lock_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-calibration-has-matrix
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_calibration_has_matrix"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-calibration-set-matrix
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_calibration_set_matrix"
                   (force %libinput))
                 (list '* '*))))
    (lambda (device matrix)
      (%func (unwrap-libinput-device device)
             ((lambda (a)
                (ffi:bytevector->pointer
                  (bytestructure-bytevector
                    (bytestructure
                      (bs:vector 6 float)
                      (cond ((vector? a) a) ((list? a) (list->vector a)))))))
              matrix)))))
(define-public libinput-device-config-calibration-get-matrix
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_calibration_get_matrix"
                   (force %libinput))
                 (list '* '*))))
    (lambda (device matrix)
      (%func (unwrap-libinput-device device)
             ((lambda (a)
                (ffi:bytevector->pointer
                  (bytestructure-bytevector
                    (bytestructure
                      (bs:vector 6 float)
                      (cond ((vector? a) a) ((list? a) (list->vector a)))))))
              matrix)))))
(define-public libinput-device-config-calibration-get-default-matrix
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_calibration_get_default_matrix"
                   (force %libinput))
                 (list '* '*))))
    (lambda (device matrix)
      (%func (unwrap-libinput-device device)
             ((lambda (a)
                (ffi:bytevector->pointer
                  (bytestructure-bytevector
                    (bytestructure
                      (bs:vector 6 float)
                      (cond ((vector? a) a) ((list? a) (list->vector a)))))))
              matrix)))))
(begin
  (define-public %libinput-config-send-events-mode-enum
    (bs:enum
      '((LIBINPUT_CONFIG_SEND_EVENTS_ENABLED 0)
        (LIBINPUT_CONFIG_SEND_EVENTS_DISABLED 1)
        (LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE 2))))
  (define-public LIBINPUT_CONFIG_SEND_EVENTS_ENABLED 0)
  (define-public LIBINPUT_CONFIG_SEND_EVENTS_DISABLED 1)
  (define-public LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE 2)
  (define-public (%libinput-config-send-events-mode-enum->number o)
    (bs:enum->integer %libinput-config-send-events-mode-enum o)))
(define-public libinput-device-config-send-events-get-modes
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_device_config_send_events_get_modes"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-send-events-set-mode
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_send_events_set_mode"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (device mode) (%func (unwrap-libinput-device device) mode))))
(define-public libinput-device-config-send-events-get-mode
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_device_config_send_events_get_mode"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-send-events-get-default-mode
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_device_config_send_events_get_default_mode"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-accel-is-available
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_accel_is_available"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-accel-set-speed
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_accel_set_speed"
                   (force %libinput))
                 (list '* ffi:double))))
    (lambda (device speed) (%func (unwrap-libinput-device device) speed))))
(define-public libinput-device-config-accel-get-speed
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_device_config_accel_get_speed"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-accel-get-default-speed
  (let ((%func (ffi:pointer->procedure
                 ffi:double
                 (dynamic-func
                   "libinput_device_config_accel_get_default_speed"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(begin
  (define-public %libinput-config-accel-profile-enum
    (bs:enum
      '((LIBINPUT_CONFIG_ACCEL_PROFILE_NONE 0)
        (LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT 1)
        (LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE 2))))
  (define-public LIBINPUT_CONFIG_ACCEL_PROFILE_NONE 0)
  (define-public LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT 1)
  (define-public LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE 2)
  (define-public (%libinput-config-accel-profile-enum->number o)
    (bs:enum->integer %libinput-config-accel-profile-enum o)))
(define-public libinput-device-config-accel-get-profiles
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_device_config_accel_get_profiles"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-accel-set-profile
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_accel_set_profile"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device profile)
      (%func (unwrap-libinput-device device)
             (%libinput-config-accel-profile-enum->number profile)))))
(define-public libinput-device-config-accel-get-profile
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_accel_get_profile"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-accel-get-default-profile
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_accel_get_default_profile"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-scroll-has-natural-scroll
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_scroll_has_natural_scroll"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-scroll-set-natural-scroll-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_scroll_set_natural_scroll_enabled"
                   (force %libinput))
                 (list '* ffi:int))))
    (lambda (device enable) (%func (unwrap-libinput-device device) enable))))
(define-public libinput-device-config-scroll-get-natural-scroll-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_scroll_get_natural_scroll_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-scroll-get-default-natural-scroll-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_scroll_get_default_natural_scroll_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-left-handed-is-available
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_left_handed_is_available"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-left-handed-set
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_left_handed_set"
                   (force %libinput))
                 (list '* ffi:int))))
    (lambda (device left_handed)
      (%func (unwrap-libinput-device device) left_handed))))
(define-public libinput-device-config-left-handed-get
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_left_handed_get"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-left-handed-get-default
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_left_handed_get_default"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(begin
  (define-public %libinput-config-click-method-enum
    (bs:enum
      '((LIBINPUT_CONFIG_CLICK_METHOD_NONE 0)
        (LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS 1)
        (LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER 2))))
  (define-public LIBINPUT_CONFIG_CLICK_METHOD_NONE 0)
  (define-public LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS 1)
  (define-public LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER 2)
  (define-public (%libinput-config-click-method-enum->number o)
    (bs:enum->integer %libinput-config-click-method-enum o)))
(define-public libinput-device-config-click-get-methods
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_device_config_click_get_methods"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-click-set-method
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_click_set_method"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device method)
      (%func (unwrap-libinput-device device)
             (%libinput-config-click-method-enum->number method)))))
(define-public libinput-device-config-click-get-method
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_click_get_method"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-click-get-default-method
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_click_get_default_method"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(begin
  (define-public %libinput-config-middle-emulation-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_MIDDLE_EMULATION_DISABLED 0)
        (LIBINPUT_CONFIG_MIDDLE_EMULATION_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_MIDDLE_EMULATION_DISABLED 0)
  (define-public LIBINPUT_CONFIG_MIDDLE_EMULATION_ENABLED 1)
  (define-public (%libinput-config-middle-emulation-state-enum->number o)
    (bs:enum->integer %libinput-config-middle-emulation-state-enum o)))
(define-public libinput-device-config-middle-emulation-is-available
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_middle_emulation_is_available"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-middle-emulation-set-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_middle_emulation_set_enabled"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device enable)
      (%func (unwrap-libinput-device device)
             (%libinput-config-middle-emulation-state-enum->number enable)))))
(define-public libinput-device-config-middle-emulation-get-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_middle_emulation_get_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-middle-emulation-get-default-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_middle_emulation_get_default_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
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
  (define-public (%libinput-config-scroll-method-enum->number o)
    (bs:enum->integer %libinput-config-scroll-method-enum o)))
(define-public libinput-device-config-scroll-get-methods
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_device_config_scroll_get_methods"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-scroll-set-method
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_scroll_set_method"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device method)
      (%func (unwrap-libinput-device device)
             (%libinput-config-scroll-method-enum->number method)))))
(define-public libinput-device-config-scroll-get-method
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_scroll_get_method"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-scroll-get-default-method
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_scroll_get_default_method"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-scroll-set-button
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_scroll_set_button"
                   (force %libinput))
                 (list '* ffi:uint32))))
    (lambda (device button) (%func (unwrap-libinput-device device) button))))
(define-public libinput-device-config-scroll-get-button
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_device_config_scroll_get_button"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-scroll-get-default-button
  (let ((%func (ffi:pointer->procedure
                 ffi:uint32
                 (dynamic-func
                   "libinput_device_config_scroll_get_default_button"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(begin
  (define-public %libinput-config-scroll-button-lock-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_DISABLED 0)
        (LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_DISABLED 0)
  (define-public LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_ENABLED 1)
  (define-public (%libinput-config-scroll-button-lock-state-enum->number o)
    (bs:enum->integer %libinput-config-scroll-button-lock-state-enum o)))
(define-public libinput-device-config-scroll-set-button-lock
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_scroll_set_button_lock"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device state)
      (%func (unwrap-libinput-device device)
             (%libinput-config-scroll-button-lock-state-enum->number state)))))
(define-public libinput-device-config-scroll-get-button-lock
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_scroll_get_button_lock"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-scroll-get-default-button-lock
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_scroll_get_default_button_lock"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(begin
  (define-public %libinput-config-dwt-state-enum
    (bs:enum
      '((LIBINPUT_CONFIG_DWT_DISABLED 0) (LIBINPUT_CONFIG_DWT_ENABLED 1))))
  (define-public LIBINPUT_CONFIG_DWT_DISABLED 0)
  (define-public LIBINPUT_CONFIG_DWT_ENABLED 1)
  (define-public (%libinput-config-dwt-state-enum->number o)
    (bs:enum->integer %libinput-config-dwt-state-enum o)))
(define-public libinput-device-config-dwt-is-available
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_dwt_is_available"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-dwt-set-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_dwt_set_enabled"
                   (force %libinput))
                 (list '* ffi:int32))))
    (lambda (device enable)
      (%func (unwrap-libinput-device device)
             (%libinput-config-dwt-state-enum->number enable)))))
(define-public libinput-device-config-dwt-get-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_dwt_get_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-dwt-get-default-enabled
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_dwt_get_default_enabled"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-rotation-is-available
  (let ((%func (ffi:pointer->procedure
                 ffi:int
                 (dynamic-func
                   "libinput_device_config_rotation_is_available"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-rotation-set-angle
  (let ((%func (ffi:pointer->procedure
                 ffi:int32
                 (dynamic-func
                   "libinput_device_config_rotation_set_angle"
                   (force %libinput))
                 (list '* ffi:unsigned-int))))
    (lambda (device degrees_cw)
      (%func (unwrap-libinput-device device) degrees_cw))))
(define-public libinput-device-config-rotation-get-angle
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_device_config_rotation_get_angle"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
(define-public libinput-device-config-rotation-get-default-angle
  (let ((%func (ffi:pointer->procedure
                 ffi:unsigned-int
                 (dynamic-func
                   "libinput_device_config_rotation_get_default_angle"
                   (force %libinput))
                 (list '*))))
    (lambda (device) (%func (unwrap-libinput-device device)))))
