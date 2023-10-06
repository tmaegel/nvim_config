local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local opts = {
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "single",
    title = " Lazy ", ---@type string only works when border is not "none"
    title_pos = "center", ---@type "center" | "left" | "right"
    -- Show pills on top of the Lazy window
    pills = true, ---@type boolean
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "󰒲",
      loaded = "󰄬",
      not_loaded = "󰅖",
      plugin = "",
      runtime = "",
      source = "",
      start = "",
      task = "✔",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
}

local plugins = {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- the plugin will allow you to navigate seamlessly between
  -- vim and tmux splits using a consistent set of hotkeys.
  { "christoomey/vim-tmux-navigator" },

  --
  -- Mason & lspconfig
  --
  {
    "williamboman/mason.nvim",
    config = function()
      require "plugins.config.mason"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason.nvim",
    },
    config = function()
      require "plugins.config.mason-lspconfig"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-lspconfig.nvim",
    },
    config = function()
      require "plugins.config.lspconfig"
    end,
  },

  --
  -- Mason & null-ls
  --
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lspconfig",
    },
    config = function()
      require "plugins.config.null-ls"
    end,
  },
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = {
      "mason.nvim",
      "null-ls.nvim",
    },
    config = function()
      require "plugins.config.mason-null-ls"
    end,
  },

  --
  -- Treesitter
  --
  {
    "nvim-treesitter/nvim-treesitter",
    -- Until https://github.com/nvim-treesitter/nvim-treesitter/issues/4945 is solved.
    commit = "33eb472b459f1d2bf49e16154726743ab3ca1c6d",
    config = function()
      require "plugins.config.treesitter"
    end,
  },

  --
  -- Autocompletion & snippets
  --
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "nvim-lspconfig",
    },
    config = function()
      require "plugins.config.cmp"
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
  { "saadparwaiz1/cmp_luasnip" }, -- Snippets source for nvim-cmp
  {
    "hrsh7th/cmp-buffer",
    dependencies = {
      "cmp-nvim-lsp",
    },
  },
  {
    "hrsh7th/cmp-nvim-lua",
    dependencies = {
      "cmp_luasnip",
    },
  },
  {
    "hrsh7th/cmp-path",
    dependencies = {
      "cmp-buffer",
    },
  },
  {
    "hrsh7th/cmp-cmdline",
    dependencies = {
      "cmp-buffer",
    },
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    dependencies = {
      "cmp-nvim-lsp",
    },
  },
  -- Snippets plugin
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/snippets" } }
      require("luasnip").filetype_extend("python", { "django", "django-rest" })
      require("luasnip").filetype_extend("dart", { "flutter" })
    end,
  },

  --
  -- Git
  --
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.config.gitsigns"
    end,
  },

  --
  -- Telescope
  --
  {
    "benfowler/telescope-luasnip.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "princejoogie/dir-telescope.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "folke/trouble.nvim",
      "princejoogie/dir-telescope.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "benfowler/telescope-luasnip.nvim",
    },
    config = function()
      require "plugins.config.telescope"
    end,
  },

  -- A pretty diagnostics, references, telescope results,
  -- quickfix and location list.
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "plugins.config.trouble"
    end,
  },

  --
  -- Buffer related
  --
  {
    "b0o/incline.nvim",
    -- tag = "v0.0.3",
    config = function()
      require "plugins.config.incline"
    end,
  },
  {
    "ghillb/cybu.nvim",
    branch = "main", -- timely updates
    -- branch = "v1.x", -- won't receive breaking changes
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    }, -- optional for icon support
    config = function()
      require "plugins.config.cybu"
    end,
  },
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete" },
  },
  -- Auto-Focusing and Auto-Resizing splits / windows.
  {
    "beauwilliams/focus.nvim",
    commit = "a994282f957840ee3419ad62a36be9d4e155560c",
    config = function()
      require "plugins.config.focus"
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    -- Follow migration guide for version v3.x.x
    -- https://github.com/lukas-reineke/indent-blankline.nvim/wiki/Migrate-to-version-3
    tag = "v2.20.8",
    config = function()
      require "plugins.config.indent-blankline"
    end,
  },

  -- Neovim colorizer
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "plugins.config.nvim-colorizer"
    end,
  },

  {
    "windwp/nvim-autopairs",
    dependencies = {
      "nvim-cmp",
    }, -- optional for icon support
    config = function()
      require "plugins.config.autopairs"
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    config = function()
      require("Comment").setup()
    end,
  },

  -- Old text                    Command         New text
  -- --------------------------------------------------------------------------------
  -- surround_words             ysiw)           (surround_words)
  -- [delete around me!]        ds]             delete around me!
  -- remove <b>HTML tags</b>    dst             remove HTML tags
  -- 'change quotes'            cs'"            "change quotes"
  -- delete(function calls)     dsf             function calls
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require "plugins.config.surround"
    end,
  },

  -- Only load whichkey after all the gui
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.config.whichkey"
    end,
  },

  -- Session management (read, write, delete).
  {
    "echasnovski/mini.sessions",
    branch = "stable",
    keys = {
      {
        "<leader>r",
        "<cmd> lua MiniSessions.read('Session.vim') <CR>",
        desc = "Restore session",
      },
    },
    config = function()
      require "plugins.config.mini-sessions"
    end,
  },

  -- Plugin that peeks lines of the buffer in non-obtrusive way.
  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
        number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true, -- Peeked line will be centered relative to window
      }
    end,
  },

  -- Pop-up menu for code actions to show meta-information and diff preview.
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    config = function()
      vim.g.code_action_menu_show_details = false
      vim.g.code_action_menu_show_diff = false
      vim.g.code_action_menu_show_action_kind = false
      require("theme").load_highlight "nvim-code-action-menu"
    end,
  },

  -- Enhanced matchparen.vim plugin for Neovim
  -- for showing matching parens.
  -- @todo: [ERROR] autocmd has already been created.
  -- {
  --   "utilyre/sentiment.nvim",
  --   tag = "*",
  --   config = function()
  --     require("sentiment").setup {}
  --   end,
  -- },

  -- Vim sugar for the UNIX shell commands that need it the most.
  -- E.g. :Remove, :Delete, :Move, :Rename, SudoWrite, :SudeEdit, ...
  -- use { "tpope/via-eunuch" }

  -- abolish.vim: Work with several variants of a word at once
  -- casesensitive search/replace with %s / %S
  {
    "tpope/vim-abolish",
  },
}

require("lazy").setup(plugins, opts)
