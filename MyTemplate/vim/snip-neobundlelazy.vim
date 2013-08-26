"*****************
"* {{_cursor_}}
"*****************
NeoBundleLazy 'aaa/bbb.vim'
"NeoBundleLazy 'Shougo/vimshell.vim', { 'depends' : [ 'Shougo/vimproc.vim' ] }
if s:bundle_tap('bbb.vim') " {{{
  call s:bundle_config({
        \   'autoload' : {
        \     'functions' : [ "",
        \                     "",
        \                     "" ],
        \     'mappings' : [ "<Plug>()", 
        \                    "<Plug>()", 
        \                    "<Plug>()" ],
        \     'commands' : [
        \       {
        \         'name' : 'Unite',
        \         'complete' : 'customlist,unite#complete_source'
        \       },
        \       'UniteWithCursorWord',
        \       'UniteWithInput'
        \     ]
        \   }
        \ })
 
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:unite_kind_jump_list_after_jump_scroll=0
  endfunction
 
  nnoremap <silent> <space>u  :<c -u>Unite -start-insert menu:unite<cr>
 
  call s:bundle_untap()
endif " }}}
