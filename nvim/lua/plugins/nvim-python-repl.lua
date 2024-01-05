return {
  {
    "geg2102/nvim-python-repl",
    -- enabled = false,
    dependencies = "nvim-treesitter",
    ft = { "python", "lua", "scala" },
    config = function()
      require("nvim-python-repl").setup({
        execute_on_send = false,
        vsplit = false,
        spawn_command = {
          python = "ipython",
          scala = "sbt console",
          lua = "ilua",
        },
      })

      -- vim.keymap.set("n", "", function()
      --   require("nvim-python-repl").send_statement_definition()
      -- end, { desc = "Send semantic unit to REPL" })
      vim.keymap.set("v", "<LocalLeader>rev", function()
        require("nvim-python-repl").send_visual_to_repl()
      end, { desc = "Send visual selection to REPL" })
      -- vim.keymap.set("n", "", function()
      --   require("nvim-python-repl").send_buffer_to_repl()
      -- end, { desc = "Send entire buffer to REPL" })
      vim.keymap.set("n", "<LocalLeader>ret", function()
        require("nvim-python-repl").toggle_execute()
      end, { desc = "Automatically execute command in REPL after sent" })
      vim.keymap.set("n", "<LocalLeader>retv", function()
        require("nvim-python-repl").toggle_vertical()
      end, { desc = "Create REPL in vertical or horizontal split" })
    end,
  },
}
