local M = {}

M.set_lsp_sign = function(name, icon)
  -- Set highlight line number for lsp diagnostics
  local hl_s = "DiagnosticSign" .. name
  local hl_ln = "DiagnosticLineNr" .. name
  vim.fn.sign_define(hl_s, { text = "", linehl = "", numhl = hl_ln, texthl = hl_s })
end

-- Set border style
M.set_border = function(hl_name)
  return {
    { "┌", hl_name },
    { "─", hl_name },
    { "┐", hl_name },
    { "│", hl_name },
    { "┘", hl_name },
    { "─", hl_name },
    { "└", hl_name },
    { "│", hl_name },
  }
end

return M
