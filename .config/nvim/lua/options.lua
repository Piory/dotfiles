local opt = vim.opt

-- 行番号の表示
opt.number = true
opt.relativenumber = true

-- タブとインデントの設定
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.autoindent = true

-- 検索設定
opt.ignorecase = true
opt.smartcase = true

-- カーソルがある行をハイライト表示
opt.cursorline = true

-- ヤンクするとクリップボードに保存される
opt.clipboard:append{'unnamedplus'}

-- タブ、空白、改行の可視化
opt.list = true
opt.listchars='tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%'

-- 補完表示時に最初の候補を選択かつ、Enter で補完を確定する
opt.completeopt = {'menuone', 'noinsert'}
