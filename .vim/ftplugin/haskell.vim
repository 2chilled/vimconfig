"Use the usual keybinding for omni completion
"inoremap <C-@> <C-x><C-o>
noremap <F2> :HdevtoolsType<CR>
"Ctrl F2
nnoremap O5Q :HdevtoolsClear<CR>
nnoremap <F3> 
nnoremap _ct :!hasktags --ignore-close-implementation --ctags .<CR>
noremap <leader>t :GhcModType<CR>
noremap <leader>T :GhcModTypeClear<CR>
let g:haddock_browser="/usr/bin/firefox"
let g:syntastic_haskell_checkers = ["hdevtools", "hlint"]
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
