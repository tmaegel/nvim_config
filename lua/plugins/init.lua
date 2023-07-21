local packer = require "packer"

packer.init {
  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 6000 },
  display = {
    compact = false,
    working_sym = " ",
    error_sym = " ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = " ",
    header_sym = " ",
    open_fn = function()
      return require("packer.util").float {
        border = "single",
      }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  -- use {
  --   "lewis6991/impatient.nvim",
  --   config = function()
  --     require "impatient"
  --   end,
  -- }

  use {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  }

  -- the plugin will allow you to navigate seamlessly between
  -- vim and tmux splits using a consistent set of hotkeys.
  use { "christoomey/vim-tmux-navigator" }

  use {
    "goolord/alpha-nvim",
    config = function()
      require "plugins.config.alpha"
    end,
  }

  --
  -- Mason & lspconfig
  --
  use {
    "williamboman/mason.nvim",
    config = function()
      require "plugins.config.mason"
    end,
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    after = "mason.nvim",
    config = function()
      require "plugins.config.mason-lspconfig"
    end,
  }
  use {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",
    config = function()
      require "plugins.config.lspconfig"
    end,
  }

  --
  -- Mason & null-ls
  --
  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "plugins.config.null-ls"
    end,
  }
  use {
    "jayp0521/mason-null-ls.nvim",
    wants = "mason.nvim",
    after = "null-ls.nvim",
    config = function()
      require "plugins.config.mason-null-ls"
    end,
  }

  --
  -- Treesitter
  --
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.config.treesitter"
    end,
  }

  --
  -- Autocompletion & snippets
  --
  use {
    "hrsh7th/nvim-cmp",
    after = "nvim-lspconfig",
    config = function()
      require "plugins.config.cmp"
    end,
  }
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp",
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip",
  }
  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer",
  }
  use {
    "hrsh7th/cmp-cmdline",
    after = "cmp-buffer",
  }
  use {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    after = "cmp-nvim-lsp",
  }
  -- Snippets plugin
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/snippets" } }
      require("luasnip").filetype_extend("python", { "django", "django-rest" })
      require("luasnip").filetype_extend("dart", { "flutter" })
    end,
  }

  -- Git integration for buffers.
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.config.gitsigns"
    end,
  }

  use {
    "benfowler/telescope-luasnip.nvim",
    -- if you wish to lazy-load
    module = "telescope._extensions.luasnip",
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "princejoogie/dir-telescope.nvim" }
  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = {
      {
        "princejoogie/dir-telescope.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "benfowler/telescope-luasnip.nvim",
      },
    },
    config = function()
      require "plugins.config.telescope"
    end,
  }

  -- A pretty diagnostics, references, telescope results, quickfix and location list.
  use {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    keys = { "x" },
    config = function()
      require "plugins.config.trouble"
    end,
  }

  use {
    "b0o/incline.nvim",
    -- tag = "v0.0.3",
    config = function()
      require "plugins.config.incline"
    end,
  }

  use {
    "ghillb/cybu.nvim",
    branch = "main", -- timely updates
    -- branch = "v1.x", -- won't receive breaking changes
    requires = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    }, -- optional for icon support
    config = function()
      require "plugins.config.cybu"
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.config.indent-blankline"
    end,
  }

  use {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "plugins.config.nvim-colorizer"
    end,
  }

  use {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete" },
  }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require "plugins.config.autopairs"
    end,
  }

  use {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    config = function()
      require("Comment").setup()
    end,
  }

  -- Old text                    Command         New text
  -- --------------------------------------------------------------------------------
  -- surround_words             ysiw)           (surround_words)
  -- [delete around me!]        ds]             delete around me!
  -- remove <b>HTML tags</b>    dst             remove HTML tags
  -- 'change quotes'            cs'"            "change quotes"
  -- delete(function calls)     dsf             function calls
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require "plugins.config.surround"
    end,
  }

  -- NVIM plugin to highlight only the screen line
  -- of the cursor in the currently active window.
  -- use {
  --   "Tummetott/reticle.nvim",
  --   config = function()
  --     require "plugins.config.reticle"
  --   end,
  -- }

  -- Only load whichkey after all the gui
  use {
    "folke/which-key.nvim",
    config = function()
      require "plugins.config.whichkey"
    end,
  }

  -- Auto-Focusing and Auto-Resizing splits / windows.
  use {
    "beauwilliams/focus.nvim",
    config = function()
      require "plugins.config.focus"
    end,
  }

  -- Plugin that peeks lines of the buffer in non-obtrusive way.
  use {
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
  }

  -- Pop-up menu for code actions to show meta-information and diff preview.
  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    config = function()
      vim.g.code_action_menu_show_details = false
      vim.g.code_action_menu_show_diff = false
      vim.g.code_action_menu_show_action_kind = false
      require("theme").load_highlight "nvim-code-action-menu"
    end,
  }

  -- Automatically creates missing directories on saving a file.
  use { "jghauser/mkdir.nvim" }

  -- Vim sugar for the UNIX shell commands that need it the most.
  -- E.g. :Remove, :Delete, :Move, :Rename, SudoWrite, :SudeEdit, ...
  use { "tpope/vim-eunuch" }

  -- Moving lines/blocks up and down.
  use { "fedepujol/move.nvim" }
end)
