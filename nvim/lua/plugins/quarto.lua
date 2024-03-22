local disabled = false

return disabled and {}
  or {
    {
      "quarto-dev/quarto-nvim",
      ft = { "quarto" },
      dev = false,
      opts = {
        lspFeatures = {
          languages = { "r", "python", "julia", "bash", "lua", "html", "dot", "javascript", "typescript", "ojs" },
          codeRunner = {
            enabled = true,
            default_method = "slime",
          },
        },
      },
      dependencies = {
        {
          "jmbuhr/otter.nvim",
          dev = false,
          dependencies = {
            { "neovim/nvim-lspconfig" },
          },
          opts = {
            lsp = {
              hover = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
              },
            },
            buffers = {
              set_filetype = true,
            },
            handle_leading_whitespace = true,
          },
        },
      },
    },

    -- override nvim-cmp and add cmp-emoji
    {
      "hrsh7th/nvim-cmp",
      dependencies = { "jmbuhr/otter.nvim" },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        table.insert(opts.sources, { name = "otter" }) -- for code chunks in quarto
      end,
    },
  }
