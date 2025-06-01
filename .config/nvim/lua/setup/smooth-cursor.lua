vim.api.nvim_set_hl(
  0,
  'SmoothCursorCustom',
  { bg = nil, fg = '#42F57E', default = true }
)
require('smoothcursor').setup({
  priority = 10,
  fancy = {
    enable = true,
    head = { cursor = '▷', texthl = 'SmoothCursorCustom', linehl = nil },
    body = {
      { cursor = '󰝥', texthl = 'SmoothCursorCustom' },
      { cursor = '󰝥', texthl = 'SmoothCursorCustom' },
      { cursor = '●', texthl = 'SmoothCursorCustom' },
      { cursor = '●', texthl = 'SmoothCursorCustom' },
      { cursor = '•', texthl = 'SmoothCursorCustom' },
      { cursor = '.', texthl = 'SmoothCursorCustom' },
      { cursor = '.', texthl = 'SmoothCursorCustom' },
    },
    tail = { cursor = nil, texthl = 'SmoothCursorCustom' },
  },
  disabled_filetypes = {
    'TelescopePrompt',
    'TelescopeResults',
    'gitblame',
    'css',
    'noice',
    'LspsagaHover',
    'lazy',
  },
})
