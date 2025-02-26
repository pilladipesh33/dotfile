return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "poimandres",
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
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local p = require("poimandres.palette")
      require("poimandres").setup({
        disable_background = true, -- disable background
        disable_float_background = true, -- disable background for floats
        highlight_groups = {
          LspReferenceText = { bg = p.background1 },
          LspReferenceWrite = { bg = p.background1 },
          LspReferenceRead = { bg = p.background1 },
        },
      })
    end,
  },
}
