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
set completeopt=longest,menuone,preview
set ignorecase

" use ripgrep as grep implementation
if executable('rg')
  set grepprg=rg\ --vimgrep\ --color=never
endif

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
autocmd BufEnter * set completeopt-=preview

" " statusline
" exec 'hi User1 guifg=' . g:terminal_color_10 . ' guibg=#282828'
" exec 'hi User2 guifg=' . g:terminal_color_9 . ' guibg=#282828'
" exec 'hi User3 guifg=' . g:terminal_color_12 . ' guibg=#282828'
" exec 'hi User4 guifg=' . g:terminal_color_13 . ' guibg=#282828'
" exec 'hi User5 guifg=' . g:terminal_color_11 . ' guibg=#282828'
"
" hi StatusLineNC guibg='#ebdbb2'
"
" function! MyActiveWindow()
"
"   if !exists("w:my_is_window_active")
"     let w:my_is_window_active = 0
"   endif
"
"   if w:my_is_window_active == 0
"     setl statusline=
"     setl statusline +=%1*\ %n\ %*            "buffer number
"     setl statusline +=%5*%{&ff}%*            "file format
"     setl statusline +=%3*%y%*                "file type
"     " set statusline +=%4*\ %<%F%*            "full path
"     setl statusline +=%4*\ %<%f%*            "full path
"     setl statusline +=%2*%m%*                "modified flag
"     setl statusline +=%1*%=%5l%*             "current line
"     setl statusline +=%2*/%L%*               "total lines
"     setl statusline +=%1*%4v\ %*             "virtual column number
"     setl statusline +=%2*0x%04B\ %*          "character under cursor
"   endif
"
"   let w:my_is_window_active = 1
"
" endfunction
"
" function! MyInactiveWindow()
"
"   if !exists("w:my_is_window_active")
"     let w:my_is_window_active = 1
"   endif
"
"   if w:my_is_window_active == 1
"     setl statusline=
"     setl statusline +=%f            "full path
"   endif
"
"   let w:my_is_window_active = 0
" endfunction
"
"
" augroup BgHighlight
"   autocmd!
"
"   " whether to highlight current line or not
"   autocmd WinEnter,BufWinEnter * set cul
"   autocmd WinLeave,BufWinLeave * set nocul
"
"   autocmd WinEnter,BufWinEnter * call MyActiveWindow()
"   autocmd WinLeave,BufWinLeave * call MyInactiveWindow()
" augroup END
