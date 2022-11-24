local colors = require("theme").get_theme_tb "base_30"

return {

  StatusLine = {
    bg = colors.black,
  },
  St_gitIcons = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },

  -- LSP

  St_lspError = {
    fg = colors.red,
    bg = colors.lightbg,
  },
  St_lspWarning = {
    fg = colors.yellow,
    bg = colors.lightbg,
  },
  St_LspHints = {
    fg = colors.purple,
    bg = colors.lightbg,
  },
  St_LspInfo = {
    fg = colors.green,
    bg = colors.lightbg,
  },
  St_LspStatus = {
    fg = colors.nord_blue,
    bg = colors.lightbg,
  },
  St_LspProgress = {
    fg = colors.green,
    bg = colors.lightbg,
  },
  St_LspStatus_Icon = {
    fg = colors.black,
    bg = colors.lightbg,
  },

  -- MODES

  St_NormalMode = {
    bg = colors.blue,
    fg = colors.black,
    bold = true,
  },
  St_InsertMode = {
    bg = colors.green,
    fg = colors.black,
    bold = true,
  },
  St_TerminalMode = {
    bg = colors.cyan,
    fg = colors.black,
    bold = true,
  },
  St_NTerminalMode = {
    bg = colors.yellow,
    fg = colors.black,
    bold = true,
  },
  St_VisualMode = {
    bg = colors.purple,
    fg = colors.black,
    bold = true,
  },
  St_ReplaceMode = {
    bg = colors.orange,
    fg = colors.black,
    bold = true,
  },
  St_ConfirmMode = {
    bg = colors.teal,
    fg = colors.black,
    bold = true,
  },
  St_CommandMode = {
    bg = colors.green,
    fg = colors.black,
    bold = true,
  },
  St_SelectMode = {
    bg = colors.nord_blue,
    fg = colors.black,
    bold = true,
  },

  -- Separators for mode

  St_NormalModeSep = {
    fg = colors.nord_blue,
    bg = colors.black,
  },
  St_InsertModeSep = {
    fg = colors.dark_purple,
    bg = colors.black,
  },
  St_TerminalModeSep = {
    fg = colors.green,
    bg = colors.black,
  },
  St_NTerminalModeSep = {
    fg = colors.yellow,
    bg = colors.black,
  },
  St_VisualModeSep = {
    fg = colors.cyan,
    bg = colors.black,
  },
  St_ReplaceModeSep = {
    fg = colors.orange,
    bg = colors.black,
  },
  St_ConfirmModeSep = {
    fg = colors.teal,
    bg = colors.black,
  },
  St_CommandModeSep = {
    fg = colors.green,
    bg = colors.black,
  },
  St_SelectModeSep = {
    fg = colors.nord_blue,
    bg = colors.black,
  },
  St_EmptySpace = {
    fg = colors.grey,
    bg = colors.grey,
  },
  St_EmptySpace2 = {
    fg = colors.grey,
    bg = colors.statusline_bg,
  },
  St_file_info = {
    bg = colors.lightbg,
    fg = colors.white,
  },
  St_cwd_icon = {
    fg = colors.black,
    bg = colors.red,
  },
  St_cwd_text = {
    fg = colors.white,
    bg = colors.lightbg,
  },
  St_cwd_sep = {
    fg = colors.red,
    bg = colors.black,
  },
  St_pos_icon = {
    fg = colors.black,
    bg = colors.green,
  },
  St_pos_text = {
    fg = colors.green,
    bg = colors.lightbg,
  },
  St_default_sep = {
    fg = colors.black,
    bg = colors.black,
  },
}
