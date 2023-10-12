return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("theme").load_highlight "git"
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
        border = require("ui.utils").set_border "FloatBorder",
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
        keymap.set("n", "<leader>hn", "<cmd> Gitsigns next_hunk <CR>", { desc = "Go to next hunk" })
        keymap.set("n", "<leader>hN", "<cmd> Gitsigns prev_hunk <CR>", { desc = "Go to prev hunk" })
        keymap.set("n", "<leader>ha", "<cmd> Gitsigns stage_hunk <CR>", { desc = "Stage hunk" })
        keymap.set("n", "<leader>hA", "<cmd> Gitsigns stage_buffer <CR>", { desc = "Stage buffer" })
        keymap.set("n", "<leader>hu", "<cmd> Gitsigns undo_stage_hunk <CR>", { desc = "Undo stage hunk" })
        keymap.set("n", "<leader>hr", "<cmd> Gitsigns reset_hunk <CR>", { desc = "Reset hunk" })
        keymap.set("n", "<leader>hR", "<cmd> Gitsigns reset_buffer <CR>", { desc = "Reset buffer" })
        keymap.set("n", "<leader>hd", "<cmd> Gitsigns diffthis <CR>", { desc = "Show diff" })
        keymap.set("n", "<leader>hp", "<cmd> preview_hunk <CR>", { desc = "Preview the hunk at the cursor position" })
        keymap.set("v", "<leader>ha", "<cmd> Gitsigns stage_hunk <CR>", { desc = "Stage hunk" })
        keymap.set("v", "<leader>hr", "<cmd> Gitsigns reset_hunk <CR>", { desc = "Reset hunk" })
      end,
    }
  end,
}
