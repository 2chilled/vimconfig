let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'dkprice/vim-easygrep'
Plug 'airblade/vim-rooter'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'LnL7/vim-nix'
Plug 'Twinside/vim-haskellFold'
Plug 'derekwyatt/vim-scala'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-fugitive'
Plug 'sukima/xmledit'
Plug 'jtai/vim-womprat'
Plug 'flazz/vim-colorschemes'
Plug 'vim-latex/vim-latex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'Raimondi/delimitMate'
Plug 'gre/play2vim'
Plug 'othree/html5.vim'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ludovicchabant/vim-gutentags'
Plug 'elubow/cql-vim'
Plug 'GEverding/vim-hocon'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim/' }
Plug 'vim-scripts/BufOnly.vim'
Plug 'junegunn/fzf'
Plug 'goerz/jupytext.vim'
Plug 'udalov/kotlin-vim'
Plug 'glacambre/firenvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'scalameta/nvim-metals', {'tag': 'v0.7.x'}
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'mfussenegger/nvim-jdtls'
call plug#end()

filetype plugin indent on    " required

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:EasyGrepCommand = 1
endif

" No automatic switching of working dir when buffer is opened
set noacd

" case-sensitive if search contains an uppercase character
set smartcase

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

set tw=110

set spelllang=de,en
set spellfile=~/.vim/spell/myspellfile.utf-8.add

vmap r "_dP

" size of a hard tabstop
set tabstop=2
" size of an "indent"
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
" " make "tab" insert indents instead of tabs at the beginning of a line
" set smarttab
"
" always uses spaces instead of tab characters
set expandtab

"for setting vim settings in files
set modeline

syntax on
set t_Co=256
"colorscheme desert
colorscheme wombat256mod

"bash like tab completion for file names
set wildmode=longest,list,full

"completion optimizations
set completeopt=menu,menuone,noselect
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <SPACE> <Nop>
let mapleader = " "

command SUDOwrite :execute 'w !sudo tee > /dev/null %' | edit!

nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wp :wincmd p<CR>
nnoremap <leader>w= :wincmd =<CR>

nnoremap U :redo<CR>

nnoremap t :tabnew

"Alt-F1
"nnoremap O1;3P :NERDTreeFind<CR>
nnoremap <leader>ntf :NERDTreeFind<CR>
"Alt-1
nnoremap <leader>ntt :NERDTreeToggle<CR>

noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>hl :set hlsearch!<CR>
noremap <leader>pt :CtrlPTag<CR>
noremap <leader>pb :CtrlPBuffer<CR>
noremap gb :bprevious<CR>
noremap gB :bnext<CR>

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.sc set filetype=scala
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:EasyGrepFilesToExclude=".svn,.git,dist/**,target/**,node_modules/**"

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|dist|target|cassandra[\/]data|venv|node_modules$',
    \ 'file': '\v\.(exe|so|dll|hi|o|class)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_root_markers = ['shell.nix', '.git']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
"dbext
let g:dbext_default_type   = 'MYSQL'
let g:dbext_default_user   = 'root'
let g:dbext_default_passwd = ''
let g:dbext_default_profile_generic = 'type=MYSQL:user=root:passwd='

set tags=./tags,./TAGS,tags,TAGS,./.tags,.tags

"windows
set switchbuf +=useopen

"vebugger
let g:vebugger_leader='<Leader>d'

"disable mouse support
set mouse=

autocmd BufWritePre * StripWhitespace

let g:gutentags_ctags_exclude = ['**/target/**', '/cdk.out', 'node_modules']
let g:gutentags_project_root = [
  \'.project_root',
  \'shell.nix',
  \'.git',
  \ '.hg',
  \ '.svn',
  \ '.bzr',
  \ '_darcs',
  \ '_FOSSIL_',
  \ '.fslckout']


"used to workaround a strange char encoding issue with xfce4-terminal (02.05.2018)
set guicursor=
tnoremap ^^ <C-\><C-n>
tnoremap  <C-\><C-n>

"language server client
set hidden

"let g:airline#extensions#coc#enabled = 1

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
"inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
"nmap <silent><Leader>ld <Plug>(coc-definition)
"nmap <silent><Leader>lt <Plug>(coc-type-definition)
"nmap <silent><Leader>li <Plug>(coc-implementation)
"nmap <silent><Leader>lR <Plug>(coc-references)

" Remap for do codeAction of current line
"nmap <silent><Leader>la <Plug>(coc-codeaction)

" Remap for format selected region
"xmap <leader>lf  <Plug>(coc-format-selected)
"nmap <leader>lf  <Plug>(coc-format-selected)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <silent><Leader>lr <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent><Leader>lD  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent><Leader>lo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><Leader>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Add status line support, for integration with other plugins, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Toggle panel with Tree Views
nnoremap <silent><Leader>lT :<C-u>CocCommand metals.tvp<CR>

silent! so .vimlocal
autocmd FileType json syntax match Comment +\/\/.\+$+

set scrollback=100000
let g:rooter_patterns = ['shell.nix', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
" workaround to prevent terminal from crashing
autocmd TermOpen set wrap|term://* startinsert
imap <c-space> <c-x><c-o>

:lua << EOF
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
 -- cmp.setup.filetype('gitcommit', {
 --   sources = cmp.config.sources({
 --     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
 --   }, {
 --     { name = 'buffer' },
 --   })
 -- })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  metals_config = require'metals'.bare_config()
  metals_config.settings = {
     showImplicitArguments = true,
     excludedPackages = {
       "akka.actor.typed.javadsl",
       "com.github.swagger.akka.javadsl"
     }
  }

  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

  metals_config.on_attach = function()
    require'completion'.on_attach();
  end

  metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = '-',
      }
    }
  )

  require'lspconfig'.texlab.setup{
    settings = {
      texlab = {
        chktex = {
          onSave = true
        },
        build = {
          onSave = true
        }
      }
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities()
  }
EOF

augroup lsp
  au!
  au FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
augroup end

nmap <silent><Leader>ld           <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K               <cmd>lua vim.lsp.buf.hover()<CR>
nmap <silent><Leader>li           <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent><Leader>lR           <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><Leader>lo       <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><Leader>ls       <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nmap <silent><Leader>lr           <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>lf      <cmd>lua vim.lsp.buf.formatting()<CR>
nmap <silent><Leader>la           <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><Leader>lD       <cmd>lua vim.diagnostic.setqflist()<CR>
nnoremap <silent> <space>d        <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> [c              <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
nnoremap <silent> ]c              <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>
set foldmethod=indent
setlocal omnifunc=v:lua.vim.lsp.omnifunc

