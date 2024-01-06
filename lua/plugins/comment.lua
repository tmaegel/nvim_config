-- https://github.com/numToStr/Comment.nvim
return {
  "numToStr/Comment.nvim",
  tag = "v0.8.0",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup()
  end,
}
