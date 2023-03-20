local colors = require("theme").get_theme_tb "base_30"

return {
  -- LSP References
  LspReferenceText = { fg = colors.darker_black, bg = colors.white },
  LspReferenceRead = { fg = colors.darker_black, bg = colors.white },
  LspReferenceWrite = { fg = colors.darker_black, bg = colors.white },

  -- Lsp Diagnostics
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticHint = { fg = colors.purple },
  DiagnosticInfo = { fg = colors.green },
  DiagnosticInformation = { fg = colors.green },

  LspSignatureActiveParameter = { fg = colors.black, bg = colors.green },

  DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
  DiagnosticUnderlineWarn = { sp = colors.red, undercurl = true },
  DiagnosticUnderlineHint = { sp = colors.red, undercurl = true },
  DiagnosticUnderlineInfo = { sp = colors.red, undercurl = true },

  LspDiagnosticsFloatingError = { fg = colors.red },
  LspDiagnosticsFloatingWarn = { fg = colors.yellow },
  LspDiagnosticsFloatingHint = { fg = colors.yellow },
  LspDiagnosticsFloatingInfor = { fg = colors.green },

  DiagnosticLineNrError = { fg = colors.red, bg = colors.black },
  DiagnosticLineNrWarn = { fg = colors.yellow, bg = colors.black },
  DiagnosticLineNrHint = { fg = colors.purple, bg = colors.black },
  DiagnosticLineNrInfo = { fg = colors.green, bg = colors.black },

  -- TODO: Define winhighlight mapping for lsp floating windows.
  -- LspFloatWinNormal = { bg = colors.blue },
  LspFloatWinBorder = { fg = colors.grey, bg = colors.black },
}
