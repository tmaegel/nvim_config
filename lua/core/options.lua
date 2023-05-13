-- lua/core/options

local opt = vim.opt
local g = vim.g

g.mapleader = " "

local options = {
  -- Disable folder in diff mode
  diffopt = opt.diffopt + "context:99999,foldcolumn:0",
  -- Set utf8 as standard encoding and en_US as the standard language
  encoding = "utf8",
  -- Use Unix as the standard file type
  ffs = "unix,dos,mac",
  -- Autosave when navigating between buffers
  autowrite = false,
  -- Auto read when a file is changes from outside
  autoread = true,
  -- Set.how many lines of history vim has to remember
  history = 1000,
  -- Disable folding
  foldenable = false,
  -- Show line numbers
  number = true,
  numberwidth = 2,
  -- Turn on the wild menu
  wildmenu = true,
  -- Always show current postion
  ruler = false,
  -- Enable cursorline
  cursorline = true,
  cursorcolumn = false,
  foldcolumn = "0",
  -- Configure backspace so it acts as it should act
  backspace = "eol,start,indent",
  -- Ignore the case when the search pattern is all lowercase.
  ignorecase = true,
  smartcase = true,
  -- For regular expressions turn magic on
  magic = true,
  -- Show matching brackets when text indicator is over them
  showmatch = true,
  -- How many tenths of a second to blink when matching brackets
  mat = 2,
  -- Never (0) / always (2) show tabline
  showtabline = 0,
  -- Hide (0),  show always (2) or (3) global statusline
  laststatus = 3,
  cmdheight = 0,
  -- Hide/show visible characters
  list = false,
  listchars = {
    eol = "↴",
    tab = "▸ ",
    trail = "·",
    extends = ">",
    precedes = "<",
    space = "·",
  },
  fillchars = {
    diff = " ", -- ╱ ░
    eob = " ",
    -- horiz = "━", -- Fallback to default
    -- vert = "┃", -- Fallback to default
    horizup = " ",
    horizdown = " ",
    vertleft = " ",
    vertright = " ",
    verthoriz = " ",
  },
  -- Recommend for vgit
  incsearch = false,
  -- No annoying sound on errors
  errorbells = false,
  visualbell = false,
  tm = 500,
  -- Tab set to two spaces
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  smarttab = true,
  -- Linebreak on 500 characters
  lbr = true,
  tw = 500,
  -- Auto indent
  ai = true,
  -- Smart indent
  smartindent = true,
  -- Disable line wrapping
  wrap = false,
  -- Keep lines below cursor when scrolling
  scrolloff = 2,
  sidescrolloff = 5,
  -- Don't use temp files
  backup = false,
  wb = false,
  swapfile = false,
  -- Insert mode completion setting
  completeopt = { "menu", "menuone", "noselect" },
  showmode = false,
  clipboard = "unnamedplus",
  mouse = "a",
  -- Disable nvim intro
  shortmess = opt.shortmess + "sI",
  signcolumn = "yes",
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  timeoutlen = 400,
  undofile = true,
  -- Interval for writing swap file to disk, also used by gitsigns
  updatetime = 250,
  -- Go to previous/next line with h,l,left arrow and right arrow
  -- when cursor reaches end/beginning of line
  whichwrap = opt.whichwrap + "<>[]hl",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

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
