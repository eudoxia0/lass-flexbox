(defsystem lass-flexbox-test
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :depends-on (:lass-flexbox
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "lass-flexbox")))))
