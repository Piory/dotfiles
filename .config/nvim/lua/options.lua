local opt = vim.opt

opt.undofile = true

-- カラースキームで 24bit カラーを使用
opt.termguicolors = true

-- マウスの有効化
opt.mouse = ''

-- 行番号の表示
opt.number = true
opt.relativenumber = true
opt.wrap = false

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
opt.clipboard:append({ 'unnamedplus' })

-- タブ、空白、改行の可視化
opt.list = true
opt.listchars = {
  tab = '»-',
  trail = '-',
  space = '·',
  lead = '·',
  eol = '↲',
  extends = '»',
  precedes = '«',
  nbsp = '%',
}

-- 補完表示時に最初の候補を選択かつ、Enter で補完を確定する
opt.completeopt = {
  'popup',
  'menuone',
  'noinsert',
}

--          ╭─────────────────────────────────────────────────────────╮
--          │                    自動リロード設定                     │
--          ╰─────────────────────────────────────────────────────────╯
-- 自動リロードを有効化
opt.autoread = true
-- バッファに戻ったり、フォーカスを取ったときに checktime を実行
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
  pattern = { '*' },
  command = "if mode() != 'c' | checktime | endif",
})

--          ╭─────────────────────────────────────────────────────────╮
--          │                    読み取り専用設定                     │
--          ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('BufRead', {
  pattern = {
    '*/node_modules/*',
    '*/.venv/*',
    '*/dist/*',
  },
  callback = function()
    vim.bo.readonly = true
    vim.bo.modifiable = false
  end,
})
