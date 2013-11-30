" Common Editting 
set ts=3
set so=999
set sw=3
set expandtab
set smarttab
set autoindent
set hlsearch
set nocscopeverbose
" set spl=en_us spell
syntax on
" source ~/.vim/plugin/cscope_maps.vim

colorscheme peachpuff
"colorscheme morning
"colorscheme desert

" LaTex
filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flafor='pdflatex'

" ctag
set tags=~/pytags


" TagList
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Update=1
let Tlist_Auto_Highlight_Tag=1
let Tlist_Compact_Format=1
let Tlist_Close_On_Select=1
let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Show_One_File=1

" cscope auto-load
function! LoadCscope()
   let db = findfile("cscope.out", ".;")
   if (!empty(db))
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
   endif
endfunction
au BufEnter /* call LoadCscope()"

" Objective-C
set runtimepath+=~/.vim/src/ultisnips_rep 
call pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim

"clang
let g:clang_use_library      = 1
let g:clang_auto_select      = 0
let g:clang_complete_auto    = 1
let g:clang_complete_copen   = 1
let g:clang_complete_macros  = 1
let g:clang_complete_patters = 1
set completeopt=menu,longest

let g:clang_library_path = '/usr/lib/llvm-3.4/lib'
"let g:clang_auto_user_options = "-I/usr/include/c++/4.6, .clang_complete"
"let g:clang_auto_user_options = "-I/usr/include/c++/4.6"
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
