-- https://github.com/ghillb/cybu.nvim
return {
  "ghillb/cybu.nvim",
  branch = "main", -- timely updates
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  }, -- optional for icon support
  config = function()
    local colors = require("theme.utils").get_theme_tb "base_30"

    require("theme.utils").load_highlight {
      -- current / selected buffer
      CybuFocus = {
        bg = colors.blue,
        fg = colors.black,
      },
      -- buffers not in focus
      CybuAdjacent = {
        fg = colors.white,
        bg = colors.black,
      },
      -- window background
      CybuBackground = {
        fg = colors.red,
        bg = colors.red,
      },
      -- border of the window
      CybuBorder = {
        fg = colors.grey,
        bg = colors.black,
      },
    }

    require("cybu").setup {
      position = {
        relative_to = "win", -- win, editor, cursor
        anchor = "center", -- topleft, topcenter, topright,
        -- centerleft, center, centerright,
        -- bottomleft, bottomcenter, bottomright
        vertical_offset = 0, -- vertical offset from anchor in lines
        horizontal_offset = 0, -- vertical offset from anchor in columns
        max_win_height = 5, -- height of cybu window in lines
        max_win_width = 0.5, -- integer for absolute in columns
        -- float for relative to win/editor width
      },
      style = {
        path = "relative", -- absolute, relative, tail (filename only)
        path_abbreviation = "none", -- none, shortened
        border = "single", -- single, double, rounded, none
        separator = " ", -- string used as separator
        prefix = "…", -- string used as prefix for truncated paths
        padding = 5, -- left & right padding in number of spaces
        hide_buffer_id = true, -- hide buffer IDs in window
        devicons = {
          enabled = true, -- enable or disable web dev icons
          colored = true, -- enable color for web dev icons
          truncate = true, -- truncate wide icons to one char width
        },
        infobar = {
          enabled = false,
        },
        highlights = { -- see highlights via :highlight
          current_buffer = "CybuFocus", -- current / selected buffer
          adjacent_buffers = "CybuAdjacent", -- buffers not in focus
          background = "CybuBackground", -- window background
          border = "CybuBorder", -- border of the window
          infobar = "CybuInfobar",
        },
      },
      behavior = { -- set behavior for different modes
        mode = {
          default = {
            switch = "on_close", -- immediate, on_close
            view = "paging", -- paging, rolling
          },
          last_used = {
            switch = "on_close", -- immediate, on_close
            view = "paging", -- paging, rolling
          },
          auto = {
            view = "rolling", -- paging, rolling
          },
        },
        show_on_autocmd = false, -- event to trigger cybu (eg. "BufEnter")
      },
      display_time = 1000, -- time the cybu window is displayed
      exclude = { -- filetypes, cybu will not be active
        "neo-tree",
        "fugitive",
        "qf",
      },
      -- arbitrary fallback function
      -- used in excluded filetypes
      fallback = function() end,
    }
    local keymap = vim.keymap
    keymap.set("n", "<Tab>", "<Plug>(CybuNext)", { desc = "Cycle previous buffer" })
    keymap.set("n", "<S-Tab>", "<Plug>(CybuPrev)", { desc = "Cycle next buffer" })
    -- keymap.set("n", "<Tab>", "<Plug>(CybuLastusedNext)", { desc = "Cycle last next buffer" })
    -- keymap.set("n", "<S-Tab>", "<Plug>(CybuLastusedPrev)", { desc = "Cycle previous last buffer" })
  end,
}
