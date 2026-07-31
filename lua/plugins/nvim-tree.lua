-- https://github.com/nvim-tree/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvim_tree = require "nvim-tree"
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    nvim_tree.setup {
      sort = {
        sorter = "name",
        folders_first = true,
        files_first = false,
      },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      view = {
        width = 35,
        signcolumn = "no",
        preserve_window_proportions = true,
      },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_width = 2,
        indent_markers = { enable = false },
        icons = {
          git_placement = "after",
          modified_placement = "after",
          hidden_placement = "after",
          diagnostics_placement = "after",
          bookmarks_placement = "after",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
            modified = true,
            hidden = false,
            diagnostics = false,
            bookmarks = false,
          },
          glyphs = {
            default = "󱓻",
            symlink = "󱓻",
            bookmark = "",
            modified = "󰜄",
            hidden = "󱙝",
            folder = {
              default = "󱓻",
              open = "󱓼",
              empty = "󱓼",
              empty_open = "󱓼",
              symlink = "󱨇",
              symlink_open = "󱨈",
            },
            git = {
              unstaged = "-",
              staged = "✓",
              unmerged = "󰧾",
              untracked = "",
              renamed = "➜",
              deleted = "×",
              ignored = " ",
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = true,
        },
      },
      git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      filters = {
        git_ignored = false,
        dotfiles = false,
      },
      on_attach = function(bufnr)
        -- default mappings
        api.map.on_attach.default(bufnr)

        -- Custom mappings
        -- Keymaps that you are setting here are only to be active within nvim-tree buffer.
      end,
    }

    -- Global mappings
    vim.keymap.set("n", "<C-b>", api.tree.toggle, opts "Toggle")

    -- Hide the cursor in nvim-tree buffer
    vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
      callback = function(data)
        local hl = vim.api.nvim_get_hl(0, { name = "Cursor", link = false })
        if api.tree.is_tree_buf(data.buf) then
          vim.api.nvim_set_hl(0, "Cursor", { blend = 100, fg = hl.fg, bg = hl.bg })
          vim.opt_local.guicursor:append "a:Cursor/lCursor"
        else
          vim.api.nvim_set_hl(0, "Cursor", { blend = 0, fg = hl.fg, bg = hl.bg })
          vim.opt_local.guicursor:remove "a:Cursor/lCursor"
        end
      end,
    })
  end,
}
