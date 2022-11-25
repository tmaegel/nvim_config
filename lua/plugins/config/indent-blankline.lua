local blankline = require "indent_blankline"

require("theme").load_highlight "blankline"
require("core.utils").load_mappings "blankline"

-- Change blankline context character
vim.g.indent_blankline_context_char = "│"

blankline.setup {
  char = "│",
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}
