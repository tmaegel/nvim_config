return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require "lspconfig"
    local set_border = require("ui.utils").set_border

    require("theme").load_highlight "lsp"
    require "ui.lsp"

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or set_border "LspFloatWinBorder"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Export on_attach & capabilities for custom lspconfigs
    local keymap = vim.keymap
    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, { desc = "LSP hover", noremap = true, silent = true })
      keymap.set("n", "<leader>ls", function()
        vim.lsp.buf.signature_help()
      end, { desc = "LSP signature_help", noremap = true, silent = true })
      keymap.set(
        "n",
        "<leader>ca",
        "<CMD> CodeActionMenu <CR>",
        { desc = "LSP code_action", noremap = true, silent = true }
      )
      keymap.set("n", "<leader>dN", function()
        vim.diagnostic.goto_prev()
      end, { desc = "Goto prev", noremap = true, silent = true })
      keymap.set("n", "<leader>dn", function()
        vim.diagnostic.goto_next()
      end, { desc = "Goto_next", noremap = true, silent = true })
      keymap.set("n", "<leader>q", function()
        vim.diagnostic.setloclist()
      end, { desc = "Diagnostic setloclist", noremap = true, silent = true })
      keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.format { async = true }
      end, { desc = "LSP formatting", noremap = true, silent = true })
      keymap.set("n", "<leader>wa", function()
        vim.lsp.buf.add_workspace_folder()
      end, { desc = "Add workspace folder", noremap = true, silent = true })
      keymap.set("n", "<leader>wr", function()
        vim.lsp.buf.remove_workspace_folder()
      end, { desc = "Remove workspace folder", noremap = true, silent = true })
      keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "List workspace folders", noremap = true, silent = true })

      if client.server_capabilities.signatureHelpProvider then
        require("ui.signature").setup(client)
      end
    end

    --
    -- PYTHON
    --
    local python_root_files = {
      "WORKSPACE", -- added for Bazel; items below are from default config
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "pyrightconfig.json",
    }
    lspconfig["pyright"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(unpack(python_root_files)),
      settings = {
        -- https://github.com/microsoft/pyright/blob/main/docs/settings.md
        pyright = {
          disableLanguageServices = false,
          disableOrganizeImports = true,
        },
        python = {
          venv = "venv",
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
            useLibraryCodeForTypes = true,
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
    -- Dockerfile
    --
    lspconfig["dockerls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {},
    }

    --
    -- LUA
    --
    lspconfig["lua_ls"].setup {
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
      -- init_options = {
      --   onlyAnalyzeProjectsWithOpenFiles = true,
      --   suggestFromUnimportedLibraries = true,
      --   closingLabels = flutter_config.closing_labels.enabled,
      --   outline = true,
      --   flutterOutline = true,
      -- },
      -- handlers = {
      --   ["dart/textDocument/publishClosingLabels"] = closing_labels.closing_labels,
      -- },
      settings = {
        dart = {
          -- An array of paths (absolute or relative to each workspace folder)
          -- that should be excluded from analysis.
          -- analysisExcludedFolders = {
          --   path.join(flutter_sdk_path, "packages"),
          --   path.join(flutter_sdk_path, ".pub-cache"),
          -- },
          enableSdkFormatter = true,
          updateImportsOnRename = true,
          -- Completes functions/methods with their required parameters.
          completeFunctionCalls = true,
          -- Whether to generate diagnostics for TODO comments.
          showTodos = true,
          lineLength = 80,
          enableSnippets = false,
        },
      },
    }

    --
    -- ANSIBLE
    --
    lspconfig["ansiblels"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ansible = {
          ansible = {
            path = "ansible",
          },
          executionEnvironment = {
            enabled = false,
          },
          python = {
            interpreterPath = "python",
          },
          validation = {
            enabled = true,
            lint = {
              enabled = true,
              path = "ansible-lint",
            },
          },
        },
      },
    }

    --
    -- TERRAFORM
    --
    lspconfig["terraformls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {},
    }
  end,
}
