local colors = require('themes.colors-soft')
local common = require('themes.rainbow-drops-common')

local M = {}

function M.setup()
  common.setup(
    colors,
    'rainbow-drops-soft',
    'themes.lualine-rainbow-drops-soft'
  )
end

return M
