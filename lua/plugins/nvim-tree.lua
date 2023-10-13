return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local keymap = vim.keymap

    local colors = require("theme.utils").get_theme_tb "base_30"

    require("theme.utils").load_highlight {
      NvimTreeIndentMarker = { fg = colors.one_bg2 },

      NvimTreeFolderDirty = { fg = colors.red },
      NvimTreeFileDirty = { fg = colors.red },
      NvimTreeGitDirty = { fg = colors.red },

      NvimTreeFolderStaged = { fg = colors.green },
      NvimTreeFileStaged = { fg = colors.green },
      NvimTreeGitStaged = { fg = colors.green },

      NvimTreeFolderRenamed = { fg = colors.blue },
      NvimTreeFileRenamed = { fg = colors.blue },
      NvimTreeGitRenamed = { fg = colors.blue },

      NvimTreeFolderNew = { fg = colors.blue },
      NvimTreeFileNew = { fg = colors.blue },
      NvimTreeGitNew = { fg = colors.blue },

      NvimTreeFolderDeleted = { fg = colors.blue },
      NvimTreeFileDeleted = { fg = colors.blue },
      NvimTreeGitDeleted = { fg = colors.blue },

      NvimTreeFolderIgnored = { fg = colors.grey },
      NvimTreeFileIgnored = { fg = colors.grey },
      NvimTreeGitIgnored = { fg = colors.grey },
    }

    -- Recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- configure nvim-tree
    require("nvim-tree").setup {
      view = {
        width = 35,
        number = false,
        relativenumber = false,
        cursorline = false,
        signcolumn = "yes",
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "single",
            width = 35,
            height = 50,
            row = 0,
            col = 0,
          },
        },
      },
      -- Change folder arrow icons
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        highlight_diagnostics = false,
        indent_markers = {
          enable = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "󰆤",
            modified = "●",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "󰉖",
              open = "󰷏",
              empty = "󰉖",
              empty_open = "󰷏",
              symlink = "󱧯",
              symlink_open = "󱧯",
            },
            git = {
              unstaged = "",
              staged = "󰄴",
              unmerged = "󰗖",
              renamed = "󱖔",
              untracked = "",
              deleted = "󰅚",
              ignored = "󱥸",
            },
          },
        },
      },
      -- Disable window_picker for xplorer to work well with window splits.
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
        file_popup = {
          open_win_config = {
            col = 1,
            row = 1,
            relative = "cursor",
            border = "single",
            style = "minimal",
          },
        },
      },
      filters = {
        dotfiles = true,
      },
      git = {
        ignore = false,
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)
        -- custom mappings
        keymap.set("n", "<C-h>", api.node.open.vertical, opts "Open in vertial split")
        keymap.set("n", "<C-h>", api.node.open.horizontal, opts "Open in horizontal split")
      end,
    }

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
