" Common Editting 
set ts=2
set so=999
set sw=2
set expandtab
set smarttab
set autoindent
set hlsearch
set nocscopeverbose
set spl=en_us spell
syntax on

colorscheme slate

let g:languagetool_jar='$HOME/.vim/src/LanguageTool-2.6/languagetool-commandline.jar'

" LaTex
filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flafor='pdflatex'

" autotag
source ~/.vim/autotag/autotag.vim

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

""""""""""""""""""""""
"Vundle
""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

""""""""""""""""""""""
"Powerline
""""""""""""""""""""""
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

""""""""""""""""""""""
"Fugitive
""""""""""""""""""""""
"Fugitive is a Git plugin. It basically wraps most Git commands so that you can call them from inside Vim. They are prefixed with G, for example Gcommit For example it allows you to stage files directly from Vim and make the commit. It also leverages VimDiff to perform conflict resolution, blame and the like. There’s a whole set of screencasts on how to use it available from Vim Casts which I recommend watching.

Bundle 'tpope/vim-fugitive'

""""""""""""""""""""""
"NerdTree
""""""""""""""""""""""
Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

""""""""""""""""""""""
"PythonMode
"""""""""""""""""""""
Bundle 'klen/python-mode'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Ctrl-c>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<Ctrl-c>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
