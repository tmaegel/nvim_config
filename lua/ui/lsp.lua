local set_lsp_sign = require("ui.utils").set_lsp_sign

-- Overwrite diagnostic icons/signs
set_lsp_sign "Error"
set_lsp_sign "Info"
set_lsp_sign "Hint"
set_lsp_sign "Warn"

vim.diagnostic.config {
  underline = true,
  virtual_text = false,
  signs = false,
  float = {
    source = "always", -- Or "if_many"
  },
  update_in_insert = false,
  severity_sort = false,
}

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
  focusable = false,
  relative = "cursor",
})

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "single",
      source = "always",
      prefix = "",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
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
