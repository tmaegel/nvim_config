return {
  run = function(config)
    vim.g.statusline_sep_style = config.separator_style
    local modules = require "ui.statusline.modules"

    return table.concat {
      modules.mode(),

      modules.sep(),

      modules.cwd(),

      modules.sep(),

      modules.git(),

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
