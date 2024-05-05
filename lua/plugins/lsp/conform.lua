-- https://github.com/stevearc/conform.nvim
return {
  "stevearc/conform.nvim",
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
      json = { "jq" },
      yaml = { "yamlfmt" },
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
      shfmt = {
        prepend_args = { "-i", "2", "-s", "-bn", "-ci", "-sr" },
      },
      prettier = {
        prepend_args = { "--print-width", "120" },
      },
      jq = {
        prepend_args = { "--indent", "4" },
      },
    },
  },
}
