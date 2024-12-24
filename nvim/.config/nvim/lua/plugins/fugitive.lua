return {
  {
    "tpope/vim-fugitive",
    event = "LazyFile",
    keys = {
      {
        "<leader>gb",
        function()
          vim.ui.input({ prompt = "New branch name: " }, function(branch_name)
            if branch_name then
              vim.cmd("Git checkout -b " .. branch_name)
            end
          end)
        end,
        desc = "Create and checkout new branch",
      },
    },
  },
}
