-- lua/core/mappings

local M = {}

-- Prevent dd override you last yank if its an empty string/line.
local function smart_dd()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return '"_dd'
  else
    return "dd"
  end
end

vim.keymap.set("n", "dd", smart_dd, { noremap = true, silent = true, expr = true })

-- Move lines/blocks
vim.keymap.set("n", "+", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "-", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "+", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "-", ":m '<-2<cr>gv=gv", { desc = "Move up" })

M.general = {
  n = {
    -- Switch between windows and tmux panes
    ["<A-Left>"] = { "<cmd> TmuxNavigateLeft <CR>", "Focus split left" },
    ["<A-Right>"] = { "<cmd> TmuxNavigateRight <CR>", "Focus split right" },
    ["<A-Down>"] = { "<cmd> TmuxNavigateDown <CR>", "Focus spit down" },
    ["<A-Up>"] = { "<cmd> TmuxNavigateUp <CR>", "Focus split up" },
    ["<A-BS>"] = { "<cmd> b# <CR>", "Alternate between two buffers" },
    -- ["<A-BS>"] = { "<A-p>", "<cmd> TmuxNavigatePrevious <CR>", "Focus previews split" },
    ["<A-f>"] = {
      "<cmd> FocusMaximise <CR>",
      "Temporarily maximises the focussed window",
    },
    ["<A-g>"] = {
      "<cmd> FocusSplitNicely <CR>",
      "Split a window based on the golden ratio rule",
    },
    ["<leader>l"] = { "<cmd> FocusSplitLeft <CR>", "Move to existing or create a new split to the left" },
    ["<leader>r"] = { "<cmd> FocusSplitRight <CR>", "Move to existing or create a new split to the right" },
    ["<leader>d"] = { "<cmd> FocusSplitDown <CR>", "Move to existing or create a new split below" },
    ["<leader>u"] = { "<cmd> FocusSplitUp <CR>", "Move to existing or create a new split above" },

    -- Swtich between tabpages
    ["<leader>p"] = { "<cmd> tabprevious <CR>", "Tab left" },
    ["<leader>n"] = { "<cmd> tabnext <CR>", "Tab right" },

    -- Keep the cursor position while forward-searching a word.
    -- Reference: https://github.com/NvChad/NvChad/issues/1224
    -- TODO: map # key as well and activate backward search
    -- TODO: Set mapping via laod_mappings. Does not work yet.
    ["*"] = {
      function()
        vim.fn.setreg("/", "\\<" .. vim.fn.expand "<cword>" .. "\\>")
        vim.opt.hlsearch = true
      end,
      "Constant cursor position in hlsearch",
      opts = { silent = true, noremap = true },
    },

    -- Remap: Insert new line without enter insert mode
    ["o"] = { "o<ESC>", "Insert new line after (without enter insert mode)" },
    ["O"] = { "O<ESC>", "Insert new line above (without enter insert mode)" },

    ["U"] = { "<cmd> redo<CR>", "Redo" },

    ["<leader>a"] = { "ggVG", "Select all text in curent buffer" },
    -- ["<leader>e"] = { "%", "Go to matching pair" },
    -- ["<leader>f"] = { "^", "Go to first character in line" },
    -- ["<leader>l"] = { "g_", "Go to last character in line" },

    -- buffer
    -- ["<TAB>"] = { "<cmd> bnext <CR>", "Cycle next buffer" },
    -- ["<S-Tab>"] = { "<cmd> bprevious <CR>", "Cycle prev buffer" },
    ["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>bh"] = { "<cmd> sp <CR>", "Horizontal split window" },
    ["<leader>bv"] = { "<cmd> vsp <CR>", "Vertical split window" },
    -- close buffer + hide terminal buffer
    ["<leader>bq"] = { "<cmd> Bdelete <CR>", "Close buffer" },
    ["<leader>bd"] = { "<cmd> Bdelete <CR>", "Close buffer" },
    --
    -- tabs
    ["<leader>tn"] = { "<cmd> tabnew <CR>", "New tab" },
    ["<leader>tq"] = { "<cmd> tabclose <CR>", "Close tab" },
    ["<leader>td"] = { "<cmd> windo bd <CR>", "Close tab and its buffers" },
    ["<leader>tc"] = { "<cmd> windo bd <CR>", "Close tab and its buffers (alt. mapping)" },
    ["<leader>tm"] = { "<cmd> +tabmove <CR>", "Move tab to the right" },
    ["<leader>tM"] = { "<cmd> -tabmove <CR>", "Move tab to the left" },

    -- Diff and merge
    ["<leader>gl"] = { "<cmd> diffget LOCAL <CR>", "Apply local changes" },
    ["<leader>gr"] = { "<cmd> diffget REMOTE <CR>", "Apply remote changes" },

    ["<ESC>"] = { "<cmd> noh <CR>", "No highlight" },

    -- Save
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
  },
  x = {
    ["<leader>e"] = { "%", "Go to matching pair" },
  },
}

