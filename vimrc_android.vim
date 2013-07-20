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
set lines=60 columns=140
set nocompatible
inoremap <silent> jj <ESC>
set wildmode=longest:full,full
"set wildmode=list,full
set noswapfile
 
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
"* neobundle
"*****************
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle/neobundle.vim/
	call neobundle#rc(expand('~/vimfiles/bundle/neobundle'))
endif

NeoBundle	'Shougo/neobundle.vim'
NeoBundle	'Shougo/neocomplcache'
NeoBundle	'Shougo/vimproc'

"*****************
"* neocomplcache
"*****************
" Use neocomplcache 
let g:neocomplcache_enable_at_startup = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
let g:neocomplcache_force_overwrite_completefunc = 1

" Plugin key-mappings.
inoremap <expr><C-l>  neocomplcache#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
nnoremap nce  :<C-u>NeoComplCacheEnable<CR>
imap <C-u> <Plug>(neocomplcache_start_unite_quick_match)
imap <C-y> <Plug>(neocomplcache_start_unite_complete)

"*****************
"* vimshell
"*****************
NeoBundleLazy 'Shougo/vimshell', {
\   'autoload' : { 'commands' : [ 'VimShell', "VimShellPop", "VimShellInteractive" ] }
\}
let s:bundle = neobundle#get("vimshell")
function! s:bundle.hooks.on_source(bundle)
  "let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  let g:vimshell_user_prompt = 'getcwd()'
  "let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
  let g:vimshell_enable_smart_case = 1
  let g:neocomplcache_max_list = 50
  "let g:vimshell_cat_command = 'view'
  
  if has('win32') || has('win64')
    " Display user name on Windows.
    let g:vimshell_prompt = $USERNAME."% "
  else
    " Display user name on Linux.
    let g:vimshell_prompt = $USER."% "
  endif
  
  " Initialize execute file list.
  let g:vimshell_execute_file_list = {}
  call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
  let g:vimshell_execute_file_list['rb'] = 'ruby'
  let g:vimshell_execute_file_list['pl'] = 'perl'
  let g:vimshell_execute_file_list['py'] = 'python'
  "call vimshell#set_execute_file('html,xhtml', 'gexe firefox')
  
  autocmd FileType vimshell
  \ call vimshell#altercmd#define('l', 'll')
  \| call vimshell#altercmd#define('ll', 'ls -l')
endfunction
unlet s:bundle

nnoremap <silent> ,vs :VimShell<CR>
nnoremap <silent> ,vsp :VimShellPop<CR>

