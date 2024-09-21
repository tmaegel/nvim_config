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
        line = "require('onedarkpro.helpers').lighten('bg', 3, 'onedark')",
        border = "#31353d",
        bg_lighter = "#252931",
        bg_darker = "#1b1f27",
        light_gray = "require('onedarkpro.helpers').darken('gray', 15, 'onedark')",
        diff_add = "#273732",
        diff_delete = "#362B31",
        diff_change = "#273732",
        diff_text = "#395844",
      },
    },
    highlights = {
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
      -- Git
      --
      DiffAdd = { bg = "${diff_add}" }, -- diff mode: Added line |diff.txt|
      DiffChange = { bg = "${diff_change}" }, -- diff mode: Changed line |diff.txt|
      DiffDelete = { bg = "${diff_delete}" },
      DiffText = { bg = "${diff_text}" }, -- diff mode: Changed text within a changed line |diff.txt|

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
      CmpPmenu = { bg = "${bg}" },
      CmpBorder = { fg = "${border}" },
      CmpDocBorder = { fg = "${border}" },

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
      TelescopeSelectionCaret = { fg = "${bg}", bg = "${blue}" },
      TelescopeMatching = { fg = "${red}" },

      --
      -- Incline
      --
      InclineNormal = { fg = "${bg}", bg = "${blue}" },
      InclineNormalNC = { fg = "${fg}", bg = "${bg}" },

      --
      -- Indent-blankline
      --
      IndentLine = { fg = "${line}" },
      IndentBlanklineContextChar = { fg = "${light_gray}" },

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
      gitsigns = true,
      indentline = true,
      nvim_cmp = true,
      telescope = false,
      treesitter = true,
      trouble = true,
      which_key = true,
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
