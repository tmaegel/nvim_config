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
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_InsertMode = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_TerminalMode = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_NTerminalMode = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_VisualMode = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_ReplaceMode = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_ConfirmMode = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_CommandMode = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_SelectMode = {
    fg = colors.light_grey,
    bg = colors.black,
  },

  -- Separators

  St_Sep = {
    fg = colors.black,
    bg = colors.black,
  },

  -- Custom status line components

  St_file_type = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_cwd = {
    fg = colors.light_grey,
    bg = colors.black,
  },
  St_pos = {
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
