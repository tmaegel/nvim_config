local telescope = require "telescope"

require("theme").load_highlight "telescope"

-- This action will launch telescope-file-browser in folder mode,
-- and then launch live_grep within the selected directory.
local ts_select_dir_for_grep = function(prompt_bufnr)
  local action_state = require "telescope.actions.state"
  local fb = require("telescope").extensions.file_browser
  local live_grep = require("telescope.builtin").live_grep
  local current_line = action_state.get_current_line()

  fb.file_browser {
    files = false,
    depth = false,
    attach_mappings = function(prompt_bufnr)
      require("telescope.actions").select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        live_grep {
          results_title = relative .. "/",
          cwd = absolute,
          default_text = current_line,
        }
      end)

      return true
    end,
  }
end

-- This action will launch telescope-file-browser in folder mode,
-- and then launch find_files within the selected directory.
local ts_select_dir_for_find = function(prompt_bufnr)
  local action_state = require "telescope.actions.state"
  local fb = require("telescope").extensions.file_browser
  local find_files = require("telescope.builtin").find_files
  local current_line = action_state.get_current_line()

  fb.file_browser {
    files = false,
    depth = false,
    attach_mappings = function(prompt_bufnr)
      require("telescope.actions").select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        find_files {
          results_title = relative .. "/",
          cwd = absolute,
          default_text = current_line,
        }
      end)

      return true
    end,
  }
end

telescope.setup {
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
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
        results_width = 0.5,
      },
      vertical = {
        prompt_position = "top",
        width = 0.75,
        height = 0.5,
      },
      width = 0.90,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", "venv" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  pickers = {
    command_history = {
      layout_strategy = "vertical",
    },
    keymaps = {
      layout_strategy = "vertical",
    },
    find_files = {
      mappings = {
        i = {
          ["<C-f>"] = ts_select_dir_for_find,
        },
        n = {
          ["<C-f>"] = ts_select_dir_for_find,
        },
      },
    },
    live_grep = {
      mappings = {
        i = {
          ["<C-f>"] = ts_select_dir_for_grep,
        },
        n = {
          ["<C-f>"] = ts_select_dir_for_grep,
        },
      },
    },
  },
  extensions = {
    file_browser = {
      -- theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

require("telescope").load_extension "projects"
require("telescope").load_extension "file_browser"
