local set_lsp_sign = require("ui.utils").set_lsp_sign

-- Overwrite diagnostic icons/signs
set_lsp_sign "Error"
set_lsp_sign "Info"
set_lsp_sign "Hint"
set_lsp_sign "Warn"

vim.diagnostic.config {
  underline = false,
  -- Disable virtual_text since it's redundant due to lsp_lines.
  virtual_text = false,
  -- Enable lsp_lines.
  -- virtual_lines = true,
  virtual_lines = { only_current_line = true },
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

-- Suppress error messages from lang servers
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
