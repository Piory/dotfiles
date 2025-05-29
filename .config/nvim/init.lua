local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 翻訳の言語設定
vim.g.translator_target_lang = 'ja'

-- 基本オプションの設定
require('options')

-- キーマップの設定
require('keymaps')

-- プラグインの設定
require('plugins')

-- カラースキームの設定
vim.cmd.colorscheme('tokyonight-storm')

-- 各種セットアップ（例：Tree-sitter, LSPなどh
require('setup.alpha-nvim')
require('setup.toggleterm')
require('setup.gitsigns')
require('setup.lsp')
require('setup.lspconfig')
require('setup.flutter-tools')
require('setup.nvim-tree')
require('setup.nvim-treesitter')
require('setup.telescope')
require('setup.hlchunk')
require('setup.lsp-status')
require('setup.nvim-autopairs')
require('setup.nvim-highlight-colors')
require('setup.noice')
require('setup.no-neck-pain')
require('setup.lualine')
require('setup.bufferline')
require('setup.smooth-cursor')
require('setup.modes')

-- 背景透明化の設定
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalNC guibg=none
  highlight NormalSB guibg=none
]])
