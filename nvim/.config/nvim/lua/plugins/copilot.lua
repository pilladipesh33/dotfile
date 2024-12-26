return {
  {
    "jellydn/avante-copilot.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
      provider = "copilot", -- You can then change this provider here
      -- provider = "claude",
      mappings = {
        ask = "<leader>ra",
        edit = "<leader>re",
        refresh = "<leader>rr",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      "MunifTanjim/nui.nvim",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
    },
    config = function(_, options)
      require("avante").setup(options)

      local wk = require("which-key")
      wk.add({
        { "<leader>ra", desc = "Ask AI" },
        { "<leader>re", desc = "Edit selected" },
        { "<leader>rr", desc = "Refresh AI" },
      })
    end,
  },
}
