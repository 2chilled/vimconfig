"Use the usual keybinding for omni completion
"inoremap <C-@> <C-x><C-o>
noremap <F2> :HdevtoolsType<CR>
nnoremap <F3> :HdevtoolsClear<CR>
nnoremap <leader>ct :!hasktags --ignore-close-implementation --ctags .<CR>
noremap <leader>gmt :GhcModType<CR>
noremap <leader>gmT :GhcModTypeClear<CR>
noremap <leader>gmti :GhcModTypeInsert<CR>
let g:haddock_browser="/usr/bin/firefox"
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
setlocal omnifunc=necoghc#omnifunc
set cmdheight=2
set tabstop=2
" size of an "indent"
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

let g:neomake_haskell_enabled_makers = ['hdevtools', 'hlint']
