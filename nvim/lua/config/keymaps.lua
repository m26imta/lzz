-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

if false then
  map("n", "<A-,>", "<cmd>m .+1<cr>==", { desc = "Move down" })
  map("n", "<A-.>", "<cmd>m .-2<cr>==", { desc = "Move up" })
  map("i", "<A-,>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
  map("i", "<A-.>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
  map("v", "<A-,>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
  map("v", "<A-.>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

  map("n", "<A-h>", "v<", { desc = "Indent left" })
  map("n", "<A-l>", "v>", { desc = "Indent right" })
  map("i", "<A-h>", "<ESC>v<gi", { desc = "Indent left" })
  map("i", "<A-l>", "<ESC>v>gi", { desc = "Indent right" })
  map("v", "<A-h>", "<gv", { desc = "Indent left" })
  map("v", "<A-l>", ">gv", { desc = "Indent right" })
end
