return {
  "moll/vim-bbye",
  cmd = { "Bdelete" },
  keys = {
    { "<S-x>", "<cmd>Bdelete!<cr>", desc = "Close current buffer", mode = { "n" }, noremap = true, silent = true },
    -- { "<S-q>" },
  },
}
