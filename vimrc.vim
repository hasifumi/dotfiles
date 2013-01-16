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
colorscheme desert
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
set nobackup
set lines=60 columns=140
 
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
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><CR>

"*****************
"  tab
"*****************
nnoremap <silent> ,tn :<C-u>tabnext<CR>
nnoremap <silent> ,tp :<C-u>tabprevious<CR>

"*****************
"  Encording
"*****************
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,enc-jp,cp932

"*****************
"  Folding
"*****************
autocmd FileType javascript set foldmethod=marker
autocmd FileType coffee set foldmethod=marker

"*****************
"* pathogen
"*****************
"call pathogen#runtime_append_all_bundles()

"*****************
"* MyScript 
"*****************
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
"NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle	'Shougo/neosnippet'
NeoBundleLazy	'honza/snipmate-snippets'
NeoBundle	'Shougo/vimfiler'
"NeoBundleLazy 'Shougo/vimfiler', {
"\   'autoload' : { 'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer" ] }
"\}
if Is_Android()
  NeoBundle	'Shougo/vimshell'
endif
"NeoBundleLazy 'Shougo/vimshell', {
"\   'autoload' : { 'commands' : [ 'VimShell', "VimShellPop", "VimShellInteractive" ] }
"\}
NeoBundle	'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/echodoc'
NeoBundleLazy 'Shougo/vesting'
NeoBundleLazy 'tsukkee/unite-tag'
NeoBundleLazy 'tsukkee/unite-help'
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'tpope/vim-fugitive'
NeoBundleLazy 'h1mesuke/unite-outline'
NeoBundleLazy 'ujihisa/unite-colorscheme'
"NeoBundle 'thinca/unite-history'
NeoBundleLazy 'kchmck/vim-coffee-script', {
	      \ 'autoload' : {
	      \     'filetypes' : ['coffee'],
	      \    },
	      \ }
NeoBundleLazy 'pekepeke/titanium-vim'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'clausreinke/typescript-tools'
NeoBundle 'kana/vim-smartinput'
"NeoBundle 'nobuoka/typescript_completion.vim'
NeoBundleLazy	'FavEx'
"NeoBundle 'teramako/jscomplete-vim'
NeoBundleLazy 'hasifumi/timobile_complete'
NeoBundleLazy 'hasifumi/enchant_complete'

NeoBundleLazy 'test3', { 'type' : 'nosync', 'base' : '~/vimfiles/bundle/manual/' }
NeoBundleLazy 'Refactoring', { 'type' : 'nosync', 'base' : '~/vimfiles/bundle/manual/' }

NeoBundleLazy 'ujihisa/neco-look'
NeoBundleLazy 'ujihisa/neco-ruby'
NeoBundle 'tyru/open-browser.vim'
"NeoBundleLazy "tyru/open-browser.vim", {
"\   'autoload' : {
"\       'functions' : "OpenBrowser",
"\       'commands'  : "OpenBrowserSearch",
"\       'mappings'  : "<Plug>(openbrowser-smart-search)"
"\   },
"\}
NeoBundle 'kana/vim-smartchr'
NeoBundleLazy 'tpope/vim-surround'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundleLazy 'taglist.vim'
NeoBundle 'ref.vim'
NeoBundleLazy 'fugitive.vim'
NeoBundleLazy 'Source-Explorer-srcexpl.vim'
NeoBundleLazy 'vtreeexplorer'
NeoBundleLazy 'JSON.vim'
NeoBundleLazy 'Tagbar'
NeoBundleLazy 'camelcasemotion'
NeoBundleLazy 'EasyMotion'
NeoBundleLazy 'refactor'
NeoBundleLazy "git://github.com/tyru/caw.vim.git"
NeoBundleLazy 'git://github.com/tpope/vim-pathogen.git'
"if isdirectory(expand('~/.vim/bundle/neobundle/vim-pathogen'))
"	call pathogen#infect('~/.vim/bundle/pathogen')
"endif

filetype plugin indent on

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
"inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
	
"" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

autocmd BufRead,BufNewFile *.coffee setlocal ft=coffee
autocmd BufRead,BufNewFile *.ts setlocal ft=typescript

"*****************
"* vimshell
"*****************
nnoremap <silent> ,vs :VimShell<CR>
nnoremap <silent> ,vsp :VimShellPop<CR>

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

  "call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
  "call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
  "let g:vimshell_execute_file_list['zip'] = 'zipinfo'
  "call vimshell#set_execute_file('tgz,gz', 'gzcat')
  "call vimshell#set_execute_file('tbz,bz2', 'bzcat')
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

"function! g:my_chpwd(args, context)
"  call vimshell#execute('ls')
"endfunction

"autocmd FileType int-* call s:interactive_settings()
"function! s:interactive_settings()
"endfunction

"*****************
"* vimfiler
"*****************
nnoremap <silent> ,vf :VimFiler -simple -winwidth=35 -no-quit<CR>

call vimfiler#set_execute_file('vim', 'vim')
"call vimfiler#set_execute_file('txt', 'notepad')
call vimfiler#set_execute_file('txt', 'vim')
"call vimfiler#set_execute_file('c', ['vim', 'notepad'])
call vimfiler#set_execute_file('c', 'vim')
call vimfiler#set_execute_file('coffee', 'vim')
call vimfiler#set_execute_file('ts', 'vim')

" Edit file by tabedit.
"let g:vimfiler_edit_action = 'tabopen'

let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
"let g:vimfiler_tree_opened_icon = '笆ｾ'
"let g:vimfiler_tree_closed_icon = '笆ｸ'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" Use trashbox.
" Windows only and require latest vimproc.
let g:unite_kind_file_use_trashbox = 1

