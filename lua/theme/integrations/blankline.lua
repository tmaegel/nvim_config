local colors = require("theme").get_theme_tb "base_30"

return {
  IndentBlanklineChar = { fg = colors.line },
  IndentBlanklineSpaceChar = { fg = colors.line },
  IndentBlanklineContextChar = { fg = colors.line },
  IndentBlanklineContextStart = { bg = colors.one_bg2 },
}
