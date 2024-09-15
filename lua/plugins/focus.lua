-- https://github.com/nvim-focus/focus.nvim
return {
  "beauwilliams/focus.nvim",
  config = function()
    -- Ignore filetypes
    local ignore_filetypes = {
      "",
      "alpha",
      "DiffviewFiles",
      "help",
      "lspinfo",
      "mason",
      "NvimTree",
      "Outline",
      "packer",
      "qf",
      "TelescopePrompt",
      "TelescopeResults",
      "terminal",
      "toggleterm",
      "trouble",
      "tsplayground",
    }
    -- Ignore buftypes
    local ignore_buftypes = {
      "nofile",
      "popup",
      "prompt",
    }

    require("focus").setup {
      enable = true, -- Enable module
      commands = true, -- Create Focus commands
      autoresize = {
        enable = true, -- Enable or disable auto-resizing of splits
        width = 120, -- Force width for the focused window
        height = 80, -- Force height for the focused window
        minwidth = 20, -- Force minimum width for the unfocused window
        minheight = 10, -- Force minimum height for the unfocused window
        height_quickfix = 10, -- Set the height of quickfix panel
      },
      split = {
        bufnew = false, -- Create blank buffer for new split windows
        tmux = false, -- Create tmux splits instead of neovim splits
      },
      ui = {
        number = false, -- Display line numbers in the focussed window only
        relativenumber = false, -- Display relative line numbers in the focussed window only
        hybridnumber = false, -- Display hybrid line numbers in the focussed window only
        absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

        cursorline = false, -- Display a cursorline in the focussed window only
        cursorcolumn = false, -- Display cursorcolumn in the focussed window only
        colorcolumn = {
          enable = false, -- Display colorcolumn in the foccused window only
          list = "+1", -- Set the comma-saperated list for the colorcolumn
        },
        signcolumn = false, -- Display signcolumn in the focussed window only
        winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
      },
    }

    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

    vim.api.nvim_create_autocmd("WinEnter", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
          vim.b.focus_disable = true
        end
      end,
      desc = "Disable focus autoresize for BufType",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        end
      end,
      desc = "Disable focus autoresize for FileType",
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>T", "<cmd> FocusToggle <CR>", { desc = "Toggle focus (globally) on and off" })
    keymap.set(
      "n",
      "<leader>=",
      "<cmd> FocusMaxOrEqual <CR>",
      { desc = "Toggles between having the splits equalised or the focused window maximised" }
    )
  end,
}
