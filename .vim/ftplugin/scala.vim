set foldmethod=syntax
nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
noremap <leader>et :EnType<CR>
nnoremap <leader>eit :EnInspectType<CR>
nnoremap <leader>es :EnSymbol<CR>
nnoremap <leader>ed :EnDeclaration<CR>
noremap <leader>ef :EnFormatSource<CR>

let EnErrorStyle='Underlined'
