-- https://github.com/folke/trouble.nvim
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    auto_preview = true, -- automatically open preview when on an item
    auto_refresh = true, -- auto refresh when open
    focus = true, -- Focus the window when opened
    open_no_results = true, -- open the trouble window when there are no results
  },
  keys = {
    {
      "xx",
      "<cmd>Trouble diagnostics toggle<CR>",
      desc = "Trouble diagnostics",
    },
    {
      "xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Trouble buffer diagnostics",
    },
    {
      "xl",
      "<cmd>Trouble loclist toggle<CR>",
      desc = "Trouble location list",
    },
    {
      "xq",
      "<cmd>Trouble qflist toggle<CR>",
      desc = "Trouble quickfix list",
    },
  },
}
