-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Load vimrc
local home_vimrc = vim.fn.expand("$HOME/.vimrc")
local config_vimrc = vim.fn.expand(vim.fn.stdpath("config") .. "/lua/config/.vimrc")
if vim.fn.has("win32") == 1 then
  home_vimrc = vim.fn.expand("$HOME/_vimrc")
end
if vim.fn.filereadable(home_vimrc) == 1 then
  vim.cmd("source " .. home_vimrc)
  print("source " .. home_vimrc)
elseif vim.fn.filereadable(config_vimrc) == 1 then
  vim.cmd("source " .. config_vimrc)
  print("source " .. config_vimrc)
end

-- python file
vim.cmd([[
au BufNewFile,BufRead *.py
    \ :set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix
]])

-- web
vim.cmd([[
au BufNewFile,BufRead *.js, *.html, *.css
    \ :set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
]])
