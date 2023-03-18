local colors = require("theme").get_theme_tb "base_30"

return {
  -- current / selected buffer
  CybuFocus = {
    bg = colors.red,
    fg = colors.white,
  },
  -- buffers not in focus
  CybuAdjacent = {
    fg = colors.white,
    bg = colors.black2,
  },
  -- window background
  CybuBackground = {
    fg = colors.red,
    bg = colors.red,
  },
  -- border of the window
  CybuBorder = {
    fg = colors.darker_black,
    bg = colors.darker_black,
  },
}
