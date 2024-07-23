-- https://github.com/lewis6991/gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  tag = "v0.7",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local theme = require("theme.utils").get_theme_tb "base_16"
    local colors = require("theme.utils").get_theme_tb "base_30"

    require("theme.utils").load_highlight {
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
    }

    require("gitsigns").setup {
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
        border = require("utils").set_border "FloatBorder",
        style = "minimal",
        relative = "cursor",
        row = 1,
        col = 1,
      },
      yadm = {
        enable = false,
      },
      on_attach = function(bufnr)
        local keymap = vim.keymap
        keymap.set("n", "<leader>hn", "<cmd> Gitsigns next_hunk <CR>", { desc = " Git go to next hunk" })
        keymap.set("n", "<leader>hN", "<cmd> Gitsigns prev_hunk <CR>", { desc = "Git go to prev hunk" })
        keymap.set("n", "<leader>ha", "<cmd> Gitsigns stage_hunk <CR>", { desc = "Git stage hunk" })
        keymap.set("n", "<leader>hA", "<cmd> Gitsigns stage_buffer <CR>", { desc = "Git stage buffer" })
        keymap.set("n", "<leader>hu", "<cmd> Gitsigns undo_stage_hunk <CR>", { desc = "Git Undo stage hunk" })
        keymap.set("n", "<leader>hr", "<cmd> Gitsigns reset_hunk <CR>", { desc = "Git reset hunk" })
        keymap.set("n", "<leader>hR", "<cmd> Gitsigns reset_buffer <CR>", { desc = "Git reset buffer" })
        keymap.set("n", "<leader>hd", "<cmd> Gitsigns diffthis split=botright <CR>", { desc = "Git show diff" })
        keymap.set(
          "n",
          "<leader>hp",
          "<cmd> preview_hunk <CR>",
          { desc = "Git preview the hunk at the cursor position" }
        )
        keymap.set("v", "<leader>ha", "<cmd> Gitsigns stage_hunk <CR>", { desc = "Git stage hunk" })
        keymap.set("v", "<leader>hr", "<cmd> Gitsigns reset_hunk <CR>", { desc = "Git reset hunk" })
      end,
    }
  end,
}
