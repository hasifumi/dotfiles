" vim: foldmethod=marker :

"*****************
"  basic
"*****************
set encoding=utf-8
set filetype=unix
set number
set nobackup
set noswapfile
set noundofile
set title
set showcmd
set shellslash
set diffopt=vertical
set completeopt+=menuone
set completeopt-=preview
set helplang=ja
set laststatus=2
set statusline+=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
set clipboard+=unnamedplus,unnamed
set guioptions-=T
set ttyfast

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

nnoremap <M-h> :<C-u>help<Space><C-r><C-w><CR>

" F5キーでコマンド履歴を開く
" F6キーで検索履歴を開く
nnoremap <F5> q:
nnoremap <F6> q/
" q:、q/、q? は無効化
nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap q? <NOP>

nnoremap <C-g> g;
inoremap <silent> jj <ESC>
nmap <Esc><Esc> :noh<CR>

syntax on
filetype off

"*****************
"  tab
"*****************
nnoremap <C-l> :<C-u>tabnext<CR>
nnoremap <C-h> :<C-u>tabprevious<CR>
nnoremap <C-t> :<C-u>tabedit<CR>

"*****************
"* neobundle
"*****************
let s:is_windows  = has('win32') || has('win64')
if has('vim_starting')
  if s:is_windows
    set runtimepath+=~/vimfiles/bundle/neobundle/neobundle.vim/
    call neobundle#begin(expand('~/vimfiles/bundle/neobundle'))
  else
    set runtimepath+=~/.vim/bundle/neobundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/neobundle'))
  endif
endif

NeoBundleFetch  'Shougo/neobundle.vim'

"*****************
"* vimproc
"*****************
NeoBundleFetch 'Shougo/vimproc'

"*****************
"* Unite
"*****************
NeoBundle "Shougo/unite.vim"
NeoBundle 'Shougo/neomru.vim'

inoremap <expr><C-l>  neocomplete#complete_common_string()
" ブックマーク
nnoremap <silent> ,uc :<C-u>Unite bookmark<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,ur :<C-u>Unite file_mru<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC>   <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)
endfunction

"*****************
"* vimshell
"*****************
NeoBundle "Shougo/vimshell"
NeoBundle "ujihisa/vimshell-ssh"
nnoremap <silent> ,vs :VimShell<CR>

"*****************
"* vimfiler
"*****************
NeoBundle "Shougo/vimfiler"
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> ,vf :VimFiler -simple -winwidth=20 -no-quit<CR>

"*****************
"* neocomplele
"*****************
NeoBundle "Shougo/neocomplete"
let g:neocomplete#data_directory = "~/.vim/tmp/swap"
let g:neocomplete#enable_at_startup = 1
inoremap <expr><C-l>  neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

"*****************
"* neosnippet
"*****************
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"let g:neosnippet#snippets_directory = '~/vimfiles/bundle/neobundle/neosnippet-snippets/snippets'
let g:neosnippet#snippets_directory = '~/vimfiles/bundle/neobundle/neosnippet-snippets/snippets, ~/dotfiles/MySnippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)

"*****************
"* for Golang
"*****************
NeoBundle "nsf/gocode"
NeoBundle "Blackrush/vim-gocode"

"*****************
"* eskk.vim
"*****************
NeoBundle 'tyru/eskk.vim'
let g:eskk#large_dictionary = expand('~/dotfiles/MyDict/skk/SKK-JISYO.L')
let g:eskk#enable_completion = 1
let g:eskk#show_annotation = 1
let g:eskk#tab_select_completion = 1
let g:eskk#no_default_mappings = 1

silent! imap <unique> <C-o>   <Plug>(eskk:toggle)

" Use google-ime-skk
let g:eskk#server = {
\  'host': 'localhost',
\  'port': 55100,
\  'type': 'notfound',
\}

"*****************
"* thinca/vim-quickrun
"*****************
NeoBundle 'thinca/vim-quickrun'
nnoremap ,qr <C-c>:QuickRun<CR>

let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\   "groovy" :{
\       "type" : "my_groovy"
\   },
\   "my_groovy" : {
\       "command"   : "/home/fumio/.gvm/groovy/current/bin/groovy",
\       "exec" : "%c %o %s:p %a",
\       "cmdopt" : "",
\   },
\   "go" : {
\       "command"   : "go",
\       "exec" : ['%c run %s'],
\       "cmdopt" : "",
\   },
\ }

"*****************
"* etc
"*****************
NeoBundle "Shougo/echodoc.vim"
let g:echodoc_enable_at_startup = 1

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'yomi322/vim-gitcomplete'

NeoBundle 'Lokaltog/vim-easymotion'
nmap s <Plug>(easymotion-s2)

NeoBundle 'thinca/vim-themis'

"*****************
"* after loading Plugins
"*****************
" enable all the plugins
call neobundle#end()
filetype plugin indent on

