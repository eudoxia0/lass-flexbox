(in-package :cl-user)
(defpackage lass-flexbox
  (:use :cl)
  (:import-from :lass
                :define-special-property
                :make-property)
  (:documentation "Lass Flexbox extension."))
(in-package :lass-flexbox)

(define-special-property flexbox ()
  (list (make-property "display" "-webkit-box")
        (make-property "display: -webkit-flex")
        (make-property "display" "-moz-flex")
        (make-property "display" "-ms-flexbox")
        (make-property "display" "flex")))

(define-special-property inline-flex ()
  (list (make-property "display" "-webkit-inline-box")
	(make-property "display" "-webkit-inline-flex")
	(make-property "display" "-moz-inline-flex")
	(make-property "display" "-ms-inline-flexbox")
	(make-property "display" "inline-flex")))

(define-special-property flex-direction (direction)
  (append (cond
            ((string= direction "row-reverse")
             (list (make-property "-webkit-box-direction" "reverse")
                   (make-property "-webkit-box-orient" "horizontal")))
            ((string= direction "column")
             (list (make-property "-webkit-box-direction" "normal")
                   (make-property "-webkit-box-orient" "vertical")))
            ((string= direction "column-reverse")
             (list (make-property "-webkit-box-direction" "reverse")
                   (make-property "-webkit-box-orient" "vertical")))
            (t
             (list (make-property "-webkit-box-direction" "normal")
                   (make-property "-webkit-box-orient" "horizontal"))))
          (list (make-property "-webkit-flex-direction" direction)
                (make-property "-moz-flex-direction" direction)
                (make-property "-ms-flex-direction" direction)
                (make-property "flex-direction" direction))))

(define-special-property flex-wrap (value)
  (list (make-property "-webkit-flex-wrap" value)
	(make-property "-moz-flex-wrap" value)
        (if (string= value "nowrap")
            (make-property "-ms-flex-wrap" "none")
            (make-property "-ms-flex-wrap" value))
        (make-property "flex-wrap" value)))

(define-special-property order (value)
  (list (make-property "-webkit-box-ordinal-group"
                       (princ-to-string
                        (1+
                         (parse-integer value))))
	(make-property "-webkit-order" value)
	(make-property "-moz-order" value)
	(make-property "-ms-flex-order" value)
	(make-property "order" value)))

(define-special-property flex-grow (value)
  (list (make-property "webkit-box-flex" value)
        (make-property "webkit-flex-grow" value)
        (make-property "moz-flex-grow" value)
        (make-property "ms-flex-positive" value)
        (make-property "flex-grow" value)))

(define-special-property flex-shrink (value)
  (list (make-property "webkit-flex-shrink" value)
        (make-property "moz-flex-shrink" value)
        (make-property "ms-flex-negative" value)
        (make-property "flex-shrink" value)))

(define-special-property flex-basis (value)
  (list (make-property "webkit-flex-basis" value)
        (make-property "moz-flex-basis" value)
        (make-property "ms-flex-preferred-size" value)
        (make-property "flex-basis" value)))

(define-special-property justify-content (value)
  (append (cond
            ((string= value "flex-start")
             (list (make-property "-webkit-box-pack" "start")
                   (make-property "-ms-flex-pack" "start")))
            ((string= value "flex-end")
             (list (make-property "-webkit-box-pack" "end")
                   (make-property "-ms-flex-pack" "end")))
            ((string= value "space-between")
             (list (make-property "-webkit-box-pack" "justify")
                   (make-property "-ms-flex-pack" "justify")))
            ((string= value "space-around")
             (list (make-property "-ms-flex-pack" "distribute")))
            (t
             (list (make-property "-webkit-box-pack" value)
                   (make-property "-ms-flex-pack" value))))
          (list (make-property "-webkit-justify-content" value)
                (make-property "-moz-justify-content" value)
                (make-property "justify-content" value))))

(define-special-property align-items (value)
  (append (cond
            ((string= value "flex-start")
             (list (make-property "-webkit-box-align" "start")
                   (make-property "-ms-flex-align" "start")))
            ((string= value "flex-end")
             (list (make-property "-webkit-box-align" "end")
                   (make-property "-ms-flex-align" "end")))
            (t
             (list (make-property "-webkit-box-align" value)
                   (make-property "-ms-flex-align" value))))
          (list
           (make-property "-webkit-align-items" value)
           (make-property "-moz-align-items" value)
           (make-property "align-items" value))))

(define-special-property align-self (value)
  (list (make-property "-webkit-align-self" value)
        (make-property "-moz-align-self" value)
        (cond
          ((string= value "flex-start")
           (make-property "-ms-flex-item-align" "start"))
          ((string= value "flex-end")
           (make-property "-ms-flex-item-align" "end"))
          (t
           (make-property "-ms-flex-item-align" value)))
        (make-property "align-self" value)))

(define-special-property align-content (value)
  (list (make-property "-webkit-align-content" value)
        (make-property "-moz-align-content" value)
        (cond
          ((string= value "flex-start")
           (make-property "-ms-flex-line-pack" "start"))
          ((string= value "flex-end")
           (make-property "-ms-flex-line-pack" "end"))
          (t
           (make-property "-ms-flex-line-pack" value)))
        (make-property "align-content" value)))
