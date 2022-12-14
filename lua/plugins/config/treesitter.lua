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
    "toml",
    "typescript",
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
