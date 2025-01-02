return {
  -- {
  --   "blink.cmp",
  --   dependencies = "rafamadriz/friendly-snippets",
  --   version = "*",
  --   opts = {
  --     appearance = {
  --       use_nvim_cmp_as_default = true,
  --       nerd_font_variant = "mono",
  --     },
  --     completion = {
  --       accept = { auto_brackets = { enabled = false } },
  --     },
  --     keymap = {
  --       preset = "default",
  --     },
  --     sources = {
  --       default = { "lsp", "path", "snippets", "buffer" },
  --     },
  --   },
  --   opts_extend = { "sources.default" },
  -- },
  {
    "saghen/blink.cmp",
    lazy = false,
    build = "cargo build --release",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "luasnip", "buffer", "lazydev" },
        cmdline = {},
        providers = {
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lazy_dev" } },
        },
      },
      keymap = {
        -- Scrolling
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        -- Completion
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<Space>"] = { "accept", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = {
          "select_next",
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = {
          "select_prev",
          "snippet_backward",
          "fallback",
        },
      },
      completion = {
        keyword = { range = "full" },
        list = { selection = "manual" },
        accept = { auto_brackets = { enabled = false } },
        documentation = { auto_show = true, auto_show_delay_ms = 100 },
        ghost_text = { enabled = true },
      },
      snippets = {
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require("luasnip").jumpable(filter.direction)
          end
          return require("luasnip").in_snippet()
        end,
        jump = function(direction)
          require("luasnip").jump(direction)
        end,
      },
    },
    dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
  },
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load()

      vim.api.nvim_create_autocmd("ModeChanged", {
        group = vim.api.nvim_create_augroup("clear-snippets-on-mode-change", { clear = true }),
        pattern = { "s:n", "i:*" },
        callback = function(args)
          local luasnip = require("luasnip")
          if luasnip.session.current_nodes[args.buf] and not luasnip.session.jump_active then
            luasnip.unlink_current()
          end
        end,
      })
    end,
  },
}
