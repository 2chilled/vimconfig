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
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'eagletmt/neco-ghc'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'airblade/vim-rooter'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'LnL7/vim-nix'
Plugin 'bitc/vim-hdevtools'
Plugin 'Twinside/vim-haskellFold'
Plugin 'derekwyatt/vim-scala'
Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'vim-scripts/dbext.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ensime/ensime-vim'
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
Plugin 'artur-shaik/vim-javacomplete2'
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
Plugin 'file:///home/chief/.vim/bundle/vim-sbt'

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
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

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
    \ 'dir':  '\v[\/](\.(git|hg|svn))|dist|target$',
    \ 'file': '\v\.(exe|so|dll|hi|o)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
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
" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()
inoremap <silent><expr> <NUL> deoplete#mappings#manual_complete()
silent! so .vimlocal
