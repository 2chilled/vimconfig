nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
setlocal omnifunc=javacomplete#Complete

autocmd BufWritePre * SortScalaImports
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
