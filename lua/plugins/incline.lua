return {
  {
    "b0o/incline.nvim",
    -- tag = "v0.0.3",
    config = function()
      local colors = require("theme").get_theme_tb "base_30"

      require("theme").load_highlight {
        InclineNormal = {
          fg = colors.black,
          bg = colors.green,
        },
        InclineNormalNC = {
          fg = colors.light_grey,
          bg = colors.lightbg,
        },
      }

      require("incline").setup {
        debounce_threshold = {
          falling = 50,
          rising = 10,
        },
        hide = {
          cursorline = false,
          focused_win = false,
          only_win = false,
        },
        highlight = {
          groups = {
            InclineNormal = {
              default = true,
              group = "NormalFloat",
            },
            InclineNormalNC = {
              default = true,
              group = "NormalFloat",
            },
          },
        },
        ignore = {
          buftypes = "special",
          filetypes = {},
          floating_wins = true,
          unlisted_buffers = true,
          wintypes = "special",
        },
        render = "basic",
        window = {
          margin = {
            horizontal = 0,
            vertical = 1,
          },
          options = {
            signcolumn = "no",
            wrap = false,
          },
          padding = 1,
          padding_char = " ",
          placement = {
            horizontal = "right",
            vertical = "top",
          },
          width = "fit",
          winhighlight = {
            active = {
              EndOfBuffer = "None",
              Normal = "InclineNormal",
              Search = "None",
            },
            inactive = {
              EndOfBuffer = "None",
              Normal = "InclineNormalNC",
              Search = "None",
            },
          },
          zindex = 50,
        },
      }
    end,
  },
}
