local colors = require('themes.colors')
local common = require('themes.rainbow-drops-common')

local M = {}

function M.setup()
  common.setup(colors, 'rainbow-drops', 'themes.lualine-rainbow-drops')
end

return M
