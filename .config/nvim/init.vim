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
" Map Alt + 1-9 to switch to tabs
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt

" Map Alt + Left or Right to switch between tabs
noremap <A-Left> :tabprevious<CR>
noremap <A-Right> :tabnext<CR>

noremap <C-N> :NERDTreeToggle<CR>

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
