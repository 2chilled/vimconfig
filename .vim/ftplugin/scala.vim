set foldmethod=syntax
nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
noremap <leader>ent :EnType<CR>
noremap <leader>enT :EnTypeCheck<CR>
nnoremap <leader>enit :EnInspectType<CR>
nnoremap <leader>ens :EnSymbol<CR>
nnoremap <leader>end :EnDeclaration<CR>
noremap <leader>enf :EnFormatSource<CR>

let g:EnErrorStyle='Underlined'