"*****************
"* Unite
"*****************
" インサートモードで開始しない
let g:unite_enable_start_insert = 1
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
" neocomplcache
"imap <C-h> <Plug>(neocomplcache_snippets_unite_complete)
" neosnippet
nnoremap <silent> ,us  :<C-u>Unite snippet<CR>
" neobundle 
nnoremap <silent> ,unb  :<C-u>Unite neobundle<CR>

" unite_my_settings
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " Overwrite settings.

  nmap <buffer> <ESC>      <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  
  " Start insert.
  " let g:unite_enable_start_insert = 0
endfunction

" Unite-tag
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> u<C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif
" Unite-vimshell-history
inoremap <buffer><expr> <C-l> unite#start_complete(
  \ ['vimshell/history'], {                                                                                                                  
  \ 'start_insert' : 1,
  \ 'input' : vimshell#get_cur_text()})

"*****************
"* neosnippet
"*****************
let g:neosnippet#snippets_directory = '~/vimfiles/bundle/neobundle/snipmate-snippets/snippets'
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
"* VTreeExplorer
"*****************
let g:treeExplWinSize=45
let g:treeExplVertical=1

"*****************
"* JSON
"*****************
au! BufRead,BufNewFile *.json,*.JSON set filetype=json 

augroup json_autocmd 
  autocmd! 
  autocmd FileType json setlocal autoindent 
  autocmd FileType json setlocal formatoptions=tcq2l 
  autocmd FileType json setlocal textwidth=78 shiftwidth=2 
  autocmd FileType json setlocal softtabstop=2 tabstop=8 
  autocmd FileType json setlocal expandtab 
  autocmd FileType json setlocal foldmethod=syntax 
augroup END 

"*****************
"* echodoc
"*****************
"let g:echodoc_enable_at_startup=1

"*****************
"* MyScripts
"*****************
":function! GetJsonURL()"{{{
"  "let ret = {}
"  let ret = ""
"	"let val = []
"	let org = &enc
"	" nullをあらかじめ定義
"	let null = []
"	let &enc = "utf-8"
"	"let ret = system("curl -k -u user:pass -s \"" . a:url . "\"")
"	let inputfile = "c:/users/fumio/Downloads/api2.json"
"	for line in readfile(inputfile)
"		"let ret = ret + line
"	  let line = substitute(line, '\\u\([0-9a-zA-Z]\{4\}\)', '\=nr2char("0x".submatch(1))', 'g')
"		"call add(ret, line)
"    let ret = ret.line
"	endfor
"	"let ret = substitute(ret, '\\u\([0-9a-zA-Z]\{4\}\)', '\=nr2char("0x".submatch(1))', 'g')
"	"exe "let val = " . iconv(ret, "utf-8", org)
"	"echo ret
"	echo eval("ret")
"	let &enc = org
"	"return val
":endfunction
"
"function! Titanium_echodoc()
"  if g:loaded_echodoc
"		call echodoc#register('titanium_echodoc', s:doc_dict)
"		let s:ti_text = s:getfile("c:/Users/fumio/vimfiles/plugin/timobile_for_echodoc.txt")
"	endif
"endfunction
"
"function! s:getfile(inputfile)
"  let org = &enc
"  let &enc = "utf-8"
"
"  let ret = ""
"  let ret2 = {}
"	"let inputfile = "c:/Users/fumio/Downloads/api.json"
"  "for line in readfile("c:/Users/fumio/vimfiles/plugin/timobile_for_echodoc.txt")
"  for line in readfile(a:inputfile)
"    let ret = ret . line
"  endfor
"  let ret2 = eval(ret)
"
"  let &enc = org
"  return ret2
"endfunction
"
"let s:doc_dict = {
"      \ 'name' : 'titanium_echodoc',
"      \ 'rank' : 5,
"      \ 'filetypes' : { 'coffee' : 1, 'javascript' : 1 },
"      \ }
"
"function! s:doc_dict.search(cur_text)
"	"let l:test_text = {
"	"  \ "text1" : " Text1",
"	"  \ "text2" : " Text2",
"	"  \ "text3" : " Text3",
"	"  \ "Ti.API.info" : " Ti.API.infoi(message)",
"	"  \ "Ti.API.addEventListener" : " Ti.API.addEventListener(name, callback)",
"	"  \ }
"	let ret = []
"	"if has_key(l:test_text, a:cur_text)
"	if has_key(s:ti_text, a:cur_text)
"		call add(ret, { 'text' : 'Usage: ', 'highlight' : 'Identifier' })
"	  "call add(ret, { 'text' : l:test_text[a:cur_text] })
"	  call add(ret, { 'text' : s:ti_text[a:cur_text] })
"  endif
"	return ret
"endfunction
""}}}"}}}
"function! Test()
"	:e test.test
"	:set filetype=test
"endfunction
function! Test5()
  echo Is_Android()
endfunction

nnoremap <Leader>aa :source `=expand("%")`<CR>

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
"* coffeetag for tagbar
"*****************
"if executable('coffeetags')"{{{
"  let g:tagbar_type_coffee = {
"        \ 'ctagsbin' : 'coffeetags',
"        \ 'ctagsargs' : '',
"        \ 'kinds' : [
"        \ 'f:functions',
"        \ 'o:object',
"        \ ],
"        \ 'sro' : ".",
"        \ 'kind2scope' : {
"        \ 'f' : 'object',
"        \ 'o' : 'object',
"        \ }
"        \ }
"endif"}}}
"
"*****************
"* typescript-vim
"*****************
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

"*****************
"* open-browser.vim
"*****************
nmap ,ob  <Plug>(openbrowser-smart-search)
vmap ,ob  <Plug>(openbrowser-smart-search)
nmap ,obo <Plug>(openbrowser-open)
vmap ,obo <Plug>(openbrowser-open)

