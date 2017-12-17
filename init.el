;; Keep init.el clean from customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load default package manager
(require 'package)

;; Add package repositories
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu"   . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("elpy"  . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Compile and evaluate use-package
(eval-when-compile
  (require 'use-package))
(require 'bind-key)                ;; For :bind

;; Load org-plug-contrib with use-package
(use-package org
  :ensure org-plus-contrib
  :pin org
  :init
  ;; Remaining configuration is loaded from org file
  (org-babel-load-file
   (expand-file-name "emacs-init.org"
                     user-emacs-directory)
   )
  )
