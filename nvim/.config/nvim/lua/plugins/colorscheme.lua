return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark_default",
      colorscheme = "vesper",
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
  {
    "datsfilipe/vesper.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("vesper").setup({
        transparent = true, -- Boolean: Sets the background to transparent
        italics = {
          comments = true, -- Boolean: Italicizes comments
          keywords = true, -- Boolean: Italicizes keywords
          functions = true, -- Boolean: Italicizes functions
          strings = true, -- Boolean: Italicizes strings
          variables = false, -- Boolean: Italicizes variables
        },
        overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
        palette_overrides = {},
      })
    end,
  },
}
