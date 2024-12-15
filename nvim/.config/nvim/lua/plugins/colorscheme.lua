return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, _opts)
      return {
        style = "moon",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        sidebars = {
          "qf",
          "vista_kind",
          "spectre_panel",
          "NeogitStatus",
          "startuptime",
          "Outline",
        },
      }
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
          darken = {
            floats = false,
          },
          inverse = {
            match_paren = true,
            visual = true,
            search = true,
          },
        },
      })
    end,
  },
  -- {
  --   "cdmill/neomodern.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("neomodern").setup({
  --       -- Main options --
  --       style = "roseprime", -- choose between 'iceclimber', 'coffeecat', 'darkforest', 'campfire', 'roseprime', 'daylight'
  --       toggle_style_key = nil, -- keymap to cycle between styles
  --       toggle_style_list = { -- a table of which styles to cycle through, by default all styles are included
  --         "iceclimber",
  --         "coffeecat",
  --         "darkforest",
  --         "campfire",
  --         "roseprime",
  --         "daylight",
  --       },
  --       transparent = true, -- don't set background
  --       term_colors = true, -- if true enable the terminal
  --
  --       -- Formatting --
  --       code_style = {
  --         comments = "italic",
  --         conditionals = "none",
  --         functions = "italic",
  --         keywords = "none",
  --         headings = "bold", -- markdown headings
  --         operators = "none",
  --         keyword_return = "none",
  --         strings = "none",
  --         variables = "none",
  --       },
  --
  --       -- UI options --
  --       ui = {
  --         colored_docstrings = true, -- if true, docstrings will be highlighted like strings, otherwise they will be highlighted like comments
  --         plain_float = false, -- don't set background of floating windows. recommended for when using floating windows with borders
  --         show_eob = true, -- show the end-of-buffer tildes
  --
  --         -- Plugins Related --
  --         lualine = {
  --           bold = true,
  --           plain = true, -- use a less distracting lualine. note: works best when no lualine separators are used
  --         },
  --         cmp = {
  --           plain = true, -- don't highlight lsp-kind items
  --           reverse = false, -- reverse item kind highlights in cmp menu
  --         },
  --         telescope = "bordered", -- choose between 'borderless' or 'bordered'
  --         diagnostics = {
  --           darker = true, -- darker colors for diagnostic
  --           undercurl = true, -- use undercurl for diagnostics
  --           background = true, -- use background color for virtual text
  --         },
  --       },
  --
  --       -- Custom Highlights --
  --       colors = {
  --         comment = "#808080",
  --       }, -- Override default colors
  --       highlights = {}, -- Override highlight groups
  --     })
  --     require("neomodern").load()
  --   end,
  -- },
}
