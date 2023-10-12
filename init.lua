-- Initialize core stuff
require "core.filetype"
require "core.options"
require "core.autocmds"
require "core.mappings"

-- Initialize theme
require("theme").setup()
-- Initialize statusline
require("ui").setup()

-- Setup package manager + plugins
require "package_manager"
