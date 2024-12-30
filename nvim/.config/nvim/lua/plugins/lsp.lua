return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    opts = {
      servers = {
        lua_ls = {},
        biome = {},
        cssls = {},
        html = {},
        tailwindcss = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "tailwind.config.js",
              "tailwind.config.cjs",
              "tailwind.config.mjs",
              "tailwind.config.ts"
            )(fname)
          end,
        },
        unocss = {},
      },
    },
    config = function(_, opts)
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("lspconfig").lua_ls.setup({ capabilities = capabilities })

      local ensure_installed = {
        astro = true,
        tailwindcss = true,
        unocss = true,
        volar = true,
        vtsls = true,
      }
      for server, server_opts in pairs(opts.servers) do
        if type(server_opts) == "table" and not ensure_installed[server] then
          server_opts.mason = false
        end
      end
    end,
  },
}
