set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/deoplete.nvim'
"Plugin 'eagletmt/neco-ghc'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'airblade/vim-rooter'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'LnL7/vim-nix'
"Plugin 'bitc/vim-hdevtools'
Plugin 'Twinside/vim-haskellFold'
Plugin 'derekwyatt/vim-scala'
Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'vim-scripts/dbext.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'ensime/ensime-vim'
Plugin 'sukima/xmledit'
Plugin 'idanarye/vim-vebugger'
Plugin 'jtai/vim-womprat'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-latex/vim-latex'
Plugin 'deb.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'luochen1990/rainbow'
Plugin 'Raimondi/delimitMate'
"Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'gre/play2vim'
Plugin 'othree/html5.vim'
Plugin 'ervandew/supertab'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'elubow/cql-vim'
Plugin 'GEverding/vim-hocon'
Plugin 'neomake/neomake'
Plugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim/' }
Plugin 'vim-scripts/BufOnly.vim'
"Plugin 'autozimu/LanguageClient-neovim'
Plugin 'junegunn/fzf'
Plugin 'neoclide/coc.nvim'
Plugin 'file:///home/chief/.vim/bundle/vim-sbt'
Plugin 'goerz/jupytext.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'glacambre/firenvim'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
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
"set completeopt=longest,menuone
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

"neomake
let g:neomake_open_list = 2

autocmd BufWritePost * Neomake

let g:deoplete#enable_at_startup = 1
" disable truncate feature
call deoplete#custom#source('_',  'max_menu_width', 0)
call deoplete#custom#source('_',  'max_abbr_width', 0)
call deoplete#custom#source('_',  'max_kind_width', 0)
" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()
inoremap <silent><expr> <NUL> deoplete#mappings#manual_complete()

let g:gutentags_ctags_exclude = ['**/target/**']
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

let g:airline#extensions#coc#enabled = 1

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
nmap <silent><Leader>ld <Plug>(coc-definition)
nmap <silent><Leader>lt <Plug>(coc-type-definition)
nmap <silent><Leader>li <Plug>(coc-implementation)
nmap <silent><Leader>lR <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <silent><Leader>la <Plug>(coc-codeaction)

" Remap for format selected region
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)

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
autocmd CursorHold * silent call CocActionAsync('highlight')

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
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Add status line support, for integration with other plugins, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Toggle panel with Tree Views
nnoremap <silent><Leader>lT :<C-u>CocCommand metals.tvp<CR>

silent! so .vimlocal
autocmd FileType json syntax match Comment +\/\/.\+$+

set scrollback=100000
let g:rooter_patterns = ['shell.nix', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
" workaround to prevent terminal from crashing
autocmd TermOpen set wrap|term://* startinsert
