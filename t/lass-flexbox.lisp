(in-package :cl-user)
(defpackage lass-flexbox-test
  (:use :cl :fiveam)
  (:export :run-tests))
(in-package :lass-flexbox-test)

(def-suite tests
  :description "lass-flexbox tests.")
(in-suite tests)

(test simple-test
  (is
   (string= (lass:compile-and-write
             '(div :color "blue" :flexbox))
            "div{
    color: blue;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
}"))
  (is
   (string= (lass:compile-and-write
             '(div :inline-flex))
            "div{
    display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -moz-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
}"))
  (is
   (string= (lass:compile-and-write
             '(div :flex-direction "row"))
            "div{
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    -webkit-flex-direction: row;
    -moz-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
}")))

(defun run-tests ()
  (run! 'tests))
