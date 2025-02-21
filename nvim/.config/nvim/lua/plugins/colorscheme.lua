return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        transparent = true,
        saturation = 0.7,
        italic_comments = true,
        hide_fillchars = true,
        cache = true,
      })
    end,
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
