local c = require('themes.colors-soft')

local rainbow_drops_soft = {}

-- ノーマルモード（アクティブな状態）
rainbow_drops_soft.normal = {
  a = { fg = c.eerieBlack, bg = c.crystalBlue },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- インサートモード
rainbow_drops_soft.insert = {
  a = { fg = c.eerieBlack, bg = c.limeGreen },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- ビジュアルモード
rainbow_drops_soft.visual = {
  a = { fg = c.eerieBlack, bg = c.plum },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- 置換モード
rainbow_drops_soft.replace = {
  a = { fg = c.eerieBlack, bg = c.coral },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- コマンドモード
rainbow_drops_soft.command = {
  a = { fg = c.eerieBlack, bg = c.goldenrod },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- ターミナルモード
rainbow_drops_soft.terminal = {
  a = { fg = c.eerieBlack, bg = c.mediumTurquoise },
  b = { fg = c.aliceBlue, bg = c.charcoal },
  c = { fg = c.silver, bg = c.eerieBlack },
}

-- 非アクティブウィンドウ
rainbow_drops_soft.inactive = {
  a = { fg = c.dimGray, bg = c.darkSlateGray },
  b = { fg = c.dimGray, bg = c.darkSlateGray },
  c = { fg = c.dimGray, bg = c.eerieBlack },
}

return rainbow_drops_soft

