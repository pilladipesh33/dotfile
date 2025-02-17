return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark_default",
      colorscheme = "tokyonight-night",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        style = "night",
        styles = {
          functions = { italic = true },
          -- variables = { italic = true },
          floats = "transparent",
        },
        lualine_bold = true,
      })
    end,
  },
}
