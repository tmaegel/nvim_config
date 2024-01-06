-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local colors = require("theme.utils").get_theme_tb "base_30"

    require("theme.utils").load_highlight {
      WhichKey = { fg = colors.blue },
      WhichKeySeparator = { fg = colors.light_grey },
      WhichKeyDesc = { fg = colors.red },
      WhichKeyGroup = { fg = colors.green },
      WhichKeyValue = { fg = colors.green },
      WhichKeyFloat = { bg = colors.black },
      WhichKeyBorder = { fg = colors.grey, bg = colors.black },
    }

    require("which-key").setup {
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "  ", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      window = {
        border = "single", -- none/single/double/shadow
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
        spacing = 6, -- spacing between columns
      },
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { "j", "k" },
        v = { "j", "k" },
      },
    }
    local keymap = vim.keymap
    keymap.set("n", "<leader>wk", function()
      vim.cmd "WhichKey"
    end, { desc = "Whichkey all keymaps" })
    keymap.set("n", "<leader>wK", function()
      local input = vim.fn.input "WhichKey: "
      vim.cmd("WhichKey " .. input)
    end, { desc = "Whichkey query lookup" })
  end,
}
