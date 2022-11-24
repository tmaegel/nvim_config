local colors = require("theme").get_theme_tb "base_30"

return {
  -- LSP References
  LspReferenceText = { fg = colors.darker_black, bg = colors.white },
  LspReferenceRead = { fg = colors.darker_black, bg = colors.white },
  LspReferenceWrite = { fg = colors.darker_black, bg = colors.white },

  -- Lsp Diagnostics
  DiagnosticHint = { fg = colors.purple },
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInformation = { fg = colors.green },
  LspSignatureActiveParameter = { fg = colors.black, bg = colors.green },

  DiagnosticLineNrError = {
    fg = colors.red,
    bg = colors.black,
  },
  DiagnosticLineNrWarn = {
    fg = colors.yellow,
    bg = colors.black,
  },
  DiagnosticLineNrHint = {
    fg = colors.purple,
    bg = colors.black,
  },
  DiagnosticLineNrInfo = {
    fg = colors.green,
    bg = colors.black,
  },

  RenamerTitle = { fg = colors.black, bg = colors.red },
  RenamerBorder = { fg = colors.red },
}
