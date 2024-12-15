return {
  "supermaven-inc/supermaven-nvim",
  cmd = { "SuperMaven" },
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    })
    local lspkind = require("lspkind")
    lspkind.init({
      symbol_map = {
        SuperMaven = " ",
      },
    })
  end,
}
