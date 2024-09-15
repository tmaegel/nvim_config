-- https://github.com/olimorris/onedarkpro.nvim
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  opts = {
    colors = {
      onedark = {
        bg = "#1e222a",
        bg_statusline = "#1e222a",
      },
      dark = {
        white = "#ffffff",
        line = "require('onedarkpro.helpers').lighten('bg', 5, 'onedark')",
        border = "require('onedarkpro.helpers').lighten('bg', 10, 'onedark')",
        bg_lighter = "require('onedarkpro.helpers').lighten('bg', 2, 'onedark')",
        bg_darker = "require('onedarkpro.helpers').darken('bg', 2, 'onedark')",
        light_gray = "require('onedarkpro.helpers').darken('gray', 15, 'onedark')",
        diff_add = "#31392b",
        diff_delete = "#382b2c",
        diff_change = "#1c3448",
        diff_text = "#2c5372",
        codeblock = "require('onedarkpro.helpers').lighten('bg', 2, 'onedark')",
      },
    },
    highlights = {
      ["@markup.raw.block.markdown"] = { bg = "${codeblock}" },
      ["@markup.quote.markdown"] = { italic = true, extend = true },
      ["@markup.list.unchecked.markdown"] = { fg = "${bg}", bg = "${fg}" },

      -- Line
      LineNr = { fg = "${light_gray}" },
      CursorLineNr = { bg = "${bg}", fg = "${fg}" },

      -- Match
      MatchParen = { fg = "${green}" },
      MatchWord = { fg = "${white}", bg = "${bg}" },

      -- Search
      Search = { bg = "${yellow}", fg = "${bg}" },
      Substitute = { bg = "${yellow}", fg = "${bg}" },

      -- Floats
      NormalFloat = { bg = "${bg}" },
      FloatBorder = { fg = "${border}", bg = "${bg}" },
      WinSeparator = { fg = "${line}" },

      Pmenu = { bg = "${bg}" },
      PmenuSbar = { bg = "${bg}" },
      PmenuSel = { bg = "${blue}", fg = "${bg}" },
      PmenuThumb = { bg = "${gray}" },

      --
      -- LSP
      --
      LspReferenceText = { fg = "${bg_darker}", bg = "${fg}" },
      LspReferenceRead = { fg = "${bg_darker}", bg = "${fg}" },
      LspReferenceWrite = { fg = "${bg_darker}", bg = "${fg}" },
      LspFloatWinBorder = { fg = "${border}", bg = "${bg}" },

      DiagnosticError = { fg = "${red}" },
      DiagnosticWarn = { fg = "${yellow}" },
      DiagnosticHint = { fg = "${purple}" },
      DiagnosticInfo = { fg = "${green}" },
      DiagnosticInformation = { fg = "${green}" },

      LspSignatureActiveParameter = { fg = "${bg}", bg = "${green}" },

      DiagnosticUnderlineError = { sp = "${red}", undercurl = true },
      DiagnosticUnderlineWarn = { sp = "${red}", undercurl = true },
      DiagnosticUnderlineHint = { sp = "${red}", undercurl = true },
      DiagnosticUnderlineInfo = { sp = "${red}", undercurl = true },

      LspDiagnosticsFloatingError = { fg = "${red}" },
      LspDiagnosticsFloatingWarn = { fg = "${yellow}" },
      LspDiagnosticsFloatingHint = { fg = "${yellow}" },
      LspDiagnosticsFloatingInfor = { fg = "${green}" },

      DiagnosticLineNrError = { fg = "${red}", bg = "${bg}" },
      DiagnosticLineNrWarn = { fg = "${yellow}", bg = "${bg}" },
      DiagnosticLineNrHint = { fg = "${purple}", bg = "${bg}" },
      DiagnosticLineNrInfo = { fg = "${green}", bg = "${bg}" },

      --
      -- Lazy
      --
      LazyNormal = { bg = "${bg}" },

      -- Virt Column
      VirtColumn = { fg = "${indentline}" },

      -- Luasnip
      LuaSnipChoiceNode = { fg = "${yellow}" },
      LuaSnipInsertNode = { fg = "${yellow}" },

      --
      -- Cmp
      --
      CmpItemAbbr = { fg = "${fg}" }, -- Highlight group for unmatched characters of each completion field.
      CmpItemAbbrMatch = { fg = "${blue}", bold = true }, -- Highlight group for matched characters of each completion field.
      CmpItemAbbrMatchFuzzy = { fg = "${blue}", underline = true }, -- Highlight group for fuzzy-matched characters of each completion field.
      CmpBorder = { fg = "${border}" },
      CmpDocBorder = { fg = "${border}" },
      CmpPmenu = { bg = "${bg}" },
      -- cmp item kinds
      CmpItemKindConstant = { fg = "${yellow}" },
      CmpItemKindFunction = { fg = "${cyan}" },
      CmpItemKindIdentifier = { fg = "${red}" },
      CmpItemKindField = { fg = "${red}" },
      CmpItemKindVariable = { fg = "${purple}" },
      CmpItemKindSnippet = { fg = "${red}" },
      CmpItemKindText = { fg = "${green}" },
      CmpItemKindStructure = { fg = "${purple}" },
      CmpItemKindType = { fg = "${yellow}" },
      CmpItemKindKeyword = { fg = "${fg}" },
      CmpItemKindMethod = { fg = "${cyan}" },
      CmpItemKindConstructor = { fg = "${blue}" },
      CmpItemKindFolder = { fg = "${fg}" },
      CmpItemKindModule = { fg = "${yellow}" },
      CmpItemKindProperty = { fg = "${red}" },
      -- CmpItemKindEnum = { fg = "" },
      CmpItemKindUnit = { fg = "${purple}" },
      -- CmpItemKindClass = { fg = "" },
      CmpItemKindFile = { fg = "${fg}" },
      -- CmpItemKindInterface = { fg = "" },
      CmpItemKindColor = { fg = "${red}" },
      CmpItemKindReference = { fg = "${fg}" },
      -- CmpItemKindEnumMember = { fg = "" },
      CmpItemKindStruct = { fg = "${purple}" },
      -- CmpItemKindValue = { fg = "" },
      -- CmpItemKindEvent = { fg = "" },
      CmpItemKindOperator = { fg = "${fg}" },
      CmpItemKindTypeParameter = { fg = "${red}" },
      CmpItemKindCopilot = { fg = "${green}" },

      --
      -- Telescope
      --
      TelescopePromptTitle = { fg = "${bg}", bg = "${green}" },
      TelescopePromptPrefix = { fg = "${red}" },
      TelescopePromptBorder = { fg = "${bg_lighter}", bg = "${bg_lighter}" },
      TelescopePromptCounter = { fg = "${fg}" },
      TelescopePromptNormal = { fg = "${white}", bg = "${bg_lighter}" },
      TelescopePreviewTitle = { fg = "${bg}", bg = "${purple}" },
      TelescopePreviewNormal = { bg = "${bg_darker}" },
      TelescopePreviewBorder = { fg = "${bg_darker}", bg = "${bg_darker}" },
      TelescopeResultsTitle = { fg = "${bg}", bg = "${bg_darker}" },
      TelescopeResultsDiffAdd = { fg = "${green}" },
      TelescopeResultsDiffChange = { fg = "${yellow}" },
      TelescopeResultsDiffDelete = { fg = "${red}" },
      TelescopeNormal = { bg = "${bg_darker}" },
      TelescopeBorder = { fg = "${bg_darker}", bg = "${bg_darker}" },
      TelescopeSelection = { fg = "${bg}", bg = "${blue}" },
      TelescopeMatching = { fg = "${red}" },

      --
      -- Git / Gitsign
      --
      GitSignsAdd = { fg = "${green}", bg = "none" },
      GitSignsChange = { fg = "${blue}", bg = "none" },
      GitSignsDelete = { fg = "${red}", bg = "none" },
      GitSignsAddNr = { fg = "${green}", bg = "${bg}" },
      GitSignsChangeNr = { fg = "${blue}", bg = "${bg}" },
      GitSignsDeleteNr = { fg = "${red}", bg = "${bg}" },
      GitSignsAddLn = { fg = "none", bg = "${diff_add}" },
      GitSignsChangeLn = { fg = "none", bg = "${diff_change}" },
      GitSignsDeleteLn = { fg = "none", bg = "${diff_delete}" },

      DiffText = { fg = "none", bg = "${diff_text}" },
      DiffAdd = { fg = "none", bg = "${diff_add}" },
      DiffChange = { fg = "none", bg = "${diff_change}" },
      DiffDelete = { fg = "none", bg = "${diff_delete}" },
      DiffAdded = { fg = "${green}" },
      DiffChangeDelete = { fg = "${red}" },
      DiffModified = { fg = "${yellow}" },
      DiffRemoved = { fg = "${red}" },
      GitWordAdd = { bg = "${diff_text}" },
      GitWordDelete = { bg = "${diff_text}" },

      --
      -- Incline
      --
      InclineNormal = { fg = "${bg}", bg = "${blue}" },
      InclineNormalNC = { fg = "${fg}", bg = "${bg}" },

      --
      -- Cybu
      -- @todo
      --
      CybuFocus = { fg = "${bg}", bg = "${blue}" }, -- current / selected buffer
      CybuAdjacent = { fg = "${fg}", bg = "${bg}" }, -- Buffers not in focus
      CybuBackground = { fg = "${fg}", bg = "${bg}" }, -- Window background
      CybuBorder = { fg = "${blue}", bg = "${bg}" }, -- Border of the window
      CybuInfobar = {},

      --
      -- Indent-blankline
      --
      IblIndent = { fg = "${line}" },
      IblScope = { fg = "${light_gray}" },

      --
      -- nvim-code-action-menu
      --
      CodeActionMenuMenuSelection = { fg = "${bg}", bg = "${blue}" },

      --
      -- Which-key
      --
      WhichKeyTitle = { fg = "${bg}", bg = "${green}" }, -- Title of the which-key
    },

    caching = false,
    cache_path = vim.fn.expand(vim.fn.stdpath "cache" .. "/onedarkpro_dotfiles"),

    plugins = {
      gitsigns = false,
      indentline = false,
      telescope = false,
      which_key = true,
      nvim_cmp = false,
    },
    styles = {
      tags = "NONE",
      types = "NONE",
      methods = "NONE",
      numbers = "NONE",
      strings = "NONE",
      comments = "italic",
      keywords = "NONE",
      constants = "NONE",
      functions = "NONE",
      operators = "NONE",
      variables = "NONE",
      parameters = "NONE",
      conditionals = "NONE",
      virtual_text = "NONE",
    },
    options = {
      cursorline = false,
      transparency = true,
      highlight_inactive_windows = false,
    },
  },
  config = function(_, opts)
    require("onedarkpro").setup(opts)
    vim.cmd [[colorscheme onedark]]
  end,
}
