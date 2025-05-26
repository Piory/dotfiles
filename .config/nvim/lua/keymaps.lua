local keymap = vim.keymap
vim.g.mapleader =
' '                                                                                                   -- <leader> を半角スペースに設定

keymap.set('i', 'jj', '<ESC>', { silent = true })                                                     -- インサートモードを抜ける
keymap.set('n', ';', ':', { silent = true })                                                          -- シフトを押すことなく、;を入力する。割と便利

keymap.set('n', '<leader>w', ':w<CR>')                                                                -- 保存
keymap.set('n', '<leader>q', ':q<CR>')                                                                -- 終了
keymap.set('n', '<leader>c', ':nohlsearch<CR>')                                                       -- 検索のハイライトを消す
keymap.set('n', '<leader>sv', '<C-w>v')                                                               -- ウィンドウを垂直方向に分割する
keymap.set('n', '<leader>sh', '<C-w>s')                                                               -- ウィンドウを水平に分割する
keymap.set('n', '<leader>se', '<C-w>=')                                                               -- ウィンドウの幅を等分にする
keymap.set('n', '<leader>sx', ':close<CR>')                                                           -- 現在、カーソルがいるウィンドウを閉じる
keymap.set('n', '<leader>sw', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>')                     -- ウィンドウの幅を少し広げる
keymap.set('n', '<leader>sww',
  '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>') -- ウィンドウの幅を大きく広げる
keymap.set('n', '<leader>st', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><')                     -- ウィンドウの幅を少し狭める
keymap.set('n', '<leader>stt',
  '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><') -- ウィンドウの幅を大きく狭める

-- タブを作成、削除
keymap.set('n', '<leader>to', ':tabnew<CR>')
keymap.set('n', '<leader>tx', ':tabclose<CR>')
keymap.set('n', '<leader>tn', ':tabn<CR>')
keymap.set('n', '<leader>tp', ':tabp<CR>')
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
-- nvim-tree のトグル
vim.api.nvim_set_keymap('n', '<leader>s', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Toggleterm で lazygit を表示
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
-- Toggleterm
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
-- BDelete
-- vim.api.nvim_set_keymap('n', '<leader>x', ':BDelete this<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>xo', ':BDelete other<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>xa', ':BDelete all<CR>', { noremap = true, silent = true })
