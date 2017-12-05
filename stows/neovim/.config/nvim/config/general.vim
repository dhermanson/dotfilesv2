" global settings
syntax on
filetype plugin indent on

set timeout timeoutlen=1000 ttimeoutlen=100
"nnoremap <BS> :e 

set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set expandtab
set number
set relativenumber
set noshowmode
"set omnifunc=syntaxcomplete#Complete
"set completefunc=syntaxcomplete#Complete
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
" set completeopt=longest,menuone,preview
set completeopt=longest,menuone
set ignorecase

" use ripgrep as grep implementation
" if executable('rg')
"   set grepprg=rg\ --vimgrep\ --color=never
" endif

" no bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"faster redrawing
set ttyfast
set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set encoding=utf8


" Sets the directory to store .swp files in.
" The double '//' ensures that there will be no name conflicts
" amongst the swap files by replacing path separators with %
set directory=~/.config/nvim/swap//
set backupdir=~/.config/nvim/backup//
set undodir=~/.config/nvim/undo//

let g:netrw_liststyle=3

if !has('nvim')
  set ttymouse=xterm2
endif

" TODO: put this somewhere else: https://superuser.com/questions/359580/error-adding-cronjobs-in-mac-os-x-lion
autocmd filetype crontab setlocal nobackup nowritebackup
" autocmd BufEnter * set completeopt-=preview


augroup BgHighlight
  autocmd!

  " whether to highlight current line or not
  autocmd WinEnter,BufWinEnter * set cul
  autocmd WinLeave,BufWinLeave * set nocul

  " autocmd WinEnter,BufWinEnter * call MyActiveWindow()
  " autocmd WinLeave,BufWinLeave * call MyInactiveWindow()
augroup END
