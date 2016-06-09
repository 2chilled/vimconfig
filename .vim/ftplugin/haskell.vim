"Use the usual keybinding for omni completion
"inoremap <C-@> <C-x><C-o>
noremap <F2> :HdevtoolsType<CR>
nnoremap <F3> :HdevtoolsClear<CR>
nnoremap <leader>ct :!hasktags --ignore-close-implementation --ctags .<CR>
noremap <leader>gmt :GhcModType<CR>
noremap <leader>gmT :GhcModTypeClear<CR>
noremap <leader>gmti :GhcModTypeInsert<CR>
let g:haddock_browser="/usr/bin/firefox"
let g:syntastic_haskell_checkers = ["hdevtools", "hlint"]
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
set cmdheight=2
