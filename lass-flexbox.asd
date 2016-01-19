(defsystem lass-flexbox
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :maintainer "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage ""
  :bug-tracker ""
  :source-control (:git "")
  :depends-on (:lass)
  :components ((:module "src"
                :serial t
                :components
                ((:file "lass-flexbox"))))
  :description "Flexbox for Lass."
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op lass-flexbox-test))))
