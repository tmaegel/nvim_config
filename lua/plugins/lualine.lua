-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = false,
      theme = "onedark",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
          padding = { left = 1, right = 1 },
        },
      },
      lualine_b = {
        {
          "tabs",
          padding = { left = 1, right = 1 },
          tabs_color = {
            active = "LualineNormal", -- Color for active tab.
            inactive = "LualineInactive", -- Color for inactive tab.
          },
          show_modified_status = false,
        },
      },
      lualine_c = {
        -- {
        --   "buffers",
        --   show_filename_only = true, -- Shows shortened relative path when set to false.
        --   hide_filename_extension = false, -- Hide filename extension when set to true.
        --   show_modified_status = true, -- Shows indicator when the buffer is modified.
        --   mode = 0, -- 0: Shows buffer name
        --   max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
        --   filetype_names = {
        --     TelescopePrompt = "Telescope",
        --     dashboard = "Dashboard",
        --     packer = "Packer",
        --     fzf = "FZF",
        --     alpha = "Alpha",
        --   },
        --   buffers_color = {
        --     active = "LuaLineBufferActive",
        --     inactive = "LuaLineBufferInactive",
        --   },
        --   symbols = {
        --     modified = " 󰜄",
        --     alternate_file = "",
        --     directory = "󱓻",
        --   },
        -- },
      },
      lualine_x = {
        {
          "encoding",
          padding = { left = 0, right = 1 },
        },
        {
          "fileformat",
          padding = { left = 0, right = 1 },
        },
        {
          "filetype",
          padding = { left = 0, right = 1 },
        },
        {
          "diff",
          padding = { left = 0, right = 1 },
          colored = true,
          diff_color = {
            added = "LuaLineDiffAdd",
            modified = "LuaLineDiffChange",
            removed = "LuaLineDiffDelete",
          },
        },
      },
      lualine_y = {
        {
          "branch",
          padding = { left = 1, right = 1 },
        },
      },
      lualine_z = {
        {
          "progress",
          padding = { left = 1, right = 1 },
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
