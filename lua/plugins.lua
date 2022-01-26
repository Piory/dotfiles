vim.cmd[[packadd packer.nvim]] 

vim.api.nvim_command('set cindent')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set tabstop=2')
vim.api.nvim_command('set shiftwidth=2')
vim.api.nvim_command('set shiftwidth')
vim.api.nvim_command('set softtabstop')
vim.api.nvim_command('set autoindent')
vim.api.nvim_command('set smartindent')
vim.api.nvim_command('set number')

require'packer'.startup(function()
  use 'neoclide/coc.nvim'
end)
