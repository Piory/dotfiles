-- rainbow-drops テーマの共通 setup 処理
local M = {}

local function setup_base_highlights(hl, c)
  -- 基本ハイライトグループ
  hl(0, 'Whitespace', { fg = c.mutedGray })
  hl(0, 'NonText', { fg = c.mutedGray })
  hl(0, 'SpecialKey', { fg = c.mutedGray })
  hl(0, 'EndOfBuffer', { fg = c.mutedGray })
  hl(0, 'Normal', { fg = c.lightGrayBlue, bg = c.eerieBlack })
  hl(0, 'CursorLine', { bg = c.cursorLine })
  hl(0, 'LineNr', { fg = c.dimGray })
  hl(0, 'CursorLineNr', { fg = c.lightGrayBlue })
  hl(0, 'SignColumn', { bg = c.eerieBlack })
  hl(0, 'IndentBlanklineChar', { fg = c.mutedGray })
  hl(0, 'IndentBlanklineSpaceChar', { fg = c.mutedGray })
  hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = c.mutedGray })
  hl(0, 'IndentBlanklineContextChar', { fg = c.mutedGray })
  hl(0, 'IblIndent', { fg = c.mutedGray })
  hl(0, 'IblWhitespace', { fg = c.mutedGray })
  hl(0, 'IblScope', { fg = c.mutedGray })
  hl(0, 'StatusLine', { fg = c.aliceBlue, bg = c.charcoal })
  hl(0, 'StatusLineNC', { fg = c.dimGray, bg = c.darkSlateGray })
  hl(0, 'VertSplit', { fg = c.dimGray })
  hl(0, 'WinSeparator', { fg = c.dimGray })
  hl(0, 'Visual', { bg = c.slateGray, fg = c.skyBlue })
  hl(0, 'Search', { bg = c.lightGray })
  hl(0, 'IncSearch', { bg = c.lightGray })
  hl(0, 'Identifier', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'Special', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'Type', { fg = c.crystalBlue })
  hl(0, 'String', { fg = c.mediumTurquoise })
  hl(0, 'Constant', { fg = c.lightSkyBlue2 })
  hl(0, 'Statement', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'Comment', { fg = c.dimGray, italic = true })
  hl(0, 'Delimiter', { fg = c.lightGrayBlue })
  hl(0, 'PreProc', { fg = c.lightCyan })

  --- 通知関連
  hl(0, 'NotifyBackground', { bg = c.eerieBlack })
  hl(0, 'NotifyERRORBorder', { fg = c.error })
  hl(0, 'NotifyERRORIcon', { fg = c.error })
  hl(0, 'NotifyERRORTitle', { fg = c.error })
  hl(0, 'NotifyWARNBorder', { fg = c.warning })
  hl(0, 'NotifyWARNIcon', { fg = c.warning })
  hl(0, 'NotifyWARNTitle', { fg = c.warning })
  hl(0, 'NotifyINFOBorder', { fg = c.hint })
  hl(0, 'NotifyINFOIcon', { fg = c.hint })
  hl(0, 'NotifyINFOTitle', { fg = c.hint })
  hl(0, 'NotifyDEBUGBorder', { fg = c.info })
  hl(0, 'NotifyDEBUGIcon', { fg = c.info })
  hl(0, 'NotifyDEBUGTitle', { fg = c.info })
  hl(0, 'NotifyTRACEBorder', { fg = c.dimGray })
  hl(0, 'NotifyTRACEIcon', { fg = c.dimGray })
  hl(0, 'NotifyTRACETitle', { fg = c.dimGray })

  -- フローティングウィンドウの背景色
  hl(0, 'NormalFloat', { bg = 'NONE' })
  hl(0, 'FloatBorder', { fg = c.crystalBlue })
  hl(0, 'FloatTitle', { fg = c.crystalBlue, bold = true })

  -- ポップアップメニュー（基本）
  hl(0, 'Pmenu', { fg = c.aliceBlue })
  hl(0, 'PmenuSel', { fg = c.eerieBlack })
  hl(0, 'PmenuSbar', { bg = c.dimGray })
  hl(0, 'PmenuThumb', { bg = c.lightGray })

  -- 補完ポップアップ（blink.cmp）
  hl(0, 'BlinkCmpMenu', { fg = c.aliceBlue })
  hl(0, 'BlinkCmpMenuBorder', { fg = c.crystalBlue })
  hl(0, 'BlinkCmpMenuSelection', { bg = c.slateGray, fg = c.aliceBlue, bold = true })

  -- ラベル関連
  hl(0, 'BlinkCmpLabel', { fg = c.aliceBlue })
  hl(0, 'BlinkCmpLabelDeprecated', { fg = c.dimGray, strikethrough = true })
  hl(0, 'BlinkCmpLabelMatch', { fg = c.brightCyan })

  -- Kind（種類）関連
  hl(0, 'BlinkCmpKind', { fg = c.crystalBlue })
  hl(0, 'BlinkCmpKindVariable', { fg = c.goldenrod })
  hl(0, 'BlinkCmpKindFunction', { fg = c.limeGreen })
  hl(0, 'BlinkCmpKindMethod', { fg = c.limeGreen })
  hl(0, 'BlinkCmpKindKeyword', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'BlinkCmpKindProperty', { fg = c.skyBlue2 })
  hl(0, 'BlinkCmpKindField', { fg = c.skyBlue2 })
  hl(0, 'BlinkCmpKindUnit', { fg = c.aquamarine })
  hl(0, 'BlinkCmpKindClass', { fg = c.crystalBlue, bold = true })
  hl(0, 'BlinkCmpKindInterface', { fg = c.plum })
  hl(0, 'BlinkCmpKindConstant', { fg = c.lightSkyBlue })
  hl(0, 'BlinkCmpKindSnippet', { fg = c.corare })

  -- ドキュメンテーション
  hl(0, 'BlinkCmpDoc', { bg = c.eerieBlack })
  hl(0, 'BlinkCmpDocBorder', { fg = c.crystalBlue })

  -- シグネチャヘルプ
  hl(0, 'BlinkCmpSignatureHelp', {})
  hl(0, 'BlinkCmpSignatureHelpBorder', { fg = c.crystalBlue })

  -- Telescope
  hl(0, 'TelescopeNormal', { fg = c.aliceBlue })
  hl(0, 'TelescopeBorder', { fg = c.dimGray })
  hl(0, 'TelescopePromptNormal', { fg = c.aliceBlue })
  hl(0, 'TelescopePromptBorder', { fg = c.brightCyan })
  hl(0, 'TelescopePromptTitle', { fg = c.brightCyan, bold = true })
  hl(0, 'TelescopePreviewTitle', { fg = c.limeGreen, bold = true })
  hl(0, 'TelescopePreviewBorder', { fg = c.limeGreen })
  hl(0, 'TelescopeResultsTitle', { fg = c.limeGreen, bold = true })
  hl(0, 'TelescopeResultsBorder', { fg = c.limeGreen, bold = true })
  hl(0, 'TelescopeSelection', { fg = c.aliceBlue, bold = true })
  hl(0, 'TelescopeSelectionCaret', { fg = c.crystalBlue })
  hl(0, 'TelescopeMatching', { fg = c.crystalBlue, bold = true })
  hl(0, 'TelescopePromptPrefix', { fg = c.mediumVioletRed, bold = true })

  -- SmoothCursor
  hl(0, 'SmoothCursorCustom', { bg = nil, fg = c.mediumTurquoise, default = true })

  -- LSP診断
  hl(0, 'DiagnosticError', { fg = c.error })
  hl(0, 'DiagnosticWarn', { fg = c.warning })
  hl(0, 'DiagnosticInfo', { fg = c.info })
  hl(0, 'DiagnosticHint', { fg = c.hint })
  hl(0, 'DiagnosticUnderlineError', { underline = true, sp = c.error })
  hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = c.warning })
  hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = c.info })
  hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = c.hint })

  --- WinBar
  hl(0, 'WinBar', { bg = c.eerieBlack, fg = c.sliver })
  hl(0, 'WinBarNC', { bg = c.eerieBlack, fg = c.dimGray })

  --- gitsigns
  hl(0, 'GitSignsAdd', { fg = c.hint })
  hl(0, 'GitSignsChange', { fg = c.warning })
  hl(0, 'GitSignsDelete', { fg = c.error })
