;
; emacs_default_autoloads.ml
;
; This file contains the default set of autoloading functions. These
; functions are set up before the default bindings are set up.
;
(autoload "adjust-line-number" "goto")
(autoload "backward-paragraph" "paragraph")
(autoload "backward-sentence" "sentence")
(autoload "buffer-dired" "bufdired")
(autoload "c-mode" "cmode")
(autoload "case-capitalize" "case-convert")
(autoload "case-invert" "case-convert")
(autoload "case-lower" "case-convert")
(autoload "case-upper" "case-convert")
(autoload "compile-it" "newcompil")
(autoload "dabbrev" "dabbrev")
(autoload "debug" "debug")
(autoload "default-emacs-init" "default-emacs-init")
(autoload "delete-area" "area.ml")
(autoload "describe-command" "describex")
(autoload "describe-variable" "describex")
(autoload "describe-word-in-buffer" "desword")
(autoload "diff-mode" "diff.ml")
(autoload "diff" "diff")
(autoload "dired" "dired.ml")
(autoload "edit-variable" "edit-variable")
(autoload "electric-c-mode" "electricc")
(autoload "electric-pascal-mode" "pascal")
(autoload "ere-query-replace-string" "query-replace")
(autoload "error-message-parser" "errmsgprs") (setq error-message-parser "error-message-parser")
(autoload "expand-buffer-in-buffer" "expand-word-in-buffer.ml")
(autoload "expand-file-in-buffer" "expand-word-in-buffer.ml")
(autoload "expand-mlisp-variable-in-buffer" "expand-word-in-buffer.ml")
(autoload "expand-mlisp-variable" "expandx")
(autoload "expand-mlisp-word-in-buffer" "expand-word-in-buffer.ml")
(autoload "expand-mlisp-word" "expandx")
(autoload "forward-paragraph" "paragraph")
(autoload "forward-sentence" "sentence")
(autoload "fundamental-mode" "fundmode")
(autoload "goto-line" "goto")
(autoload "goto-percent" "goto")
(autoload "grep-current-buffer" "grep")
(autoload "grep-in-buffers" "grep")
(autoload "grep-in-files" "grep")
(autoload "grep" "grep")
(autoload "help-key" "helpchar")
(autoload "help" "helpchar")
(autoload "HTML-mode" "html-mode")
(autoload "incremental-search" "incsearch")
(autoload "indent-region" "dent")
(autoload "info" "info")
(autoload "insert-area" "area.ml")
(autoload "install-shield-mode" "install-shield-mode")
(autoload "Java-mode" "javamode")
(autoload "JavaScript-mode" "javascriptmode")
(autoload "justify-paragraph" "justify")
(autoload "latex-mode" "latexmode")
(autoload "lisp-mode" "lispmode")
(autoload "makefile-mode" "makefile-mode")
(autoload "make-tag-table" "tags")
(autoload "minibuf" "minibuf")
(autoload "new-undo" "undo")
(autoload "next-file-buffer" "buffer-commands")
(autoload "normal-mode" "normalmod")
(autoload "ntcmd-mode" "ntcmdmode")
(autoload "paren-flash" "flasher")
(autoload "paren-flash-only" "flasher")
(autoload "previous-file-buffer" "buffer-commands")
(autoload "puppet-mode" "puppet-mode")
(autoload "Python-console-mode" "python-mode")
(autoload "Python-console" "python-console")
(autoload "Python-mode" "python-mode")
(autoload "query-replace-string" "query-replace")
(autoload "re-query-replace-string" "query-replace")
(autoload "replace-tabs-with-spaces-in-buffer" "tabs")
(autoload "resize-tabs-in-buffer" "tabs")
(autoload "reverse-incremental-search" "incsearch")
(autoload "shell" "process")
(autoload "show-buffer" "show-buffer")
(autoload "show-terminal" "show-terminal")
(autoload "sh-mode" "sh-mode")
(autoload "smart-auto-execute" "smart-auto-execute")
(autoload "spawn" "spawn")
(autoload "SQL-mode" "sql-mode")
(autoload "tab-delete" "tabs")
(autoload "tab-key" "tabs")
(autoload "text-mode" "textmode")
(autoload "trace" "trace") (setq trace-hook "trace")
(autoload "undent-region" "dent")
(autoload "vbscript-mode" "vbscript-mode")
(autoload "view-buffer" "view")
(autoload "view-file" "view")
(autoload "visit-tag-table" "tags.ml")
(autoload "what-cursor-position" "whatcurs")
(autoload "window-diff-continue" "windiff")
(autoload "window-diff-start" "windiff")
(autoload "write-region-to-file" "writereg")
(autoload "XHTML-mode" "xhtml-mode")
(autoload "XML-mode" "xml-mode")

(if (= operating-system-name "unix")
    (progn
        (autoload "buffer-chmod" "unix-buffer")
        (autoload "buffer-chown" "unix-buffer")
        (autoload "new-shell" "process")
        (autoload "unix-man-word-in-buffer" "unix-man")
        (autoload "unix-man" "unix-man")
    )
)

(if (= operating-system-name "VMS")
    (progn
        (autoload "correct-word" "emacs_spell")
        (autoload "get-tty-correction" "emacs_spell")
        (autoload "notes" "notes")
        (autoload "print-file" "queues")
        (autoload "show-queue" "queues")
        (autoload "spell-check-word" "emacs_spell")
        (autoload "spell-word-in-buffer" "spell")
        (autoload "vms-help" "help")
        (execute-mlisp-file "emacs_sys")
    )
)
(if (= operating-system-name "Windows")
    (progn
    )
)
