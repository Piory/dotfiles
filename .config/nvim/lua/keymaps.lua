local keymap = vim.keymap
vim.g.mapleader = ' '                             -- <leader> を半角スペースに設定

keymap.set('i', 'jj', '<ESC>', { silent = true }) -- インサートモードを抜ける
keymap.set('n', ';', ':', { silent = true })      -- シフトを押すことなく、;を入力する。割と便利

vim.keymap.set('n', '<Esc><Esc>', function()
  vim.cmd('nohlsearch')
  -- 検索パターン自体も空にしたい場合は有効化
  vim.fn.setreg('/', '')
end, { silent = true, desc = '検索ハイライトを消す' })

keymap.set('n', '<leader>w', ':w<CR>', { silent = true, desc = '保存(:w)'})
keymap.set('n', '<leader>q', ':q<CR>', { silent = true, desc= '終了(:q)'})
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'ウィンドウを垂直方向に分割する' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'ウィンドウを水平方向に分割する' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'ウィンドウの幅を等分にする' })
keymap.set('n', '<leader>sx', ':close<CR>', { silent = true , desc = '現在、カーソルがいるウィンドウを閉じる' })
keymap.set('n', '<leader>sw', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>', { desc = 'ウィンドウの幅を少し広げる' })
keymap.set('n', '<leader>sww',
  '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>', { desc = 'ウィンドウの幅を大きく広げる' })
keymap.set('n', '<leader>st', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><', { desc = 'ウィンドウの幅を少し狭める' })
keymap.set('n', '<leader>stt',
  '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><', { desc = 'ウィンドウの幅を大きく狭める' })

-- ターミナルモードのキーマップ
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-]>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ウィンドウを移動する
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to the right window' })
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to the left window' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to the lower window' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to the upper window' })
-- 単語を' " どちらかで囲う
keymap.set('n', '<leader>aw', 'ciw""<Esc>P', { desc = '単語を""で囲う' })
keymap.set('n', '<leader>aW', "ciw''<Esc>P", { desc = "単語を''で囲う" })
-- タブの移動
keymap.set('n', 'gt', ':bnext<CR>', { silent = true, desc = '次のタブへ移動' })
keymap.set('n', 'gT', ':bprev<CR>', { silent = true, desc = '前のタブへ移動' })

-- LSP handlers
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = true })

-- Oil (File Explorer)
keymap.set('n', '-', '<CMD>Oil --float<CR>', {
  noremap = true,
  silent = true,
  desc = 'Open parent directory',
})
