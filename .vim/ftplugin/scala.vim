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
call deoplete#custom#option('ignore_sources', {'scala': ['LanguageClient']})

let ensime_server_v2=1
let $ENSIME_VIM_DEBUG = 1

"set errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-G\ %#[error]\ %m
"set errorformat+=%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-G\ %#[warn]\ %m
"set errorformat+=%C\ %#%m

"highlight lscDiagnosticError cterm=bold ctermfg=196 gui=bold guifg=DarkRed
"highlight lscDiagnosticWarning cterm=bold ctermfg=214 gui=bold guifg=Orange

let g:LanguageClient_serverCommands = {}
call LanguageClient#exit()
call deoplete#disable()
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <Leader>ld <Plug>(coc-definition)
nmap <Leader>lt <Plug>(coc-type-definition)
nmap <Leader>li <Plug>(coc-implementation)
nmap <Leader>lR <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <Leader>la <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <Leader>lf :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Show all diagnostics
nnoremap <Leader>lD  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <Leader>lo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <Leader>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
