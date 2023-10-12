local M = {}

local config = require "theme.config"

M.get_theme_tb = function(type)
  local default_path = "theme.themes." .. config.theme
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

M.setup = function()
  M.load_highlight "defaults"
  M.load_highlight "statusline"
  M.load_highlight "syntax"
  M.load_highlight "lsp"
  M.load_highlight "git"
  if config.transparency then
    M.load_highlight "glassy"
  end
end

return M
