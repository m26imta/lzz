-- python3 -m venv venv
-- source ./venv/bin/activate
-- pip install pynvim ipython jupytext jupyter_client notebook

return true
    and {
      { import = "lazyvim.plugins.extras.lang.python" },

      -- ipynb molten
      {
        "benlubas/molten-nvim",
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
          function MoltenInitPython()
            vim.cmd([[
            let py=has("win32")==1?"python":"python3"
            "":MoltenInit py
            if has("win32")
            :MoltenInit python
            else
            :MoltenInit python3
            endif
            :MoltenEvaluateArgument a=5
          ]])
          end

          vim.cmd([[
            :command MoltenInitPython lua MoltenInitPython()
          ]])

          -- vim.g.python3_host_prog = vim.fn.expand("$HOME") .. "/.virtualenvs/venv/bin/python3"
          -- vim.g.python3_host_prog = vim.fn.expand("$VIRTUAL_ENV") .. "/bin/python3"
          vim.g.python3_host_prog = vim.fn.has("win32") and "python" or "python3"
          vim.g.molten_image_provider = "none"
          -- vim.g.molten_image_provider = "image.nvim"
          vim.g.molten_use_border_highlights = true
          -- add a few new things

          -- don't change the mappings (unless it's related to your bug)
          vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>")
          vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>")
          vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>")
          vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
          vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>")
          vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>")
          vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>")
        end,
      },
      {
        "3rd/image.nvim",
        enabled = false,
        opts = {
          backend = "kitty",
          integrations = {},
          max_width = 100,
          max_height = 12,
          max_height_window_percentage = math.huge,
          max_width_window_percentage = math.huge,
          window_overlap_clear_enabled = true,
          window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
        version = "1.1.0", -- or comment out for latest
      },

      --
      -- ipynb notebook_navigator
      {
        "GCBallesteros/NotebookNavigator.nvim",
        ft = "python",
        keys = {
          { "[h", "<cmd>lua require('notebook-navigator').move_cell('u')<cr>" },
          { "]h", "<cmd>lua require('notebook-navigator').move_cell('d')<cr>" },
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
  or {}
