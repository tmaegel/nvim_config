-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
  "lukas-reineke/indent-blankline.nvim",
  tag = "v3.7.2",
  main = "ibl",
  config = function()
    require("ibl").setup {
      indent = {
        char = "▏",
        highlight = "IblIndent",
      },
      scope = {
        char = "▏",
        show_start = true,
        show_end = true,
        show_exact_scope = true,
        highlight = "IblScope",
      },
    }
    local hooks = require "ibl.hooks"
    -- Replaces the first indentation guide for space indentation with a normal space.
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      group = vim.api.nvim_create_augroup("autocmd_ibl_enable", { clear = true }),
      callback = function()
        require("ibl").setup_buffer(0, { enabled = true })
      end,
    })
    vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
      group = vim.api.nvim_create_augroup("autocmd_ibl_disable", { clear = true }),
      callback = function()
        require("ibl").setup_buffer(0, { enabled = false })
      end,
    })
  end,
}
