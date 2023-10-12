local M = {}

M.setup = function()
  vim.opt.statusline = "%!v:lua.require('statusline').run()"
end

M.run = function()
  local modules = require "statusline.modules"
  return table.concat {
    modules.mode(),
    modules.tabline(),

    modules.sep(),

    modules.cwd(),

    modules.sep(),

    modules.git(),

    "%#StatusLine#%=",
    "%#StatusLine#%=",

    modules.lsp_diagnostics(),

    modules.sep(),

    modules.lsp_status() or "",

    modules.sep(),

    modules.file_type(),

    modules.sep(),

    modules.cursor_position(),
  }
end

return M
