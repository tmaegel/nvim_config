local mason = require "mason"
local ensure_installed = {
  -- python
  "pyright",
  "black",
  "flake8",
  "isort",
  "mypy",
  -- shell
  "bash-language-server",
  -- lua stuff
  "lua-language-server",
  "stylua",
  -- web dev
  "typescript-language-server",
}

vim.api.nvim_create_augroup("_mason", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "mason",
  callback = function()
    require("theme").load_highlight "mason"
  end,
  group = "_mason",
})

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
end, {})

mason.setup {
  -- Where Mason should put its bin location in your PATH. Can be one of:
  -- * "prepend" (default, Mason's bin location is put first in PATH)
  -- * "append" (Mason's bin location is put at the end of PATH)
  -- * "skip" (doesn't modify PATH)
  -- * @type '"prepend"' | '"append"' | '"skip"'
  PATH = "prepend",

  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = true,
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
    keymaps = {
      -- Keymap to expand a package
      toggle_server_expand = "<CR>",
      -- Keymap to install the package under the current cursor position
      install_server = "i",
      -- Keymap to reinstall/update the package under the current cursor position
      update_server = "u",
      -- Keymap to check for new version for the package under the current cursor position
      check_server_version = "c",
      -- Keymap to update all installed packages
      update_all_servers = "U",
      -- Keymap to check which installed packages are outdated
      check_outdated_servers = "C",
      -- Keymap to uninstall a package
      uninstall_server = "X",
      -- Keymap to cancel a package installation
      cancel_installation = "<C-c>",
    },
  },

  -- Limit for the maximum amount of packages to be installed at the same time
  -- Once this limit is reached, any further
  -- packages that are requested to be installed will be put in a queue.
  max_concurrent_installers = 10,
}
