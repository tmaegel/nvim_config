return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.diagnostic.config {
      underline = false,
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
        linehl = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
        textln = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
          [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticLineNrError",
          [vim.diagnostic.severity.WARN] = "DiagnosticLineNrWarn",
          [vim.diagnostic.severity.INFO] = "DiagnosticLineNrInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticLineNrHint",
        },
      },
      float = {
        source = true, -- Or "if_many"
      },
      update_in_insert = false,
      severity_sort = true,
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

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or require("utils").set_border "LspFloatWinBorder"
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

      keymap.set("n", "<leader>sh", function()
        vim.lsp.buf.signature_help()
      end, { desc = "LSP signature_help", noremap = true, silent = true })

      keymap.set(
        "n",
        "<leader>ca",
        "<CMD> CodeActionMenu <CR>",
        { desc = "LSP code_action", noremap = true, silent = true }
      )

      keymap.set(
        "n",
        "<leader>rn",
        vim.lsp.buf.rename,
        { desc = "Rename symbol under cursor", noremap = true, silent = true }
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
    end

    --
    -- GENERAL
    --
    vim.lsp.config("*", {
      on_attach = on_attach,
      capabilities = capabilities,
    })

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
    vim.lsp.config("pyright", {
      root_dir = require("lspconfig").util.root_pattern(unpack(python_root_files)),
    })
    vim.lsp.enable "pyright"

    --
    -- BASH
    --
    vim.lsp.config("bashls", {
      settings = {},
    })
    vim.lsp.enable "bashls"

    --
    -- TypeScript/JavaScript
    --
    vim.lsp.config("ts_ls", {
      settings = {},
    })
    vim.lsp.enable "ts_ls"

    --
    -- Dockerfile
    --
    vim.lsp.config("dockerls", {
      settings = {},
    })
    vim.lsp.enable "dockerls"

    --
    -- LUA
    --
    vim.lsp.config("lua_ls", {
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
    })
    vim.lsp.enable "lua_ls"

    --
    -- DART
    --
    vim.lsp.config("dartls", {
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
    })
    vim.lsp.enable "dartls"

    --
    -- GOLANG
    --
    vim.lsp.config("gopls", {
      settings = {},
    })
    vim.lsp.enable "gopls"

    --
    -- ANSIBLE
    --
    vim.lsp.config("ansiblels", {
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
    })
    vim.lsp.enable "ansiblels"

    --
    -- TERRAFORM
    --
    vim.lsp.config("terraformls", {
      settings = {},
    })
    vim.lsp.enable "terraformls"

    --
    -- HELM
    --
    vim.lsp.config("helm_ls", {
      settings = {
        ["helm-ls"] = {
          yamlls = {
            path = "yaml-language-server",
          },
        },
      },
    })
    vim.lsp.enable "helm_ls"
  end,
}