end

local function setup_treesitter_highlights(hl, c)
  -- Tree-sitter ハイライトグループ
  hl(0, '@comment', { fg = c.dimGray, italic = true })
  hl(0, '@attribute', { fg = c.lightGrayBlue })
  hl(0, '@punctuation.special', { fg = c.lightGrayBlue })
  hl(0, '@constant', { fg = c.lightSkyBlue, bold = true, italic = true })
  hl(0, '@constructor', { fg = c.limeGreen })
  hl(0, '@string', { fg = c.mediumTurquoise })
  hl(0, '@number', { fg = c.lightSteelBlue })
  hl(0, '@boolean', { fg = c.mediumVioletRed, bold = true })
  hl(0, '@keyword', { fg = c.mediumVioletRed, bold = true })
  hl(0, '@keyword.conditional.ternary', { fg = c.lightGrayBlue })
  hl(0, '@operator', { fg = c.lightGrayBlue })
  hl(0, '@parameter', { fg = c.lightSkyBlue2 })
  hl(0, '@function', { fg = c.limeGreen })
  hl(0, '@function.builtin', { fg = c.limeGreen })
  hl(0, '@function.method', { fg = c.forestGreen, bold = true })
  hl(0, '@function.method.call', { fg = c.limeGreen })
  hl(0, '@func.dotcall', { fg = c.limeGreen })
  hl(0, '@method', { fg = c.yellowGreen })
  hl(0, '@conditional', { fg = c.blueGreen })
  hl(0, '@repeat', { fg = c.blueGreen })
  hl(0, '@variable', { fg = c.goldenrod })
  hl(0, '@variable.builtin', { fg = c.mediumVioletRed, bold = true })
  hl(0, '@variable.member', { fg = c.skyBlue2 })
  hl(0, '@variable.parameter', { fg = c.lightSkyBlue2 })
  hl(0, '@field', { fg = c.skyBlue2 })
  hl(0, '@property', { fg = c.skyBlue2 })
  hl(0, '@module', { fg = c.silver })
  hl(0, '@type', { fg = c.crystalBlue, bold = true })
  hl(0, '@type.definition', { fg = c.crystalBlue, bold = true })
  hl(0, '@namespace', { fg = c.silver })
  hl(0, '@tag', { fg = c.mediumVioletRed })
  hl(0, '@tag.tsx', { fg = c.brightCyan, bold = true })
  hl(0, '@tag.builtin.tsx', { fg = c.brightCyan, bold = true })
  hl(0, '@tag.delimiter.tsx', { fg = c.crystalBlue, bold = true })
  hl(0, '@tag.attribute', { fg = c.limeGreen })
  hl(0, '@label', { fg = c.forestGreen })
