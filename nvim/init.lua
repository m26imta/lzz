require("user.launch")
table.insert(LAZY_PLUGIN_SPEC, { "LazyVim/LazyVim" })
spec("lazyvim.plugins")

if vim.g.vscode then
  -- load extras_vscode package
  spec("lazyvim.plugins.extras.vscode")

  -- vscode_neovim custom plugins
  spec("vscode_neovim.plugins")

  -- options for vscode_neovim
  -- require("config.options")
  require("vscode_neovim.config.options")
else
  -- LazyVim
  spec("plugins")
end
require("config.lazy")