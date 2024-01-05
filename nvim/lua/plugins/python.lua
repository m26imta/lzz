return {
  { import = "lazyvim.plugins.extras.lang.python" },

  -- ipynb molten
  {
    "benlubas/molten-nvim",
    -- enabled = false,
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    -- dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      function MoltenInitPython()
        vim.cmd([[
        :MoltenInit python
        :MagmaEvaluateArgument a=5
        ]])
      end

      function MoltenInitCSharp()
        vim.cmd([[
        :MoltenInit .net-csharp
        :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
        ]])
      end

      function MoltenInitFSharp()
        vim.cmd([[
        :MoltenInit .net-fsharp
        :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")
        ]])
      end

      vim.g.magma_automatically_open_output = false
      -- vim.g.molten_image_provider = "image.nvim"
      vim.g.magma_image_provider = "none"
      vim.g.python3_host_prog = "python"

      vim.cmd([[
        nnoremap <silent><expr> <LocalLeader>r  :MoltenEvaluateOperator<CR>
        nnoremap <silent>       <LocalLeader>rr :MoltenEvaluateLine<CR>
        xnoremap <silent>       <LocalLeader>r  :<C-u>MoltenEvaluateVisual<CR>
        nnoremap <silent>       <LocalLeader>rc :MoltenReevaluateCell<CR>
        nnoremap <silent>       <LocalLeader>rd :MoltenDelete<CR>
        nnoremap <silent>       <LocalLeader>ro :MoltenShowOutput<CR>

        :command MoltenInitPython lua MoltenInitPython()
        :command MoltenInitCSharp lua MoltenInitCSharp()
        :command MoltenInitFSharp lua MoltenInitFSharp()
      ]])

      -- vim.cmd([[
      -- :autocmd Filetype python :MoltenInit python
      -- ]])

      vim.keymap.set(
        "v",
        "<LocalLeader>mr",
        ":lua vim.fn.MoltenEvaluateRange('python', vim.fn.getpos(\"'<\")[2], vim.fn.getpos(\"'>\")[2])<cr>gv",
        { desc = "Molten run block of code" }
      )
      vim.keymap.set(
        "v",
        "<LocalLeader>mvr",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        { desc = "execute visual selection", silent = true }
      )
    end,
  },

  -- ipynb notebook_navigator
  {
    "GCBallesteros/NotebookNavigator.nvim",
    ft = "python",
    keys = {
      {
        "]h",
        function()
          require("notebook-navigator").move_cell("d")
        end,
      },
      {
        "[h",
        function()
          require("notebook-navigator").move_cell("u")
        end,
      },
      { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
      "GCBallesteros/jupytext.nvim",
      "echasnovski/mini.ai",
      "echasnovski/mini.comment",
      "hkupty/iron.nvim", -- repl provider
      -- "akinsho/toggleterm.nvim", -- alternative repl provider
      "anuvyklack/hydra.nvim",
    },
    config = function()
      local nn = require("notebook-navigator")
      nn.setup({ activate_hydra_keys = "<leader>h" })
    end,
  },
  {
    "GCBallesteros/jupytext.nvim",
    -- event = "VeryLazy",
    config = function()
      require("jupytext").setup({
        style = "hydrogen",
      })
    end,
  },
  {
    "hkupty/iron.nvim",
    -- enabled = false,
    -- event = "VeryLazy",
    version = false, -- false -> latest commit
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      iron.setup({
        config = {
          -- https://github.com/Vigemus/iron.nvim?tab=readme-ov-file#repl-windows
          -- repl_open_cmd = view.split.vertical.botright(60),
          -- repl_open_cmd = "vertical botright 60 split",
          repl_open_cmd = view.split.vertical.botright(60),
        },
        keymaps = {
          send_motion = "<leader>sc",
          visual_send = "<leader>sc",
          send_file = "<leader>sf",
          exit = "<leader>sq",
          clear = "<leader>cl",
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    -- event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require("notebook-navigator")

      local opts = { highlighters = { cells = nn.minihipatterns_spec } }
      return opts
    end,
  },
  {
    "echasnovski/mini.ai",
    -- event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require("notebook-navigator")

      -- https://github.com/GCBallesteros/NotebookNavigator.nvim?tab=readme-ov-file#yankingdeleting-cells
      -- vah to select the full cell in visual mode.
      local opts = { custom_textobjects = { h = nn.miniai_spec } }
      return opts
    end,
  },
}