end

local function setup_lsp_highlights(hl, c)
  -- LSP ハイライト
  hl(0, '@lsp.type.namespace', { fg = c.sliver })
  hl(0, '@lsp.type.parameter', { fg = c.lightSkyBlue2 })
  hl(0, '@lsp.type.enum', { fg = c.plum })
  hl(0, '@lsp.type.method', { fg = c.limeGreen })
  hl(0, '@lsp.type.type', { fg = c.lightCyan, bold = false })
  hl(0, '@lsp.type.interface', { fg = c.lightCyan })
  hl(0, '@lsp.type.typeParameter', { fg = c.rosyBrown, bold = true })
  hl(0, '@lsp.typemod.variable.declaration', { fg = c.coral })
  hl(0, '@lsp.typemod.property.static', { fg = c.skyBlue2, italic = true })
  hl(0, '@lsp.typemod.property.annotation', { fg = c.sliver })
  hl(0, '@lsp.typemod.method.constructor', { fg = c.forestGreen, bold = true })
  hl(0, '@lsp.typemod.method.defaultLibrary', { fg = c.limeGreen })
  hl(0, '@lsp.typemod.function.defaultLibrary', { fg = c.limeGreen })
  hl(0, '@lsp.typemod.class.defaultLibrary', { fg = c.crystalBlue, bold = true })
  hl(0, '@lsp.mod.importPrefix', { fg = c.lightGrayBlue })
  hl(0, '@lsp.mod.constructor', { fg = c.forestGreen, bold = true })
  hl(0, '@lsp.mod.instance', { fg = c.skyBlue2 })
  hl(0, '@lsp.mod.defaultLibrary', { fg = c.skyBlue2 })
  hl(0, '@lsp.mod.static', { italic = true })
  hl(0, '@lsp.typemod.function.declaration', { fg = c.forestGreen, bold = true })
  hl(0, '@lsp.typemod.variable.instance', { fg = c.skyBlue2 })
  hl(0, '@lsp.typemod.method.declaration', { fg = c.forestGreen, bold = true })
