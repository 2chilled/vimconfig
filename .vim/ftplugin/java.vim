set foldmethod=indent
nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
"setlocal omnifunc=javacomplete#Complete
"let g:JaveComplete_AutoStartServer = 0

"autocmd BufWritePre * SortScalaImports
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

let g:neomake_java_enabled_makers = []

"let g:deoplete#sources = {}
"let g:deoplete#sources.java = ['buffer', 'tags', 'omni']
"let g:deoplete#omni#input_patterns = {}
"let g:deoplete#omni#input_patterns.java = [
  "\ '[^. *\t]\.\w*',
  "\ '[:\[,] ?\w*',
  "\ '^import .*'
  "\]
