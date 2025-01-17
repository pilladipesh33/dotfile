return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_default",
      -- colorscheme = "mellow",
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
          styles = {
            comments = "italic",
            functions = "italic",
            variables = "italic",
            conditionals = "bold",
            strings = "NONE",
          },
          -- inverse = {
          --   match_paren = true,
          --   -- visual = true,
          -- },
          darken = {
            floats = true,
            sidebars = {
              enable = true,
              list = {},
            },
          },
        },
      })
    end,
  },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("cyberdream").setup({
  --       transparent = true,
  --       italic_comments = true,
  --       hide_fillchars = true,
  --       terminal_colors = false,
  --       cache = true,
  --       borderless_telescope = { border = false, style = "flat" },
  --       theme = {
  --         variant = "auto",
  --       },
  --     })
  --   end,
  -- },
}
