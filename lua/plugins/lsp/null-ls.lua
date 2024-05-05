return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    local null_ls = require "null-ls"
    local b = null_ls.builtins
    local sources = {

      -- PYTHON
      b.diagnostics.flake8,
      b.diagnostics.mypy,

      -- SHELL / BASH
      b.code_actions.shellcheck,
      b.diagnostics.shellcheck.with {
        diagnostics_format = "#{m} [#{c}]",
        extra_args = {
          "-o",
          "all",
        },
      },

      -- YAML
      b.diagnostics.yamllint.with {
        extra_args = {
          "-d",
          "{extends: default, rules: {line-length: {max: 999}}}",
        },
      },

      -- MARKDOWN
      b.diagnostics.markdownlint.with {
        extra_args = {
          "--disable",
          "MD013",
        },
      },
    }

    null_ls.setup {
      -- Use :NullLsLog to open your debug log in the current Neovim
      debug = false,
      sources = sources,
    }
  end,
}
