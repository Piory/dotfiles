-- rainbow-drops テーマの共通 setup 処理
local M = {}

local function setup_base_highlights(hl, c)
  -- 基本ハイライトグループ
  hl(0, 'Normal', { fg = c.lightGrayBlue })
  hl(0, 'CursorLine', { bg = c.cursorLine })
  hl(0, 'LineNr', { fg = c.dimGray })
  hl(0, 'CursorLineNr', { fg = c.lightGrayBlue })
  hl(0, 'SignColumn', { bg = 'NONE' })
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
  hl(0, 'NotifyBackground', { bg = c.eerieBlack })

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

  -- BufferLine
  hl(0, 'BufferLineFill', { bg = c.eerieBlack })
  hl(0, 'BufferLineBackground', { bg = c.eerieBlack, fg = c.aliceBlue })
  hl(0, 'BufferLineBufferVisible', { bg = c.eerieBlack, fg = c.aliceBlue })
  hl(0, 'BufferLineBufferSelected', { bg = c.eerieBlack, fg = c.lightSkyBlue, bold = true, italic = true })
  hl(0, 'BufferLineCloseButton', { fg = c.dimGray, bg = c.eerieBlack })
  hl(0, 'BufferLineCloseButtonVisible', { fg = c.aliceBlue, bg = c.eerieBlack })
  hl(0, 'BufferLineCloseButtonSelected', { fg = c.coral, bg = c.eerieBlack, bold = true })
  hl(0, 'BufferLineModified', { fg = c.goldenrod, bg = c.eerieBlack })
  hl(0, 'BufferLineModifiedVisible', { fg = c.coral, bg = c.eerieBlack })
  hl(0, 'BufferLineModifiedSelected', { fg = c.limeGreen, bg = c.eerieBlack, bold = true })
  hl(0, 'BufferLineIndicatorSelected', { fg = c.crystalBlue, bg = c.eerieBlack })
  hl(0, 'BufferLineSeparator', { fg = c.gray, bg = c.eerieBlack })
  hl(0, 'BufferLineSeparatorVisible', { fg = c.gray, bg = c.eerieBlack })
  hl(0, 'BufferLineSeparatorSelected', { fg = c.gray, bg = c.eerieBlack })
  hl(0, 'BufferLineTab', { fg = c.aliceBlue, bg = c.eerieBlack })
  hl(0, 'BufferLineTabSelected', { fg = c.brightCyan, bg = c.eerieBlack, bold = true })
  hl(0, 'BufferLineTabClose', { fg = c.coral, bg = c.eerieBlack, bold = true })
  hl(0, 'BufferLineTabSeparator', { fg = c.gray, bg = c.eerieBlack })
  hl(0, 'BufferLineTabSeparatorSelected', { fg = c.gray, bg = c.eerieBlack })
  hl(0, 'BufferLineDuplicate', { fg = c.silver, bg = c.eerieBlack, italic = true })
  hl(0, 'BufferLineDuplicateVisible', { fg = c.aliceBlue, bg = c.eerieBlack, italic = true })
  hl(0, 'BufferLineDuplicateSelected', { fg = c.aliceBlue, bg = c.eerieBlack, italic = true, bold = true })
  hl(0, 'BufferLineNumbers', { fg = c.silver, bg = c.eerieBlack })
  hl(0, 'BufferLineNumbersVisible', { fg = c.aliceBlue, bg = c.eerieBlack })
  hl(0, 'BufferLineNumbersSelected', { fg = c.brightCyan, bg = c.eerieBlack, bold = true })
  hl(0, 'BufferLinePick', { fg = c.coral, bg = c.eerieBlack, bold = true })
  hl(0, 'BufferLinePickVisible', { fg = c.coral, bg = c.eerieBlack, bold = true })
  hl(0, 'BufferLinePickSelected', { fg = c.coral, bg = c.eerieBlack, bold = true })
  hl(0, 'BufferLineError', { fg = c.crimson })
  hl(0, 'BufferLineErrorVisible', { fg = c.crimson })
  hl(0, 'BufferLineErrorSelected', { fg = c.crimson, bold = true })
  hl(0, 'BufferLineWarning', { fg = c.goldenrod })
  hl(0, 'BufferLineWarningVisible', { fg = c.goldenrod })
  hl(0, 'BufferLineWarningSelected', { fg = c.goldenrod, bold = true })
  hl(0, 'BufferLineInfo', { fg = c.crystalBlue })
  hl(0, 'BufferLineInfoVisible', { fg = c.crystalBlue })
  hl(0, 'BufferLineInfoSelected', { fg = c.crystalBlue, bold = true })
  hl(0, 'BufferLineHint', { fg = c.aquamarine })
  hl(0, 'BufferLineHintVisible', { fg = c.aquamarine })
  hl(0, 'BufferLineHintSelected', { fg = c.aquamarine, bold = true })

  -- BufferLine 診断アイコン
  hl(0, 'BufferLineDiagnostic', { bg = c.eerieBlack })
  hl(0, 'BufferLineDiagnosticVisible', { bg = c.eerieBlack })
  hl(0, 'BufferLineDiagnosticSelected', { bg = c.eerieBlack })
  hl(0, 'BufferLineErrorDiagnostic', { fg = c.crimson, bg = c.eerieBlack })
  hl(0, 'BufferLineErrorDiagnosticVisible', { fg = c.crimson, bg = c.eerieBlack })
  hl(0, 'BufferLineErrorDiagnosticSelected', { fg = c.crimson, bg = c.eerieBlack })
  hl(0, 'BufferLineWarningDiagnostic', { fg = c.goldenrod, bg = c.eerieBlack })
  hl(0, 'BufferLineWarningDiagnosticVisible', { fg = c.goldenrod, bg = c.eerieBlack })
  hl(0, 'BufferLineWarningDiagnosticSelected', { fg = c.goldenrod, bg = c.eerieBlack })
  hl(0, 'BufferLineInfoDiagnostic', { fg = c.crystalBlue, bg = c.eerieBlack })
  hl(0, 'BufferLineInfoDiagnosticVisible', { fg = c.crystalBlue, bg = c.eerieBlack })
  hl(0, 'BufferLineInfoDiagnosticSelected', { fg = c.crystalBlue, bg = c.eerieBlack })
  hl(0, 'BufferLineHintDiagnostic', { fg = c.aquamarine, bg = c.eerieBlack })
  hl(0, 'BufferLineHintDiagnosticVisible', { fg = c.aquamarine, bg = c.eerieBlack })
  hl(0, 'BufferLineHintDiagnosticSelected', { fg = c.aquamarine, bg = c.eerieBlack })

  -- 診断状態のファイル名背景色（バッファタイトル）
  hl(0, 'BufferLineBufferError', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferErrorVisible', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferErrorSelected', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferWarning', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferWarningVisible', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferWarningSelected', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferInfo', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferInfoVisible', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferInfoSelected', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferHint', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferHintVisible', { bg = c.eerieBlack })
  hl(0, 'BufferLineBufferHintSelected', { bg = c.eerieBlack })

  -- BufferLine DevIcon背景色の統一（アイコン色は保持するため遅延実行）
  vim.defer_fn(function()
    -- DevIconの背景色を後から設定（アイコンの元の色を保持）
    local function update_devicon_bg()
      local highlight_groups = vim.api.nvim_get_hl(0, {})
      for name, _ in pairs(highlight_groups) do
        if name:match('^BufferLineDevIcon') and not name:match('Selected$') and not name:match('Visible$') and not name:match('Inactive$') then
          local existing = vim.api.nvim_get_hl(0, { name = name })
          if existing.fg then
            -- 通常状態
            vim.api.nvim_set_hl(0, name, { fg = existing.fg, bg = c.eerieBlack })
            -- 選択状態
            vim.api.nvim_set_hl(0, name .. 'Selected', { fg = existing.fg, bg = c.eerieBlack })
            -- 表示状態
            vim.api.nvim_set_hl(0, name .. 'Visible', { fg = existing.fg, bg = c.eerieBlack })
          end
        end
      end
    end
    update_devicon_bg()
  end, 100)

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

  -- LSP診断
  hl(0, 'DiagnosticError', { fg = c.crimson })
  hl(0, 'DiagnosticWarn', { fg = c.goldenrod })
  hl(0, 'DiagnosticInfo', { fg = c.crystalBlue })
  hl(0, 'DiagnosticHint', { fg = c.aquamarine })
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
  hl(0, '@tag.tsx', { fg = c.crystalBlue, bold = true })
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
  hl(0, '@lsp.typemod.variable.declaration', { fg = c.coral })
  hl(0, '@lsp.typemod.property.static', { fg = c.skyBlue2, italic = true })
  hl(0, '@lsp.typemod.property.annotation', { fg = c.sliver })
  hl(0, '@lsp.typemod.method', { fg = c.limeGreen })
  hl(0, '@lsp.typemod.method.constructor', { fg = c.forestGreen, bold = true })
  hl(0, '@lsp.mod.importPrefix', { fg = c.lightGrayBlue })
  hl(0, '@lsp.mod.constructor', { fg = c.forestGreen, bold = true })
  hl(0, '@lsp.mod.instance', { fg = c.skyBlue2 })
  hl(0, '@lsp.mod.static', { italic = true })
  hl(0, '@lsp.typemod.function.declaration', { fg = c.forestGreen, bold = true })
  hl(0, '@lsp.typemod.variable.instance', { fg = c.skyBlue2 })
  hl(0, '@lsp.typemod.method.declaration', { fg = c.forestGreen, bold = true })
end

local function setup_language_specific(hl, c)
  -- Lua
  hl(0, '@constructor.lua', { fg = c.lightGrayBlue })

  -- TypeScript
  hl(0, '@lsp.typemod.interface.declaration.typescriptreact', { fg = c.lightCyan })
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
