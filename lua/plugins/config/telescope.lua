local telescope = require "telescope"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local transform_mod = require("telescope.actions.mt").transform_mod
local lga_actions = require "telescope-live-grep-args.actions"

require("theme").load_highlight "telescope"

-- This action will launch telescope-file-browser in folder mode,
-- and then launch live_grep within the selected directory.
local ts_select_dir_for_grep = function(prompt_bufnr)
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
-- and then launch live_grep_args within the selected directory.
local ts_select_dir_for_grep_args = function(prompt_bufnr)
  local fb = require("telescope").extensions.file_browser
  local live_grep_args = require("telescope").extensions.live_grep_args.live_grep_args
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

        live_grep_args {
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

-- Open multiple files at once
local function multiopen(prompt_bufnr, method)
  local cmd_map = {
    vertical = "vsplit",
    horizontal = "split",
    tab = "tabe",
    default = "edit",
  }
  local picker = action_state.get_current_picker(prompt_bufnr)
  local multi_selection = picker:get_multi_selection()

  if #multi_selection > 1 then
    require("telescope.pickers").on_close_prompt(prompt_bufnr)
    pcall(vim.api.nvim_set_current_win, picker.original_win_id)

    for i, entry in ipairs(multi_selection) do
      -- opinionated use-case
      local cmd = i == 1 and "edit" or cmd_map[method]
      vim.cmd(string.format("%s %s", cmd, entry.value))
    end
  else
    actions["select_" .. method](prompt_bufnr)
  end
end

local custom_actions = transform_mod {
  multi_selection_open_vertical = function(prompt_bufnr)
    multiopen(prompt_bufnr, "vertical")
  end,
  multi_selection_open_horizontal = function(prompt_bufnr)
    multiopen(prompt_bufnr, "horizontal")
  end,
  multi_selection_open_tab = function(prompt_bufnr)
    multiopen(prompt_bufnr, "tab")
  end,
  multi_selection_open = function(prompt_bufnr)
    multiopen(prompt_bufnr, "default")
  end,
}

local function stopinsert(callback)
  return function(prompt_bufnr)
    vim.cmd.stopinsert()
    vim.schedule(function()
      callback(prompt_bufnr)
    end)
  end
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
        mirror = false,
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
      i = {
        ["q"] = require("telescope.actions").close,
        ["<C-v>"] = stopinsert(custom_actions.multi_selection_open_vertical),
        ["<C-s>"] = stopinsert(custom_actions.multi_selection_open_horizontal),
        ["<C-t>"] = stopinsert(custom_actions.multi_selection_open_tab),
        ["<CR>"] = stopinsert(custom_actions.multi_selection_open),
      },
      n = {
        ["q"] = require("telescope.actions").close,
        ["<C-v>"] = custom_actions.multi_selection_open_vertical,
        ["<C-s>"] = custom_actions.multi_selection_open_horizontal,
        ["<C-t>"] = custom_actions.multi_selection_open_tab,
        ["<CR>"] = custom_actions.multi_selection_open,
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
      previewer = false,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {},
        ["n"] = {},
      },
    },
    live_grep_args = {
      -- enable/disable auto-quoting
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
          ["<C-t>"] = lga_actions.quote_prompt { postfix = " --type " },
          ["<C-f>"] = ts_select_dir_for_grep_args,
        },
        n = {
          ["<C-f>"] = ts_select_dir_for_grep_args,
        },
      },
    },
  },
}

require("telescope").load_extension "live_grep_args"
require("telescope").load_extension "projects"
require("telescope").load_extension "file_browser"
