-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<Leader>bl", ":e#<cr>", { desc = "Switch to the last buffer" })
vim.keymap.set("n", "<Leader>sf", ":FzfLua grep<cr>", { desc = "Grep for term" })
vim.keymap.set("n", "<Leader>fy", ':let @+ = expand("%")<cr>', { desc = "Copy current file path" })
