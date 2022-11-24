local theme = require("theme").get_theme_tb "base_16"
local colors = require("theme").get_theme_tb "base_30"

return {

  DiffText = {
    fg = "none",
    bg = colors.diff_text,
  },
  DiffAdd = {
    fg = "none",
    bg = colors.diff_add,
  },
  DiffChange = {
    fg = "none",
    bg = colors.diff_change,
  },
  DiffDelete = {
    fg = "none",
    bg = colors.diff_delete,
  },
  DiffAdded = {
    fg = colors.green,
  },
  DiffChangeDelete = {
    fg = colors.red,
  },
  DiffModified = {
    fg = colors.orange,
  },
  DiffRemoved = {
    fg = colors.red,
  },

  -- Gitsigns
  GitSignsAdd = {
    fg = colors.green,
    bg = "none",
  },
  GitSignsChange = {
    fg = colors.blue,
    bg = "none",
  },
  GitSignsDelete = {
    fg = colors.red,
    bg = "none",
  },
  GitWordAdd = {
    bg = colors.diff_text,
  },
  GitWordDelete = {
    bg = colors.diff_text,
  },
  GitSignsAddNr = {
    fg = colors.green,
    bg = colors.black,
  },
  GitSignsChangeNr = {
    fg = colors.blue,
    bg = colors.black,
  },
  GitSignsDeleteNr = {
    fg = colors.red,
    bg = colors.black,
  },
  GitSignsAddLn = {
    fg = "none",
    bg = colors.diff_add,
  },
  GitSignsChangeLn = {
    fg = "none",
    bg = colors.diff_change,
  },
  GitSignsDeleteLn = {
    fg = "none",
    bg = colors.diff_delete,
  },

  -- git commits
  gitcommitOverflow = {
    fg = theme.base08,
  },
  gitcommitSummary = {
    fg = theme.base08,
  },
  gitcommitComment = {
    fg = theme.base03,
  },
  gitcommitUntracked = {
    fg = theme.base03,
  },
  gitcommitDiscarded = {
    fg = theme.base03,
  },
  gitcommitSelected = {
    fg = theme.base03,
  },
  gitcommitHeader = {
    fg = theme.base0E,
  },
  gitcommitSelectedType = {
    fg = theme.base0D,
  },
  gitcommitUnmergedType = {
    fg = theme.base0D,
  },
  gitcommitDiscardedType = {
    fg = theme.base0D,
  },
  gitcommitBranch = {
    fg = theme.base09,
    bold = true,
  },
  gitcommitUntrackedFile = {
    fg = theme.base0A,
  },
  gitcommitUnmergedFile = {
    fg = theme.base08,
    bold = true,
  },
  gitcommitDiscardedFile = {
    fg = theme.base08,
    bold = true,
  },
  gitcommitSelectedFile = {
    fg = theme.base0B,
    bold = true,
  },
}
