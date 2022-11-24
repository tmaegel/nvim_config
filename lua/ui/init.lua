local M = {}
local config = require "ui.config"

M.statusline = function()
  return require("ui.statusline").run(config.statusline)
end

M.setup = function()
  vim.opt.statusline = "%!v:lua.require('ui').statusline()"
end

return M
