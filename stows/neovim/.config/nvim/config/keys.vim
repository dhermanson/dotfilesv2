if !has('gui_running')
  if !has('nvim')
    "map vim escape sequences as explained in
    "http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
    let c='a'
    while c <= 'z'
      exec "set <A-".c.">=\e".c
      "exec "imap \e".c." <A-".c.">"
      let c = nr2char(1+char2nr(c))
    endw

    let c='A'
    while c <= 'Z'
      exec "set <A-".c.">=\e".c
      "exec "imap \e".c." <A-".c.">"
      let c = nr2char(1+char2nr(c))
    endw
  endif
endif

" leader keys
let mapleader=" "
let maplocalleader = ","

" map empty project mapping to noop...cuz sometimes i forget what i'm doing
nnoremap <Leader>p <Nop>

" updating vimrc file
nnoremap <Leader>.ev :e $MYVIMRC<CR>
nnoremap <Leader>.sv :source $MYVIMRC<CR>

" save
inoremap <M-w> <C-o>:w<CR>
nnoremap <M-w> :w<CR>

" semicolon to colon...and vice-versa
" nnoremap ; :
" nnoremap : ;

" escape on jk
inoremap jk <Esc>
onoremap jk <Esc>
cnoremap jk <C-c>

nnoremap <M-d> <Esc>
vnoremap <M-d> <Esc>
onoremap <M-d> <Esc>
inoremap <M-d> <Esc>
cnoremap <M-d> <C-c>

nnoremap <M-e> <Esc>
vnoremap <M-e> <Esc>
onoremap <M-e> <Esc>
inoremap <M-e> <Esc>
cnoremap <M-e> <C-c>
snoremap <M-e> <Esc>

nnoremap <M-f> <Esc>
vnoremap <M-f> <Esc>
onoremap <M-f> <Esc>
inoremap <M-f> <Esc>
cnoremap <M-f> <C-c>
snoremap <M-f> <Esc>

nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
onoremap <C-c> <Esc>
inoremap <C-c> <Esc>
cnoremap <C-c> <C-c>
snoremap <C-c> <Esc>

nnoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
onoremap <C-l> <Esc>
inoremap <C-l> <Esc>
cnoremap <C-l> <C-c>
snoremap <C-l> <Esc>

" use number to navigate around
nnoremap <Leader>1 :edit .<CR>
nnoremap <Leader>2 :Explore<CR>
nnoremap <Leader>3 :Sexplore<CR>
nnoremap <Leader>4 :Vexplore<CR>

" leave only this window open
nnoremap <M-o> <C-w>o

" move to split if exists, else create new one and go
nnoremap <silent> <M-h> :call WinMove('h')<cr>
nnoremap <silent> <M-j> :call WinMove('j')<cr>
nnoremap <silent> <M-k> :call WinMove('k')<cr>
nnoremap <silent> <M-l> :call WinMove('l')<cr>

" move current split to left, down, up, right respectively
nnoremap <silent> <M-H> <C-w>H
nnoremap <silent> <M-J> <C-w>J
nnoremap <silent> <M-K> <C-w>K
nnoremap <silent> <M-L> <C-w>L


" uppercase or lowercase word
inoremap <M-u> <Esc>vbUea
inoremap <M-l> <Esc>vbuea

" lookup tag in insert mode
inoremap <M-t> <C-x><C-]>

" apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" delete buffer
nnoremap <Leader>q :bdelete<CR>
nnoremap <M-q> :bdelete<CR>
" force delete a buffer
nnoremap <M-Q> :call ConfirmBDeleteBang()<CR>

" close buffer
nnoremap <M-c> <C-w>c


" move between buffers
nnoremap <M-[> :bprevious<CR>
nnoremap <M-]> :bnext<CR>

" new horizontal or vertical splits
nnoremap <Leader>ns :new<CR>
nnoremap <Leader>nv :vnew<CR>

" ack
nnoremap <Leader>a :Ack! 

" easymotion
map <silent> / <Plug>(easymotion-sn)
omap <silent> / <Plug>(easymotion-tn)
map <Leader>; <Plug>(easymotion-bd-f)
" map s <Plug>(easymotion-bd-f)
" map s <Plug>(easymotion-sl-wl)

" fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gc :Commits<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<m-n>"
let g:UltiSnipsJumpBackwardTrigger="<m-p>"
nnoremap <Leader>.es :UltiSnipsEdit<CR>

" dispatch
nnoremap <Leader>dp :Dispatch 
nnoremap <Leader>ds :Start 
vnoremap <Leader>dp y:call DispatchCommand(@@)<CR>
vnoremap <Leader>ds y:call DispatchCommand(@@, "Start")<CR>

" searching
nnoremap <Leader>f :Files<CR>
inoremap <M-f> <Esc>:Files<CR>
nnoremap <M-f> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <M-b> :Buffers<CR>
inoremap <M-b> <Esc>:Buffers<CR>
" nnoremap <Leader>k :MyTagList<CR>
nnoremap <Leader>k :Tags<CR>
" nnoremap <Leader>l :MyBufferTags<CR>
nnoremap <Leader>l :CtrlPBufTag<CR>

" tmux interaction
nnoremap <silent> <M-s> :call SendLineToTmuxPane(line('.'), g:my_tmux_repl_pane)<CR>
inoremap <silent> <M-s> <C-o>:call SendLineToTmuxPane(line('.'), g:my_tmux_repl_pane)<CR>
vnoremap <M-s> :\<C-u>call SendLinesToTmuxPane(line("'<"), line("'>"), g:my_tmux_repl_pane)<CR>
nnoremap <silent> <M-x> :call KillTmuxRepl()<CR>

" tagbar settings
nnoremap <Leader>0 :TagbarToggle<CR>
nnoremap <M-B> :TagbarToggle<CR>
inoremap <M-B> <esc>:TagbarToggle<CR>
nnoremap <Leader>9 :TagbarTogglePause<CR>

" edit crontab
nnoremap <Leader>.ec :call system('tmux splitw -p 25 "EDITOR=nvim crontab -e"')<CR>

" vim-bufonly
nnoremap <M-O> :BufOnly<CR>

" nerdtree
nnoremap <M-;> :NERDTreeFocus<CR>
nnoremap <M-:> :NERDTreeFind<CR>

"ale
nnoremap <leader>ep :ALEPrevious<CR>
nnoremap <leader>en :ALENext<CR>
