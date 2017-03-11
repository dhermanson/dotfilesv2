if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

function! RunPhpSpecOnBuffer(buffer_name)
  " TODO: don't hardcode console:runner.1
  "       maybe use a global config or something
  "exe "Tmux send-keys -t console:runner.1 'clear; phpspec run " . fnameescape(a:buffer_name) . "' Enter"
  let l:project_dir = fnamemodify('.', ':p')
  let l:phpspec_exe = fnamemodify('vendor/bin/phpspec run', ':p')
  let l:file = expand('%:p')
  let l:cmd = 'cd ' . l:project_dir . ' && clear && ' . l:phpspec_exe . ' ' . l:file
  "exe "Start phpspec run " . fnameescape(a:buffer_name) . " && read"
  "exe "Tmux neww -t runner"
  "exe "Tmux send-keys -t runner '" . l:cmd . "' Enter"
  "exe "Tmux neww -t runner '" . l:cmd . "'"
  exe "Tmux splitw '" . l:cmd . " ; read'"
endfunction

function! RunArtisanTinkerInProjectRootDirectory()
  let l:project_dir = fnamemodify('.', ':p')
  let l:cmd = 'cd ' . l:project_dir . ' && php artisan tinker'
  exe "Tmux neww -t runner -n artisan '" . l:cmd . "'"
  let g:my_tmux_repl_pane = "runner:artisan.0"
endfunction

function! RunArtisanTinkerInProjectRootDirectoryInTmuxSplit()
  let l:project_dir = fnamemodify('.', ':p')
  let l:cmd = 'cd ' . l:project_dir . ' && php artisan tinker'
  exe "Tmux splitw '" . l:cmd . "'"
  exe "Tmux last-pane"
endfunction

function! RunBehatOnFile()
  let l:project_dir = fnamemodify('.', ':p')
  let l:behat_exe = fnamemodify('vendor/bin/behat', ':p')
  let l:file = expand('%:p')
  let l:cmd = 'cd ' . l:project_dir . ' && clear && ' . l:behat_exe . ' --append-snippets ' . l:file
  exe "Tmux neww -t runner"
  exe "Tmux send-keys -t runner '" . l:cmd . "' Enter"
endfunction

function! RunArtisanTinkerInSplit(split)
  call KillTmuxRepl()
  let l:project_dir = fnamemodify('.', ':p')
  let l:cmd = 'cd ' . l:project_dir . ' && php artisan tinker'
  let l:pane = CreateTmuxSplitAndRunCommand(l:cmd, a:split)
  let g:my_tmux_repl_pane = l:pane

  "call RunCommandInTmuxPane(l:pane, l:cmd)
endfunction

function! CreatePhpSplitAndStartRepl(buffersplit, tmuxsplit)
  execute "normal! :" . a:buffersplit . "\<CR>"
  :setfiletype php
  :call RunArtisanTinkerInSplit(a:tmuxsplit)
  execute "normal! i<?php\<CR>\<CR>"
  :startinsert
endfunction

function! RemoveUnusedPhpUseStatementsForCurrentFile()
  " check if buffer has been modified
  if (&mod)
    "let l:choice = confirm("Save buffer first?", "&Yes\n&No")
    "if l:choice == 1
      execute "w"
    "endif
  endif

  let l:filename = bufname("%")
  let l:cmd = "php-cs-fixer fix " . l:filename . " --fixers=unused_use"
  call system(l:cmd)
  exe "edit!"
endfunction


"command DropProjectDatabase :call DropProjectDatabase()


nnoremap <buffer> <localleader>rus :call RemoveUnusedPhpUseStatementsForCurrentFile()<CR>
nnoremap <buffer> <localleader>fmig :exe ":FZF database/migrations"<CR>
nnoremap <buffer> <localleader>fmid :exe ":FZF app/Http/Middleware"<CR>
nnoremap <buffer> <localleader>fv :exe ":FZF resources/views"<CR>
nnoremap <buffer> <localleader>fj :exe ":FZF resources/assets/js"<CR>
nnoremap <buffer> <localleader>fl :exe ":FZF resources/assets/less"<CR>
nnoremap <buffer> <localleader>fcf :exe ":FZF config"<CR>

