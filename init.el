;;load-path bag if this is not exit, cannot load packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
;
;; load auto complete
(require 'auto-complete)
(require 'auto-complete-config)
;;python -mode
(require 'python-mode)
(setq auto-mode-alist (cons '("\\.py\\'" . python-mode) auto-mode-alist))
;########################################
                                        ; web-mode setting

                                        ;########################################
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
'(("php"    . "\\.phtml\\'")
  ("blade"  . "\\.blade\\.")))

;; Goのパスを通す
(add-to-list 'exec-path (expand-file-name "/usr/local/bin/go"))
;; go get で入れたツールのパスを通す
(add-to-list 'exec-path (expand-file-name "/Users/junya/.go/bin"))

;; flycheck-modeを有効化してシンタックスエラーを検知
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook (lambda()
       (add-hook 'before-save-hook' 'gofmt-before-save)
       (local-set-key (kbd "M-.") 'godef-jump)
       (set (make-local-variable 'company-backends) '(company-go))
       (setq indent-tabs-mode nil)    ; タブを利用
       (setq c-basic-offset 4)    ; tabサイズを4にする
       (setq tab-width 4)))

;; company-modeとの連携してコード補完する
(require 'company-go)
(add-hook 'go-mode-hook (lambda()
      (company-mode)
      (setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
      (setq company-idle-delay 0) ; 遅延なしにすぐ表示
      (setq company-minimum-prefix-length 3) ; デフォルトは4
      (setq company-selection-wrap-around t) ; 候補の最後の次は先頭に戻る
      (setq completion-ignore-case t)
      (setq company-dabbrev-downcase nil)
      (global-set-key (kbd "C-M-i") 'company-complete)
      ;; C-n, C-pで補完候補を次/前の候補を選択
      (define-key company-active-map (kbd "C-n") 'company-select-next)
      (define-key company-active-map (kbd "C-p") 'company-select-previous)
      (define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
      (define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定
      (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete) ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
      ))




;; web-mode, html-color
(set-face-attribute 'web-mode-doctype-face nil :foreground "#4A8ACA")
(set-face-attribute 'web-mode-html-tag-face nil :foreground  "#4A8ACA")
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "White")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#87CEEB")
(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "FFFFFF")
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#D78181")
(set-face-attribute 'web-mode-comment-face nil :foreground "#587F35")
;; web-mode, css-color
(set-face-attribute 'web-mode-css-at-rule-face nil :foreground "#DFCF44")
(set-face-attribute 'web-mode-css-selector-face nil :foreground "#DFCF44")
(set-face-attribute 'web-mode-css-pseudo-class-face nil :foreground "#DFCF44")
(set-face-attribute 'web-mode-css-property-name-face nil :foreground "#87CEEB")
(set-face-attribute 'web-mode-css-string-face nil :foreground "#D78181")

(setq web-mode-enable-auto-closing t) 
(setq web-mode-enable-auto-pairing t)
;;setup jedi
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;;auto-virtualenvwrapper
(require 'virtualenvwrapper)
(require 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)
;; xterm のマウスイベントを取得する
(xterm-mouse-mode t)
;; マウスホイールを取得する
(mouse-wheel-mode t)
;; ホイールでポインタを移動できるようにする
(global-set-key [mouse-4] (kbd "C-p"))
(global-set-key [mouse-5] (kbd "C-n"))
;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; バックアップファイルを作成させない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

;; 改行コードを表示する
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; 複数ウィンドウを禁止する
(setq ns-pop-up-frames nil)

;; ウィンドウを透明にする
;; アクティブウィンドウ／非アクティブウィンドウ（alphaの値で透明度を指定）
(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; メニューバーを消す
(menu-bar-mode -1)

;; ツールバーを消す
(tool-bar-mode -1)
;; 以下二つはターミナルモードだと、先頭行にへんてこりんなバグを誘発するので、削除
;; 列数を表示する
;; (column-number-mode t)

;; 行数を表示する
;; (global-linum-mode t)

;; カーソルの点滅をやめる
(blink-cursor-mode 0)

;; カーソル行をハイライトする
;;(global-hl-line-mode t)

;; 対応する括弧を光らせる
;;(show-paren-mode 1)

;; ウィンドウ内に収まらないときだけ、カッコ内も光らせる
;;(setq show-paren-style 'mixed)
;;(set-face-background 'show-paren-match-face "grey")
;;(set-face-foreground 'show-paren-match-face "black")

;; スペース、タブなどを可視化する
;;(global-whitespace-mode 1)
;;
;; スクロールは１行ごとに
(setq scroll-conservatively 1)

;; シフト＋矢印で範囲選択
;;(setq pc-select-selection-keys-only t)
;;(pc-selection-mode 1)

;; C-kで行全体を削除する
(setq kill-whole-line t)

;;; dired設定
(require 'dired-x)

;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)

;; beep音を消す
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; Macのキーバインドを使う
;;(mac-key-mode 1)

;; Macのoptionをメタキーにする
;;(setq mac-option-modifier 'meta)

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)
;; emacs-package-archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-go go-mode web-mode auto-compile auto-virtualenvwrapper jedi python-mode virtualenvwrapper))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; markup-laguage auto-complete setting. 

  
(put 'upcase-region 'disabled nil)
