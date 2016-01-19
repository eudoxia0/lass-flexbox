(defsystem lass-flexbox
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :maintainer "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage "https://github.com/eudoxia0/lass-flexbox"
  :bug-tracker "https://github.com/eudoxia0/lass-flexbox/issues"
  :source-control (:git "git@github.com:eudoxia0/lass-flexbox.git")
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