end

local function setup_language_specific(hl, c)
  -- Zsh
  hl(0, 'zshVariable', { fg = c.goldenrod })
  hl(0, 'zshCommands', { fg = c.limeGreen })
  hl(0, 'zshFunction', { fg = c.limeGreen })

  -- Lua
  hl(0, '@constructor.lua', { fg = c.lightGrayBlue })

  -- TypeScript
  hl(0, '@constructor.typescript', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'typescriptTypeReference', { fg = c.silver })
  hl(0, 'typescriptBlock', { fg = c.lightGrayBlue })
  hl(0, 'typescriptArrowFunc', { fg = c.lightGrayBlue })
  hl(0, 'typescriptBOMWindowMethod', { fg = c.limeGreen })
  hl(0, 'typescriptNumber', { fg = c.lightSteelBlue })
  hl(0, 'typescriptObjectLiteral', { fg = c.lightSteelBlue })
  hl(0, 'typescriptObjectLabel', { fg = c.skyBlue2 })
  hl(0, 'typescriptConditionalParen', { fg = c.lightGrayBlue })
  hl(0, 'typescriptBraces', { fg = c.lightGrayBlue })
  hl(0, 'typescriptPredefinedType', { fg = c.mediumVioletRed, bold = true })
  -- TypeScript React
  hl(0, 'tsxTag', { fg = c.crystalBlue })
  hl(0, 'tsxCloseTag', { fg = c.crystalBlue })
  hl(0, 'tsxCloseString', { fg = c.crystalBlue })
  hl(0, 'tsxTagName', { fg = c.brightCyan, bold = true })
  hl(0, 'tsxAttrib', { fg = c.limeGreen })

  -- Golang
  hl(0, '@lsp.type.namespace.go', { fg = c.silver })
  hl(0, '@lsp.type.struct.go', { fg = c.crystalBlue, bold = true })
  hl(0, '@lsp.type.interface.go', { fg = c.plum, bold = true })
  hl(0, '@function.go', { fg = c.forestGreen, bold = true })
  hl(0, 'goPackage', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'goImport', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'goFunc', { fg = c.mediumVioletRed, bold = true })
  hl(0, 'goType', { fg = c.crystalBlue, bold = true })
end

local function setup_search_highlights(hl, c)
  hl(0, 'Search', { fg = c.eerieBlack, bg = c.goldenrod, bold = true })
  hl(0, 'CurSearch', { fg = c.eerieBlack, bg = c.yellowGreen, bold = true })
  hl(0, 'IncSearch', { fg = c.eerieBlack, bg = c.brightCyan, italic = true })
  hl(0, 'Substitute', { fg = c.aliceBlue, bg = c.mediumVioletRed, underline = true })
end

function M.setup(colors, theme_name, lualine_theme_name)
  -- クリア & 基本設定
  vim.cmd('highlight clear')
  vim.o.termguicolors = true
  vim.o.background = 'dark'
  vim.g.colors_name = theme_name

  local hl = vim.api.nvim_set_hl

  -- ハイライトグループの設定
  setup_base_highlights(hl, colors)
  setup_treesitter_highlights(hl, colors)
  setup_lsp_highlights(hl, colors)
  setup_language_specific(hl, colors)
  setup_search_highlights(hl, colors)

  -- lualine テーマ設定
  if package.loaded['lualine'] and lualine_theme_name then
    require('lualine').setup({
      options = {
        theme = require(lualine_theme_name),
      },
    })
  end
end

return M
