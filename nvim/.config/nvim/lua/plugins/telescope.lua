return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "scottmckendry/telescope-resession.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = function()
        local install_path = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim"
        vim.cmd("silent !cd " .. install_path .. " && make")
      end,
    },
  },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      pickers = {
        find_files = {
          -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          find_command = { "rg", "--files", "--sort=modified" },
        },
      },
      defaults = {
        sorting_strategy = "limit",
        path_display = {
          filename_first = {
            reverse_directories = true,
          },
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            -- ["<cr>"] = select_one_or_multi,
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>fF",
      function()
        -- Get the directory of the currently active buffer
        local cwd = require("telescope.utils").buffer_dir()
        -- Use Telescope's find_files with a specific cwd
        require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
          cwd = cwd,
          prompt_title = "Files in " .. cwd,
        }))
      end,
      desc = "Find Files (Buffer Dir)",
    },

    {
      "<leader>ff",
      function()
        local cwd = vim.fn.getcwd()
        require("telescope").extensions.frecency.frecency(require("telescope.themes").get_ivy({
          workspace = "CWD",
          cwd = cwd,
          prompt_title = "FRECENCY " .. cwd,
        }))
      end,
      desc = "Find Files (Root Dir)",
    },
    {
      "<leader><Space>",
      function()
        local cwd = vim.fn.getcwd()
        require("telescope").extensions.frecency.frecency(require("telescope.themes").get_ivy({
          workspace = "CWD",
          cwd = cwd,
          prompt_title = "FRECENCY " .. cwd,
        }))
      end,
      desc = "Find Files (Root Dir) [Space]",
    },

    {
      "<leader>sG",
      function()
        local cwd = require("telescope.utils").buffer_dir()
        require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({
          cwd = cwd,
          prompt_title = "GREP " .. cwd,
        }))
      end,
      desc = "[P]Grep (buffer dir)",
    },

    -- I want to grep with fzf-lua, so disabling/disable this keymap for telescope
    -- { "<leader>sg", LazyVim.pick("live_grep", { root = false, theme = "ivy" }), desc = "Grep (Root Dir)" },
    -- {
    --   "<leader>sg",
    --   function()
    --     local cwd = vim.fn.getcwd()
    --     require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({
    --       -- gets current working directory
    --       cwd = cwd,
    --       prompt_title = "GREP " .. cwd,
    --     }))
    --   end,
    --   desc = "[P]Grep (Root Dir)",
    -- },

    -- { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status(require("telescope.themes").get_ivy({
          layout_config = {
            -- Set preview width, 0.7 sets it to 70% of the window width
            preview_width = 0.7,
            -- height = 0.2,
          },
          initial_mode = "normal", -- Start in normal mode
        }))
      end,
      desc = "Git Status (ivy theme with custom preview size)",
    },

    {
      "<leader><BS>",
      "<cmd>e #<cr>",
      desc = "Alternate buffer",
    },

    -- fzf-lua takes over this keymap, since I disaled fzf-lua, this keymap is
    -- gone, so I need to add it here for it to work
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
  },
}
