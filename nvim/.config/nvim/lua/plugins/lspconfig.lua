return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    "Bilal2453/luvit-meta",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "smiteshp/nvim-navic",
    "yioneko/nvim-vtsls",
  },
  config = function()
    local lspconfig = require("lspconfig")
    -- local mason_lspconfig = require("mason-lspconfig")
    require("lspconfig.ui.windows").default_options.border = "rounded"

    -- Diagnostics
    vim.diagnostic.config({
      signs = true,
      underline = true,
      update_in_insert = true,
      virtual_text = {
        source = "if_many",
        prefix = "●",
      },
    })

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Run setup for no_config_servers
    local no_config_servers = {
      "docker_compose_language_service",
      "dockerls",
      "html",
      "jsonls",
      "nil_ls",
      "tailwindcss",
      "taplo",
      "templ", -- requires gopls in PATH, mason probably won't work depending on the OS
      "yamlls",
      "emmet_ls",
    }
    for _, server in pairs(no_config_servers) do
      lspconfig[server].setup({})
    end

    -- Lua
    lspconfig.lua_ls.setup({
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.uv.fs_stat(path .. "/.luarc.json") and not vim.uv.fs_stat(path .. "/.luarc.jsonc") then
          client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
              },
            },
          })

          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end,
    })
  end,
}
