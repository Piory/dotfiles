-- Ensure termguicolors is enabled if not already
vim.opt.termguicolors = true

require('nvim-highlight-colors').setup({
  render = 'virtual',
  virtual_symbol = '●',
  virtual_symbol_position = 'eol',
})
