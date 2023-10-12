return {
  --
  -- mason
  --
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local ensure_installed = {
        -- python
        "pyright",
        "black",
        "flake8",
        "isort",
        "mypy",
        -- shell
        "bash-language-server",
        -- lua stuff
        "lua-language-server",
        -- web dev
        "typescript-language-server",
      }

      require("mason").setup {
        -- Where Mason should put its bin location in your PATH. Can be one of:
        -- * "prepend" (default, Mason's bin location is put first in PATH)
        -- * "append" (Mason's bin location is put at the end of PATH)
        -- * "skip" (doesn't modify PATH)
        -- * @type '"prepend"' | '"append"' | '"skip"'
        PATH = "prepend",
        ui = {
          -- Whether to automatically check for new versions when opening the :Mason window.
          check_outdated_packages_on_open = true,
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
          keymaps = {
            -- Keymap to expand a package
            toggle_server_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_server = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_server = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_server_version = "c",
            -- Keymap to update all installed packages
            update_all_servers = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_servers = "C",
            -- Keymap to uninstall a package
            uninstall_server = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
          },
        },
        -- Limit for the maximum amount of packages to be installed at the same time
        -- Once this limit is reached, any further
        -- packages that are requested to be installed will be put in a queue.
        max_concurrent_installers = 10,
      }

      vim.api.nvim_create_augroup("_mason", { clear = true })
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "mason",
        callback = function()
          local colors = require("theme").get_theme_tb "base_30"
          require("theme").load_highlight {
            MasonNormal = { bg = colors.darker_black },
            MasonCursorLine = { bg = colors.darker_black },

            MasonHeading = { bold = true, default = true },
            MasonHeader = { fg = colors.black, bg = colors.red },
            MasonHeaderSecondary = { link = "MasonHighlightBlock" },

            MasonHighlight = { fg = colors.blue },
            MasonHighlightBlock = { fg = colors.black, bg = colors.green },
            MasonHighlightBlockBold = { link = "MasonHighlightBlock" },

            -- MasonHighlightSecondary = { fg = "#DCA561", default = true },
            -- MasonHighlightBlockSecondary = { bg = "#DCA561", fg = "#222222", default = true },
            -- MasonHighlightBlockBoldSecondary = { bg = "#DCA561", fg = "#222222", bold = true, default = true },

            MasonMuted = { fg = colors.light_grey },
            MasonMutedBlock = { fg = colors.light_grey, bg = colors.one_bg },

            -- MasonMutedBlockBold = { bg = "#888888", fg = "#222222", bold = true, default = true },
            -- MasonLink = { link = "MasonHighlight", default = true },
            -- MasonError = { fg = "#f44747", default = true },
          }
        end,
        group = "_mason",
      })

      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
      end, {})
    end,
  },
  --
  -- mason-lspconfig
  --
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
        -- This setting has no relation with the `automatic_installation` setting.
        ensure_installed = {
          "ansiblels",
          "bashls",
          "dockerls",
          "lua_ls",
          "pyright",
          "terraformls",
          "tsserver",
        },
        -- Whether servers that are set up (via lspconfig) should be automatically installed
        -- if they're not already installed.
        -- This setting has no relation with the `ensure_installed` setting.
        -- Can either be:
        -- * false: Servers are not automatically installed.
        -- * true: All servers set up via lspconfig are automatically installed.
        -- * { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
        --   Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
        automatic_installation = false,
      }
    end,
  },
  --
  -- mason-null-ls
  --
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup {
        -- A list of sources to install if they're not already installed.
        -- This setting has no relation with the `automatic_installation` setting.
        ensure_installed = {
          "black",
          "djlint",
          "fixjson",
          "flake8",
          "isort",
          "markdownlint",
          "mypy",
          "prettier",
          "shellcheck",
          "shfmt",
          "stylua",
          "yamllint",
        },
        -- Will automatically install masons tools based on selected sources in `null-ls`.
        -- Can also be an exclusion list.
        -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
        automatic_installation = false,
        -- Whether sources that are installed in mason should be automatically set up in null-ls.
        -- Removes the need to set up null-ls manually.
        -- Can either be:
        -- 	- false: Null-ls is not automatically registered.
        -- 	- true: Null-ls is automatically registered.
        -- 	- { types = { SOURCE_NAME = {TYPES} } }. Allows overriding default configuration.
        -- 	Ex: { types = { eslint_d = {'formatting'} } }
        automatic_setup = false,
      }
    end,
  },
}
