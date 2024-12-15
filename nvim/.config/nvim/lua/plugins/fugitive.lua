return {
  -- {
  --     "NeogitOrg/neogit",
  -- dependencies = {
  --   "nvim-lua/plenary.nvim", -- required
  --   "sindrets/diffview.nvim", -- optional - Diff integration
  --
  --   -- Only one of these is needed.
  --   "nvim-telescope/telescope.nvim", -- optional
  --   "ibhagwan/fzf-lua", -- optional
  --   "echasnovski/mini.pick", -- optional
  -- },
  -- config = true,
  -- event = "LazyFile",
  -- }
{
"tpope/vim-fugitive",
event = "LazyFile",
keys = {
    {
    "<leader>gb",
    function()
        vim.ui.input({ prompt = "New branch name: " }, function(branch_name)
        if branch_name then
            vim.cmd('Git checkout -b ' .. branch_name)
        end
        end)
    end,
    desc = "Create and checkout new branch",
    },
},
},
}
