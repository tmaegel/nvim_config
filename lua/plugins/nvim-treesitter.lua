return {
  "nvim-treesitter/nvim-treesitter",
  -- Until https://github.com/nvim-treesitter/nvim-treesitter/issues/4945 is solved.
  commit = "33eb472b459f1d2bf49e16154726743ab3ca1c6d",
  config = function()
    require("theme").load_highlight "treesitter"

    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "css",
        "dart",
        "dockerfile",
        "hcl",
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
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
