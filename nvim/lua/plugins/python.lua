return {
  { import = "lazyvim.plugins.extras.lang.python" },

  -- ipynb molten
  {
    "benlubas/molten-nvim",
    enabled = false,
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    -- dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      -- vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_image_provider = "none"
      vim.g.molten_output_win_max_height = 20
      vim.g.python3_host_prog = "python3"

      vim.cmd([[
      :autocmd Filetype python :MoltenInit python3
      ]])

      vim.keymap.set("n", "<leader>mip", ":MoltenInit python3<cr>", { desc = "MoltenInit python3" })
      vim.keymap.set("n", "<leader>mr", ":MoltenEvaluateLine<cr>")
      vim.keymap.set(
        "v",
        "<leader>mr",
        ":lua vim.fn.MoltenEvaluateRange('python3', vim.fn.getpos(\"'<\")[2], vim.fn.getpos(\"'>\")[2])<cr>gv",
        { desc = "Molten run block of code" }
      )
      vim.keymap.set(
        "v",
        "<leader>mvr",
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
