-- https://github.com/hrsh7th/nvim-cmp
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Snippets source for nvim-cmp
      "hrsh7th/cmp-nvim-lsp-signature-help", -- Source for displaying function signatures
      "hrsh7th/cmp-nvim-lua", -- Source for neovim Lua API
      "hrsh7th/cmp-buffer", -- Source for text in buffer
      "hrsh7th/cmp-path", -- Source for file system paths
      "hrsh7th/cmp-cmdline", -- Source for vim's cmdline
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local base16 = require("theme.utils").get_theme_tb "base_16"
      local colors = require("theme.utils").get_theme_tb "base_30"

      require("theme.utils").load_highlight {
        -- nvim cmp
        CmpItemAbbr = { fg = colors.white },
        CmpItemAbbrMatch = { fg = colors.blue, bold = true },
        CmpBorder = { fg = colors.grey, bg = colors.black },
        CmpDocBorder = { fg = colors.grey, bg = colors.black },
        CmpPmenu = { bg = colors.black },

        -- cmp item kinds
        CmpItemKindConstant = { fg = base16.base09 },
        CmpItemKindFunction = { fg = base16.base0D },
        CmpItemKindIdentifier = { fg = base16.base08 },
        CmpItemKindField = { fg = base16.base08 },
        CmpItemKindVariable = { fg = base16.base0E },
        CmpItemKindSnippet = { fg = colors.red },
        CmpItemKindText = { fg = base16.base0B },
        CmpItemKindStructure = { fg = base16.base0E },
        CmpItemKindType = { fg = base16.base0A },
        CmpItemKindKeyword = { fg = base16.base07 },
        CmpItemKindMethod = { fg = base16.base0D },
        CmpItemKindConstructor = { fg = colors.blue },
        CmpItemKindFolder = { fg = base16.base07 },
        CmpItemKindModule = { fg = base16.base0A },
        CmpItemKindProperty = { fg = base16.base08 },
        -- CmpItemKindEnum = { fg = "" },
        CmpItemKindUnit = { fg = base16.base0E },
        -- CmpItemKindClass = { fg = "" },
        CmpItemKindFile = { fg = base16.base07 },
        -- CmpItemKindInterface = { fg = "" },
        CmpItemKindColor = { fg = colors.red },
        CmpItemKindReference = { fg = base16.base05 },
        -- CmpItemKindEnumMember = { fg = "" },
        CmpItemKindStruct = { fg = base16.base0E },
        -- CmpItemKindValue = { fg = "" },
        -- CmpItemKindEvent = { fg = "" },
        CmpItemKindOperator = { fg = base16.base05 },
        CmpItemKindTypeParameter = { fg = base16.base08 },
        CmpItemKindCopilot = { fg = colors.green },
      }

      cmp.setup {
        completion = {
          completeopt = "menu,menuone,noselect,noinsert",
        },
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            border = require("utils").set_border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          },
          documentation = {
            border = require("utils").set_border "CmpDocBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          },
        },
        formatting = {
          format = function(_, vim_item)
            local icons = require("theme.icons").lspkind
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
        -- Disabling completion in certain contexts, such as comments.
        enabled = function()
          if
            require("cmp.config.context").in_treesitter_capture "comment" == true
            or require("cmp.config.context").in_syntax_group "Comment"
          then
            return false
          else
            return true
          end
        end,
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<ESC>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm {
            -- behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        experimental = {
          ghost_text = true,
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path", option = { trailing_slash = true } },
        },
      }

      -- `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-nvim-lua" },
  {
    "hrsh7th/cmp-cmdline",
    dependencies = {
      "hrsh7th/cmp-buffer",
    },
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  --
  -- Snippets
  --
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/snippets" } }
      require("luasnip").filetype_extend("python", { "django", "django-rest" })
      require("luasnip").filetype_extend("dart", { "flutter" })
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },
}
