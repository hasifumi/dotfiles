"*****************
"* {{_cursor_}}
"*****************
NeoBundleLazy '', {
\   'autoload' : { 
\       'functions' : [ "",
\                       "",
\                       "" ],
\       'mappings' : [ "<Plug>()", 
\                      "<Plug>()", 
\                      "<Plug>()" ],
\       'commands' : [ "", 
\                      "", 
\                      "" ],
\   }
\}
let s:bundle = neobundle#get("")
function! s:bundle.hooks.on_source(bundle)
  let g:neosnippet#snippets_directory = '~/vimfiles/bundle/neobundle/snipmate-snippets/snippets'
endfunction
unlet s:bundle

" Plugin key-mappings.
nmap <C-a>     <Plug>()

