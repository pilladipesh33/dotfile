return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy-load on file read or new file creation
  opts = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        toml = { "taplo" },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = true,
      --   timeout_ms = 1000,
      -- },

      format_after_save = function()
        if not vim.g.autoformat then
          return
        else
          if vim.bo.filetype == "ps1" then
            vim.lsp.buf.format()
            return
          end
          return { lsp_format = "fallback" }
        end
      end,

      formatters = {
        goimports_reviser = {
          command = "goimports-reviser",
          args = { "-output", "stdout", "$FILENAME" },
        },
      },
    })

    -- Override prettier's default indent type
    require("conform").formatters.prettier = {
      prepend_args = { "--tab-width", "4" },
    }

    -- -- Keymap to trigger formatting manually
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
