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

" no bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"faster redrawing
set ttyfast
set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set encoding=utf8

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

