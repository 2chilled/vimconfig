autocmd BufWritePre * SortScalaImports
autocmd BufWritePre * StripWhitespace

nnoremap <silent> <leader>ws      <cmd>lua require'metals'.worksheet_hover()<CR>
autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
"set shortmess+=c
