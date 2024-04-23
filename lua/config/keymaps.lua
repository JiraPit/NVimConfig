-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
LazyVim.safe_keymap_set({ "v", "n", "i" }, "<S-Up>", "5<Up>")
LazyVim.safe_keymap_set({ "v", "n", "i" }, "<S-Down>", "5<Down>")
