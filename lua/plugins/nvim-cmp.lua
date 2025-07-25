-- https://github.com/hrsh7th/nvim-cmp
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind.nvim",
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
      local lspkind = require "lspkind"

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
          format = lspkind.cmp_format {
            mode = "symbol_text", -- show only symbol annotations
            preset = "default",
            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            maxwidth = 50,
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
              return vim_item
            end,
          },
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
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
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
          ["<C-x>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.close()
            else
              cmp.complete {}
            end
          end, { "i", "s" }),
        },
        experimental = {
          ghost_text = false,
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
      require("luasnip").filetype_extend("yaml.ansible", { "ansible" })
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },
}
