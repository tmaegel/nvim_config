local M = {}

M.setup = function()
  vim.opt.statusline = "%!v:lua.require('statusline').run()"
end

M.run = function()
  local modules = require "statusline.modules"
  return table.concat {
    modules.tabline(),

    modules.sep(),

    modules.mode(),

    modules.sep(),

    modules.cwd(),

    "%#StatusLine#%=",
    "%#StatusLine#%=",

    modules.git(),

    modules.sep(),

    modules.file_type(),

    modules.sep(),

    modules.cursor_position(),
  }
end

return M
