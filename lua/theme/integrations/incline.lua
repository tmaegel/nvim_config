local colors = require("theme").get_theme_tb "base_30"

return {
  InclineNormal = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  InclineNormalNC = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
}
