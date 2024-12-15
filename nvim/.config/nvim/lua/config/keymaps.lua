-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local discipline = require("discipline.discipline")
discipline.cowboy()

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

-- -- Move lines up and down in normal mode using Ctrl+j and Ctrl+k
keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- -- Move lines up and down in visual mode using Ctrl+j and Ctrl+k
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

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
