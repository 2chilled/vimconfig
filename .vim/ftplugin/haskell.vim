"Use the usual keybinding for omni completion
"inoremap <C-@> <C-x><C-o>
"noremap <F2> :HdevtoolsType<CR>
"nnoremap <F3> :HdevtoolsClear<CR>
nnoremap <leader>ct :!hasktags --ctags .<CR>
"noremap <leader>gmt :GhcModType<CR>
"noremap <leader>gmT :GhcModTypeClear<CR>
"noremap <leader>gmti :GhcModTypeInsert<CR>
" not needed, just slows down vim because of https://github.com/commercialhaskell/stack/issues/274
"function! hdevtools#prepare_shutdown()
"endfunction
"let g:haddock_browser="/usr/bin/firefox"
"let g:haskellmode_completion_ghc = 0
"let g:necoghc_enable_detailed_browse = 1
set omnifunc=lsc#complete#complete
set showcmd
set cmdheight=2
set tabstop=2
" size of an "indent"
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

"let g:neomake_haskell_enabled_makers = ['hlint', 'hdevtools']
let g:ghcid_command = "ghcid --test=:main"
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

let g:deoplete#sources = {}
let g:deoplete#sources.haskell = ['buffer', 'tags', 'omni']
call deoplete#custom#source('omni', 'functions', {
  \ 'haskell':  'LanguageClient#complete',
  \})

call deoplete#custom#var('omni', 'input_patterns', {
  \ 'haskell': [
    \ '[^. *\t]\.\w*',
    \ '^import\s+\w*',
    \],
  \})

call deoplete#disable()

"map <Leader>lh :call LanguageClient#textDocument_hover()<CR>
"map <Leader>lc :call LanguageClient#textDocument_codeAction()<CR>
"map <Leader>ld :call LanguageClient#textDocument_definition()<CR>
"map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
"map <Leader>lR :call LanguageClient#textDocument_references()<CR>
"map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
"map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
"map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
