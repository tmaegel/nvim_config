return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-shellcheck.nvim",
  },
  config = function()
    local null_ls = require "null-ls"
    local none_ls_shellcheck = require "none-ls-shellcheck"
    local sources = {

      -- GOLANG
      null_ls.builtins.diagnostics.golangci_lint.with {
        extra_args = {
          "--fast",
        },
      },

      -- PYTHON
      require "none-ls.diagnostics.flake8",
      null_ls.builtins.diagnostics.mypy,

      -- SHELL / BASH
      none_ls_shellcheck.code_actions,
      none_ls_shellcheck.diagnostics,

      -- YAML
      null_ls.builtins.diagnostics.yamllint.with {
        extra_args = {
          "-d",
          '{extends: default, rules: {line-length: {max: 999}, document-start: "disable"}}',
        },
      },

      -- MARKDOWN
      null_ls.builtins.diagnostics.markdownlint.with {
        extra_args = {
          "--disable",
          "MD013",
        },
      },
    }

    null_ls.setup {
      -- Use :NoneLsLog to open your debug log in the current Neovim
      debug = false,
      sources = sources,
    }
  end,
}
