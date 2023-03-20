-- Initialize core stuff
require "core.filetype"
require "core.options"
require "core.autocmds"

-- Initialize theme
require("theme").setup()
-- Initialize statusline
require("ui").setup()

-- Setup packer + plugins
require "plugins"

-- Load mappings
require("core.utils").load_mappings "general"
