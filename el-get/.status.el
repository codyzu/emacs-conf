((auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)))
 (bookmark+ status "installed" recipe
            (:name bookmark+ :pkgname "emacsmirror/bookmark-plus" :website "http://www.emacswiki.org/emacs/BookmarkPlus" :type github :description "Extensions to standard library `bookmark.el'" :features bookmark+))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp" :website "https://github.com/kiwanami/emacs-deferred" :type github :pkgname "kiwanami/emacs-deferred" :features "deferred"))
 (dired+ status "installed" recipe
         (:name dired+ :description "Extensions to Dired" :type emacswiki :features dired+))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :info "." :load "el-get.el"))
 (elpy status "installed" recipe
       (:name elpy :website "https://github.com/jorgenschaefer/elpy" :description "Emacs Python Development Environment" :type github :pkgname "jorgenschaefer/elpy" :post-init
              (el-get-envpath-prepend "PYTHONPATH" default-directory)
              :depends
              (auto-complete yasnippet virtualenv highlight-indentation find-file-in-project idomenu iedit nose jedi rope)))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
             (deferred ctable)))
 (find-file-in-project status "installed" recipe
                       (:name find-file-in-project :type github :pkgname "technomancy/find-file-in-project" :description "Quick access to project files in Emacs" :load "find-file-in-project.el" :compile
                              ("find-file-in-project.el")))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (groovy-emacs-mode status "installed" recipe
                    (:name groovy-emacs-mode :description "Emacs major mode for the Groovy programming language" :type bzr :url "http://bazaar.launchpad.net/~russel/groovy-emacs-mode/trunk/"))
 (highlight-indentation status "installed" recipe
                        (:name highlight-indentation :description "Function for highlighting indentation" :type git :url "https://github.com/antonj/Highlight-Indentation-for-Emacs"))
 (icicles-install status "installed" recipe
                  (:name icicles-install :auto-generated t :type emacswiki :description "Download and optionally byte-compile Icicles " :website "https://raw.github.com/emacsmirror/emacswiki.org/master/icicles-install.el"))
 (idomenu status "installed" recipe
          (:name idomenu :type emacswiki :description "imenu tag selection a la ido" :load-path "."))
 (iedit status "installed" recipe
        (:name iedit :description "Edit multiple regions with the same content simultaneously." :type emacswiki :features iedit))
 (jedi status "installed" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :build
              (("make" "requirements"))
              :build/berkeley-unix
              (("gmake" "requirements"))
              :submodule nil :depends
              (epc auto-complete)))
 (lacarte status "installed" recipe
          (:name lacarte :auto-generated t :type emacswiki :description "Execute menu items as commands, with completion." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/lacarte.el"))
 (multi-term status "installed" recipe
             (:name multi-term :description "A mode based on term.el, for managing multiple terminal buffers in Emacs." :type emacswiki :features multi-term))
 (nav status "installed" recipe
      (:name nav :description "Emacs mode for filesystem navigation" :type hg :url "https://emacs-nav.googlecode.com/hg" :features nav))
 (nose status "installed" recipe
       (:type github :pkgname "emacsmirror/nose" :name nose :website "https://bitbucket.org/durin42/nosemacs" :description "Emacs extension to provide easy nosetest integration." :type emacsmirror :pkgname nose))
 (popup status "installed" recipe
        (:name popup :website "git://github.com/codyzu/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el"))
 (rope status "installed" recipe
       (:name rope :description "A python refactoring library" :post-init
              (el-get-envpath-prepend "PYTHONPATH" default-directory)
              :type hg :url "http://bitbucket.org/agr/rope"))
 (session status "installed" recipe
          (:name session :description "When you start Emacs, package Session restores various variables (e.g., input histories) from your last session. It also provides a menu containing recently changed/visited files and restores the places (e.g., point) of such a file when you revisit it." :type http-tar :options
                 ("xzf")
                 :load-path
                 ("lisp")
                 :url "http://downloads.sourceforge.net/project/emacs-session/session/session-2.3a.tar.gz" :autoloads nil))
 (virtualenv status "installed" recipe
             (:name virtualenv :description "Virtualenv for Python" :type github :pkgname "aculich/virtualenv.el"))
 (xclip status "installed" recipe
        (:name xclip :description "Emacs Interface to XClip" :type http :url "http://www.mail-archive.com/gnu-emacs-sources@gnu.org/msg01336/xclip.el"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
                   (unless
                       (or
                        (boundp 'yas/snippet-dirs)
                        (get 'yas/snippet-dirs 'customized-value))
                     (setq yas/snippet-dirs
                           (list
                            (concat el-get-dir
                                    (file-name-as-directory "yasnippet")
                                    "snippets"))))
                   :post-init
                   (put 'yas/snippet-dirs 'standard-value
                        (list
                         (list 'quote
                               (list
                                (concat el-get-dir
                                        (file-name-as-directory "yasnippet")
                                        "snippets")))))
                   :compile nil :submodule nil)))
