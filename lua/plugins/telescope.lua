local select_one_or_multi = function(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require("telescope.actions").close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format("%s %s", "edit", j.path))
      end
    end
  else
    require("telescope.actions").select_default(prompt_bufnr)
  end
end

-- https://github.com/nvim-telescope/telescope.nvim
return {
  {
    "benfowler/telescope-luasnip.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "princejoogie/dir-telescope.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "folke/trouble.nvim",
      "princejoogie/dir-telescope.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "benfowler/telescope-luasnip.nvim",
    },
    config = function()
      local actions = require "telescope.actions"
      local open_with_trouble = require("trouble.sources.telescope").open

      local colors = require("theme.utils").get_theme_tb "base_30"

      require("theme.utils").load_highlight {
        TelescopeBorder = {
          fg = colors.darker_black,
          bg = colors.darker_black,
        },
        TelescopePromptBorder = {
          fg = colors.black2,
          bg = colors.black2,
        },
        TelescopePromptNormal = {
          fg = colors.white,
          bg = colors.black2,
        },
        TelescopePromptPrefix = {
          fg = colors.red,
          bg = colors.black2,
        },
        TelescopeNormal = {
          bg = colors.darker_black,
        },
        TelescopePreviewTitle = {
          fg = colors.black,
          bg = colors.green,
        },
        TelescopePromptTitle = {
          fg = colors.black,
          bg = colors.red,
        },
        TelescopeResultsTitle = {
          fg = colors.darker_black,
          bg = colors.darker_black,
        },
        TelescopeSelection = {
          bg = colors.black2,
          fg = colors.white,
        },
        TelescopeResultsDiffAdd = {
          fg = colors.green,
        },
        TelescopeResultsDiffChange = {
          fg = colors.yellow,
        },
        TelescopeResultsDiffDelete = {
          fg = colors.red,
        },
      }

      require("telescope").setup {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          -- The character(s) that will be shown in front of Telescope's prompt.
          prompt_prefix = "   ",
          -- The character(s) that will be shown in front of the current selection.
          selection_caret = "  ",
          -- Prefix in front of each result entry. Current selection not included.
          entry_prefix = "   ",
          -- Symbol to add in front of a multi-selected result entry.
          multi_icon = " + ",
          initial_mode = "insert",
          -- Determines how the cursor acts after each sort iteration.
          selection_strategy = "reset",
          -- Determines the direction "better" results are sorted towards.
          sorting_strategy = "ascending",
          -- Determines the default layout of Telescope pickers.
          layout_strategy = "horizontal",
          layout_config = {
            bottom_pane = {
              height = 25,
              prompt_position = "top",
              preview_cutoff = 120,
            },
            center = {
              height = 0.4,
              width = 0.5,
              prompt_position = "top",
              preview_cutoff = 40,
            },
            cursor = {
              height = 0.9,
              width = 0.8,
              preview_cutoff = 40,
            },
            vertical = {
              height = 0.75,
              width = 0.75,
              prompt_position = "bottom",
              preview_height = 0.4,
              results_height = 0.4,
              preview_cutoff = 40,
            },
            horizontal = {
              height = 0.9,
              width = 0.8,
              prompt_position = "top",
              preview_width = 0.5,
              results_width = 0.5,
              preview_cutoff = 120,
            },
            width = 0.90,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules", "venv" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          dynamic_preview_title = true,
          results_title = "Preview",
          winblend = 0,
          border = true,
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            i = {
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
              ["<S-Up>"] = actions.results_scrolling_up,
              ["<S-Down>"] = actions.results_scrolling_down,
              ["<C-h>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<C-q>"] = open_with_trouble, -- Open search / selected in troubles quickfix list
              ["<CR>"] = select_one_or_multi,
            },
            n = {
              ["q"] = require("telescope.actions").close,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
              ["<S-Up>"] = actions.results_scrolling_up,
              ["<S-Down>"] = actions.results_scrolling_down,
              ["<C-h>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<C-q>"] = open_with_trouble, -- Open search / selected in troubles quickfix list
              ["<CR>"] = select_one_or_multi,
            },
          },
        },
        pickers = {
          buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            previewer = false,
            mappings = {
              i = {
                ["<c-d>"] = "delete_buffer",
              },
              n = {
                ["<c-d>"] = "delete_buffer",
              },
            },
          },
          find_files = {
            mappings = {
              i = {},
              n = {},
            },
          },
          live_grep = {
            mappings = {
              i = {},
              n = {},
            },
          },
        },
        extensions = {
          file_browser = {
            previewer = true,
            layout_strategy = "horizontal",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {},
              ["n"] = {},
            },
          },
          luasnip = {
            -- Has no effect, pass it on command level
            layout_strategy = "vertical",
          },
        },
      }

      require("telescope").load_extension "file_browser"
      require("telescope").load_extension "dir"
      require("telescope").load_extension "luasnip"

      local keymap = vim.keymap
      keymap.set("n", "?", "<cmd> Telescope grep_string <CR>", { desc = "Grep string under the cursor" })
      keymap.set(
        "n",
        "<leader>fr",
        "<cmd> lua require('telescope.builtin').resume() <CR>",
        { desc = "Telescope resume" }
      )
      keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Telescope find files" })
      keymap.set(
        "n",
        "<leader>fF",
        "<cmd> Telescope dir find_files <CR>",
        { desc = "Telescope find files in selected directory" }
      )
      keymap.set(
        "n",
        "<leader>fa",
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
        { desc = "Telescope find all" }
      )
      keymap.set("n", "<leader>F", function()
        vim.cmd("Telescope find_files default_text=" .. vim.fn.expand "<cword>")
      end, { desc = "Telescope find file under cursor" })

      keymap.set("n", "<leader>fg", "<cmd> Telescope live_grep <CR>", { desc = "Telescope live grep" })
      keymap.set(
        "n",
        "<leader>fG",
        "<cmd> Telescope dir live_grep <CR>",
        { desc = "Telescope live grep in selected directory" }
      )
      keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Telescope find oldfiles" })
      keymap.set(
        "n",
        "<leader>fb",
        "<cmd> Telescope buffers sort_lastused=false <CR>",
        { desc = "Telescope show buffers" }
      )
      keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Telescope find help pages" })
      keymap.set("n", "<leader>fk", "<cmd> Telescope keymaps <CR>", { desc = "Telescope find keys" })
      keymap.set(
        "n",
        "<leader>fs",
        "<cmd> Telescope search_history <CR>",
        { desc = "Telescope find searches that were executed recently" }
      )
      keymap.set(
        "n",
        "<leader>fc",
        "<cmd> Telescope command_history <CR>",
        { desc = "Telescope find commands that were executed recently" }
      )
      keymap.set("n", "<leader>fd", "<cmd> Telescope file_browser <CR>", { desc = "Telescope file browser" })
      keymap.set(
        "n",
        "<leader>fx",
        "<cmd> Telescope luasnip layout_strategy=vertical <CR>",
        { desc = "Telescope find snippets" }
      )
      keymap.set("n", "<leader>fp", "<cmd> Telescope builtin <CR>", { desc = "Telescope find builtin pickers" })
      -- Git
      keymap.set("n", "<leader>gs", "<cmd> Telescope git_status <CR>", { desc = "Git status" })
      keymap.set("n", "<leader>gc", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })
      keymap.set("n", "<leader>gb", "<cmd> Telescope git_branches <CR>", { desc = "Git branches" })
      -- LSP
      keymap.set(
        "n",
        "gd",
        "<cmd> Telescope lsp_definitions <CR>",
        { desc = "Telescope goto the LSP definition (word under cursor)" }
      )
      keymap.set(
        "n",
        "gD",
        "<cmd> Telescope lsp_type_definitions <CR>",
        { desc = "Telescope goto the LSP definition (word under cursor)" }
      )
      keymap.set(
        "n",
        "gr",
        "<cmd> Telescope lsp_references <CR>",
        { desc = "Telescope lists LSP references (word under cursor)" }
      )
      keymap.set(
        "n",
        "gi",
        "<cmd> Telescope lsp_implementations <CR>",
        { desc = "Telescope list the LSP implementation (word under cursor)" }
      )
      keymap.set(
        "n",
        "gs",
        "<cmd> Telescope lsp_document_symbols <CR>",
        { desc = "Telescope lists LSP document symbols of the current buffer" }
      )
      keymap.set(
        "n",
        "<leader>ic",
        "<cmd> Telescope lsp_incoming_calls <CR>",
        { desc = "Telescope lists LSP incoming calls (word under cursor)" }
      )
      keymap.set(
        "n",
        "<leader>oc",
        "<cmd> Telescope lsp_outgoing_calls <CR>",
        { desc = "Telescope lists LSP outgoing calls (word under cursor)" }
      )
    end,
  },
}
