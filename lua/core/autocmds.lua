-- lua/core/autocmds

local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

autocmd("FileType", {
  group = augroup "ft_python",
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
  group = augroup "ft_shell",
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
  group = augroup "ft_javascript",
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
  group = augroup "ft_html",
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
  group = augroup "ft_django",
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
  group = augroup "ft_json",
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
  group = augroup "ft_txt",
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
  group = augroup "ft_yaml",
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
  group = augroup "ft_lua",
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
  group = augroup "qf_buffer",
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup "highlight_yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup "resize_splits",
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  group = augroup "last_loc",
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
  group = augroup "auto_create_dir",
  callback = function(event)
    if event.match:match "^%w%w+://" then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
