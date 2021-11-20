set nocompatible
filetype off
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Download plug-ins to the ~/.vim/plugged/ directory
call vundle#begin('~/.vim/plugged')
" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'cocopon/iceberg.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'Badacadabra/vim-archery'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'scheakur/vim-scheakur'
Plugin 'preservim/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'dyng/ctrlsf.vim'
" Git plugins
Plugin 'tpope/vim-fugitive'
" Bufferline
Plugin 'bling/vim-bufferline'
" Statusline plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

filetype plugin indent on
"
" How many columns of whitespace a \t is worth
set tabstop=4 
" How many columns of whitespace a "level of indentation" is worth
set shiftwidth=4 
" Use spaces when tabbing
set expandtab

set incsearch  " Enable incremental search
set hlsearch   " Enable highlight search

" set termwinsize=12x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits
set ttymouse=sgr

set background=dark   " dark or light
colorscheme default  " Your favorite color scheme's name



""""""""""""""""""
" NERDTree config
" <leader>r means \ + r
""""""""""""""""""
let NERDTreeShowHidden = 0      " Show hidden files"
nmap <F2> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>


" Auto-Pairs 
let g:AutoPairsShortcutToggle = '<C-P>'

""""""""""""""""""""""""
" TagBar (tag navigation)
""""""""""""""""""""""""
" Focus the panel when opening it
let g:tagbar_autofocus = 1
" Highlight the active tag
let g:tagbar_autoshowtag = 1
" Make panel vertical and place on the right
let g:tagbar_position = 'botright vertical'
" Mapping to open and close the panel
nmap <F8> :TagbarToggle<CR>"

""""""""""""""""""""""""
" CtrlSF plugin config
""""""""""""""""""""""""
let g:ctrlsf_backend = 'ag'

""""""""""""""""""""""""
" Airline config
""""""""""""""""""""""""
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_powerline_fonts = 1


""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""
" Ctrl-S for save
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Buffer navigation
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bp<cr>:bd #<cr>

