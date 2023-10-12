-- Old text                    Command         New text
-- --------------------------------------------------------------------------------
-- surround_words             ysiw)           (surround_words)
-- [delete around me!]        ds]             delete around me!
-- remove <b>HTML tags</b>    dst             remove HTML tags
-- 'change quotes'            cs'"            "change quotes"
-- delete(function calls)     dsf             function calls
return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup {}
  end,
}
