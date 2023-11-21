return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local colors = require("theme.utils").get_theme_tb "base_30"

    require("theme.utils").load_highlight {
      Indentation = { fg = colors.line },
      CurrentScope = { fg = colors.one_bg2 },
    }

    require("ibl").setup {
      indent = {
        char = "▏",
        highlight = "Indentation",
      },
      scope = {
        char = "▎",
        show_start = true,
        show_end = true,
        show_exact_scope = true,
        highlight = "CurrentScope",
      },
      exclude = {
        filetypes = {
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
      },
    }
  end,
}
