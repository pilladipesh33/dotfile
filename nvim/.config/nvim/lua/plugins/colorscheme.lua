return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vague",
    },
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda"
    end,
  },
  {
    -- vague colorscheme
    "vague2k/vague.nvim",
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = true,
        style = {
          boolean = "bold",
          strings = "none",
          functions = "italic",
          variables = "italic",
        },
      })
    end,
  },
}
