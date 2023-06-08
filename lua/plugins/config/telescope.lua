local telescope = require "telescope"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local transform_mod = require("telescope.actions.mt").transform_mod

require("core.utils").load_mappings "telescope"
require("theme").load_highlight "telescope"

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
        ["<C-Up>"] = actions.preview_scrolling_up,
        ["<C-Down>"] = actions.preview_scrolling_down,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<A-h>"] = stopinsert(custom_actions.multi_selection_open_horizontal),
        ["<A-v>"] = stopinsert(custom_actions.multi_selection_open_vertical),
        ["<A-t>"] = stopinsert(custom_actions.multi_selection_open_tab),
        ["<CR>"] = stopinsert(custom_actions.multi_selection_open),
      },
      n = {
        ["q"] = require("telescope.actions").close,
        ["<C-Up>"] = actions.preview_scrolling_up,
        ["<C-Down>"] = actions.preview_scrolling_down,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<A-h>"] = custom_actions.multi_selection_open_horizontal,
        ["<A-v>"] = custom_actions.multi_selection_open_vertical,
        ["<A-t>"] = custom_actions.multi_selection_open_tab,
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
    ["ui-select"] = {
      previewer = false,
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
        width = 0.50,
        height = 0.50,
      },
    },
  },
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension "dir"
require("telescope").load_extension "luasnip"
require("telescope").load_extension "ui-select"
