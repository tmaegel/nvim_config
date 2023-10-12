-- Initialize core stuff
require "core.filetype"
require "core.options"
require "core.autocmds"
require "core.mappings"

-- Initialize theme
require "theme"
-- Initialize statusline
require("statusline").setup()

-- Setup package manager + plugins
require "package_manager"
