return {

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = { char = "┊" },
    },
  },
  { "nvzone/showkeys", cmd = "ShowkeysToggle", lazy = true, opts = {
    position = "top-right",
  } },
}
