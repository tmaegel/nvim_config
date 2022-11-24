local colors = require("theme").get_theme_tb "base_30"

return {
  MasonNormal = { bg = colors.darker_black },
  MasonCursorLine = { bg = colors.darker_black },

  MasonHeading = { bold = true, default = true },
  MasonHeader = { fg = colors.black, bg = colors.red },
  MasonHeaderSecondary = { link = "MasonHighlightBlock" },

  MasonHighlight = { fg = colors.blue },
  MasonHighlightBlock = { fg = colors.black, bg = colors.green },
  MasonHighlightBlockBold = { link = "MasonHighlightBlock" },

  -- MasonHighlightSecondary = { fg = "#DCA561", default = true },
  -- MasonHighlightBlockSecondary = { bg = "#DCA561", fg = "#222222", default = true },
  -- MasonHighlightBlockBoldSecondary = { bg = "#DCA561", fg = "#222222", bold = true, default = true },

  MasonMuted = { fg = colors.light_grey },
  MasonMutedBlock = { fg = colors.light_grey, bg = colors.one_bg },
  -- MasonMutedBlockBold = { bg = "#888888", fg = "#222222", bold = true, default = true },

  -- MasonLink = { link = "MasonHighlight", default = true },
  -- MasonError = { fg = "#f44747", default = true },
}
