nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
setlocal omnifunc=javacomplete#Complete

autocmd BufWritePre * SortScalaImports
autocmd BufWritePre * StripWhitespace

"let g:ycm_filetype_whitelist = { '*': 0 }
"let g:ycm_filetype_blacklist = {
      "\ 'java' : 1,
      "\}

"let g:deoplete#enable_at_startup = 1
"
let g:syntastic_mode_map = { 'mode': 'passive' }

autocmd! BufWritePost * Neomake
