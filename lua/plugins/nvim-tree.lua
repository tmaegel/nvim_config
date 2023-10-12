return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local keymap = vim.keymap

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
        signcolumn = "no",
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "single",
            width = 35,
            height = 30,
            row = 0,
            col = 0,
          },
        },
      },
      -- Change folder arrow icons
      renderer = {
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
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
