return {
  run = function()
    local modules = require "ui.statusline.modules"

    return table.concat {
      modules.mode(),

      modules.sep(),

      modules.tabline(),

      modules.sep(),

      modules.git(),

      modules.sep(),

      modules.buffer_dir(),

      "%#StatusLine#%=",
      "%#StatusLine#%=",

      modules.lsp_diagnostics(),

      modules.sep(),

      modules.file_type(),

      modules.sep(),

      modules.cursor_position(),
    }
  end,
}
