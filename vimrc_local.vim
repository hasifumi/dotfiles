"if exists('$HOME') && filereadable(('$HOME' . '/vimrc_android.vim')
"  source $HOME/vimrc_android.vim
"endif

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle/neobundle.vim/
	call neobundle#rc(expand('~/vimfiles/bundle/neobundle'))
endif

NeoBundle	'Shougo/neobundle.vim'
NeoBundle	'Shougo/neocomplcache'
NeoBundle	'Shougo/vimproc'

filetype plugin indent on