set foldmethod=indent

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

call deoplete#disable()
