set nocompatible
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
" Plug 'xolox/vim-session'

call plug#end()

" set font
" :GuiFont Consolas:h14
if exists('g:GuiLoaded')
  " let g:GuiFont="Consolas:h14"
  GuiFont Consolas:h14
  " let g:GuiWindowFullScreen=1
endif

" colors
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
" set background=light
let g:gruvbox_italic=0
let g:gruvbox_invert_signs=1
" let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection=0
" let g:gruvbox_italic=0
" colorscheme gruvbox
endtry
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
set nolazyredraw

" leader keys
let mapleader=" "
let maplocalleader = ","


augroup my_filetype_dockerfile
  autocmd!
  autocmd BufRead,BufNewFile Dockerfile* set filetype=dockerfile
  autocmd BufRead,BufNewFile *.Dockerfile set filetype=dockerfile
augroup END

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
nnoremap <A-f> :CtrlP<CR>
nnoremap <A-b> :CtrlPBuffer<CR>

" nerdtree
let g:NERDTreeQuitOnOpen=1
nnoremap <A-;> :NERDTreeFocus<CR>
nnoremap <A-:> :NERDTreeFind<CR>

" updating vimrc file
nnoremap <Leader>.ev :e $MYVIMRC<CR>
nnoremap <Leader>.sv :source $MYVIMRC<CR>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" move to split if exists, else create new one and go
nnoremap <silent> <A-h> :call WinMove('h')<cr>
nnoremap <silent> <A-j> :call WinMove('j')<cr>
nnoremap <silent> <A-k> :call WinMove('k')<cr>
nnoremap <silent> <A-l> :call WinMove('l')<cr>

" terminal mode
if has('nvim')
  tnoremap <silent> <A-Backspace> <C-\><C-n>
endif

" move current split to left, down, up, right respectively
nnoremap <silent> <A-H> <C-w>H
nnoremap <silent> <A-J> <C-w>J
nnoremap <silent> <A-K> <C-w>K
nnoremap <silent> <A-L> <C-w>L

" leave only this window open
nnoremap <M-o> <C-w>o

" apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" delete buffer
nnoremap <silent> <Leader>q :bdelete<CR>
nnoremap <silent> <M-q> :bdelete<CR>
" force delete a buffer
nnoremap <silent> <M-Q> ::bdelete!<CR>

" close buffer
nnoremap <M-c> <C-w>c

" save buffer
nnoremap <M-w> :w<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<m-n>"
let g:UltiSnipsJumpBackwardTrigger="<m-p>"
if (has('win32'))
  let g:UltiSnipsSnippetsDir = $HOME . "/AppData/Local/nvim/ultisnips""
else
  let g:UltiSnipsSnippetsDir = $HOME . "/.config/nvim/ultisnips"
endif
nnoremap <Leader>.es :UltiSnipsEdit<CR>

" fugitive
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ge :Gedit<CR>
