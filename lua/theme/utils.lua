local M = {}

local config = require "theme.config"

M.get_theme_tb = function(type)
  local default_path = "theme." .. config.theme
  local present, default_theme = pcall(require, default_path)

  if present then
    return default_theme[type]
  else
    error "No such theme bruh >_< "
  end
end

M.load_highlight = function(group)
  if type(group) == "string" then
    group = require("theme.integrations." .. group)
  end
  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

return M