" quickly create new php buffers
nnoremap <buffer> <localleader>nv :exe ":vnew \| setfiletype php"<CR>
nnoremap <buffer> <localleader>ns :exe ":new \| setfiletype php"<CR>


nnoremap <buffer> <localleader><leader>mamo :Dispatch php artisan make:model 
nnoremap <buffer> <localleader><leader>mi<Space> :Dispatch php artisan migrate<CR>
nnoremap <buffer> <localleader><leader><localleader> :Dispatch php artisan 

" phpspec
"autocmd BufRead,BufNewFile,BufEnter *Spec.php UltiSnipsAddFiletypes php-phpspec
setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
setlocal tags+=~/.language-ctags/php/tags
setlocal tags+=tags
setlocal tags+=tags.vendor
nnoremap <buffer> <localleader>mtp :Dispatch $HOME/.config/nvim/bin/create-php-ctags.sh<CR>
nnoremap <buffer> <localleader>mtv :Dispatch $HOME/.config/nvim/bin/create-php-vendor-tags.sh<CR>

" run behat contexts
"autocmd FileType php nnoremap <localleader>rb :VimuxRunCommand('clear; behat -f progress') <CR>
"autocmd FileType php nnoremap <localleader>rb :Tmux send-keys -t console:runner.1 'clear; behat' Enter<CR>
nnoremap <buffer> <localleader>rb :Start behat % && read<CR>
nnoremap <buffer> <localleader>rp :Tmux send-keys -t runner.1 'pwd' Enter<CR>

" run phpspec specs for file or for project
"autocmd FileType php nnoremap <localleader>rs :VimuxRunCommand('clear; phpspec run ' . bufname('%')) <CR>
nnoremap <buffer> <localleader>rs :call RunPhpSpecOnBuffer(bufname('%')) <CR>
"autocmd FileType php nnoremap <localleader>rs :Start 'phpspec run ' . (bufname('%') . ' && read' <CR>
"autocmd FileType php nnoremap <localleader>rps :VimuxRunCommand('clear; phpspec run') <CR>
"autocmd FileType php nnoremap <buffer> <localleader>rps :Start phpspec run && read<CR>
nnoremap <buffer> <localleader>rps :Tmux splitw 'phpspec run ; read'<CR>

" run phpunit tests for file or for project
"autocmd FileType php nnoremap <localleader>rt :VimuxRunCommand('clear; phpunit ' . bufname('%')) <CR>
"autocmd FileType php nnoremap <localleader>rpt :VimuxRunCommand('clear; phpunit') <CR>
nnoremap <buffer> <localleader>rt :Start phpunit % && read<CR>
nnoremap <buffer> <localleader>rpt :Start phpunit && read<CR>

" laravel
"autocmd FileType php nnoremap <buffer> <localleader>lat :Tmux splitw 'php artisan tinker'<CR>
nnoremap <buffer> <localleader>lat :call RunArtisanTinkerInProjectRootDirectory()<CR>
nnoremap <buffer> <localleader>tw :call RunArtisanTinkerInProjectRootDirectory()<CR>
nnoremap <buffer> <silent> <leader>rr :call RunArtisanTinkerInProjectRootDirectory()<CR>
nnoremap <buffer> <silent> <leader>rc :call ClearRepl()<CR>
nnoremap <buffer> <silent><localleader>ts :call CreatePhpSplitAndStartRepl("vnew", "-v")<CR>
nnoremap <buffer> <silent><localleader>tv :call CreatePhpSplitAndStartRepl("new", "-h")<CR>
nnoremap <buffer> <silent> <leader>rs :call RunCommandInSplit("psysh", "-v")<CR>
nnoremap <buffer> <silent> <leader>rv :call RunCommandInSplit("psysh", "-h")<CR>

" codesniffer
nnoremap <buffer> <localleader>cs :Dispatch phpcs % --standard=~/phpcsconfig.xml<CR>
nnoremap <buffer> <localleader>cbf :Dispatch phpcbf % --standard=~/phpcsconfig.xml<CR>

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
