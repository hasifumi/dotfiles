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
"  日本語
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
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle	'Shougo/vimfiler'
NeoBundle	'Shougo/vimshell'
NeoBundle	'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/vesting'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'thinca/unite-history'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pekepeke/titanium-vim'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'clausreinke/typescript-tools'
NeoBundle 'kana/vim-smartinput'
"NeoBundle 'nobuoka/typescript_completion.vim'
NeoBundle	'FavEx'
"NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'hasifumi/timobile_complete'
NeoBundle 'hasifumi/enchant_complete'

NeoBundle 'test3', { 'type' : 'nosync', 'base' : '~/vimfiles/bundle/manual/' }
NeoBundle 'Refactoring', { 'type' : 'nosync', 'base' : '~/vimfiles/bundle/manual/' }

NeoBundle 'git://github.com/tpope/vim-pathogen.git'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'ujihisa/neco-ruby'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'taglist.vim'
NeoBundle 'ref.vim'
NeoBundle 'fugitive.vim'
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'vtreeexplorer'
NeoBundle 'JSON.vim'
NeoBundle 'Tagbar'
NeoBundle 'camelcasemotion'
NeoBundle 'EasyMotion'
NeoBundle 'refactor'
NeoBundle "git://github.com/tyru/caw.vim.git"
NeoBundle 'git://github.com/tpope/vim-pathogen.git'
if isdirectory(expand('~/.vim/bundle/neobundle/vim-pathogen'))
	call pathogen#infect('~/.vim/bundle/pathogen')
endif

filetype plugin indent on

"*****************
"* neocomplcache
"*****************
" Use neocomplcache 
let g:neocomplcache_enable_at_startup = 1
"" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
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

autocmd BufRead,BufNewFile *.coffee setlocal ft=coffee
autocmd BufRead,BufNewFile *.ts setlocal ft=typescript

"*****************
"* vimshell
"*****************
nnoremap <silent> ,vs :VimShell<CR>

"*****************
"* vimfiler
"*****************
nnoremap <silent> ,vf :VimFiler -simple -winwidth=35 -no-quit<CR>


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
imap <C-h> <Plug>(neocomplcache_snippets_unite_complete)
" select next line at insert-mode
"imap <silent> n :<Plug>>(unite_select_next_line)
" select previous line at insert-mode
"imap <silent> p :<Plug>>(unite_select_previous_line)

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
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=2 
  autocmd FileType json set softtabstop=2 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
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
"if executable('coffeetags')
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
"endif
"
"*****************
"* typescript-vim
"*****************
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

