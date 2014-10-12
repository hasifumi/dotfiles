set encoding=utf-8

" start vundler
filetype off
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
set runtimepath+=~/vimfiles/bundle/neobundle/neobundle.vim/
call neobundle#rc(expand('~/vimfiles/bundle/neobundle'))

NeoBundle "nsf/gocode"
NeoBundle "Blackrush/vim-gocode"

NeoBundle "Shougo/neocomplete"
NeoBundle "Shougo/echodoc.vim"

" enable all the plugins
filetype plugin indent on

  let g:neocomplete#data_directory = "~/.vim/tmp/swap"
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1

  "" Enable heavy omni completion.
  "if !exists('g:neocomplete#sources#omni#input_patterns')
  "  let g:neocomplete#sources#omni#input_patterns = {}
  "endif

  "" golang fix
  "let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
