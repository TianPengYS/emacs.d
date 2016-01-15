(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'smex)

(require 'undo-tree)
(global-undo-tree-mode)

(setq-default indent-tabs-mode nil)

(defun 设置java缩进 ()
  "设置java缩进"
  (interactive)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (hs-minor-mode))

(defun 设置c缩进 ()
  "设置c缩进"
  (interactive)
  (c-set-style "linux")
  (setq c-basic-offset 4)
  (hs-minor-mode))

(defun 设置orgmode ()
  ""
  (interactive)
  ;; 设置fill-paragraph(自动折行)的宽度
  (setq fill-column 70))

(add-hook 'c-mode-common-hook '设置c缩进)
(add-hook 'c++-mode-common-hook '设置c缩进)
(add-hook 'java-mode-hook '设置java缩进)
(add-hook 'org-mode-hook '设置orgmode)

(setq make-backup-files nil)

;; 设置行间距
(setq default-line-spacing 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (spolsky)))
 '(custom-safe-themes
   (quote
    ("ec0f5324cdd147558e44c5ae8c25f6709400bda26280be9bf9474e73ebe36afe" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "30b7087fdd149a523aa614568dc6bacfab884145f4a67d64c80d6011d4c90837" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" default)))
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 100 :width normal)))))

;; 设置窗口大小
(setq default-frame-alist
      '((height . 25) (width . 100) (tool-bar-lines . 0)))

;; 去除C-x C-c退出程序
(global-set-key (kbd "C-x C-c") nil)

(defun 编译 ()
  "如果当前目录有makefile，则编译"
  (interactive)
  (save-some-buffers 1) ;; 保存所有未保存文件，不提示
  (if (file-exists-p "makefile")
      (shell-command "nmake")
    (message "不存在makefile文件")))

(global-set-key (kbd "<f7>") '编译)

(defun 编译并运行 ()
  (interactive)
  (save-some-buffers 1) ;; 保存所有未保存文件，不提示
  (if (file-exists-p "makefile")
      (if (= 0 (shell-command "nmake"))
          (progn
            (if (file-exists-p "main.exe")
                (shell-command "main")))
        (message "编译失败"))
    (message "不存在makefile文件")))

(global-set-key (kbd "<f6>") '编译并运行)

(defun 运行程序 ()
  (interactive)
  (progn
    (if (file-exists-p "main.exe")
        (shell-command "main")
      (message "不存在可运行的程序"))))

(global-set-key (kbd "<f5>") '运行程序)

(defun 保存全部文件 ()
  (interactive)
  (save-some-buffers 1))

(global-set-key (kbd "<f2>") '保存全部文件)

;; 使能快速输入命令插件
(global-set-key (kbd "M-x") 'smex)

(defun 移动光标到词首 ()
  (if (or (char-equal ?\s (char-before))
          (char-equal ?\n (char-before))
          (char-equal ?\t (char-before)))
      ()
    (backward-word)))

(defun 删除当前单词 ()
  (移动光标到词首)
  (kill-word 1))

(defun 片段 ()
  (interactive)
  (progn
    (let ((名 (thing-at-point 'word)))
      (pcase 名
        ("main" (progn
                  (删除当前单词)
                  (insert "int main(int argc, char **argv)\n{\n")
                  (let ((mypoint (point)))
                    (insert "\nreturn 0;")
                    (c-indent-line-or-region)
                    (insert"\n}")
                    (goto-char mypoint)
                    (c-indent-line-or-region))))

        ("if" (progn
                (删除当前单词)
                (insert "if (")
                (let ((mypoint (point)))
                  (insert ") {\n}")
                  (c-indent-line-or-region)
                  (goto-char mypoint))))

        ("ifelse" (progn
                    (删除当前单词)
                    (insert "if (")
                    (let ((mypoint (point)))
                      (insert ") {\n} else {")
                      (c-indent-line-or-region)
                      (insert "\n}")
                      (c-indent-line-or-region)
                      (goto-char mypoint))))

        ("elseif" (progn
                    (删除当前单词)
                    (insert "} else if () {")
                    (c-indent-line-or-region)))

        ("else" (progn
                  (删除当前单词)
                  (insert "else {\n")
                  (let ((mypoint (point)))
                    (insert "\n}")
                    (c-indent-line-or-region)
                    (goto-char mypoint)
                    (c-indent-line-or-region))))

        ("for" (progn
                 (删除当前单词)
                 (insert "for (; ; ) {\n}")))

        ("re" (insert "turn "))

        (code (message "未能识别的片段" code))))))

;; 设置快速输入代码片段
(global-set-key (kbd "<M-return>") '片段)

(defun 删除空白字符 ()
  "删除从当前字符开始的所有空白字符"
  (interactive)
  (while (or (equal "\n" (string (following-char)))
             (equal " " (string (following-char))))
    (delete-char 1)))

(global-set-key (kbd "C-x C-j") '删除空白字符)

(defun 编辑配置文件 ()
  "编辑home文件夹下的配置文件"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-x <f1>") '编辑配置文件)

(defun 切换窗口 ()
  "交换窗口的缓冲区"
  (interactive)
  (let ((buffer (window-buffer)) (window (selected-window)))
    (other-window 1)
    (let ((other-buffer (window-buffer)) (other-window (selected-window)))
      (set-window-buffer window other-buffer)
      (set-window-buffer other-window buffer)
      (select-window window))))

(global-set-key (kbd "C-x O") '切换窗口)

;; 重新绑定切换窗口快捷键
(global-set-key (kbd "C-x o") 'other-window)

(global-set-key
 (kbd "C-x x")
 (lambda ()
   (interactive)
   (find-file "e:/src/jni/main.java")))

(defun 切换头文件 ()
  "交换源文件和头文件"
  (interactive)
  (let ((window (selected-window)) (name (buffer-file-name)))
    (cond
     ((string-match "\\.c" name)
      (setq name (concat (substring name 0 (string-match "\\.c" name)) ".h")))
     ((string-match "\\.h" name)
      (setq name (concat (substring name 0 (string-match "\\.h" name))
                         (if (directory-files "." nil ".*\\.cpp") ".cpp" ".c")))))
    (find-file name)))

(global-set-key (kbd "M-SPC") '切换头文件)

;; 切换窗口
(global-set-key
 (kbd "M-o")
 (lambda ()
   (interactive)
   (other-window 1)))

;; 保存所有文件
(global-set-key
 (kbd "M-s")
 (lambda ()
   (interactive)
   (save-some-buffers 1)))

(global-set-key
 (kbd "M-k")
 (lambda ()
   (interactive)
   (let ((window (selected-window)))
     (other-window 1)
     (kill-buffer)
     (select-window window))))

;; 设置标题
(setq frame-title-format "Emacs Take the matter on its merits")

;; 高亮括号匹配
(show-paren-mode t)

;;默认写文件编码
(setq default-buffer-file-coding-system 'utf-8)

;; 默认新建文件、读文件编码
(prefer-coding-system 'utf-8)

;; 设置org mode导出时不产生validate
(setq org-html-validation-link nil)
