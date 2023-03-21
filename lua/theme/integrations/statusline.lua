local colors = require("theme").get_theme_tb "base_30"

return {

  StatusLine = {
    bg = colors.black,
  },

  -- LSP

  St_lspError = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_lspWarning = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_LspHints = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_LspInfo = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_LspStatus = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_LspProgress = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_LspStatus_Icon = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },

  -- MODES

  St_NormalMode = {
    fg = colors.black,
    bg = colors.blue,
    bold = true,
  },
  St_InsertMode = {
    fg = colors.black,
    bg = colors.green,
    bold = true,
  },
  St_TerminalMode = {
    fg = colors.black,
    bg = colors.yellow,
    bold = true,
  },
  St_NTerminalMode = {
    fg = colors.black,
    bg = colors.yellow,
    bold = true,
  },
  St_VisualMode = {
    fg = colors.black,
    bg = colors.dark_purple,
    bold = true,
  },
  St_ReplaceMode = {
    fg = colors.black,
    bg = colors.orange,
    bold = true,
  },
  St_ConfirmMode = {
    fg = colors.black,
    bg = colors.teal,
    bold = true,
  },
  St_CommandMode = {
    fg = colors.black,
    bg = colors.red,
    bold = true,
  },
  St_SelectMode = {
    fg = colors.black,
    bg = colors.pink,
    bold = true,
  },

  -- Separators

  St_Sep = {
    fg = colors.black,
    bg = colors.black,
  },
  St_Sep_Fill = {
    fg = colors.grey,
    bg = colors.grey,
  },

  -- Custom status line components

  St_file_type_icon = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_file_type_text = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_cwd_icon = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_cwd_text = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_pos_icon = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_pos_text = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_git_info = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_tab_active = {
    fg = colors.black,
    bg = colors.green,
  },
  St_tab_inactive = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
}
