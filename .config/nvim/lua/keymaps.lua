local keymap = vim.keymap
vim.g.mapleader = ' '                             -- <leader> を半角スペースに設定

keymap.set('i', 'jj', '<ESC>', { silent = true }) -- インサートモードを抜ける
keymap.set('n', ';', ':', { silent = true })      -- シフトを押すことなく、;を入力する。割と便利

keymap.set('n', '<leader>w', ':w<CR>')            -- 保存
keymap.set('n', '<leader>q', ':q<CR>')            -- 終了
keymap.set('n', '<leader>c', ':nohlsearch<CR>')   -- 検索のハイライトを消す
keymap.set('n', '<leader>sv', '<C-w>v')           -- ウィンドウを垂直方向に分割する
keymap.set('n', '<leader>sh', '<C-w>s')           -- ウィンドウを水平に分割する
keymap.set('n', '<leader>se', '<C-w>=')           -- ウィンドウの幅を等分にする
keymap.set('n', '<leader>sx', ':close<CR>')       -- 現在、カーソルがいるウィンドウを閉じる
keymap.set(
  'n',
  '<leader>sw',
  '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>'
) -- ウィンドウの幅を少し広げる
keymap.set(
  'n',
  '<leader>sww',
  '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>'
) -- ウィンドウの幅を大きく広げる
keymap.set(
  'n',
  '<leader>st',
  '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><'
) -- ウィンドウの幅を少し狭める
keymap.set(
  'n',
  '<leader>stt',
  '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><'
) -- ウィンドウの幅を大きく狭める

-- ウィンドウを移動する
keymap.set('n', '<C-l>', '<C-w>l')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
-- 単語を' " どちらかで囲う
keymap.set('n', '<leader>aw', 'ciw""<Esc>P')
keymap.set('n', '<leader>aW', "ciw''<Esc>P")
-- タブの移動
keymap.set('n', 'gt', ':bnext<CR>')
keymap.set('n', 'gT', ':bprev<CR>')

-- LSP handlers
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = true }
)

-- nvim-tree のトグル
vim.api.nvim_set_keymap(
  'n',
  '<leader>s',
  ':NvimTreeToggle<CR>',
  { noremap = true, silent = true }
)
-- Toggleterm
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>sf', function()
  builtin.find_files()
end)
keymap.set('n', '<leader>sg', function()
  builtin.live_grep()
end)
keymap.set('n', '<leader>sb', function()
  builtin.buffers()
end)
keymap.set('n', '<leader>sc', function()
  builtin.command_history()
end)
-- keymap.set('n', '<leader>sh', function()
--   builtin.help_tags()
-- end)

-- BDelete
vim.api.nvim_set_keymap(
  'n',
  '<leader>bx',
  ':BDelete this<CR>',
  { noremap = true, silent = true }
)
-- vim.api.nvim_set_keymap(
--   'n',
--   '<leader>bxo',
--   ':BDelete other<CR>',
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   'n',
--   '<leader>bxa',
--   ':BDelete all<CR>',
--   { noremap = true, silent = true }
-- )

-- Oil (File Explorer)
keymap.set('n', '-', '<CMD>Oil --float<CR>', {
  noremap = true,
  silent = true,
  desc = 'Open parent directory',
})
-- Lspsaga の設定
keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
keymap.set('n', '<C-r>', '<cmd>Lspsaga rename<CR>')
