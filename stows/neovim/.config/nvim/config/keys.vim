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

" escape on jk
inoremap jk <Esc>

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

" close buffer
nnoremap <M-c> <C-w>c

" force delete a buffer
nnoremap <Leader>x :call ConfirmBDeleteBang()<CR>

" new horizontal or vertical splits
nnoremap <Leader>ns :new<CR>
nnoremap <Leader>nv :vnew<CR>

" ack
nnoremap <Leader>8 :Ack 

" easymotion
map <silent> / <Plug>(easymotion-sn)
omap <silent> / <Plug>(easymotion-tn)
map <Leader>; <Plug>(easymotion-bd-f)
map s <Plug>(easymotion-bd-f)

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
"let g:UltiSnipsJumpForwardTrigger="<m-n>"
"let g:UltiSnipsJumpBackwardTrigger="<m-p>"
let g:UltiSnipsJumpForwardTrigger="<m-j>"
let g:UltiSnipsJumpBackwardTrigger="<m-k>"

" dispatch
nnoremap <Leader>dp :Dispatch 
nnoremap <Leader>ds :Start 
vnoremap <Leader>dp y:call DispatchCommand(@@)<CR>
vnoremap <Leader>ds y:call DispatchCommand(@@, "Start")<CR>

" searching
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
" nnoremap <Leader>k :MyTagList<CR>
nnoremap <Leader>k :Tags<CR>
nnoremap <Leader>l :MyBufferTags<CR>

" tmux interaction
inoremap <silent> <M-s> <C-o>:call SendToTmuxPane()<CR>
vnoremap <M-s> :\<C-u>execute "'<,'>Twrite " . g:my_tmux_repl_pane <CR>
nnoremap <silent> <M-s> :call SendToTmuxPane()<CR>
nnoremap <silent> <M-x> :call KillTmuxRepl()<CR>
