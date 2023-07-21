local gitsigns = require "gitsigns"
local set_border = require("ui.utils").set_border

require("theme").load_highlight "git"

gitsigns.setup {
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "┃" },
    topdelete = { text = "┃" },
    changedelete = { text = "┃" },
    untracked = { text = "┃" },
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = set_border "FloatBorder",
    style = "minimal",
    relative = "cursor",
    row = 1,
    col = 1,
  },
  yadm = {
    enable = false,
  },
  on_attach = function(bufnr)
    require("core.utils").load_mappings("gitsigns", { buffer = bufnr })
  end,
}
