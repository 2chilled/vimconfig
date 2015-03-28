"activate pathogen plugin manager
call pathogen#infect()
call pathogen#helptags()

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set tw=110

set spelllang=de,en
set spellfile=~/.vim/spell/myspellfile.utf-8.add

vmap r "_dP

" size of a hard tabstop
set tabstop=2
" size of an "indent"
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
" " make "tab" insert indents instead of tabs at the beginning of a line
" set smarttab
"
" always uses spaces instead of tab characters
set expandtab
syntax on
colorscheme desert

"syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:haddock_browser="/usr/bin/firefox"
let g:haskell_conceal_wide = 0
au BufEnter *.hs compiler ghc

"Use the usual keybinding for omni completion
inoremap <C-@> <C-x><C-o>
"set current working directory
nnoremap ,cd :cd %:p:h<CR>

