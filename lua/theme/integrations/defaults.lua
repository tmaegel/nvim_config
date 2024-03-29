local colors = require("theme.utils").get_theme_tb "base_30"
local theme = require("theme.utils").get_theme_tb "base_16"

return {
  MatchWord = {
    fg = colors.white,
    bg = colors.one_bg2,
  },

  Pmenu = { bg = colors.black2 },
  PmenuSbar = { bg = colors.one_bg },
  PmenuSel = { bg = colors.pmenu_bg, fg = colors.black },
  PmenuThumb = { bg = colors.grey },

  MatchParen = { bg = colors.one_bg2, fg = colors.green },

  Comment = { fg = colors.grey_fg },

  CursorLineNr = { fg = colors.light_grey },
  LineNr = { fg = colors.grey },

  -- floating windows
  FloatBorder = { fg = colors.grey, bg = colors.darker_black },
  NormalFloat = { fg = colors.white, bg = colors.black },

  NvimInternalError = { fg = colors.red },
  WinSeparator = { fg = colors.line },

  Normal = {
    fg = theme.base05,
    bg = theme.base00,
  },

  Bold = {
    bold = true,
  },

  Debug = {
    fg = theme.base08,
  },

  Directory = {
    fg = theme.base0D,
  },

  Error = {
    fg = theme.base00,
    bg = theme.base08,
  },

  ErrorMsg = {
    fg = theme.base08,
    bg = theme.base00,
  },

  Exception = {
    fg = theme.base08,
  },

  FoldColumn = {
    fg = theme.base0C,
    bg = colors.black,
  },

  Folded = {
    fg = theme.base03,
    bg = theme.base01,
  },

  IncSearch = {
    fg = theme.base01,
    bg = theme.base09,
  },

  Italic = {
    italic = true,
  },

  Macro = {
    fg = theme.base08,
  },

  ModeMsg = {
    fg = theme.base0B,
  },

  MoreMsg = {
    fg = theme.base0B,
  },

  Question = {
    fg = theme.base0D,
  },

  Search = {
    fg = theme.base01,
    bg = theme.base0A,
  },

  Substitute = {
    fg = theme.base01,
    bg = theme.base0A,
    sp = "none",
  },

  SpecialKey = {
    fg = theme.base03,
  },

  TooLong = {
    fg = theme.base08,
  },

  UnderLined = {
    fg = theme.base0B,
  },

  Visual = {
    bg = theme.base02,
  },

  VisualNOS = {
    fg = theme.base08,
  },

  WarningMsg = {
    fg = theme.base08,
  },

  WildMenu = {
    fg = theme.base08,
    bg = theme.base0A,
  },

  Title = {
    fg = theme.base0D,
    sp = "none",
  },

  Conceal = {
    bg = "NONE",
  },

  Cursor = {
    fg = theme.base00,
    bg = theme.base05,
  },

  NonText = {
    fg = theme.base03,
  },

  SignColumn = {
    fg = theme.base03,
    bg = colors.black,
    sp = "NONE",
  },

  ColorColumn = {
    bg = theme.base01,
    sp = "none",
  },

  CursorColumn = {
    bg = theme.base01,
    sp = "none",
  },

  CursorLine = {
    bg = "none",
    sp = "none",
  },

  QuickFixLine = {
    bg = colors.black2,
    sp = "none",
  },

  -- spell
  SpellBad = {
    undercurl = true,
    sp = theme.base08,
  },

  SpellLocal = {
    undercurl = true,
    sp = theme.base0C,
  },

  SpellCap = {
    undercurl = true,
    sp = theme.base0D,
  },

  SpellRare = {
    undercurl = true,
    sp = theme.base0E,
  },

  healthSuccess = {
    bg = colors.green,
    fg = colors.black,
  },
}
