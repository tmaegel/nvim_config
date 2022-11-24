return {
  run = function(config)
    vim.g.statusline_sep_style = config.separator_style
    local modules = require "ui.statusline.modules"

    return table.concat {
      modules.mode(),
      modules.cwd(),
      modules.git(),
      modules.file_info(),

      "%#StatusLine#%=",
      "%#StatusLine#%=",

      modules.lsp_diagnostics(),
      -- modules.file_type(),
      modules.cursor_position(),
    }
  end,
}
