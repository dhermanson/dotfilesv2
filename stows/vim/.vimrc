set nocompatible
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'morhetz/gruvbox'
" Plug 'itchyny/lightline.vim'
" Plug 'shinchu/lightline-gruvbox.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'

call plug#end()

" colors
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
let g:gruvbox_italic=0
let g:gruvbox_invert_signs=1
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection=0
" let g:gruvbox_italic=0
colorscheme gruvbox
highlight SignColumn ctermbg=236
highlight VertSplit ctermbg=236
" highlight Comment cterm=italic

set timeout timeoutlen=1000 ttimeoutlen=100
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set expandtab
set number
set relativenumber
set noshowmode
set mouse=a
set complete=.,w,b,u
set autowriteall
set nocursorline
set nocursorcolumn
set noswapfile
set nohlsearch
set cursorline
set nosplitbelow
set splitright
set completeopt=longest,menuone
set ignorecase



" leader keys
let mapleader=" "
let maplocalleader = ","

" easymotion
let g:EasyMotion_smartcase = 1
map <silent> / <Plug>(easymotion-sn)
omap <silent> / <Plug>(easymotion-tn)
map <Leader>; <Plug>(easymotion-bd-f)

" ctrlp
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript' ]
nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>l :CtrlPBufTag<CR>

" nerdtree
nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <leader>T :NERDTreeFind<CR>
