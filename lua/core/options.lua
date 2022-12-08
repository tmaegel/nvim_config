local opt = vim.opt
local g = vim.g

g.mapleader = " "

-- Enable syntax highlight
vim.cmd "syntax enable"

-- Enable filetype plugins
vim.cmd [[
  filetype on
  filetype plugin on
  filetype indent on
]]

-- Disable folder in diff mode
vim.cmd [[
  set diffopt+=context:99999,foldcolumn:0
]]

-- Set utf8 as standard encoding and en_US as the standard language
opt.encoding = "utf8"
-- Use Unix as the standard file type
opt.ffs = "unix,dos,mac"

-- Autosave when navigating between buffers
opt.autowrite = false
-- set.to auto read when a file is changes from outside
opt.autoread = true
-- Set.how many lines of history vim has to remember
opt.history = 1000
-- Disable folding
opt.foldenable = false
-- Show line numbers
opt.number = true
opt.numberwidth = 2
-- Turn on the wild menu
opt.wildmenu = true
-- Always show current postion
opt.ruler = false
-- Enable cursorline
opt.cursorline = false
opt.cursorcolumn = false
opt.foldcolumn = "0"
-- configure backspace so it acts as it should act
opt.backspace = "eol,start,indent"
-- Ignore the case when the search pattern is all lowercase.
opt.ignorecase = true
opt.smartcase = true
-- For regular expressions turn magic on
opt.magic = true
-- Show matching brackets when text indicator is over them
opt.showmatch = true
-- How many tenths of a second to blink when matching brackets
opt.mat = 2
-- Never (0) / always (2) show tabline
opt.showtabline = 2
-- hide (0),  show always (2) or (3) global statusline
opt.laststatus = 3
opt.cmdheight = 0
-- hide/show visible characters
opt.list = false
opt.listchars = {
  eol = "↴",
  tab = "▸ ",
  trail = "·",
  extends = ">",
  precedes = "<",
  space = "·",
}
opt.fillchars = {
  diff = " ", -- ╱ ░
  eob = " ",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

-- Recommend for vgit
opt.incsearch = false

-- No annoying sound on errors
opt.errorbells = false
opt.visualbell = false
opt.tm = 500
opt.completeopt = "menu,menuone,noselect"
-- Tab set to two spaces
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smarttab = true
-- linebreak on 500 characters
opt.lbr = true
opt.tw = 500
-- Auto indent
opt.ai = true
-- Smart indent
opt.smartindent = true
-- Disable line wrapping
opt.wrap = false
-- Keep lines below cursor when scrolling
opt.scrolloff = 2
opt.sidescrolloff = 5
-- Don't use temp files
opt.backup = false
opt.wb = false
opt.swapfile = false
-- Insert mode completion setting
opt.completeopt = { "menu", "menuone", "noselect" }

opt.showmode = false
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Keep the cursor position while forward-searching a word.
-- Reference: https://github.com/NvChad/NvChad/issues/1224
-- TODO: map # key as well and activate backward search
-- TODO: Set mapping via laod_mappings. Does not work yet.
local function shine_forward()
  vim.fn.setreg("/", "\\<" .. vim.fn.expand "<cword>" .. "\\>")
  vim.opt.hlsearch = true
end
vim.keymap.set("n", "*", shine_forward, { silent = true, noremap = true })
