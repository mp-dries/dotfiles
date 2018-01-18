;;; jetbrains-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "jetbrains" "jetbrains.el" (23136 56139 23606
;;;;;;  785000))
;;; Generated autoloads from jetbrains.el

(defvar-local jetbrains-ide nil)

(put 'jetbrains-ide 'safe-local-variable #'jetbrains-ide-symbol)

(autoload 'jetbrains-open-project "jetbrains" "\
Open project in JetBrains IDE by `IDE' and `IDE-ROOT'.

\(fn IDE IDE-ROOT)" t nil)

(autoload 'jetbrains-open-buffer-file "jetbrains" "\
Open buffer file in JetBrains IDE.

\(fn)" t nil)

(autoload 'jetbrains-create-dir-local-file "jetbrains" "\
Create project file `.dir-locals.el' for `jetbrains.el'.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; jetbrains-autoloads.el ends here
