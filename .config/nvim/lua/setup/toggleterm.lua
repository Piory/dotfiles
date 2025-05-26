require('toggleterm').setup({
  size = 100,
  open_mapping = [[<c-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  close_on_exit = true,
  float_opts = {
    border = 'curved',
    width = 180,
    height = 100,
  },
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = 'lazygit',
	direction = 'float',
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

