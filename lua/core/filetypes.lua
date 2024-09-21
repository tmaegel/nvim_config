-- Filetype mappings can be added either by extension or by filename
-- (either the "tail" or the full file path). The full file path is
-- checked first, followed by the file name. If a match is not found
-- using the filename, then the filename is matched against the list
-- of lua-patterns (sorted by priority) until a match is found.
-- https://neovim.io/doc/user/lua.html#vim.filetype.add()

vim.filetype.add {
  pattern = {
    ["Dockerfile_.*"] = "dockerfile",
  },
}

vim.filetype.add {
  extension = {
    automount = "systemd",
    device = "systemd",
    mount = "systemd",
    path = "systemd",
    scope = "systemd",
    service = "systemd",
    slice = "systemd",
    snapshot = "systemd",
    socket = "systemd",
    swap = "systemd",
    timer = "systemd",
  },
}

vim.filetype.add {
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
}
