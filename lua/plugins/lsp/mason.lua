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

      require("mason-lspconfig").setup {
        -- A list of servers to automatically install if they're not already installed.
        -- Example: { "rust_analyzer@nightly", "sumneko_lua" }
        -- This setting has no relation with the `automatic_installation` setting.
        ensure_installed = {
          -- "ansiblels", -- Installed via nix
          -- "bashls", -- Installed via nix
          -- "dockerls", -- Installed via nix
          -- "lua_ls", -- Installed via nix
          -- "nil_ls", -- Installed via nix
          -- "pyright", -- Installed via nix
          -- "tsserver", -- Installed via nix
        },
        -- Whether servers that are set up (via lspconfig) should be automatically installed
        -- if they're not already installed.
        -- This setting has no relation with the `ensure_installed` setting.
        -- Can either be:
        -- * false: Servers are not automatically installed.
        -- * true: All servers set up via lspconfig are automatically installed.
        -- * { exclude: string[] }: All servers set up via lspconfig, except the ones
        --   provided in the list, are automatically installed.
        --   Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
        automatic_installation = false,
      }

      vim.api.nvim_create_augroup("_mason", { clear = true })
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "mason",
        callback = function()
          local colors = require("theme.utils").get_theme_tb "base_30"
          require("theme.utils").load_highlight {
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
          -- "black", -- Installed via nix
          -- "djlint", -- Installed via nix
          -- "fixjson", -- Installed via nix
          -- "flake8", -- Installed via nix
          -- "isort", -- Installed via nix
          -- "markdownlint", -- Installed via nix
          -- "mypy", -- Insalled via nix
          -- "prettier", -- Installed via nix
          -- "shellcheck", -- Installed via nix
          -- "shfmt", -- Installed via nix
          -- "stylua", -- Installed via nix
          -- "yamllint", -- Installed via nix
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
