-- NOTE: Specify the trigger character(s) used for luasnip
local trigger_text = ";"

return {
  "saghen/blink.cmp",
  lazy = false,
  build = "cargo build --release",
  dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
  opts = function(_, opts)
    -- So I'm disabling blink.cmp for Telescope
    opts.enabled = function()
      local filetype = vim.bo[0].filetype
      if filetype == "TelescopePrompt" or filetype == "minifiles" then
        return false
      end
      return true
    end

    opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          fallbacks = { "lazy_dev" },
        },
        lsp = {
          name = "lsp",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          kind = "LSP",
          score_offset = 90, -- the higher the number, the higher the priority
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 25,
          fallbacks = { "snippets", "buffer" },
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          },
        },
        buffer = {
          name = "Buffer",
          enabled = true,
          max_items = 3,
          module = "blink.cmp.sources.buffer",
          min_keyword_length = 4,
          score_offset = 15, -- the higher the number, the higher the priority
        },
        snippets = {
          name = "snippets",
          enabled = true,
          min_keyword_length = 2,
          module = "blink.cmp.sources.snippets",
          score_offset = 85, -- the higher the number, the higher the priority
          should_show_items = function()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
            -- NOTE: remember that `trigger_text` is modified at the top of the file
            return before_cursor:match(trigger_text .. "%w*$") ~= nil
          end,
          transform_items = function(_, items)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
            local trigger_pos = before_cursor:find(trigger_text .. "[^" .. trigger_text .. "]*$")
            if trigger_pos then
              for _, item in ipairs(items) do
                item.textEdit = {
                  newText = item.insertText or item.label,
                  range = {
                    start = { line = vim.fn.line(".") - 1, character = trigger_pos - 1 },
                    ["end"] = { line = vim.fn.line(".") - 1, character = col },
                  },
                }
              end
            end
            vim.schedule(function()
              require("blink.cmp").reload("snippets")
            end)
            return items
          end,
        },
      },
      cmdline = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        if type == ":" then
          return { "cmdline" }
        end
        return {}
      end,
    })
    opts.completion = {
      keyword = { range = "full" },
      menu = {
        border = "single",
      },
      accept = { auto_brackets = { enabled = false } },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        window = {
          border = "single",
        },
      },
      ghost_text = {
        enabled = true,
      },
    }
    opts.snippets = {
      preset = "luasnip",
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
    }
    opts.keymap = {
      preset = "default",
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
    }

    return opts
  end,
}
