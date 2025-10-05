local c = require('themes.colors')

local rainbow_drops = {}

-- ノーマルモード（アクティブな状態）
rainbow_drops.normal = {
  a = { fg = c.eerieBlack, bg = c.brightCyan, gui = 'bold' },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- インサートモード
rainbow_drops.insert = {
  a = { fg = c.eerieBlack, bg = c.limeGreen, gui = 'bold' },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- ビジュアルモード
rainbow_drops.visual = {
  a = { fg = c.eerieBlack, bg = c.plum, gui = 'bold' },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- 置換モード
rainbow_drops.replace = {
  a = { fg = c.eerieBlack, bg = c.coral, gui = 'bold' },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- コマンドモード
rainbow_drops.command = {
  a = { fg = c.eerieBlack, bg = c.goldenrod, gui = 'bold' },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- ターミナルモード
rainbow_drops.terminal = {
  a = { fg = c.eerieBlack, bg = c.mediumTurquoise, gui = 'bold' },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- 非アクティブウィンドウ
rainbow_drops.inactive = {
  a = { fg = c.dimGray, bg = c.darkSlateGray },
  b = { fg = c.dimGray, bg = c.darkSlateGray },
  c = { fg = c.dimGray, bg = c.eerieBlack },
}

return rainbow_drops
