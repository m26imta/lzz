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

-- Neovide
if vim.g.neovide then
  local cursor_vfx_mode = { "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe" }
  vim.g.neovide_cursor_vfx_mode = cursor_vfx_mode[6]
  vim.o.guifont = "JetBrainsMono Nerd Font:h11"
  vim.g.neovide_transparency = 0.95
  -- vim.g.neovide_fullscreen = true  -- windowed fullscreen mode
  vim.cmd([[ nnoremap <C-A-m> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR> ]])
  vim.g.neovide_cursor_animation_length = 0.08 -- 0.06
  vim.g.neovide_cursor_trail_size = 0.8 -- 0.7
  -- vim.g.neovide_cursor_antialiasing = false  -- Disabling may fix some cursor visual issues.
end

-- python file
vim.cmd([[
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
]])

-- web
vim.cmd([[
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
]])
