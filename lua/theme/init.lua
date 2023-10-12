local config = require "theme.config"
local utils = require "theme.utils"

utils.load_highlight "defaults"
utils.load_highlight "statusline"
utils.load_highlight "syntax"
utils.load_highlight "lsp"
utils.load_highlight "git"
if config.transparency then
  utils.load_highlight "glassy"
end
