set foldmethod=indent
autocmd BufWritePre * SortScalaImports
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

"nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
"nnoremap <leader>ent :EnType<CR>
"xnoremap <leader>ent :EnType selection<CR>
"noremap <leader>enT :EnTypeCheck<CR>
"nnoremap <leader>enit :EnInspectType<CR>
"nnoremap <leader>ens :EnSymbol<CR>
"nnoremap <leader>end :EnDeclaration<CR>
"nnoremap <leader>enoi :EnOrganizeImports<CR>
"noremap <leader>enf :EnFormatSource<CR>
"noremap <leader>ensi :EnSuggestImport<CR>
"noremap <leader>enD :EnDocBrowse<CR>

"let g:deoplete#sources = {}
"let g:deoplete#sources.java = ['buffer', 'tags', 'omni']
"let g:deoplete#omni#input_patterns = {}
"let g:deoplete#omni#input_patterns.java = [
  "\ '[^. *\t]\.\w*',
  "\ '[:\[,] ?\w*',
  "\ '^import .*'
  "\]

map <Leader>lh :call LanguageClient#textDocument_hover()<CR>
map <Leader>lc :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ld :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lR :call LanguageClient#textDocument_references()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
