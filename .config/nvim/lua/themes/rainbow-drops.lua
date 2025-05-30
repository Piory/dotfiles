local c = require('themes.colors')

local M = {}

function M.setup()
  -- クリア & 基本設定
  vim.cmd('highlight clear')
  vim.o.termguicolors = true
  vim.o.background = 'dark'
  vim.g.colors_name = 'rainbow-drops'

  local hl = vim.api.nvim_set_hl
  --          ╭─────────────────────────────────────────────────────────╮
  --          │                     基本ハイライト                      │
  --          ╰─────────────────────────────────────────────────────────╯
  hl(0, 'Normal', { fg = c.aliceBlue, bg = c.eerieBlack })
  -- hl(0, 'CursorLine', { bg = c.charcoal })
  -- hl(0, 'LineNr', { fg = c.dimGray, bg = c.eerieBlack })
  hl(0, 'Visual', { bg = c.slateGray, fg = c.skyBlue })
  hl(0, 'Search', { bg = c.lightGray })
  hl(0, 'IncSearch', { bg = c.lightGray })
  hl(0, 'Identifier', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'Special', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'Type', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'String', { fg = c.mediumTurquoise })
  hl(0, 'Constant', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'Statement', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'Comment', { fg = c.dimGray, italic = true })
  hl(0, 'Delimiter', { fg = c.white })
  --          ╭─────────────────────────────────────────────────────────╮
  --          │             Tree-sitter ハイライトグループ              │
  --          ╰─────────────────────────────────────────────────────────╯
  hl(0, '@comment', { fg = c.dimGray, italic = true })
  hl(0, '@constant', { fg = c.lightSkyBlue, bold = true, italic = true })
  hl(0, '@string', { fg = c.mediumTurquoise })
  hl(0, '@number', { fg = c.lightSteelBlue })
  hl(0, '@boolean', { fg = c.mediumVioletRed, bold = true })
  hl(0, '@keyword', { fg = c.mediumVioletRed, bold = true })
  hl(0, '@operator', { fg = c.lavender })
  hl(0, '@parameter', { fg = c.lightSkyBlue2 })
  hl(0, '@function', { fg = c.limeGreen })
  hl(0, '@function.builtin', { fg = c.limeGreen })
  hl(0, '@func.dotcall', { fg = c.limeGreen })
  hl(0, '@method', { fg = c.yellowGreen })
  hl(0, '@function.builtin', { fg = c.lightCyan })
  hl(0, '@conditional', { fg = c.blueGreen })
  hl(0, '@repeat', { fg = c.blueGreen })
  hl(0, '@variable', { fg = c.goldenrod })
  hl(0, '@variable.builtin', { fg = c.mediumVioletRed })
  hl(0, '@variable.member', { fg = c.skyBlue2 })
  hl(0, '@variable.parameter', { fg = c.lightSkyBlue2 })
  hl(0, '@field', { fg = c.skyBlue2 })
  hl(0, '@property', { fg = c.skyBlue2 })
  hl(0, '@module', { fg = c.sliver })
  hl(0, '@type', { fg = c.crystalBlue, bold = true })
  hl(0, '@type.definition', { fg = c.crystalBlue, bold = true })
  hl(0, '@namespace', { fg = c.silver })
  hl(0, '@tag', { fg = c.mediumVioletRed })
  hl(0, '@label', { fg = c.forestGreen })

  --          ╭─────────────────────────────────────────────────────────╮
  --          │                           LSP                           │
  --          ╰─────────────────────────────────────────────────────────╯
  hl(0, '@lsp.type.namespace', { fg = c.sliver })
  hl(0, '@lsp.type.parameter', { fg = c.lightSkyBlue2 })
  hl(0, '@lsp.type.enum', { fg = c.plum })
  hl(0, '@lsp.typemod.variable.declaration', { fg = c.skyBlue2 })
  hl(0, '@lsp.typemod.property.annotation', { fg = c.sliver })
  hl(0, '@lsp.typemod.property.static', { fg = c.skyBlue2, italic = true })
  hl(0, '@lsp.mod.instance', { fg = c.skyBlue2 })
  hl(0, '@lsp.typemod.variable.instance', { fg = c.skyBlue2 })
  hl(0, '@lsp.typemod.variable.declaration', { fg = c.coral })
  hl(0, '@lsp.typemod.method.declaration', { fg = c.forestGreen, bold = true })
  --          ╭─────────────────────────────────────────────────────────╮
  --          │                       Typescript                        │
  --          ╰─────────────────────────────────────────────────────────╯
  hl(0, '@lsp.type.namespace.typescriptreact', { fg = c.sliver })
  hl(0, 'typescriptTypeReference', { fg = c.sliver })
  hl(0, 'typescriptBlock', { fg = c.white, bold = true })
  hl(0, 'typescriptAliasKeyword', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'typescriptFuncCallArg', { fg = c.limeGreen })
  hl(0, 'typescriptBOMWindowMethod', { fg = c.limeGreen })
  hl(0, 'typescriptNumber', { fg = c.limeGreen })
  hl(0, 'typescriptObjectLiteral', { fg = c.lightSteelBlue })
  hl(0, 'typescriptObjectLabel', { fg = c.skyBlue2 })
  --          ╭─────────────────────────────────────────────────────────╮
  --          │                    Typescript React                     │
  --          ╰─────────────────────────────────────────────────────────╯
  hl(0, 'tsxTag', { fg = c.crystalBlue })
  hl(0, 'tsxCloseTag', { fg = c.crystalBlue })
  hl(0, 'tsxCloseString', { fg = c.crystalBlue })
  hl(0, 'tsxTagName', { fg = c.brightCyan, bold = true })
  hl(0, 'tsxAttrib', { fg = c.limeGreen })
  --          ╭─────────────────────────────────────────────────────────╮
  --          │                         Golang                          │
  --          ╰─────────────────────────────────────────────────────────╯

  -- LSP 診断設定
  -- vim.diagnostic.config({
  --   virtual_text = {
  --     spacing = 2,
  --     prefix = '●',
  --     severity = vim.diagnostic.severity.INFO,
  --   },
  --   signs = true,
  --   underline = true,
  --   float = { border = 'rounded' },
  -- })
end

return M
