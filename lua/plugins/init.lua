local packer = require "packer"

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

packer.init {
  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 6000 },
  display = {
    compact = false,
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    header_sym = " ",
    open_fn = function()
      return require("packer.util").float {
        border = "none",
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

  use {
    "~/.config/nvim/lua/theme",
    config = function()
      require("theme").setup()
    end,
  }

  use {
    "~/.config/nvim/lua/ui",
    config = function()
      require("ui").setup()
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
  -- LSP source for nvim-cmp
  use "hrsh7th/cmp-nvim-lsp"
  -- Snippets source for nvim-cmp
  use "saadparwaiz1/cmp_luasnip"
  -- Snippets plugin
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/snippets" } }
    end,
  }

  -- ["saadparwaiz1/cmp_luasnip"] = { after = "LuaSnip" },
  -- ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },
  -- ["hrsh7th/cmp-nvim-lsp"] = { after = "cmp-nvim-lua" },
  -- ["hrsh7th/cmp-buffer"] = { after = "cmp-nvim-lsp" },
  -- ["hrsh7th/cmp-path"] = { after = "cmp-buffer" },

  use "tpope/vim-fugitive"
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.config.gitsigns"
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    after = "telescope-file-browser.nvim",
    config = function()
      require "plugins.config.telescope"
    end,
  }
  use "nvim-telescope/telescope-file-browser.nvim"

  use {
    "folke/trouble.nvim",
    config = function()
      require "plugins.config.trouble"
    end,
  }

  -- use {
  --   "kyazdani42/nvim-tree.lua",
  --   config = function()
  --     require "plugins.config.nvim-tree"
  --   end,
  -- }

  use {
    "nanozuki/tabby.nvim",
    config = function()
      require "plugins.config.tabby"
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

  -- use {
  --   "heavenshell/vim-pydocstring",
  --   config = function()
  --     require "plugins.config.nvim-pydocstring"
  --   end,
  -- }

  use "famiu/bufdelete.nvim"

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }
end)
