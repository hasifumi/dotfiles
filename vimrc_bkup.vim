" vim: foldmethod=marker :
"
"
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
"set lines=60 columns=140
set nocompatible
inoremap <silent> jj <ESC>
"set wildmode=longest:full,full
set wildmenu
"set wildmode=list,full
set noswapfile
set ttyfast
set cursorline
set fileformat=unix
nmap ,zz :<C-u>set scrolloff=999<CR>
nmap ,zzf :<C-u>set scrolloff=0<CR>
set shellslash
set diffopt=vertical
"inoremap '  ''<Left>
"inoremap "  ""<Left>
"次の2行で、Tab、行末の半角スペース、改行を明示的に表示
set list
"set listchars=tab:>\ ,trail:~,eol:$

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

"*****************
"  colorscheme
"*****************
"colorscheme desert

""*****************
""  Japanese
""*****************
""set statusline=2
""挿入モード終了時にIME状態を保存しない
"inoremap <silent> <ESC> <ESC>
"inoremap <silent> <C-[> <ESC>
"
""IMEモード固定
"inoremap <silent> <C-j> <C-^>

"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM

"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double

"画面最後の行をできる限り表示する。
set display+=lastline

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"scriptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
"  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
"  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
  highlight ZenkakuSpace cterm=reverse ctermfg=LightGrey gui=reverse guifg=DarkRed
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    "autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
"*****************
"  Search
"*****************
nmap <Esc><Esc> :noh<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz


"*****************
"  Help
"*****************
"nnoremap <C-e> :<C-u>help<Space><C-r><C-w><CR>
"nnoremap <C-i> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <M-h> :<C-u>help<Space><C-r><C-w><CR>
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
nnoremap <C-l> :<C-u>tabnext<CR>
nnoremap <C-h> :<C-u>tabprevious<CR>
nnoremap <C-t> :<C-u>tabedit<CR>
" Use <C-o> despite <C-t>

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
"if has("win32")
"  "set encoding より上に書くこと
"  let &termencoding = &encoding
"endif
"set enc=utf-8
""set fenc=utf-8
"set fencs=cp932,sjis,iso-2022-jp,enc-jp,utf-8

set laststatus=2
set statusline+=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\

"*****************
"  autocmd(filetype)
"*****************
autocmd FileType javascript setlocal foldmethod=marker
autocmd FileType coffee setlocal foldmethod=marker

autocmd FileType basic,st setlocal filetype=vb

autocmd FileType vb :call excel_vba_echodoc#echodoc()

"*****************
"  Window
"*****************
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"nnoremap <C-h> <C-w>h

"*****************
"  Motion(Insert-Mode)
"*****************
"inoremap <A-j> <Down>"{{{
"inoremap <A-k> <Up>
"inoremap <A-l> <Right>
"inoremap <A-h> <Left>"}}}

"カーソル一文字単位移動
inoremap <silent> <C-s> <Left>
inoremap <silent> <C-d> <Right>

"単語単位移動（行末で止まる必要がない場合）
inoremap <silent> <C-f> <S-Left>
inoremap <silent> <C-b> <S-Right>

"カーソル前の文字削除
"inoremap <silent> <BS>  <C-g>u<BS>
inoremap <silent> <C-h> <C-g>u<C-h>
"カーソル後の文字削除
inoremap <silent> <Del> <C-g>u<Del>
inoremap <silent> <C-g> <C-g>u<Del>

