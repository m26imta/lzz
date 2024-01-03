-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

map("n", "<M-,>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-.>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-,>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-.>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-,>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-.>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
