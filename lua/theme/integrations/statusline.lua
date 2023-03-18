local colors = require("theme").get_theme_tb "base_30"

return {

  StatusLine = {
    bg = colors.black,
  },

  -- LSP

  St_lspError = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_lspWarning = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_LspHints = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_LspInfo = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_LspStatus = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_LspProgress = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_LspStatus_Icon = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },

  -- MODES

  St_NormalMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },
  St_InsertMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },
  St_TerminalMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },
  St_NTerminalMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },
  St_VisualMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },
  St_ReplaceMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },
  St_ConfirmMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },
  St_CommandMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
    bold = true,
  },
  St_SelectMode = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
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
    bg = colors.statusline_bg,
  },
  St_file_type_text = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_cwd_icon = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_cwd_text = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_pos_icon = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_pos_text = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_git_info = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
  St_tab_active = {
    fg = colors.light_grey,
    bg = colors.lightbg,
  },
  St_tab_inactive = {
    fg = colors.light_grey,
    bg = colors.statusline_bg,
  },
}
