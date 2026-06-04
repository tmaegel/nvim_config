-- https://github.com/stevearc/conform.nvim
return {
  "stevearc/conform.nvim",
  branch = "nvim-0.9",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      dart = { "dart_format" },
      go = { "golines", "gofmt" },
      sh = { "shfmt" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "prettier" },
      terraform = { "terraform_fmt" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "yamlfmt" },
      nix = { "nixfmt" },
      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = {},
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = true,
    },
    formatters = {
      -- Fix: https://github.com/stevearc/conform.nvim/issues/712
      dart_format = {
        args = { "format", "$FILENAME" },
        stdin = false,
      },
      shfmt = {
        prepend_args = { "-i", "2", "-s", "-bn", "-ci", "-sr" },
      },
      jq = {
        prepend_args = { "--indent", "4" },
      },
    },
  },
}
