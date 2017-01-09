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

autocmd! BufWritePost * Neomake

autocmd BufWritePre * SortScalaImports
autocmd BufWritePre * StripWhitespace

let g:deoplete#sources = {}
let g:deoplete#sources.scala = ['buffer', 'tags', 'omni']
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.scala = [
  \ '[^. *\t]\.\w*',
  \ '[:\[,] ?\w*',
  \ '^import .*'
  \]
