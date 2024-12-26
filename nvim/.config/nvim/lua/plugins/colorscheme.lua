return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
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
  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = false,
        cache = true,
        borderless_telescope = { border = false, style = "flat" },
        theme = {
          variant = "auto",
        },
      })
    end,
  },
}
