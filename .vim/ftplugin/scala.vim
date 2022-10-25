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

set completeopt="menuone","noinsert","noselect"

nmap <silent><Leader>ld           <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K               <cmd>lua vim.lsp.buf.hover()<CR>
nmap <silent><Leader>li           <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent><Leader>lR           <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><Leader>lo       <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><Leader>ls       <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nmap <silent><Leader>lr           <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>lf      <cmd>lua vim.lsp.buf.formatting()<CR>
nmap <silent><Leader>la           <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ws      <cmd>lua require'metals'.worksheet_hover()<CR>
nnoremap <silent><Leader>lD       <cmd>lua vim.diagnostic.setqflist()<CR>
nnoremap <silent> <space>d        <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> [c              <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
nnoremap <silent> ]c              <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>
"inoremap <silent> <expr> <c-space> <cmd>lua require'metals'.open_all_diagnostics()<CR>
" inoremap <silent><expr> <c-space> <cmd>lua require'cmp'.complete()<CR>

autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menuone,noinsert,noselect
set shortmess+=c
