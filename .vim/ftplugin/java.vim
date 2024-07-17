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

:lua << EOF
  local config = {
    cmd = {
        'jdtls',
        '-Xmx2G',
        '-data',
        vim.fn.getcwd() .. "/../.workspace/"
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }
  require('jdtls').start_or_attach(config)
EOF
