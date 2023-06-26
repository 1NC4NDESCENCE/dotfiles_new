set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=0
" set smarttab
set smartcase
set softtabstop=4
set mouse=
set undofile
set undodir=~/.vim/undo
" set shellcmdflag=-ic
cnoreabbrev nt NERDTree
autocmd Filetype scm setlocal tabstop=2
autocmd BufNewFile *.c 0r ~/.vim/skeleton/skeleton.c

call plug#begin()

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'
Plug 'philrunninger/nerdtree-buffer-ops'

Plug 'jlanzarotta/bufexplorer'

Plug 'szw/vim-maximizer'
Plug 'wesq3/vim-windowswap'

call plug#end()

set completeopt=menu,menuone,noselect
