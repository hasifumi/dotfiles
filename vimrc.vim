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
 
"*****************
"  colorscheme
"*****************
"colorscheme desert

"*****************
"  Japanese
"*****************
"set statusline=2
"挿入モード終了時にIME状態を保存しない
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>

"IMEモード固定
inoremap <silent> <C-j> <C-^>

"*****************
"  Search
"*****************
nmap <Esc><Esc> :noh<CR>

"*****************
"  Help
"*****************
nnoremap <C-e> :<C-u>help<Space><C-r><C-w><CR>
set helplang=ja

"*****************
"  tab
"*****************
nnoremap <silent> tbn :<C-u>tabnext<CR>
nnoremap <silent> tbh :<C-u>tabnext<CR>
nnoremap <silent> tbj :<C-u>tabnext<CR>
nnoremap <silent> tbp :<C-u>tabprevious<CR>
nnoremap <silent> tbl :<C-u>tabprevious<CR>
nnoremap <silent> tbk :<C-u>tabprevious<CR>
nnoremap <silent> tbe :<C-u>tabedit<CR>

"*****************
"  tag
"*****************
nnoremap <silent> tgn <C-]>
nnoremap <silent> tgn :<C-u>tag<CR>
nnoremap <silent> tgj :<C-u>tag<CR>
nnoremap <silent> tgp :<C-u>pop<CR>
nnoremap <silent> tgk :<C-u>pop<CR>
nnoremap <silent> tgl :<C-u>tags<CR>

"*****************
"  Encording
"*****************
if has("win32")
  "set encoding より上に書くこと
  let &termencoding = &encoding
endif
"set encoding=utf-8
"set fileencodings=utf-8,cp932,euc-jp
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,enc-jp,cp932

"*****************
"  Folding
"*****************
autocmd FileType javascript set foldmethod=marker
autocmd FileType coffee set foldmethod=marker

"*****************
"  Window  
"*****************
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"*****************
"  Motion(Insert-Mode)
"*****************
"inoremap <C-j> <Down>"{{{
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>
"inoremap <C-h> <Left>"}}}

"*****************
"  Clipboard
"*****************
set clipboard+=unnamedplus,unnamed

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
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'YankRing.vim'
"NeoBundle 'supermomonga/shaberu.vim'

"NeoBundle 'Shougo/unite.vim'
"NeoBundle	'Shougo/neosnippet'
"NeoBundle	'Shougo/vimfiler'
"NeoBundle	'Shougo/vimshell'
"NeoBundle 'thinca/unite-history'
"NeoBundle 'teramako/jscomplete-vim'

NeoBundleLazy 'Shougo/echodoc'
NeoBundleLazy 'Shougo/vesting'
NeoBundleLazy 'tsukkee/unite-tag'
NeoBundleLazy 'tsukkee/unite-help'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'h1mesuke/unite-outline'
NeoBundleLazy 'kmnk/vim-unite-giti'
NeoBundleLazy	'honza/snipmate-snippets'
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'tpope/vim-fugitive'
NeoBundleLazy 'kchmck/vim-coffee-script', {
\ 'autoload' : {
\     'filetypes' : ['coffee'],
\    },
\ }
"NeoBundleLazy 'pekepeke/titanium-vim'
"NeoBundleLazy 'hasifumi/timobile_complete'
"NeoBundleLazy 'hasifumi/enchant_complete'
"NeoBundleLazy 'test3', { 'type' : 'nosync', 'base' : '~/vimfiles/bundle/manual/' }
"NeoBundleLazy 'Refactoring', { 'type' : 'nosync', 'base' : '~/vimfiles/bundle/manual/' }
NeoBundleLazy "tyru/open-browser.vim", {
\   'autoload' : {
\       'functions' : "OpenBrowser",
\       'commands'  : "OpenBrowserSearch",
\       'mappings'  : "<Plug>(openbrowser-smart-search)"
\   },
\}
NeoBundleLazy 'tpope/vim-surround'
NeoBundleLazy 'hrsh7th/vim-versions'
"NeoBundleLazy 'ujihisa/neco-look'
"NeoBundleLazy 'ujihisa/neco-ruby'
"NeoBundleLazy 'taglist.vim'
"NeoBundleLazy 'Source-Explorer-srcexpl.vim'
"NeoBundleLazy 'vtreeexplorer'
"NeoBundleLazy 'JSON.vim'
"NeoBundleLazy 'Tagbar'
"NeoBundleLazy 'camelcasemotion'
"NeoBundleLazy 'EasyMotion'
"NeoBundleLazy 'ShowMarks'
"NeoBundleLazy 'refactor'
"NeoBundleLazy "git://github.com/tyru/caw.vim.git"
"NeoBundleLazy 'git://github.com/tpope/vim-pathogen.git'
NeoBundleLazy 'dmitry-ilyashevich/vim-typescript'
NeoBundleLazy 'nanotech/jellybeans.vim'

