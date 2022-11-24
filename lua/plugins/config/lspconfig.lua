local lspconfig = require "lspconfig"
local set_border = require("ui.utils").set_border

require("theme").load_highlight "lsp"
require "ui.lsp"

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or set_border "FloatBorder"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Export on_attach & capabilities for custom lspconfigs
local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  require("core.utils").load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("ui.signature").setup(client)
  end
end

--
-- PYTHON
--
lspconfig["pyright"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    -- https://github.com/microsoft/pyright/blob/main/docs/settings.md
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = true,
    },
    python = {
      pythonPath = "/usr/bin/python",
      analysis = {
        -- Automatically add common search paths like 'src'
        autoSearchPaths = true,
        -- Offer auto-import completions
        autoImportCompletions = true,
        -- etermines whether pyright analyzes (and reports errors for) all files in the workspace.
        -- If this option is set to "openFilesOnly", pyright analyzes only open files.
        diagnosticMode = "workspace", -- workspace, openFilesOnly
        -- Determines whether pyright reads, parses and analyzes library code to extract
        -- type information in the absence of type stub files. Type information will typically
        -- be incomplete. We recommend using type stubs where possible. The default value for
        -- this option is false.
        useLibraryCodeForTypes = false,
        -- Diagnostics / analysis
        -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
        -- Available values: off, basic, strict
        typeCheckingMode = "basic",
        -- Oberwrite diagnostic settings
        diagnosticSeverityOverrides = {
          -- When inferring the type of a list, use strict type assumptions.
          strictListInference = true,
          -- When inferring the type of a dictionary’s keys and values, use strict type assumptions.
          strictDictionaryInference = true,
          -- When inferring the type of a set, use strict type assumptions.
          strictSetInference = true,
          -- PEP 484 indicates that when a function parameter is assigned a default value of None,
          -- its type should implicitly be Optional even if the explicit type is not.
          strictParameterNoneValue = true,
          -- PEP 484 defines support for "# type: ignore" comments.
          enableTypeIgnoreComments = true,
          reportMissingTypeStubs = "warning",
          reportWildcardImportFromLibrary = "warning",
          reportInvalidTypeVarUse = "warning",
          reportAssertAlwaysTrue = "warning",
          reportSelfClsParameterName = "warning",
          reportUnsupportedDunderAll = "warning",
          reportImplicitStringConcatenation = "warning",
          reportCallInDefaultInitializer = "warning",
          reportUninitializedInstanceVariable = "none",
          reportPropertyTypeMismatch = "information",
          reportUnusedCallResult = "none",
          -- reportMissingSuperCall = 'information',
          -- reportUnnecessaryTypeIgnoreComment = 'information',
        },
      },
    },
  },
}

--
-- BASH
--
lspconfig["bashls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {},
}

--
-- TypeScript/JavaScript
--
lspconfig["tsserver"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {},
}

--
-- LUA
--
lspconfig["sumneko_lua"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      format = {
        enable = true,
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

--
-- DART
--
lspconfig["dartls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    dart = {
      enableSdkFormatter = true,
      updateImportsOnRename = true,
      lineLength = 80,
    },
  },
}
