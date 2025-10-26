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

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help {
      border = "single",
      focusable = false,
      relative = "cursor",
    }

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
        vim.diagnostic.jump { count = -1, float = true }
      end, { desc = "Goto prev", noremap = true, silent = true })

      keymap.set("n", "<leader>dn", function()
        vim.diagnostic.jump { count = 1, float = true }
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

    vim.lsp.config("*", {
      on_attach = on_attach,
      capabilities = capabilities,
    })
    vim.lsp.config("pyright", require "lsp.pyright")
    vim.lsp.enable "pyright"
    vim.lsp.config("bashls", require "lsp.bashls")
    vim.lsp.enable "bashls"
    vim.lsp.config("ts_ls", require "lsp.ts_ls")
    vim.lsp.enable "ts_ls"
    vim.lsp.config("dockerls", require "lsp.dockerls")
    vim.lsp.enable "dockerls"
    vim.lsp.config("lua_ls", require "lsp.lua_ls")
    vim.lsp.enable "lua_ls"
    vim.lsp.config("dartls", require "lsp.dartls")
    vim.lsp.enable "dartls"
    vim.lsp.config("gopls", require "lsp.gopls")
    vim.lsp.enable "gopls"
    vim.lsp.config("ansiblels", require "lsp.ansiblels")
    vim.lsp.enable "ansiblels"
    vim.lsp.config("terraformls", require "lsp.terraformls")
    vim.lsp.enable "terraformls"
    vim.lsp.config("helm_ls", require "lsp.helm_ls")
    vim.lsp.enable "helm_ls"
  end,
}
