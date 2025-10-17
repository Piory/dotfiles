local c = require('themes.colors')

local rainbow_drops = {}

-- ノーマルモード（アクティブな状態）
rainbow_drops.normal = {
  a = { fg = c.slateGray, bg = c.info, gui = 'bold' },
  b = { fg = c.info, bg = c.slateGray },
  c = { fg = c.lightGrayBlue, bg = c.eerieBlack },
}

-- インサートモード
rainbow_drops.insert = {
  a = { fg = c.slateGray, bg = c.hint, gui = 'bold' },
  b = { fg = c.hint, bg = c.slateGray },
  c = { fg = c.lightGrayBlue, bg = c.eerieBlack },
}

-- ビジュアルモード
rainbow_drops.visual = {
  a = { fg = c.slateGray, bg = c.plum, gui = 'bold' },
  b = { fg = c.plum, bg = c.slateGray },
  c = { fg = c.lightGrayBlue, bg = c.eerieBlack },
}

-- 置換モード
rainbow_drops.replace = {
  a = { fg = c.slateGray, bg = c.coral, gui = 'bold' },
  b = { fg = c.coral, bg = c.slateGray },
  c = { fg = c.lightGrayBlue, bg = c.eerieBlack },
}

-- コマンドモード
rainbow_drops.command = {
  a = { fg = c.slateGray, bg = c.warning, gui = 'bold' },
  b = { fg = c.warning, bg = c.slateGray },
  c = { fg = c.lightGrayBlue, bg = c.eerieBlack },
}

-- ターミナルモード
rainbow_drops.terminal = {
  a = { fg = c.slateGray, bg = c.mediumTurquoise, gui = 'bold' },
  b = { fg = c.mediumTurquoise, bg = c.slateGray },
  c = { fg = c.lightGrayBlue, bg = c.eerieBlack },
}

-- 非アクティブウィンドウ
rainbow_drops.inactive = {
  a = { fg = c.dimGray, bg = c.darkSlateGray },
  b = { fg = c.dimGray, bg = c.darkSlateGray },
  c = { fg = c.dimGray, bg = c.eerieBlack },
}

return rainbow_drops
