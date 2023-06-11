local map_options = {
  noremap = true,
  silent = true
}

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", map_options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Ex<CR>", map_options)
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>cnext<CR>", map_options)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>cprev<CR>", map_options)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
