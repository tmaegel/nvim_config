local gitsigns = require "gitsigns"
local set_border = require("ui.utils").set_border

require("theme").load_highlight "git"

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "┃", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "┃", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    untracked = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
  },
  preview_config = {
    -- Options passed to nvim_open_win
    border = set_border "FloatBorder",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 90,
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  show_deleted = false,
}
