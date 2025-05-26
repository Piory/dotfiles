local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 基本オプションの設定
require('options')

-- キーマップの設定
require('keymaps')

-- プラグインの設定
require('plugins')

-- カラースキームの設定
vim.cmd.colorscheme('tokyonight-storm')

-- 各種セットアップ（例：Tree-sitter, LSPなどh
require('setup.gitsigns')
require('setup.mason')
require('setup.lspconfig')
require('setup.flutter-tools')
require('setup.nvim-tree')
require('setup.telescope')
require('setup.hlchunk')
require('setup.lsp-status')
require('setup.nvim-autopairs')
require('setup.noice')
require('setup.nvim-cmp')
require('setup.lualine')
require('setup.bufferline')
require('setup.smooth-cursor')