"filetype plugin indent on

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

" Plugin key-mappings.
inoremap <expr><C-l>  neocomplcache#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"*****************
"* vimshell
"*****************
"if Is_Android()"{{{
"  NeoBundle	'Shougo/vimshell'
"endif"}}}
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
  "\| call vimshell#altercmd#define('g', 'git')
  "\| call vimshell#altercmd#define('i', 'iexe')
  "\| call vimshell#hook#add('chpwd', 'my_chpwd', 'g:my_chpwd')
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
endfunction
unlet s:bundle

nnoremap <silent> ,vf :VimFiler -simple -winwidth=35 -no-quit<CR>

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
let s:bundle = neobundle#get("unite.vim")
function! s:bundle.hooks.on_source(bundle)
  " インサートモードで開始しない
  let g:unite_enable_start_insert = 1
  " Unite menu
  if !exists("g:unite_source_menu_menus")
     let g:unite_source_menu_menus = {}
  endif
  " menu の説明
  let s:commands = {
  \   'description' : 'Shortcut',
  \}
  " コマンドを登録
  let s:commands.candidates = {
  \   "HOME(VimFiler)" : "VimFiler $HOME" , 
  \   "Google" : "VimProcBang start 'http://www.google.co.jp/'" ,
  \   "vimfiles(VimFiler)" : "VimFiler $HOME/vimfiles" ,
  \   "MyProject(VimFiler)" : "VimFiler $HOME/MyProject" ,
  \   "MyLibrary(VimFiler)" : "VimFiler $HOME/MyLibrary" ,
  \}
  
  " 上記で登録したコマンドを評価する関数
  " 最終的にこれで評価した結果が unite に登録される
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
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
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

" unite_my_settings
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC>   <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)
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

"*****************
"* neosnippet
"*****************
NeoBundleLazy 'Shougo/neosnippet', {
\   'autoload' : { 
\       'functions' : [ "neosnippet#expandable", "neosnippet#jumpable" ],
\       'mappings' : [ "<Plug>(neosnippet_expand_or_jump)", 
\                      "<Plug>(neosnippet_expand_target)", 
\                      "<Plug>(neosnippet_start_unite_snippet_target)" ],
\       'commands' : [ "NeoSnippetMakeCache", "NeoSnippetEdit", "NeoComplCacheEdit", "NeoSnippetSource" ]
\   }
\}
let s:bundle = neobundle#get("neosnippet")
function! s:bundle.hooks.on_source(bundle)
  let g:neosnippet#snippets_directory = '~/vimfiles/bundle/neobundle/snipmate-snippets/snippets'
endfunction
unlet s:bundle

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

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
"* echodoc
"*****************
"let g:echodoc_enable_at_startup=1

"*****************
"* MyScripts
"*****************
"function! Test()
"	:e test.test
"	:set filetype=test
"endfunction
function! MyOpenBrowser()
  execute ":VimProcBang start '" . expand('<cWORD>') . "'"
endfunction
function! MyOpenBrowserOpen(url)
  echo a:url
  execute ":VimProcBang start '" . a:url . "'"
endfunction
function! MyOpenBrowserSearch()
  execute ":VimProcBang start 'http://www.google.co.jp/search?q=" . expand('<cWORD>') . "'"
