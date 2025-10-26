local python_root_files = {
  "WORKSPACE", -- added for Bazel; items below are from default config
  "pyproject.toml",
  "setup.py",
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  "pyrightconfig.json",
  ".git",
}

return {
  root_dir = require("lspconfig").util.root_pattern(unpack(python_root_files)),
}