"*****************
"* vimfiler
"*****************
NeoBundleLazy 'Shougo/vimfiler', {
\   'depends' : ["Shougo/unite.vim"] , 
\   'autoload' : { 'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer" ] }
\}
let s:bundle = neobundle#get("vimfiler")
function! s:bundle.hooks.on_source(bundle)
  let g:vimfiler_as_default_explorer = 1
  " Enable file operation commands.
  let g:vimfiler_safe_mode_by_default = 0
  " Like Textmate icons.
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_file_icon = '-'
  let g:vimfiler_marked_file_icon = '*'
  " Use trashbox.
  " Windows only and require latest vimproc.
  let g:unite_kind_file_use_trashbox = 1
  call vimfiler#set_execute_file('vim', 'vim')
  "call vimfiler#set_execute_file('txt', 'notepad')
  call vimfiler#set_execute_file('txt', 'vim')
  "call vimfiler#set_execute_file('c', ['vim', 'notepad'])
  call vimfiler#set_execute_file('c', 'vim')
  call vimfiler#set_execute_file('coffee', 'vim')
  call vimfiler#set_execute_file('ts', 'vim')
  autocmd filetype vimfiler call unite#custom_default_action('directory', 'cd')
endfunction
unlet s:bundle

nnoremap <silent> ,vf :VimFiler -simple -winwidth=65 -no-quit<CR>

"call vimfiler#set_execute_file('vim', 'vim')"{{{
""call vimfiler#set_execute_file('txt', 'notepad')
"call vimfiler#set_execute_file('txt', 'vim')
""call vimfiler#set_execute_file('c', ['vim', 'notepad'])
"call vimfiler#set_execute_file('c', 'vim')
"call vimfiler#set_execute_file('coffee', 'vim')
"call vimfiler#set_execute_file('ts', 'vim')

"let g:vimfiler_as_default_explorer = 1
"" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0
"" Like Textmate icons.
"let g:vimfiler_tree_leaf_icon = ' '
"let g:vimfiler_file_icon = '-'
"let g:vimfiler_marked_file_icon = '*'
"" Use trashbox.
"" Windows only and require latest vimproc.
"let g:unite_kind_file_use_trashbox = 1
"}}}
"*****************
"* Unite
"*****************
NeoBundleLazy 'Shougo/unite.vim', {
\   'autoload' : {
\       'functions' : [ 
\            'unite#start_complete', 
\            'unite#version', 
\       ],
\       'mappings' : [ 
\            '<Plug>(unite_exit)', 
\            '<Plug>(unite_insert_leave)', 
\       ],
\       'commands' : [ 
\            'Unite', 
\            'UniteWithBufferDir', 
\            'UniteWithCursorWord', 
\       ],
\   },
\}
let g:unite_source_history_yank_enable = 1
let s:bundle = neobundle#get("unite.vim")
function! s:bundle.hooks.on_source(bundle)
  " インサートモードで開始しない
  let g:unite_enable_start_insert = 1
  "let g:unite_source_history_yank_enable = 1
	call unite#set_substitute_pattern('test', '^;v', '~/vimfiles')

  " Unite menu
  if !exists("g:unite_source_menu_menus")
     let g:unite_source_menu_menus = {}
  endif
  let s:commands = {
  \   'description' : 'Shortcut',
  \}
  let s:commands.candidates = {
  \   "HOME(VimFiler)" : "VimFiler $HOME" , 
  \   "Google" : "VimProcBang start 'http://www.google.co.jp/'" ,
  \   "vimfiles(VimFiler)" : "VimFiler $HOME/vimfiles" ,
  \   "MyProject(VimFiler)" : "VimFiler $HOME/MyProject" ,
  \   "MyLibrary(VimFiler)" : "VimFiler $HOME/MyLibrary" ,
  \   "HOME(VimShell)" : "VimShell $HOME" ,
  \   "TomcatStart" : "call vimproc#system_bg('c://Program\ Files//Apache\ Software\ Foundation//Tomcat\ 7.0//bin//startup.bat'" ,
  \}
  function s:commands.map(key, value)
     return {
  \       'word' : a:key,
  \       'kind' : 'command',
  \       'action__command' : a:value,
  \}
  endfunction
  let g:unite_source_menu_menus["shortcut"] = deepcopy(s:commands)
  unlet s:commands
  
endfunction
unlet s:bundle

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ブックマーク
nnoremap <silent> ,uc :<C-u>Unite bookmark<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" tab
nnoremap <silent> ,utb :<C-u>Unite tab<CR>
" tag
nnoremap <silent> ,utg :<C-u>Unite tag<CR>
" neosnippet
nnoremap <silent> ,us  :<C-u>Unite snippet<CR>
" neobundle 
nnoremap <silent> ,unb  :<C-u>Unite neobundle<CR>
" menu
nnoremap <silent> ,um :<C-u>Unite menu:shortcut<CR>
" history/yank 
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>

" unite_my_settings
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC>   <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)
endfunction

" Unite-tag
"autocmd BufEnter *
"\   if empty(&buftype)
"\|      nnoremap <buffer> u<C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
"\|  endif

" Unite-vimshell-history
inoremap <buffer><expr> <C-l> unite#start_complete(
  \ ['vimshell/history'], {                                                                                                                  
  \ 'start_insert' : 1,
  \ 'input' : vimshell#get_cur_text()})

call unite#set_substitute_pattern('test', '^;v', '~/vimfiles')

"*****************
"* vim-ref 
"*****************
NeoBundleLazy 'thinca/vim-ref', {
\   'autoload' : { 
\       'commands' : [ 'Ref' ],
\   }
\}
let s:bundle = neobundle#get("vim-ref")
function! s:bundle.hooks.on_source(bundle)
  let g:ref_source_webdict_cmd = 'lynx -dump %s'
  "webdictサイトの設定
  let g:ref_source_webdict_sites = {
  \   'je': {
  \     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
  \   },
  \   'ej': {
  \     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
  \   },
  \   'wiki': {
  \     'url': 'http://ja.wikipedia.org/wiki/%s',
  \   },
  \ }
  "デフォルトサイト
  let g:ref_source_webdict_sites.default = 'ej'
  "出力に対するフィルタ。最初の数行を削除
  function! g:ref_source_webdict_sites.je.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
  endfunction
  function! g:ref_source_webdict_sites.ej.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
  endfunction
  function! g:ref_source_webdict_sites.wiki.filter(output)
    return join(split(a:output, "\n")[17 :], "\n")
  endfunction
endfunction
unlet s:bundle
 
nmap <Leader>rj :<C-u>Ref webdict je<Space>
nmap <Leader>re :<C-u>Ref webdict ej<Space>

"*****************
"* restart.vim
"*****************
NeoBundleLazy 'tyru/restart.vim', {
\   'autoload' : { 
\       'commands' : [ "Restart" ], 
\   }
\}

filetype plugin indent on