M.cybu = {
  n = {
    -- Switch between windows
    ["<Tab>"] = { "<Plug>(CybuNext)", "Cycle previous buffer" },
    ["<S-Tab>"] = { "<Plug>(CybuPrev)", "Cycle next buffer" },
    -- ["<Tab>"] = { "<Plug>(CybuLastusedNext)", "Cycle last next buffer" },
    -- ["<S-Tab>"] = { "<Plug>(CybuLastusedPrev)", "Cycle previous last buffer" },
  },
}

M.lspconfig = {
  n = {
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature_help",
    },
    ["<leader>ca"] = { "<CMD> CodeActionMenu <CR>", "LSP code_action" },
    ["<leader>dN"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "Goto prev",
    },
    ["<leader>dn"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "Goto_next",
    },
    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },
    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },
    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}

M.telescope = {
  n = {
    ["?"] = { "<cmd> Telescope grep_string <CR>", "Grep string under the cursor" },
    ["<leader>fr"] = { "<cmd> lua require('telescope.builtin').resume() <CR>", "Resume telescope" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fF"] = { "<cmd> Telescope dir find_files <CR>", "Find files in selected directory" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>F"] = {
      function()
        vim.cmd("Telescope find_files default_text=" .. vim.fn.expand "<cword>")
      end,
      "Find file under cursor",
    },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fG"] = { "<cmd> Telescope dir live_grep <CR>", "Live grep in selected directory" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fb"] = { "<cmd> Telescope buffers sort_lastused=false <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Show keys" },
    ["<leader>fs"] = { "<cmd> Telescope search_history <CR>", "Lists searches that were executed recently" },
    ["<leader>fc"] = { "<cmd> Telescope command_history <CR>", "Lists commands that were executed recently" },
    ["<leader>fd"] = { "<cmd> Telescope file_browser <CR>", "File browser" },
    ["<leader>fx"] = { "<cmd> Telescope luasnip layout_strategy=vertical <CR>", "Snippet browser" },
    ["<leader>fp"] = { "<cmd> Telescope builtin <CR>", "Builtin pickers" },
    -- Git
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },
    -- LSP
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "Goto the definition of the word under the cursor" },
    ["gD"] = {
      "<cmd> Telescope lsp_type_definitions <CR>",
      "Goto the definition of the type of the word under the cursor",
    },
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "Lists LSP references for word under the cursor" },
    ["gi"] = { "<cmd> Telescope lsp_implementations <CR>", "Goto/list the implementation of the word under the cursor" },
    ["gs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Lists LSP document symbols in the current buffer" },
    ["<leader>ic"] = { "<cmd> Telescope lsp_incoming_calls <CR>", "Lists LSP incoming calls for word under the cursor" },
    ["<leader>oc"] = { "<cmd> Telescope lsp_outgoing_calls <CR>", "Lists LSP outgoing calls for word under the cursor" },
  },
}

M.trouble = {
  n = {
    ["xx"] = { "<cmd> TroubleToggle <CR>", "Toggle trouble" },
    ["xw"] = { "<cmd> Trouble workspace_diagnostics <CR>", "Trouble workspace diagnostics" },
    ["xd"] = { "<cmd> Trouble document_diagnostics <CR>", "Trouble document diagnostics" },
    ["xl"] = { "<cmd> Trouble loclist <CR>", "Trouble location list" },
    ["xq"] = { "<cmd> Trouble quickfix <CR>", "Trouble quickfix list" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>G"] = { "<cmd> G <CR>", "Git status" },
    ["<leader>hn"] = { "<cmd> Gitsigns next_hunk <CR>", "Go to next hunk" },
    ["<leader>hN"] = { "<cmd> Gitsigns prev_hunk <CR>", "Go to prev hunk" },
    ["<leader>ha"] = { "<cmd> Gitsigns stage_hunk <CR>", "Stage hunk" },
    ["<leader>hA"] = { "<cmd> Gitsigns stage_buffer <CR>", "Stage buffer" },
    ["<leader>hu"] = { "<cmd> Gitsigns undo_stage_hunk <CR>", "Undo stage hunk" },
    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>", "Reset hunk" },
    ["<leader>hR"] = { "<cmd> Gitsigns reset_buffer <CR>", "Reset buffer" },
    ["<leader>hd"] = { "<cmd> Gitsigns diffthis <CR>", "Show diff" },
    ["<leader>hp"] = { "<cmd> Gitsigns preview_hunk <CR>", "Preview the hunk at the cursor position" },
  },
  v = {
    ["<leader>ha"] = { "<cmd> Gitsigns stage_hunk <CR>", "Stage hunk" },
    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>", "Reset hunk" },
  },
}

M.blankline = {
  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )
        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,
      "Jump to current_context",
    },
  },
}

M.whichkey = {
  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Whichkey all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Whichkey query lookup",
    },
  },
}

M.mini_sessions = {
  n = {
    ["<leader>r"] = { "<cmd> lua MiniSessions.read('Session.vim') <CR>", "Restore session" },
  },
}

return M
