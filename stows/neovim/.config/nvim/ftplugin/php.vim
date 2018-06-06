if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
setlocal tags=~/.language-ctags/php/tags,.ctags-php,.ctags-php-vendor

nnoremap <buffer> <localleader>rus :call RemoveUnusedPhpUseStatementsForCurrentFile()<CR>

" quickly create new php buffers
nnoremap <buffer> <localleader>nv :exe ":vnew \| setfiletype php"<CR>
nnoremap <buffer> <localleader>ns :exe ":new \| setfiletype php"<CR>

" run phpspec specs for file or for project
nnoremap <buffer> <localleader>rs :call RunPhpSpecOnBuffer(bufname('%')) <CR>
nnoremap <buffer> <localleader>rps :Tmux splitw 'phpspec run ; read'<CR>

" run phpunit tests for file or for project
nnoremap <buffer> <M-r><M-t><M-l> :call RunPhpUnitOnBuffer(bufname('%'), '-h') <CR>
nnoremap <buffer> <M-r><M-t><M-j> :call RunPhpUnitOnBuffer(bufname('%'), '-v') <CR>
nnoremap <buffer> <M-r><M-t><M-o> :call RunPhpUnitOnBufferInNewSessionWindow(bufname('%'), 'repl') <CR>
nnoremap <buffer> <M-u><M-l> :call RunPhpUnitOnMethodInBuffer(bufname('%'), tagbar#currenttag("%s", 'none'), '-h')<CR>
nnoremap <buffer> <M-u><M-j> :call RunPhpUnitOnMethodInBuffer(bufname('%'), tagbar#currenttag("%s", 'none'), '-v')<CR>
nnoremap <buffer> <M-u><M-o> :call RunPhpUnitOnMethodInBufferInNewSessionWindow(bufname('%'), tagbar#currenttag("%s", 'none'), "repl")<CR>
nnoremap <buffer> <M-r><M-t><M-m><M-s> :MyPhpUnitTestMethod<CR>
nnoremap <buffer> <localleader>rpt :Start phpunit && read<CR>

" laravel
"autocmd FileType php nnoremap <buffer> <localleader>lat :Tmux splitw 'php artisan tinker'<CR>
nnoremap <buffer> <silent><localleader>ts :call CreatePhpSplitAndStartRepl("vnew", "-v")<CR>
nnoremap <buffer> <silent><localleader>tv :call CreatePhpSplitAndStartRepl("new", "-h")<CR>
nnoremap <buffer> <silent> <M-r><M-j> :call RunCommandInSplit("psysh", "-v")<CR>
nnoremap <buffer> <silent> <M-r><M-l> :call RunCommandInSplit("psysh", "-h")<CR>
nnoremap <buffer> <silent> <M-r><M-o> :call RunCommandInNewSessionWindow("psysh", "repl")<CR>

" codesniffer
nnoremap <buffer> <localleader>cs :Dispatch phpcs %<CR>
nnoremap <buffer> <localleader>cbf :Dispatch phpcbf %<CR>

" setting xdebug on and off
nnoremap <buffer> <localleader>xon :let $XDEBUG_CONFIG="idekey=PHPSTORM"<CR>
nnoremap <buffer> <localleader>xoff :let $XDEBUG_CONFIG=""<CR>

inoremap <buffer> <localleader>a <Esc>:call IPhpInsertUse()<CR>
nnoremap <buffer> <localleader>a :call PhpInsertUse()<CR>
inoremap <buffer> <localleader>q <Esc>:call IPhpExpandClass()<CR>
nnoremap <buffer> <localleader>q :call PhpExpandClass()<CR>
inoremap <buffer> <localleader>.s <Esc>:call PhpSortUse()<CR>
nnoremap <buffer> <localleader>.s :call PhpSortUse()<CR>

nnoremap <buffer> <localleader>d :call pdv#DocumentWithSnip()<CR>

" get docs for word under cursor
nnoremap <buffer> <silent> <M-d> :call GetPhpDocsForSymbol(expand('<cword>'), g:my_tmux_repl_pane)<CR>
inoremap <buffer> <silent> <M-d> <C-o>:call GetPhpDocsForSymbol(expand('<cword>'), g:my_tmux_repl_pane)<CR>
vnoremap <buffer> <silent> <M-d> :call GetPhpDocsForSymbol(GetSingleLineVisualSelection(), g:my_tmux_repl_pane)<CR>
" send literal to repl
nnoremap <buffer> <silent> <M-r>q :call SendSymbolToTmuxPane('q', g:my_tmux_repl_pane)<CR>
