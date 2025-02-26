return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rusty",
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
  {
    "armannikoyan/rusty",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      underline_current_line = true,
    },
    config = function(_, opts)
      require("rusty").setup(opts)
    end,
  },
}
