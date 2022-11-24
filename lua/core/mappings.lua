local M = {}

M.general = {
  n = {
    -- switch between windows
    ["<A-Left>"] = { "<C-w>h", "Window left" },
    ["<A-Right>"] = { "<C-w>l", "Window right" },
    ["<A-Down>"] = { "<C-w>j", "Window down" },
    ["<A-Up>"] = { "<C-w>k", "Window up" },

    -- swtich between tabpages
    ["<leader><Left>"] = { "<cmd> tabprevious <CR>", "Tab left" },
    ["<leader><Right>"] = { "<cmd> tabnext <CR>", "Tab right" },

    -- Remap: Insert new line without enter insert mode
    ["o"] = { "o<ESC>", "Insert new line after (without enter insert mode)" },
    ["O"] = { "O<ESC>", "Insert new line above (without enter insert mode)" },

    ["U"] = { "<cmd> redo<CR>", "Redo" },

    ["<leader>a"] = { "ggVG", "Select all text in curent buffer" },
    ["<leader>e"] = { "%", "Go to matching pair" },
    ["<leader>f"] = { "^", "Go to first character in line" },
    ["<leader>l"] = { "g_", "Go to last character in line" },

    -- buffer
    ["<TAB>"] = { "<cmd> bnext <CR>", "Cycle next buffer" },
    ["<S-Tab>"] = { "<cmd> bprevious <CR>", "Cycle prev buffer" },
    ["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>bh"] = { "<cmd> sp <CR>", "Split window" },
    ["<leader>bv"] = { "<cmd> vsp <CR>", "Vertical split window" },
    -- close buffer + hide terminal buffer
    ["<leader>bq"] = { "<cmd> Bdelete <CR>", "Close buffer" },
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

    -- Pydocstring
    -- ["<leader>ds"] = { "<cmd> Pydocstring <CR>", "Add Pydocstring template" },

    ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

    -- Save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },
  },
  x = {
    ["<leader>e"] = { "%", "Go to matching pair" },
  },
}

M.lspconfig = {
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },
    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },
    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },
    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },
    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },
    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },
    ["<leader>df"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["<leader>dN"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },
    ["<leader>dn"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },
    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },
    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },
    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
    },
  },
}

M.telescope = {
  n = {
    ["?"] = { "<cmd> Telescope grep_string <CR>", "grep string under the cursor" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>F"] = {
      function()
        vim.cmd("Telescope find_files default_text=" .. vim.fn.expand "<cword>")
      end,
      "find file under cursor",
    },
    ["<leader>fF"] = {
      function()
        local buffer_dir = require("telescope.utils").buffer_dir()
        vim.cmd("Telescope find_files prompt_title=find_files_in_buffer_dir cwd=" .. buffer_dir)
      end,
      "find file in directory of current buffer",
    },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fG"] = {
      function()
        local buffer_dir = require("telescope.utils").buffer_dir()
        vim.cmd("Telescope live_grep prompt_title=live_grep_in_buffer_dir cwd=" .. buffer_dir)
      end,
      "find file in directory of current buffer",
    },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
    ["<leader>fs"] = { "<cmd> Telescope search_history <CR>", "lists searches that were executed recently" },
    ["<leader>fc"] = { "<cmd> Telescope command_history <CR>", "lists commands that were executed recently" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "git branches" },
    ["<leader>fd"] = { "<cmd> Telescope file_browser <CR>", "file browser" },
  },
}

M.trouble = {
  n = {
    ["xx"] = { "<cmd> TroubleToggle <CR>", "Toggle trouble" },
    ["xw"] = { "<cmd> Trouble workspace_diagnostics <CR>", "Trouble workspace diagnostics" },
    ["xd"] = { "<cmd> Trouble document_diagnostics <CR>", "Trouble document diagnostics" },
    ["xl"] = { "<cmd> Trouble loclist <CR>", "Trouble location list" },
    ["xq"] = { "<cmd> Trouble quickfix <CR>", "Trouble quickfix list" },
    ["gr"] = { "<cmd> Trouble lsp_references <CR>", "Trouble lsp references" },
    ["gR"] = { "<cmd> Trouble lsp_references <CR>", "Trouble lsp references" },
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

return M
