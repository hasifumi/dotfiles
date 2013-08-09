" vim: foldmethod=marker :
"*****************
"  Basic 
"*****************
set number
set ruler
set title
set showcmd
syntax on
set hlsearch
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
set nobackup
set nocompatible
inoremap <silent> jj <ESC>
set wildmenu
set noswapfile
set ttyfast
set cursorline
set fileformat=unix
nmap ,zz :<C-u>set scrolloff=999<CR>
nmap ,zzf :<C-u>set scrolloff=0<CR>
set shellslash
 
"*****************
"  Search
"*****************
nmap <Esc><Esc> :noh<CR>

"*****************
"  Help
"*****************
nnoremap <C-i> :<C-u>help<Space><C-r><C-w><CR>
set helplang=ja

"*****************
"  tab
"*****************
nnoremap <C-l> :<C-u>tabnext<CR>
nnoremap <C-h> :<C-u>tabprevious<CR>
"nnoremap <C-t> :<C-u>tabedit<CR>

"*****************
"  Clipboard
"*****************
set clipboard+=unnamedplus,unnamed

