return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", ":Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        width = 0.8,
        height = 0.8,
      },
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })

    local linux_only_pacakages = {
      "nil",
    }

    local mason_packages = {
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "graphql",
      "emmet_ls",
      "prismals",
      "pyright",
      "prettier", -- prettier formatter
      "stylua", -- lua formatter
      "isort", -- python formatter
      "black", -- python formatter
      "pylint",
      "eslint_d",
    }

    if vim.fn.has("win32") == 0 then
      mason_packages = vim.tbl_extend("force", mason_packages, linux_only_pacakages)
    end

    local mr = require("mason-registry")
    local function ensure_installed()
      for _, tool in ipairs(mason_packages) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
