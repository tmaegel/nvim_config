local colors = require("theme").get_theme_tb "base_30"

return {
  -- current / selected buffer
  CybuFocus = {
    bg = colors.blue,
    fg = colors.black,
  },
  -- buffers not in focus
  CybuAdjacent = {
    fg = colors.white,
    bg = colors.black,
  },
  -- window background
  CybuBackground = {
    fg = colors.red,
    bg = colors.red,
  },
  -- border of the window
  CybuBorder = {
    fg = colors.grey,
    bg = colors.black,
  },
}
