local colors = require("theme.utils").get_theme_tb "base_30"

return {

  StatusLine = {
    bg = colors.black,
  },

  -- LSP

  St_lsp_error = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_lsp_warning = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_lsp_hints = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_lsp_info = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_lsp_name = {
    fg = colors.light_grey,
    bg = colors.black,
  },

  -- MODES

  St_NormalMode = {
    fg = colors.black,
    bg = colors.blue,
  },
  St_InsertMode = {
    fg = colors.black,
    bg = colors.green,
  },
  St_TerminalMode = {
    fg = colors.black,
    bg = colors.yellow,
  },
  St_NTerminalMode = {
    fg = colors.black,
    bg = colors.yellow,
  },
  St_VisualMode = {
    fg = colors.black,
    bg = colors.dark_purple,
  },
  St_ReplaceMode = {
    fg = colors.black,
    bg = colors.orange,
  },
  St_ConfirmMode = {
    fg = colors.black,
    bg = colors.teal,
  },
  St_CommandMode = {
    fg = colors.black,
    bg = colors.red,
  },
  St_SelectMode = {
    fg = colors.black,
    bg = colors.pink,
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
    bg = colors.black,
  },
  St_file_type_text = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_cwd_icon = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_cwd_text = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_pos_icon = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_pos_text = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_git_info = {
    fg = colors.light_grey,
    bg = colors.black,
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
