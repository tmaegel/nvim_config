return {
  -- init_options = {
  --   onlyAnalyzeProjectsWithOpenFiles = true,
  --   suggestFromUnimportedLibraries = true,
  --   closingLabels = flutter_config.closing_labels.enabled,
  --   outline = true,
  --   flutterOutline = true,
  -- },
  -- handlers = {
  --   ["dart/textDocument/publishClosingLabels"] = closing_labels.closing_labels,
  -- },
  settings = {
    dart = {
      -- An array of paths (absolute or relative to each workspace folder)
      -- that should be excluded from analysis.
      -- analysisExcludedFolders = {
      --   path.join(flutter_sdk_path, "packages"),
      --   path.join(flutter_sdk_path, ".pub-cache"),
      -- },
      enableSdkFormatter = true,
      updateImportsOnRename = true,
      -- Completes functions/methods with their required parameters.
      completeFunctionCalls = true,
      -- Whether to generate diagnostics for TODO comments.
      showTodos = true,
      lineLength = 80,
      enableSnippets = false,
    },
  },
}
