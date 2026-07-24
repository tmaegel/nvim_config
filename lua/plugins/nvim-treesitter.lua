-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install {
      "bash",
      "css",
      "dart",
      "dockerfile",
      "go",
      "gotmpl",
      "hcl",
      "helm",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "python",
      "terraform",
      "toml",
      "typescript",
      "vim",
      "yaml",
    }

    -- Enable highlighting
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "<filetype>" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
