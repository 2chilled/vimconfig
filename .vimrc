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
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Valloric/YouCompleteMe'
Plugin 'embear/vim-localvimrc'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'airblade/vim-rooter'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'LnL7/vim-nix'
Plugin 'bitc/vim-hdevtools'
"Plugin 'godlygeek/tabular'
Plugin 'Twinside/vim-haskellFold'

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
colorscheme desert

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

nnoremap t :tabnew 

"Alt-F1
nnoremap O1;3P :NERDTreeFind<CR>
"Alt-1
nnoremap 1 :NERDTreeToggle<CR>

noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>

"syntactic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

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
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:EasyGrepFilesToExclude=".svn,.git,dist/**,target/**,node_modules/**"

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|dist|target$',
    \ 'file': '\v\.(exe|so|dll|hi|o)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_auto_trigger = 1

" airline
let g:airline#extensions#tabline#enabled = 0
set laststatus=2
