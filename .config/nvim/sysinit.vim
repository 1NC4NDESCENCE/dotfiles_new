set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=0
" set smarttab
set smartcase
" set softtabstop=4
set shellcmdflag=-ic
set mouse=
set undofile
set undodir=~/.vim/undo
let g:nvim_system_wide=1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
" ~/full/path/example.c
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'  " f/p/example.c
" let g:airline_theme='gruvbox'
" Map Alt + 1-9 to switch to tabs
noremap <F1> 1gt
noremap <F2> 2gt
noremap <F3> 3gt
noremap <F4> 4gt
noremap <F5> 5gt
noremap <F6> 6gt
noremap <F7> 7gt
noremap <F8> 8gt
noremap <F9> 9gt
noremap <F10> 10gt

" Map Alt + Left or Right to switch between tabs
" noremap <A-b> :tabprevious<CR>
" noremap <A-n> :tabnext<CR>

noremap <F11> :NERDTreeToggle<CR>

command! Pi PlugInstall
command! Cfg :sp ~/.config/nvim/init.vim
command! Reload :source ~/.config/nvim/sysinit.vim

" set shellcmdflag=-ic
cnoreabbrev nt NERDTree
" autocmd Filetype scm setlocal tabstop=2
autocmd BufNewFile *.c 0r ~/.vim/skeleton/skeleton.c

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'
Plug 'philrunninger/nerdtree-buffer-ops'

Plug 'jlanzarotta/bufexplorer'

Plug 'szw/vim-maximizer'
Plug 'wesq3/vim-windowswap'

Plug 'preservim/nerdcommenter'

call plug#end()

filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
map <F12> <leader>ci <CR>

set completeopt=menu,menuone,noselect

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <C-t> :call TermToggle(12)<CR>
inoremap <C-t> <Esc>:call TermToggle(12)<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Switch panes(splits) with ctrl
nnoremap <A-k> <C-w>k
nnoremap <A-j> <C-w>j
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
