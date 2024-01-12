""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
  " Change Your Vim Cursor from a Block to Line in Insert Mode
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
  " write as sudo
  "cmap w!! w !sudo tee > /dev/null %
  command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

  " Netrw
  " https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
  let g:netrw_keepdir = 0
  let g:netrw_winsize = 30
  hi! link netrwMarkFile Search
  nnoremap <leader>da :Lexplore %:p:h<CR>
  nnoremap <leader>dd :Lexplore<CR>
  nnoremap <leader>1 :Lexplore<CR>

endif
if has('win32')
  set ff=dos
endif

"" color industry
" set timeoutlen=400
" set clipboard=unnamed,unnamedplus
" set mouse=a number norelativenumber cursorline
" set ts=2 sw=2 sts=2 autoindent smartindent expandtab smarttab
" set ignorecase smartcase incsearch hlsearch noshowmatch
" set nobackup writebackup swapfile undofile
" set iskeyword+=- backspace=indent,eol,start
" set wrap linebreak showbreak=↪ whichwrap+=<,>,[,],h,l
" set scrolloff=0 sidescrolloff=0
set nolist listchars=tab:→\ ,nbsp:␣,trail:•,space:⋅,extends:▶,precedes:◀,eol:↴
"" set enc=utf-8 fenc=utf-8
" set shortmess+=c
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*

"" ToogleWrap & ToogleListchars
nnoremap <F7> :set wrap!<CR>
nnoremap <F8> :set list!<CR>

let mapleader = " "
let localmapleader = "\\"
nnoremap ; :
"inoremap jk <ESC>
"nmap <S-h> <Nop>
"nmap <S-l> <Nop>
"nmap <S-j> <Nop>
"nmap K <Nop>
"nmap <C-s> <Nop>
"nmap <C-e> <Nop>
nmap <C-m> <Nop>
imap <C-m> <Nop>
nnoremap - <C-x>
nnoremap = <C-a>
nnoremap <silent> <C-q><C-s> :write<CR>
nnoremap <silent> <C-q><C-x> :q!<CR>
" nnoremap <silent> <leader>w :w<CR>
" nnoremap <silent> <leader>x :bd!<CR>
"nnoremap <silent> <leader>q :q!<CR>
nnoremap <leader>oo :e $MYVIMRC<CR>
nnoremap <leader>ll :so $MYVIMRC<CR>
nnoremap <ESC> :nohl<CR>

" Buffer
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>
noremap <C-PageUp> :bp<CR>
noremap <C-PageDown> :bn<CR>
" nnoremap <S-Tab> :b#<CR>
nnoremap <M-`> :b#<CR>
" nnoremap <leader>bb :ls<CR>:b<Space>
" nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Move around text in InsertMode & CommandMode
noremap! <C-h> <LEFT>
noremap! <C-l> <RIGHT>
noremap! <C-j> <DOWN>
noremap! <C-k> <UP>

" Better move through wrap line
noremap j g<DOWN>
noremap k g<UP>
inoremap <C-j> <C-o>g<DOWN>
inoremap <C-k> <C-o>g<UP>

" Move around windows
nnoremap <C-h> <C-w><LEFT>
nnoremap <C-l> <C-w><RIGHT>
nnoremap <C-j> <C-w><DOWN>
nnoremap <C-k> <C-w><UP>

" Indent
nnoremap < v<
nnoremap > v>
vnoremap < <gv
vnoremap > >gv
vnoremap <S-h> <gv
vnoremap <S-l> >gv

" Move lines up & down
" nnoremap J mz:m+<cr>`z
" nnoremap K mz:m-2<cr>`z
" vnoremap J :m'>+<cr>`<my`>mzgv`yo`z
" vnoremap K :m'<-2<cr>`>my`<mzgv`yo`z
"nnoremap <S-j> :m .+1<cr>==
"nnoremap <S-k> :m .-2<cr>==
vnoremap <S-j> :m '>+1<cr>gv=gv
vnoremap <S-k> :m '<-2<cr>gv=gv

" yank & paste
inoremap <C-r><C-r> <C-\><C-o>"+P
cnoremap <C-r><C-r> <C-r>+
" noremap  <C-e><C-p> "+P
" inoremap <C-e><C-p> <C-\><C-o>"+P
nnoremap <C-m><C-a> ggVG
"vnoremap p "_dP
nnoremap x "_x
vnoremap al :<C-U>normal 0v$h<CR>
omap al :normal val<CR>
vnoremap il :<C-U>normal ^vg_<CR>
omap il :normal vil<CR>

" quick yank & paste use register `1`
vnoremap <M-1><M-y> "1y|                                        " yank into register `1`
nnoremap <M-1><M-p> "1p|                                        " put after cursor
noremap  <M-1><M-1> "1P|                                        " put before cursor
inoremap <M-1><M-1> <C-\><C-o>"1P
cnoremap <M-1><M-1> <C-r>1


" Search & Replace
vnoremap <C-f> y<ESC>/<C-r>"<CR>
vnoremap <C-r><C-e> "hy:%s/<C-r>h//gc<LEFT><LEFT><LEFT>

" Status line
if &statusline==""
  set showmode
  set laststatus=2
  " set statusline=\ %{&paste==1?'[PASTE\ MODE]\ \ ':''}\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c\ 
  set statusline=\ %{&paste==1?'[PASTE\ MODE]\ \ ':''}\ %t\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ \|\ %l:%c\ 
endif
