return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      lualine_bold = true, -- bold headers for each section header
      day_brightness = 0.15, -- high contrast but colorful
      transparent = true,
      styles = {
        -- Background styles.
        sidebars = "transparent",
        floats = "transparent",
      },

      -- jack up all saturation, default is too dull!
      on_colors = function(colors)
        local hsluv = require("tokyonight.hsluv")
        local hue_shift = 0.95 -- +: purple, -: green
        local saturation_multiplier = 2.50

        for k, v in pairs(colors) do
          if type(v) == "string" and v ~= "NONE" then
            local hsv = hsluv.hex_to_hsluv(v)
            hsv[1] = hsv[1] * hue_shift > 360 and hsv[1] * hue_shift - 360 or hsv[1] * hue_shift
            hsv[2] = hsv[2] * saturation_multiplier > 100 and 100 or hsv[2] * saturation_multiplier
            colors[k] = hsluv.hsluv_to_hex(hsv)
          elseif type(v) == "table" then
            if vim.islist(v) then
              for kk, vv in ipairs(v) do
                if type(vv) == "string" and vv ~= "NONE" then
                  local hsv = hsluv.hex_to_hsluv(vv)
                  hsv[1] = hsv[1] * hue_shift > 360 and hsv[1] * hue_shift - 360 or hsv[1] * hue_shift
                  hsv[2] = hsv[2] * saturation_multiplier > 100 and 100 or hsv[2] * saturation_multiplier
                  colors[k][kk] = hsluv.hsluv_to_hex(hsv)
                end
              end
            else
              for kk, vv in pairs(v) do
                if type(vv) == "string" and vv ~= "NONE" then
                  local hsv = hsluv.hex_to_hsluv(vv)
                  hsv[1] = hsv[1] * hue_shift > 360 and hsv[1] * hue_shift - 360 or hsv[1] * hue_shift
                  hsv[2] = hsv[2] * saturation_multiplier > 100 and 100 or hsv[2] * saturation_multiplier
                  colors[k][kk] = hsluv.hsluv_to_hex(hsv)
                end
              end
            end
          end
        end
      end,
    },
  },
  -- {
  --   "tiagovla/tokyodark.nvim",
  --   opts = {
  --     transparent_background = true, -- set background to transparent
  --     gamma = 1.0, -- adjust the brightness of the theme
  --     styles = {
  --       comments = { italic = true }, -- style for comments
  --       keywords = {}, -- style for keywords
  --       identifiers = {}, -- style for identifiers
  --       functions = {}, -- style for functions
  --       variables = { italic = true }, -- style for variables
  --     },
  --     custom_highlights = {} or function(highlights, palette)
  --       return {}
  --     end, -- extend highlights
  --     custom_palette = {} or function(palette)
  --       return {}
  --     end, -- extend palette
  --     terminal_colors = false, -- enable terminal colors     -- custom options here
  --   },
  --   config = function(_, opts)
  --     require("tokyodark").setup(opts) -- calling setup is optional
  --     vim.cmd([[colorscheme tokyodark]])
  --   end,
  -- },
}
