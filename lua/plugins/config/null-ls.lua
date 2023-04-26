local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

  -- PYTHON
  -- b.diagnostics.pylint,
  b.diagnostics.flake8,
  b.diagnostics.mypy,
  b.formatting.isort,
  b.formatting.black,
  -- b.formatting.autopep8,

  -- SHELL / BASH
  b.code_actions.shellcheck,
  b.diagnostics.shellcheck.with {
    diagnostics_format = "#{m} [#{c}]",
    extra_args = {
      "-o",
      "all",
    },
  },
  b.formatting.shfmt.with {
    extra_args = {
      "-i",
      "2",
      "-s",
      "-bn",
      "-ci",
      "-sr",
    },
  },

  -- JAVASCRIPT, CSS & HTML
  b.formatting.prettier.with {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
      "css",
      "markdown",
    },
    extra_args = {
      "--print-width",
      "120",
    },
  },
  b.formatting.djlint,

  -- LUA
  b.formatting.stylua,

  -- YAML
  b.diagnostics.yamllint.with {
    extra_args = {
      "-d",
      "{extends: default, rules: {line-length: {max: 999}}}",
    },
  },

  -- JSON
  b.formatting.fixjson.with {
    extra_args = {
      "--indent",
      "4",
    },
  },

  -- DART
  b.formatting.dart_format,

  -- TERRAFORM
  b.formatting.terraform_fmt,

  -- MARKDOWN
  b.diagnostics.markdownlint,

  -- OTHER
  b.formatting.trim_whitespace,
  b.formatting.trim_newlines,
}

null_ls.setup {
  -- Use :NullLsLog to open your debug log in the current Neovim
  debug = false,
  -- Format on save
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format {
            bufnr = bufnr,
            -- On Neovim v0.8+, when calling vim.lsp.buf.format you may want to filter
            -- the available formatters so that only null-ls receives the formatting request.
            -- Otherwise, when calling vim.lsp.buf.format, other formatters from other clients
            -- attached to the buffer may attempt to perform a format.
            filter = function(client)
              return client.name == "null-ls"
            end,
          }
          -- vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
  sources = sources,
}
