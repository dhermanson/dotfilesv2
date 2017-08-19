setlocal tags+=.ctags-js
nnoremap <buffer> <localleader>mtp :Dispatch $HOME/.config/nvim/bin/create-js-ctags.sh<CR>

" quickly create new js buffers
nnoremap <buffer> <localleader>nv :exe ":vnew \| setfiletype javascript"<CR>
nnoremap <buffer> <localleader>ns :exe ":new \| setfiletype javascript"<CR>

" nnoremap <buffer> <M-r><M-t><M-l> :call RunMochaOnBuffer(bufname('%'), '-h') <CR>
" nnoremap <buffer> <M-r><M-t><M-j> :call RunMochaOnBuffer(bufname('%'), '-v') <CR>

nnoremap <buffer> <M-r><M-t><M-l> :call RunTapeBuffer(bufname('%'), '-h', 0) <CR>
nnoremap <buffer> <M-r><M-t><M-j> :call RunTapeBuffer(bufname('%'), '-v', 0) <CR>
nnoremap <buffer> <M-r><M-t><M-d> :call RunTapeBuffer(bufname('%'), '-v', 1) <CR>
