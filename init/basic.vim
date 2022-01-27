" ヘルプを日本語化
set helplang=ja

" エンコーディング
set encoding=utf-8
scriptencoding utf-8

" 行番号を表示
set number

" 自動でカッコ等を閉じる
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" ヤンクするとクリップボードに保存される
set clipboard+=unnamed

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
