return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "meuter/lualine-so-fancy.nvim",
    },
    opts = {
      options = {
        theme = "seoul256",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          { "fancy_mode", width = 3 },
          {
            "buffers",
            show_modified_status = true,
            max_length = 3,
          },
        },
        lualine_b = {
          { "fancy_branch" },
          { "fancy_diff" },
        },
        lualine_c = {
          { "fancy_cwd", substitute_home = true },
        },
        lualine_x = {
          { "fancy_macro" },
          { "fancy_diagnostics" },
          { "fancy_searchcount" },
          { "fancy_location" },
        },
        lualine_y = {
          { "fancy_filetype", ts_icon = "" },
        },
        lualine_z = {
          { "fancy_lsp_servers" },
        },
      },
    },
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = function(_, opts)
  --     opts = {
  --       options = {
  --         -- Disable sections and component separators
  --         component_separators = "",
  --         theme = colors,
  --         section_separators = "",
  --       },
  --       sections = {
  --         -- these are to remove the defaults
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_y = {},
  --         -- These will be filled later
  --         lualine_z = {},
  --         lualine_c = {},
  --         lualine_x = {},
  --       },
  --       inactive_sections = {
  --         -- these are to remove the defaults
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_y = {},
  --         -- lualine_z = {},
  --         lualine_c = {},
  --         lualine_x = {},
  --       },
  --     }
  --     -- ╭───────────────────────────────────────────────────────────────────╮
  --     -- │                             lualine_c                             │
  --     -- ╰───────────────────────────────────────────────────────────────────╯
  --     opts.sections.lualine_c[#opts.sections.lualine_c] = {
  --       { "buffers" },
  --       {
  --         "branch",
  --         icon = "",
  --       },
  --       {
  --         "diff",
  --         symbols = { added = " ", modified = " ", removed = " " },
  --         diff_color = {
  --           added = { fg = "#7cba6f" },
  --           modified = { fg = "#76c4c4" },
  --           removed = { fg = "#be6044" },
  --         },
  --         -- cond = conditions.hide_in_width,
  --       },
  --       {
  --         "diagnostics",
  --         sources = { "nvim_diagnostic" },
  --         symbols = { error = " ", warn = " ", info = " " },
  --         diff_color = {
  --           added = { fg = "#7cba6f" },
  --           modified = { fg = "#76c4c4" },
  --           removed = { fg = "#be6044" },
  --         },
  --         {
  --           function()
  --             return "%="
  --           end,
  --         },
  --       },
  --     }
  --
  --     -- ╭───────────────────────────────────────────────────────────────────╮
  --     -- │                             lualine_z                             │
  --     -- ╰───────────────────────────────────────────────────────────────────╯
  --     opts.sections.lualine_z = {
  --       { "buffers" },
  --     }
  --
  --     -- ╭───────────────────────────────────────────────────────────────────╮
  --     -- │                             lualine_x                             │
  --     -- ╰───────────────────────────────────────────────────────────────────╯
  --     opts.sections.lualine_x = {
  --       {
  --         "location",
  --       },
  --       {
  --         "encoding",
  --       },
  --       {
  --         "filetype",
  --       },
  --     }
  --   end,
  -- },
}
