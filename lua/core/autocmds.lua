-- lua/core/autocmds

local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd("FileType", {
  pattern = "python",
  callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
  end,
})

autocmd("FileType", {
  pattern = "sh",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

autocmd("FileType", {
  pattern = "javascript,javascriptreact,typescript,typescriptreact,css",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

autocmd("FileType", {
  pattern = "html",
  callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
  end,
})

autocmd("FileType", {
  pattern = "htmldjango,django",
  callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
  end,
})

autocmd("FileType", {
  pattern = "json",
  callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
  end,
})

autocmd("FileType", {
  pattern = "markdown,txt",
  callback = function()
    opt.wrap = true
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
  end,
})

autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

autocmd("FileType", {
  pattern = "lua",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- Dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Resize splits if window got resized
-- autocmd({ "VimResized" }, {
--   callback = function()
--     vim.cmd "tabdo wincmd ="
--   end,
-- })
