-- https://github.com/stevearc/dressing.nvim
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      title_pos = "center",
      border = "single",
      relative = "editor",
    },
    select = {
      nui = {
        border = {
          style = "single",
        },
      },
    },
  },
}
