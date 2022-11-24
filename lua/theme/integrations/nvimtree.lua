local colors = require("theme").get_theme_tb "base_30"

return {
  NvimTreeEmptyFolderName = { fg = colors.folder_bg },
  NvimTreeEndOfBuffer = { fg = colors.black },
  NvimTreeFolderIcon = { fg = colors.folder_bg },
  NvimTreeFolderName = { fg = colors.folder_bg },
  NvimTreeGitDirty = { fg = colors.red },
  NvimTreeIndentMarker = { fg = colors.grey_fg },
  NvimTreeNormal = { bg = colors.black },
  NvimTreeNormalNC = { bg = colors.black },
  NvimTreeOpenedFolderName = { fg = colors.folder_bg },
  NvimTreeGitIgnored = { fg = colors.light_grey },

  NvimTreeWinSeparator = {
    fg = colors.black,
    bg = colors.black,
  },

  NvimTreeWindowPicker = {
    fg = colors.red,
    bg = colors.black2,
  },

  NvimTreeCursorLine = {
    bg = colors.black2,
  },

  NvimTreeGitNew = {
    fg = colors.yellow,
  },

  NvimTreeGitDeleted = {
    fg = colors.red,
  },

  NvimTreeSpecialFile = {
    fg = colors.yellow,
    bold = true,
  },

  NvimTreeRootFolder = {
    fg = colors.red,
    bold = true,
  },
}
