return {
  "lukas-reineke/indent-blankline.nvim",
  -- Follow migration guide for version v3.x.x
  -- https://github.com/lukas-reineke/indent-blankline.nvim/wiki/Migrate-to-version-3
  tag = "v2.20.8",
  config = function()
    local colors = require("theme.utils").get_theme_tb "base_30"

    -- Change blankline context character
    vim.g.indent_blankline_context_char = "▎"

    require("theme.utils").load_highlight {
      IndentBlanklineChar = { fg = colors.line },
      IndentBlanklineSpaceChar = { fg = colors.line },
      IndentBlanklineContextChar = { fg = colors.one_bg2 },
      IndentBlanklineContextStart = { bg = colors.one_bg2 },
    }

    require("indent_blankline").setup {
      char = "▏",
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
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    }
    local keymap = vim.keymap
    keymap.set("n", "<leader>cc", function()
      local ok, start = require("indent_blankline.utils").get_current_context(
        vim.g.indent_blankline_context_patterns,
        vim.g.indent_blankline_use_treesitter_scope
      )
      if ok then
        vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
        vim.cmd [[normal! _]]
      end
    end, { desc = "Jump to current_context" })
  end,
}
