-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("config.vscode-neovim")
end

require("config.lazy")
