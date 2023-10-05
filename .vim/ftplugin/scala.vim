autocmd BufWritePre * SortScalaImports
autocmd BufWritePre * StripWhitespace

nnoremap <silent> <leader>ws      <cmd>lua require'metals'.worksheet_hover()<CR>
augroup lsp_document_format
  autocmd! * <buffer>
  autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
augroup END
"autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
"set shortmess+=c
