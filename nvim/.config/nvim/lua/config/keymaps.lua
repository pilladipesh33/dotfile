local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--Escape
keymap.set("i", "jk", "<Esc>", opts)

--Tab
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
  require("craftzdog.lsp").toggleInlayHints()
end)

-- lazy
keymap.set("n", "<leader>l", ":Lazy<cr>", { desc = "Lazy" })

-- -- Move lines up and down in normal mode using Ctrl+j and Ctrl+k
keymap.set("n", "<A-j>", ":m.+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m.-2<CR>==", { desc = "Move line up" })

-- -- Replace lazygit with neogit
keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Open Fugitive" })

-- -- VIM-FUGITIVE BINDING
keymap.set("n", "<space>ga", ":Git add %:p<CR><CR>", { desc = "Git add current file" })
keymap.set("n", "<space>gs", ":Gstatus<CR>", { desc = "Git status" })
keymap.set("n", "<space>gc", ":Gcommit -v -q<CR>", { desc = "Git commit" })
keymap.set("n", "<space>gt", ":Gcommit -v -q %:p<CR>", { desc = "Git commit current file" })
keymap.set("n", "<space>gd", ":Gdiff<CR>", { desc = "Git diff" })
keymap.set("n", "<space>ge", ":Gedit<CR>", { desc = "Git edit" })
keymap.set("n", "<space>gr", ":Gread<CR>", { desc = "Git read" })
keymap.set("n", "<space>gw", ":Gwrite<CR><CR>", { desc = "Git write" })
keymap.set("n", "<space>gl", ":0Gllog", { desc = "Git log" })
keymap.set("n", "<space>gp", ":Ggrep ", { desc = "Git grep" })
keymap.set("n", "<space>gm", ":Gmove ", { desc = "Git move" })
keymap.set("n", "<space>gb", ":Git branch ", { desc = "Git branch" })
keymap.set("n", "<space>go", ":Git checkout ", { desc = "Git checkout" })
keymap.set("n", "<space>gps", ":Dispatch! git push<CR>", { desc = "Git push" })
keymap.set("n", "<space>gpl", ":Dispatch! git pull<CR>", { desc = "Git pull" })

-- Code/LSP
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap.set("n", "<leader>cl", ":LspInfo<cr>", { desc = "LSP Info" })
keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
keymap.set("n", "K", function()
  return vim.lsp.buf.hover()
end, { desc = "Hover" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
keymap.set("n", "gr", ":Telescope lsp_references<cr>", { desc = "Goto References" })
keymap.set("n", "gI", function()
  require("telescope.builtin").lsp_implementations({ reuse_win = true })
end, { desc = "Goto Implementation" })
keymap.set("n", "gd", function()
  require("telescope.builtin").lsp_definitions({ reuse_win = true })
end, { desc = "Goto Definition" })
keymap.set("n", "gy", function()
  require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
end, { desc = "Goto Type Definition" })
