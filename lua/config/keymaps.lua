-- Add any additional keymaps here
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
LazyVim.safe_keymap_set({ "n" }, "<leader>i", "$a")
LazyVim.safe_keymap_set({ "v", "n" }, "-", "$")
LazyVim.safe_keymap_set({ "v", "n" }, "<C-Left>", "b")
LazyVim.safe_keymap_set({ "v", "n" }, "<C-Right>", "w")
LazyVim.safe_keymap_set({ "v", "n" }, "<C-Down>", "5<Down>")
LazyVim.safe_keymap_set({ "v", "n" }, "<C-Up>", "5<Up>")
LazyVim.safe_keymap_set({ "v", "n" }, "<C-j>", "5<Down>")
LazyVim.safe_keymap_set({ "v", "n" }, "<C-k>", "5<Up>")
LazyVim.safe_keymap_set({ "v", "n" }, "<C-h>", "b")
LazyVim.safe_keymap_set({ "v", "n" }, "<C-l>", "w")
