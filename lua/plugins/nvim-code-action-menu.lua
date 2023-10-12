return {
  "weilbith/nvim-code-action-menu",
  cmd = "CodeActionMenu",
  config = function()
    local colors = require("theme.utils").get_theme_tb "base_30"

    require("theme.utils").load_highlight {
      CodeActionMenuMenuSelection = { fg = colors.black, bg = colors.blue },
    }

    vim.g.code_action_menu_show_details = false
    vim.g.code_action_menu_show_diff = false
    vim.g.code_action_menu_show_action_kind = false
  end,
}
