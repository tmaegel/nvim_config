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
        {
          "filename",
          padding = { left = 1, right = 1 },
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory
          path = 1,
          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        },
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
