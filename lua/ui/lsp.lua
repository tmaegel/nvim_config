local set_border = require("ui.utils").set_border
local set_lsp_sign = require("ui.utils").set_lsp_sign

-- Overwrite diagnostic icons/signs
set_lsp_sign "Error"
set_lsp_sign "Info"
set_lsp_sign "Hint"
set_lsp_sign "Warn"

vim.diagnostic.config {
  underline = false,
  virtual_text = false,
  -- virtual_text = {
  --   prefix = "",
  --  source = "always",  -- Or "if_many"
  -- },
  float = {
    source = "always", -- Or "if_many"
  },
  signs = true,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
  focusable = false,
  relative = "cursor",
})

-- suppress error messages from lang servers
vim.notify = function(msg, log_level)
  if msg:match "exit code" then
    return
  end
  if log_level == vim.log.levels.ERROR then
    vim.api.nvim_err_writeln(msg)
  else
    vim.api.nvim_echo({ { msg } }, true, {})
  end
end

-- Borders for LspInfo winodw
local win = require "lspconfig.ui.windows"
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  -- opts.border = "single"
  opts.border = opts.border or set_border "FloatBorder"
  return opts
end
