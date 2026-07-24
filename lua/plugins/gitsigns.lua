-- https://github.com/lewis6991/gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
      signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
      signs_staged_enable = true,
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 3000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      blame_formatter = nil, -- Use default
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
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "hn", function()
          if vim.wo.diff then
            vim.cmd.normal { "hn", bang = true }
          else
            gitsigns.nav_hunk "next"
          end
        end, { desc = "Git go to next hunk" })

        map("n", "hN", function()
          if vim.wo.diff then
            vim.cmd.normal { "hN", bang = true }
          else
            gitsigns.nav_hunk "prev"
          end
        end, { desc = "Git go to prev hunk" })

        -- Actions
        map("n", "ha", gitsigns.stage_hunk, { desc = "Git stage hunk" })
        map("n", "hA", gitsigns.stage_buffer, { desc = "Git stage buffer" })
        map("n", "hr", gitsigns.reset_hunk, { desc = "Git reset hunk" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Git reset buffer" })
        map("n", "hu", gitsigns.undo_stage_hunk, { desc = "Git undo stage hunk" })

        map("v", "ha", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end)
        map("v", "hr", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end)
        map("v", "hu", function()
          gitsigns.undo_stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end)

        map("n", "hp", gitsigns.preview_hunk, { desc = "Git preview hunk at the cursor position" })
        map("n", "hP", gitsigns.preview_hunk_inline, { desc = "Git preview the hunk at the cursor position (inline)" })

        map("n", "hb", function()
          gitsigns.blame_line { full = true }
        end, { desc = "Git blame line" })

        map("n", "hd", gitsigns.diffthis, { desc = "Git show diff" })
        map("n", "hD", function()
          gitsigns.diffthis "~"
        end, { desc = "Git show diff" })

        map("n", "hQ", function()
          gitsigns.setqflist "all"
        end, { desc = "Populate the quickfix list with all hunks" })
        map("n", "hq", gitsigns.setqflist, { desc = "Populate the quickfix list with hunks of the current file" })
      end,
    }
  end,
}
