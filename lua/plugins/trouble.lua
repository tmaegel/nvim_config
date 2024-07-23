-- https://github.com/folke/trouble.nvim
return {
  "folke/trouble.nvim",
  tag = "v3.6.0",
  cmd = "Trouble",
  opts = {
    open_no_results = true, -- open the trouble window when there are no results
    modes = {
      diagnostics_preview = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.4,
        },
      },
    },
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Trouble diagnostics",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle<CR>",
      desc = "Trouble buffer diagnostics",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<CR>",
      desc = "Trouble symbols",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
      desc = "Trouble LSP definitions / references / ...",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<CR>",
      desc = "Trouble location list",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<CR>",
      desc = "Trouble quickfix list",
    },
  },
}
