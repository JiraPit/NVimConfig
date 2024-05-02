-- Add any additional keymaps here
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
LazyVim.safe_keymap_set({ "n" }, "<leader>i", "$a")
LazyVim.safe_keymap_set({ "v", "n" }, "-", "$")
LazyVim.safe_keymap_set({ "v", "n", "i" }, "<C-Left>", "b")
LazyVim.safe_keymap_set({ "v", "n", "i" }, "<C-Right>", "w")
LazyVim.safe_keymap_set({ "v", "n", "i" }, "<S-Down>", "5<Down>")
LazyVim.safe_keymap_set({ "v", "n", "i" }, "<S-Up>", "5<Up>")
