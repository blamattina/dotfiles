return {
  -- Snippet Engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Pre-built snippets
    },
    config = function()
      -- Load snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Load custom snippets from snippets directory
      require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/.config/nvim/snippets" })
    end,
  },

  -- Completion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Snippet engine
      "L3MON4D3/LuaSnip",

      -- Completion sources
      "hrsh7th/cmp-nvim-lsp",     -- LSP completions
      "hrsh7th/cmp-buffer",       -- Buffer word completions
      "hrsh7th/cmp-path",         -- File path completions
      "hrsh7th/cmp-cmdline",      -- Command-line completions
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Helper function to check if we can expand or jump
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- Completion menu appearance
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        -- Key mappings
        mapping = cmp.mapping.preset.insert({
          -- Tab to select next item or expand snippet
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Shift-Tab to select previous item
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Enter to confirm selection
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Ctrl-Space to manually trigger completion
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Ctrl-e to abort completion
          ["<C-e>"] = cmp.mapping.abort(),

          -- Scroll documentation window
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
        }),

        -- Completion sources (order matters - higher priority first)
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },  -- LSP completions (highest priority)
          { name = "luasnip", priority = 750 },    -- Snippet completions
          { name = "buffer", priority = 500 },     -- Buffer word completions
          { name = "path", priority = 250 },       -- File path completions
        }),

        -- Formatting (how items appear in menu)
        formatting = {
          format = function(entry, vim_item)
            -- Source indicator
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              buffer = "[Buf]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },

        -- Experimental features
        experimental = {
          ghost_text = true, -- Show preview of completion
        },
      })

      -- Command-line completion for `/` (search)
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      -- Command-line completion for `:` (commands)
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  },
}
