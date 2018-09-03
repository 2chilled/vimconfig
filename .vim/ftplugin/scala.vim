set foldmethod=indent
nnoremap <leader>ct :!ctags -R . --exclude=target --exclude=vendor<CR>
nnoremap <leader>ent :EnType<CR>
xnoremap <leader>ent :EnType selection<CR>
noremap <leader>enT :EnTypeCheck<CR>
nnoremap <leader>enit :EnInspectType<CR>
nnoremap <leader>ens :EnSymbol<CR>
nnoremap <leader>end :EnDeclaration<CR>
nnoremap <leader>enoi :EnOrganizeImports<CR>
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
call deoplete#custom#var('omni', 'input_patterns', {
  \ 'scala': [
    \ '[^. *\t]\.\w*',
    \ '[:\[,] ?\w*',
    \ '^import .*'
    \],
  \})
call deoplete#custom#option('ignore_sources', {'scala': ['LanguageClient']})

let ensime_server_v2=1
let $ENSIME_VIM_DEBUG = 1

set errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-G\ %#[error]\ %m
set errorformat+=%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-G\ %#[warn]\ %m
set errorformat+=%C\ %#%m