endfunction
command! MyOpenBrowser :call MyOpenBrowser()<CR>
nnoremap mob :call MyOpenBrowser()<CR>
nnoremap mobs :call MyOpenBrowserSearch()<CR>

nnoremap <Leader>aa :source `=expand("%")`<CR>

function! Is_Android()
  if filereadable("~/.vim/bundle/is_Android")
    " true = 0
    "let s:Android = 0
    return 0
  else
    " false = 1
    "let s:Android = 1
    return 1
  endif
endfunction


"*****************
"* titanium.vim
"*****************
"let g:titanium_sdk_root_dir="c:/Users/fumio/AppData/Roaming/Titanium/mobilesdk/"

"*****************
"* Titanium_echodoc
"*****************
"autocmd FileType coffee call timobile_echodoc#echodoc()

"*****************
"* quicktigame2d_complete
"*****************
"let g:quicktigame2d_complete_startup = 1

"*****************
"* open-browser.vim
"*****************
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"nmap ,ob  <Plug>(openbrowser-smart-search)
"vmap ,ob  <Plug>(openbrowser-smart-search)
"nmap ,obo <Plug>(openbrowser-open)
"vmap ,obo <Plug>(openbrowser-open)

"*****************
"* visualMark
"*****************
"NeoBundle 'hasifumi/visualmark'
NeoBundleLazy 'hasifumi/visualmark', {
\   'autoload' : { 
\       'functions' : [ "visualmark#Vm_toggle_sign", 
\                       "visualmark#Vm_goto_next_sign",
\                       "visualmark#Vm_goto_prev_sign"],
\   }
\}
let s:bundle = neobundle#get("visualmark")
function! s:bundle.hooks.on_source(bundle)
endfunction
unlet s:bundle

" Plugin key-mappings.
nmap <F2>    :call visualmark#Vm_toggle_sign()<CR>
nmap <F3>    :call visualmark#Vm_goto_next_sign()<CR>
nmap <C-F3>  :call visualmark#Vm_goto_prev_sign()<CR>

"*****************
"* shaberu.vim
"*****************
NeoBundleLazy 'supermomonga/shaberu.vim', {
\   'autoload' : { 
\       'commands' : [ "ShaberuSay", 
\                      "ShaberuMuteOn", 
\                      "ShaberuMuteOff", 
\                      "ShaberuMuteToggle" ],
\   }
\}

" Plugin key-mappings.
nmap ,ss    :ShaberuSay `=expand(("%")` <CR>

"*****************
"* YankRing
"*****************
NeoBundle 'YankRing.vim'
"  At Lazy-mode, I can't notice Yank buffer.
"NeoBundleLazy 'YankRing.vim', {
"\   'autoload' : { 
"\       'commands' : [ "YRShow", 
"\                      "YRSearch", 
"\                      "YRClear", 
"\                      "YRToggle" ],
"\   }
"\}

" Plugin key-mappings.
nmap   ,y :YRShow<CR>

"*****************
"* tcomment.vim
"*****************
NeoBundle 'tomtom/tcomment_vim'
"NeoBundleLazy 'tomtom/tcomment_vim', {
"\   'autoload' : { 
"\       'commands' : [ "TComment", 
"\                      "TCommentAs", 
"\                      "TCommentInline", 
"\                      "TCommentRight", 
"\                      "Comment" ],
"\   }
"\}

"*****************
"* plugin neobundle setting templete
"*****************
"NeoBundle 'xxx/yyyy'
"NeoBundleLazy 'xxx/yyyy', {
"\   'autoload' : { 
"\       'functions' : [ "",
"\                       "",
"\                       "" ],
"\       'mappings' : [ "<Plug>()", 
"\                      "<Plug>()", 
"\                      "<Plug>()" ],
"\       'commands' : [ "", 
"\                      "", 
"\                      "" ],
"\   }
"\}
"let s:bundle = neobundle#get("yyyy")
"function! s:bundle.hooks.on_source(bundle)
"  let g:neosnippet#snippets_directory = '~/vimfiles/bundle/neobundle/snipmate-snippets/snippets'
"endfunction
"unlet s:bundle
"
"" Plugin key-mappings.
"nmap <C-a>     <Plug>()
"

filetype plugin indent on
