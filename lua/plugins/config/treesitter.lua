require("theme").load_highlight "treesitter"

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "python",
    "bash",
    "lua",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "toml",
    "markdown",
    "yaml",
    "hcl",
    "dockerfile",
    "dart",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
}
