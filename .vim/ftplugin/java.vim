nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
setlocal omnifunc=javacomplete#Complete

autocmd BufWritePre * SortScalaImports
