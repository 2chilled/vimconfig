set foldmethod=indent
nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
noremap <leader>ent :EnType<CR>
noremap <leader>enT :EnTypeCheck<CR>
nnoremap <leader>enit :EnInspectType<CR>
nnoremap <leader>ens :EnSymbol<CR>
nnoremap <leader>end :EnDeclaration<CR>
noremap <leader>enf :EnFormatSource<CR>
noremap <leader>ensi :EnSuggestImport<CR>
noremap <leader>enD :EnDocBrowse<CR>

let g:ycm_filetype_whitelist = { '*': 0 }
let g:ycm_filetype_blacklist = {
      \ 'scala' : 1,
      \}

let g:syntastic_full_redraws = 0

let g:syntastic_scala_checkers = ["ensime"]

let g:deoplete#enable_at_startup = 1
