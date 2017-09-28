" quickly create new js buffers
nnoremap <buffer> <localleader>nv :exe ":vnew \| setfiletype javascript"<CR>
nnoremap <buffer> <localleader>ns :exe ":new \| setfiletype javascript"<CR>

nnoremap <buffer> <M-r><M-j> :call RunNodeInSplit("-v")<CR>
nnoremap <buffer> <M-r><M-l> :call RunNodeInSplit("-h")<CR>
nnoremap <buffer> <M-r><M-o> :call RunNodeInNewSessionWindow("repl")<CR>