"*****************
"  Motion(last edited)
"*****************
" g;    " backward modify list
" g,    " forward modify list
" `.    " last edited
nnoremap gb `.zz
nnoremap <C-g> g;

"*****************
"  Clipboard
"*****************
set clipboard+=unnamedplus,unnamed

"*****************
" command-line
"*****************
" F5キーでコマンド履歴を開く
" F6キーで検索履歴を開く
nnoremap <F5> q:
nnoremap <F6> q/
" q:、q/、q? は無効化
nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap q? <NOP>

"*****************
"  GUI Option
"*****************
"set guioptions-=m
set guioptions-=T

"*****************
"* neobundle
"*****************
set nocompatible
filetype plugin indent off

let s:is_windows  = has('win32') || has('win64')
let s:is_cygwin = has('win32unix')

" neobundle auto install, but never tested!!
"if s:is_windows
"  let s:vimdot = '~/vimfiles'
"else
"  let s:vimdot = '~.vim'
"endif
"if !isdirectory(s:vimdot . '/bundle/neobundle/neobundle.vim')
"  if !isdirectory(s:vimdot . '/bundle')
"    execute '!mkdir -p bundle/neobundle'
"    execute '!cd bundle/neobundle'
"    execute '!git clone https://github.com/Shougo/neobundle.vim.git'
"    execute 'set &runtimepath += ' . s:vimdot . '/bundle/neobundle/neobundle.vim'
"  endif
"endif

if has('vim_starting')
  ""if has('win32') || has('win64')
  if s:is_windows
    set runtimepath+=~/vimfiles/bundle/neobundle/neobundle.vim/
    call neobundle#rc(expand('~/vimfiles/bundle/neobundle'))
  else
    set runtimepath+=~/.vim/bundle/neobundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/neobundle'))
  endif
  "if s:is_windows
  "  let s:vimdot = '~/vimfiles'
  "else
  "  let s:vimdot = '~.vim'
  "endif
  "echo "s:vimdot = " . s:vimdot
  "execute 'set runtimepath+='. s:vimdot . '/bundle/neobundle/neobundle.vim/'
  "execute "call neobundle#rc(expand('" . s:vimdot . "/bundle/neobundl'))"
endif

NeoBundle  'Shougo/neobundle.vim'

function! s:bundle_tap(bundle) " {{{
  let s:tapped_bundle = neobundle#get(a:bundle)
  return neobundle#is_installed(a:bundle)
endfunction " }}}

function! s:bundle_config(config) " {{{
  if exists("s:tapped_bundle") && s:tapped_bundle != {}
    call neobundle#config(s:tapped_bundle.name, a:config)
  endif
endfunction " }}}

function! s:bundle_untap() " {{{
  let s:tapped_bundle = {}
endfunction " }}}

"NeoBundle  'Shougo/vimproc'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
    "\ 'windows' : 'make -f make_mingw32.mak',
NeoBundleLazy 'kana/vim-smartinput'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'mattn/googletranslate-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'YankRing.vim'
"NeoBundle 'supermomonga/shaberu.vim'

"NeoBundle 'Shougo/unite.vim'
"NeoBundle  'Shougo/neosnippet'
"NeoBundle  'Shougo/vimfiler'
"NeoBundle  'Shougo/vimshell'
"NeoBundle 'thinca/unite-history'
"NeoBundle 'teramako/jscomplete-vim'

"NeoBundleLazy 'Shougo/echodoc'
NeoBundleLazy 'Shougo/vesting'
NeoBundleLazy 'tsukkee/unite-tag'
NeoBundleLazy 'tsukkee/unite-help'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'h1mesuke/unite-outline'
NeoBundleLazy 'kmnk/vim-unite-giti'
NeoBundleLazy 'hakobe/unite-script'
NeoBundleLazy 'tacroe/unite-mark'
NeoBundle 'thinca/vim-unite-history'
NeoBundleLazy  'honza/snipmate-snippets'
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
\       'functions' : "OpenBrowser()",
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
"NeoBundle'clausreinke/typescript-tools'
NeoBundleLazy 'hasifumi/typescript-tools'
NeoBundleLazy 'hasifumi/typescript_completion.vim'
NeoBundleLazy 'nanotech/jellybeans.vim'
"NeoBundle 'ctrlp.vim'
NeoBundleLazy 'yuratomo/w3m.vim'
"NeoBundleLazy 'hasifumi/eclim_java_complete.vim'
NeoBundleLazy 'jpo/vim-railscasts-theme'
NeoBundleLazy 'vim-scripts/candy.vim'

"filetype plugin indent on

"*****************
"* neocomplete / neocomplcache
"*****************
"NeoBundle  'Shougo/neocomplcache'
"NeoBundle  'Shougo/neocomplete'
NeoBundle  has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
  " Use neocomplele
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#min_syntax_length = 2
  let g:neocomplete#dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions',
      \ 'vb' : $HOME.'/dotfiles/MyDict/vb.dict',
      \ }
  " Plugin key-mappings.
  inoremap <expr><C-l>  neocomplete#complete_common_string()
  "inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
  nnoremap nce  :<C-u>NeoCompleteEnable<CR>
  imap <C-y> <Plug>(neocomplete#start_unite_complete)
elseif neobundle#is_installed('neocomplcache')
  " Use neocomplcache
  let g:neocomplcache_enable_at_stArtup = 1
  " Set smartcase
  "let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 2
  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions',
     \ 'vb' : $HOME.'/dotfiles/MyDict/vb.dict',
      \ }
  "let g:neocomplcache_force_overwrite_completefunc = 1

  " Plugin key-mappings.
  inoremap <expr><C-l>  neocomplcache#complete_common_string()
  inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  nnoremap nce  :<C-u>NeoComplCacheEnable<CR>
  "imap <C-u> <Plug>(neocomplcache_start_unite_quick_match)
  imap <C-y> <Plug>(neocomplcache_start_unite_complete)
endif
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

"*****************
"* vimshell
"*****************
"if Is_Android()"{{{
"  NeoBundle  'Shougo/vimshell'
"endif"}}}
NeoBundleLazy 'Shougo/vimshell', {
\   'autoload' : { 'commands' : [ 'VimShell', "VimShellPop", "VimShellInteractive" ] }
\}
let s:bundle = neobundle#get("vimshell")
function! s:bundle.hooks.on_source(bundle)
  "let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  "let g:vimshell_user_prompt = 'getcwd()'
  "let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
  let g:vimshell_enable_smart_case = 1
  let g:neocomplcache_max_list = 50
  "let g:vimshell_cat_command = 'view'

  if has('win32') || has('win64')
    " Display user name on Windows.
    "let g:vimshell_prompt = $USERNAME."% "
    let g:user_name = $USERNAME
  else
    " Display user name on Linux.
    "let g:vimshell_prompt = $USER."% "
    let g:user_name = $USER
  endif

  let g:vimshell_prompt_expr = 'fnamemodify(getcwd(), ":~")."> "'
  let g:vimshell_prompt_pattern = '^\f\+> '
  "let g:vimshell_prompt_expr = 'fnamemodify(getcwd(), ":~"). "@" . g:user_name . "> "'
  "let g:vimshell_prompt_pattern = '^.\+> '

  " Initialize execute file list.
  let g:vimshell_execute_file_list = {}
  "call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
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
nnoremap <silent> ,vspy :VimShellInteractive python<CR>
nnoremap <silent> ,vss <S-v>:VimShellSendString<CR>

"*****************
"* vimfiler
"*****************
NeoBundleLazy 'Shougo/vimfiler', {
\   'depends' : ["Shougo/unite.vim"] ,
\   'autoload' : {
\       'function-prefix' : "vimfiler",
\       'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer" ],
\   },
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
\            'unite#custom_action',
\            'unite#custom_default_action',
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
  let s:commands = {
  \   'description' : 'VimPdb',
  \}
  let s:commands.candidates = {
  \   "F5 : PdbStartDebug" : "call PdbStartDebug(1, [])" ,
  \   "F2 : PdbToggleBreakpointOnCurrentLine" : "call PdbToggleBreakpointOnCurrentLine()" ,
  \}
  function s:commands.map(key, value)
     return {
  \       'word' : a:key,
  \       'kind' : 'command',
  \       'action__command' : a:value,
  \}
  endfunction
  let g:unite_source_menu_menus["VimPdb"] = deepcopy(s:commands)
  unlet s:commands
endfunction
unlet s:bundle

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
let my_testfunc = {
  \  'description': 'my test function',
  \  'is_selectable': 1,
  \}
function! my_testfunc.func(candidates)
  "echo "MyTest1"
  execute "VimFiler"
endfunction
call unite#custom_action('buffer', 'mytestfunc', my_testfunc)
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
"nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,ur :<C-u>Unite file_mru<CR>
" ブックマーク
"nnoremap <silent> ,uc :<C-u>Unite -default-action=vimfiler bookmark<CR>
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
nnoremap <silent> ,uhy :<C-u>Unite history/yank<CR>
" history/command
nnoremap <silent> ,uhc :<C-u>Unite history/command<CR>
" history/search
nnoremap <silent> ,uhs :<C-u>Unite history/search<CR>

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


"*****************
"* neosnippet
"*****************
"NeoBundleLazy 'Shougo/neosnippet', {
NeoBundle 'Shougo/neosnippet', {
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
  let g:neosnippet#snippets_directory = '~/vimfiles/bundle/neobundle/snipmate-snippets/snippets, ~/dotfiles/MySnippets'
endfunction
unlet s:bundle

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> neosnippet#jumpable() ?
 \ "\<Plug>(neosnippet_jump)"
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
nmap ,re :<C-u>execute "Ref webdict ej " . expand('<cword>')
"nmap ,re :call s:ref_ej()

function! s:ref_ej()
  s:str = expand('<cword>')
  execute "Ref webdict ej " . s:str
endfunction

"*****************
"* echodoc
"*****************
"let g:echodoc_enable_at_startup=1

"*****************
"* MyScripts
"*****************
"function! Test()
"  :e test.test
"  :set filetype=test
"endfunction
function! MyOpenBrowser()
  execute ":VimProcBang start '" . expand('<cWORD>') . "'"
endfunction
function! MyOpenBrowserOpen(url)
  echo a:url
  execute ":VimProcBang start '" . a:url . "'"
endfunction
function! MyOpenBrowserSearch()
  call MyOpenBrowserOpen('http://www.google.co.jp/#q=' . expand('<cword>'))
endfunction
command! MyOpenBrowser :call MyOpenBrowser()<CR>
command! MyOpenBrowserSearch :call MyOpenBrowser()<CR>
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

"function! MyTagsGenerate()
"  execute ":VimProcBang start ctags -R " . expand("%")
"endfunction
"nnoremap ,tg :call MyTagsGenerate()<CR>

command! Cdcur cd %:p:h

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
"* tcomment.vim
"*****************
NeoBundle 'tomtom/tcomment_vim'
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
  \ 'vb': "' %s"
  \}

""*****************
""* tcomment_vim
""*****************
"NeoBundleLazy 'tomtom/tcomment_vim', {
"\   'autoload' : {
"\       'functions' : [ "tcomment#SetOption()",
"\                       "tcomment#Operator()",
"\                       "tcomment#OperatorLine()",
"\                       "tcomment#OperatorAnyway()",
"\                       "tcomment#OperatorLineAnyway()" ],
"\       'commands' : [ "TComment",
"\                      "TCommentAs",
"\                      "TCommentInline",
"\                      "TCommentRight",
"\                      "Comment" ],
"\   }
"\}
"let s:bundle = neobundle#get("tcomment_vim")
"function! s:bundle.hooks.on_source(bundle)
"  if !exists('g:tcomment_types')
"    let g:tcomment_types = {}
"  endif
"  let g:tcomment_types = {
"    \ 'vb': "' %s"
"    \}
"endfunction
"unlet s:bundle

"*****************
"* EasyMotion
"*****************
NeoBundle 'Lokaltog/vim-easymotion'
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key=";"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

"*****************
"* tagbar
"*****************
"NeoBundle 'majutsushi/tagbar'
NeoBundleLazy 'majutsushi/tagbar', {
\   'autoload' : {
\       'commands' : [ "TagbarToggle",
\                      "TagbarOpen",
\                      "TagbarClose" ],
\   }
\}
let s:bundle = neobundle#get("tagbar")
function! s:bundle.hooks.on_source(bundle)
  let g:tagbar_type_gorilla = {
        \ 'ctagstype' : 'gorilla',
        \ 'kinds' : [
        \   'C:constant',
        \   'e:module',
        \   'f:function',
        \   'c:class',
        \   'a:array',
        \   'o:object',
        \   'r:regex',
        \   's:string'
        \ ],
        \ 'sro' : ".",
        \}
  let g:tagbar_type_vb = {
        \ 'ctagstype' : 'basic',
        \ 'kinds' : [
        \   'c:constant',
        \   'f:function',
        \   'l:labels',
        \   't:types',
        \   'v:variables',
        \   'g:enumerations',
        \ ],
        \ 'sro' : ".",
        \}
endfunction
unlet s:bundle

" Plugin key-mappings.
nmap <F8>  :TagbarToggle<CR>
"
"*****************
"* Eclim
"*****************
"command! EclimStart :call vimproc#system_bg('c://eclipse//eclimd.bat')
"command! EclimShutdown :ShutdownEclim

"*****************
"* restart.vim
"*****************
NeoBundleLazy 'tyru/restart.vim', {
\   'autoload' : {
\       'commands' : [ "Restart" ],
\   }
\}

"*****************
"* dbg.vim
"*****************
NeoBundleLazy 'yuratomo/dbg.vim', {
\   'autoload' : {
\       'commands' : [ "Dbg",
\                      "DbgShell" ],
\   }
\}
let s:bundle = neobundle#get("dbg.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:dbg#command_shell = 'cmd.exe'
  let g:dbg#shell_prompt = '> '
  let g:dbg#command_jdb = 'jdb'
  let g:dbg#command_encoding = 'utf-8'
endfunction
unlet s:bundle

"*****************
"* syntastic
"*****************
NeoBundleLazy 'scrooloose/syntastic', {
\   'autoload' : {
\       'commands' : [ "Errors",
\                      "SyntasticToggleMode",
\                      "SyntasticCheck",
\                      "SyntasticInfo" ],
\   }
\}
let s:bundle = neobundle#get("syntastic")
function! s:bundle.hooks.on_source(bundle)
  let g:syntastic_check_on_open=1
  let g:syntastic_mode_map = {
        \ 'mode' : 'active',
        \ 'active_filetypes' : ['sh', 'vim'],
        \ 'passive_filetypes' : ['python', 'html']
        \}
endfunction
unlet s:bundle

"*****************
"* vim-gorilla-script
"*****************
NeoBundleLazy 'unc0/vim-gorilla-script', {
\   'autoload' : {
\       'filetypes' : [ "gorilla" ]
\   }
\}

"*****************
"* vim-indent-guides
"*****************
NeoBundle 'nathanaelkane/vim-indent-guides', {
\   'autoload' : {
\       'commands' : [ "IndentGuidesToggle",
\                      "IndentGuidesEnable",
\                      "IndentGuidesDisable" ],
\   }
\}
let s:bundle = neobundle#get("vim-indent-guides")
function! s:bundle.hooks.on_source(bundle)
  "let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 2
  "let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green
  let g:indent_guides_color_change_percent = 20
  let g:indent_guides_guide_size = 1
  let g:indent_guides_exclude_filetypes = [ 'help', 'vimfiler' ]
endfunction
unlet s:bundle

" Plugin key-mappings.
nnoremap <silent> ,gt :<C-u>IndentGuidesToggle<CR>

"*****************
"* vim-hier
"*****************
NeoBundleLazy 'jceb/vim-hier', {
\   'autoload' : {
\       'commands' : [ "HierUpdate",
\                      "HierClear" ],
\   }
\}
let s:bundle = neobundle#get("vim-hier")
function! s:bundle.hooks.on_source(bundle)
  "execute "highlight ucurl_my gui=undercurl guisp=Red"
  execute "highlight ucurl_my gui=italic guisp=Red"
  let g:hier_highlight_group_qf = "ucurl_my"
endfunction
unlet s:bundle

"*****************
"* quickfixstatus
"*****************
NeoBundleLazy 'dannyob/quickfixstatus', {
\   'autoload' : {
\       'commands' : [ "QuickfixStatusEnable",
\                      "QuickfixStatusDisable" ],
\   }
\}

NeoBundle 'ujihisa/vimshell-ssh'

NeoBundle 'tpope/vim-fugitive'
" Plugin key-mappings.
nmap ,gs :<C-u>Gstatus<CR>
nmap ,gl :<C-u>Glog<CR>
nmap ,gd :<C-u>Gdiff<CR>
nmap ,gc :<C-u>Gcommit<CR>
nmap ,gb :<C-u>Gblame<CR>

NeoBundle 'yomi322/vim-gitcomplete'

"*****************
"* echodoc
"*****************
NeoBundle 'Shougo/echodoc'
"NeoBundleLazy 'Shougo/echodoc',{
"\   'autoload' : {
"\       'commands' : [ "EchoDocEnable",],
"\   }
"\}

"*****************
"* excel_vba_echodoc
"*****************
NeoBundleLazy 'hasifumi/excel_vba_echodoc', {
\   'autoload' : {
\       'functions' : [ "excel_vba_echodoc#echodoc()" ],
\   }
\}

NeoBundle 'hasifumi/excel_vba_complete.vim'

"map <F11>  :sp tags<CR>:%s/^\([^     :]*:\)\=\([^    ]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>
"map <F12>  :so tags.vim<CR>

NeoBundle 'mattn/googletasks-vim'
NeoBundle 'rhysd/clever-f.vim'

"*****************
"* sonictemplate
"*****************
NeoBundleLazy 'mattn/sonictemplate-vim',{
\   'autoload' : {
\       'commands' : [ "Template" ],
\   }
\}
let s:bundle = neobundle#get("sonictemplate-vim")
function! s:bundle.hooks.on_source(bundle)
  let g:sonictemplate_vim_template_dir = [
  \ '$HOME/.vim/template',
  \ '$HOME/dotfiles/MyTemplate',
  \]
endfunction
unlet s:bundle

"*****************
"* MiSawa/sniplate.vim
"*****************
NeoBundleLazy 'MiSawa/sniplate.vim', {
\   'autoload' : {
\       'commands' : [ "SniplateLoad" ],
\   }
\}
let s:bundle = neobundle#get("sniplate.vim")
function! s:bundle.hooks.on_source(bundle)
  "let g:neosnippet#snippets_directory = '~/vimfiles/bundle/neobundle/snipmate-snippets/snippets'
endfunction
unlet s:bundle

"*****************
"*  vim-anzu
"*****************
NeoBundleLazy 'osyo-manga/vim-anzu', {
\   'autoload' : {
\       'mappings' : [ "<Plug>(anzu-n-with-echo)",
\                      "<Plug>(anzu-N-with-echo)",
\                      "<Plug>(anzu-star-with-echo)",
\                      "<Plug>(anzu-sharp-with-echo)" ],
\   }
\}
let s:bundle = neobundle#get("vim-anzu")
function! s:bundle.hooks.on_source(bundle)
  setlocal statusline=%{anzu#search_status()}
endfunction
unlet s:bundle

" Plugin key-mappings.
"nmap n <Plug>(anzu-n)
"nmap N <Plug>(anzu-N)
"nmap * <Plug>(anzu-star)
"nmap # <Plug>(anzu-sharp)
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

"*****************
"* im_control.vim
"*****************
NeoBundleLazy 'fuenor/im_control.vim'

"if has('gui_running')
"  " 「日本語入力固定モード」の動作モード
"  let IM_CtrlMode = 4
"  " GVimで<C-^>が使える場合の「日本語入力固定モード」切替キー
"  inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
"else
"  " 非GUIの場合(この例では「日本語入力固定モード」を無効化している)
"  let IM_CtrlMode = 0
"endif
"
"function! MyIMEView()
"  if has('multi_byte_ime')
"    highlight Cursor guifg=NONE guibg=Green
"    highlight CursorIM guifg=NONE guibg=Purple
"  endif
"endfunction
"
"scriptencoding utf-8
"
"" 「日本語入力固定モード」がオンの場合、ステータス行にメッセージ表示
"set statusline+=%{IMStatus('[日本語固定]')}
"
"augroup highlightIdegraphicSpace
"  autocmd!
"  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"  autocmd VimEnter,WinEnter * call MyIMEView()
"augroup END

"*****************
"* Align
"*****************
"NeoBundle 'Align'
NeoBundleLazy 'Align', {
\   'autoload' : {
\       'mappings' : [ "<Plug>AM_tsp" ],
\       'commands' : [ "Align",
\                      "AlignCtrl" ],
\   }
\}
let s:bundle = neobundle#get("Align")
function! s:bundle.hooks.on_source(bundle)
  let g:Align_xstrlen = 3
endfunction
unlet s:bundle

map! <unique> <Leader>tsp  <Plug>AM_tsp

""*****************
""* vim-prettyprint
""*****************
"NeoBundleLazy 'thinca/vim-prettyprint', {
"\   'autoload' : {
"\       'functions' : [ "PrettyPrint()",
"\                       "PP()" ],
"\       'commands' : [ "PP",
"\                      "PrettyPrint" ],
"\   }
"\}

"*****************
"* vim-prettyprint
"*****************
NeoBundleLazy 'thinca/vim-prettyprint'
if s:bundle_tap('vim-prettyprint') " {{{
  call s:bundle_config({
        \   'autoload' : {
        \     'functions' : [ "PrettyPrint()",
        \                     "PP()" ],
        \     'commands'  : [ "PP",
        \                     "PrettyPrint" ],
        \   }
        \ })
  call s:bundle_untap()
endif " }}}

""*****************
""* rbtnn/vimconsole.vim
""*****************
"NeoBundleLazy 'rbtnn/vimconsole.vim', {
"\   'autoload' : {
"\       'commands' : [ "VimConsole",
"\                      "VimConsoleToggle",
"\                      "VimConsoleOpen",
"\                      "VimConsoleClear",
"\                      "VimConsoleRedraw",
"\                      "VimConsoleClose" ],
"\   }
"\}
"let s:bundle = neobundle#get("vimconsole.vim")
"function! s:bundle.hooks.on_source(bundle)
"  let g:vimconsole#height = 10
"endfunction
"unlet s:bundle
"
"" Plugin key-mappings.
"nmap ,vct  VimConsoleToggle<CR>

"*****************
"* rbtnn/vimconsole.vim
"*****************
NeoBundleLazy 'rbtnn/vimconsole.vim'
if s:bundle_tap('vimconsole.vim') " {{{
  call s:bundle_config({
        \   'autoload' : {
        \     'commands'  : [ "VimConsole",
        \                     "VimConsoleToggle",
        \                     "VimConsoleOpen",
        \                     "VimConsoleClear",
        \                     "VimConsoleRedraw",
        \                     "VimConsoleClose" ],
        \   }
        \ })

  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:vimconsole#height = 10
  endfunction

  nmap ,vct  VimConsoleToggle<CR>

  call s:bundle_untap()
endif " }}}

"*****************
"* thinca/vim-scall
"*****************
NeoBundleLazy 'thinca/vim-scall'
if s:bundle_tap('vim-scall') " {{{
  call s:bundle_config({
        \   'autoload' : {
        \     'function_prefix' : "scall",
        \     'functions' : [ "scall#call",
        \                     "Scall",
        \                     "scall#search" ],
        \   }
        \ })

  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:scall_function_name = 'S'
  endfunction

  call s:bundle_untap()
endif " }}}

"*****************
"* thinca/vim-quickrun
"*****************
"NeoBundle 'thinca/vim-quickrun'
NeoBundleLazy 'thinca/vim-quickrun', {
\   'autoload' : {
\       'commands' : [ "QuickRun" ],
\       'functions' : [ "quickrun#" ],
\   }
\}
let s:bundle = neobundle#get("vim-quickrun")
function! s:bundle.hooks.on_source(bundle)
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
  let s:python_unittest_outputter = quickrun#outputter#buffer#new()
  let s:python_unittest_outputter.name = "python_unittest_outputter"
  let s:python_unittest_outputter.kind = "outputter"
  function! s:python_unittest_outputter.init(session)
    call call(quickrun#outputter#buffer#new().init, [a:session], self)
  endfunction
  function! s:python_unittest_outputter.finish(session)
    highlight default unittest_ok ctermfg=DarkGreen guifg=DarkGreen guibg=White
    highlight default unittest_fail ctermfg=DarkRed guifg=DarkRed guibg=White
    highlight default unittest_errors ctermfg=DarkRed guifg=DarkRed guibg=White
    highlight default unittest_assert ctermfg=DarkRed guifg=DarkRed guibg=White
    call matchadd("unittest_ok", "\s\(ok\|pass\(ed\|\>\)\)")
    call matchadd("unittest_fail", "/Fail\(s\|ed\|ures!\|ures\|ure\|:\|\>\)/")
    call matchadd("unittest_errors", "/^Error\|\.\serror/")
    call matchadd("unittest_assert", "/Assertionerror:/")
    call call(quickrun#outputter#buffer#new().finish, [a:session], self)
  endfunction
  call quickrun#module#register(s:python_unittest_outputter, 1)
  let g:quickrun_config['python.unittest'] = {
\    "command" : "python",
\    "exec" : "%c %o %s:p %a",
\    "cmdpt" : "-m unittest",
\ }
  unlet s:python_unittest_outputter
"\    "outputter" : 'python_unittest_outputter',
endfunction
unlet s:bundle

" Plugin key-mappings.
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap ,qr <C-c>:QuickRun<CR>
augroup QuickRunPythonUnitTest
  autocmd!
  autocmd BufWinEnter,BufNewFile test*.py set filetype=python.unittest
augroup END

"*****************
"* davidhalter/jedi-vim
"*****************
NeoBundleLazy "davidhalter/jedi-vim", {
\   'autoload' : {
\       'filetypes' : [ "python",
\                       "python3" ],
\   }
\}
let s:bundle = neobundle#get("jedi-vim")
function! s:bundle.hooks.on_source(bundle)
  autocmd FileType python setlocal omnifunc=jedi#completions
  autocmd FileType python let b:did_ftplugin = 1
  "let g:jedi#auto_vim_configuration = 0
  let g:jedi#auto_initialization = 1
  let g:jedi#popup_select_first = 0
  let g:jedi#completions_enabled = 0
  let g:jedi#popup_on_dot = 1
  "let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  "if neobundle#is_installed('neocomplete')
  "  let g:neocomplete#force_omni_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  "elseif
  "  let g:neocomplcache_force_omni_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  "endif
  let g:jedi#rename_command = "<Leader>R"
endfunction
unlet s:bundle

NeoBundle 'jmcantrell/vim-virtualenv'

"*****************
"* gotcha/vimpdb
"*****************
"NeoBundleLazy "gotcha/vimpdb", {
"\   'autoload' : {
"\       'filetypes' : [ "python",
"\                       "python3" ],
"\   }
"\}
NeoBundle 'hasifumi/VimPdb'
"
"*****************
"* flake8-vim
"*****************
NeoBundleLazy 'andviro/flake8-vim', {
\   'autoload' : {
\       'filetypes' : [ "python",
\                       "python3" ],
\   }
\}
let s:bundle = neobundle#get("flake8-vim")
function! s:bundle.hooks.on_source(bundle)
  let g:PyFlakeDisabledMessages = 'W293'
endfunction
unlet s:bundle

"*****************
"* vim-python-pep8-indent
"*****************
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
\   'autoload' : {
\       'filetypes' : [ "python",
\                       "python3" ],
\   }
\}
let s:bundle = neobundle#get("vim-python-pep8-indent")
function! s:bundle.hooks.on_source(bundle)
  let g:PyFlakeOnWrite = 1
  let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
  let g:PyFlakeDefaultComplexity = 10
  let g:PyFlakeRangeCommand = 'Q'
endfunction
unlet s:bundle


"*****************
"* vim-operator-autopep8
"*****************
NeoBundleLazy 'hachibeeDI/vim-operator-autopep8', {
\   'depends' : ['kana/vim-operator-user', 'andviro/flake8-vim'],
\   'autoload' : {
\       'filetypes' : [ "python",
\                       "python3" ],
\   }
\}
"let s:bundle = neobundle#get("vim-operator-autopep8")
"function! s:bundle.hooks.on_source(bundle)
"endfunction
"unlet s:bundle

" Plugin key-mappings.
"nmap <Leader>p     <Plug>(operator-autopep8)
nmap ,p     <Plug>(operator-autopep8)

"*****************
"* vim-textobj-python
"*****************
NeoBundleLazy 'bps/vim-textobj-python', {
\   'depends' : 'kana/vim-operator-user',
\   'autoload' : {
\       'filetypes' : [ "python",
\                       "python3" ],
\   }
\}
"let s:bundle = neobundle#get("vim-textobj-python")
"function! s:bundle.hooks.on_source(bundle)
"endfunction
"unlet s:bundle

" Plugin key-mappings.
"xmap aF <Plug>(textobj-python-function-a)
"omap aF <Plug>(textobj-python-function-a)
"xmap iF <Plug>(textobj-python-function-i)
"omap iF <Plug>(textobj-python-function-i)

"*****************
"* vim-scripts/VimPdb
"*****************
"NeoBundleLazy 'vim-scripts/VimPdb'
"NeoBundleLazy 'https://github.com/vim-scripts/VimPdb.git'

"NeoBundleLazy 'KangOl/vim-pudb'

""*****************
""* vital.vim
""*****************
"NeoBundle 'vim-jp/vital.vim'
"let s:V= vital#of('vital')
"let s:Filepath = s:V.import('System.Filepath')
"
"function! MyTest(path)
"  echo s:Filepath.dirname(a:path)
"  echo s:Filepath.basename(a:path)
"endfunction
"
"let s:MyPythonUnittestUtil = {}
"function! s:func1()
"  let s:path = expand("%")
"  echo "path: " . s:path
"  "let s:dirname = s:Filepath.dirname(s:path)
"  let s:dirname = expand("%:h")
"  echo "dirname: " . s:dirname
"  "let s:parent = fnamemodify(s:dirname, ":p:h:h")
"  let s:parent = expand("%:h:h")
"  "let s:parent = s:Filepath.remove_last_separator(s:dirname)
"  echo "parent: " . s:parent
"endfunction
"
"command! MyTestCommand :call s:func1()
"
"*****************
"* osyo-mark/vim-over
"*****************
NeoBundle 'osyo-manga/vim-over'

" Plugin key-mappings.
" over.vimの起動
nnoremap <silent> ,ov :OverCommandLine<CR>
"nnoremap <silent> ; :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"*****************
"* LeafCage/yankround.vim
"*****************
NeoBundle 'LeafCage/yankround.vim'

" Plugin key-mappings.
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50

"*****************
"* eskk.vim
"*****************
NeoBundle 'tyru/eskk.vim'
let g:eskk#large_dictionary = expand('~/dotfiles/MyDict/skk/SKK-JISYO.L')
let g:eskk#enable_completion = 1
let g:eskk#show_annotation = 1
let g:eskk#tab_select_completion = 1
"
"" Use google-ime-skk
let g:eskk#server = {
\  'host': 'localhost',
\  'port': 55100,
\  'type': 'notfound',
\}

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
