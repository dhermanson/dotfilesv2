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

function! ConfirmBDeleteBang()
  let l:choice = confirm("Really delete buffer?", "&Yes\n&No")
  if l:choice == 1
    execute "bdelete!"
  endif
endfunction

function! DispatchCommand(command, ...)
  let l:choice = confirm("Execute command: " . a:command, "&Yes\n&No")
  let l:dispatch = a:0 ? a:1 : "Dispatch"

  if l:choice == 1
    execute l:dispatch " " . a:command
  endif
endfunction

function! SendLinesToTmuxPane(line1, line2, pane)
  let l:sleep = 0
  if a:line2 - a:line1 > 10
    let l:sleep = 1
  endif

  for line in range(a:line1, a:line2)
    silent call SendLineToTmuxPane(line, a:pane)
    if l:sleep == 1
      sleep 1m
    endif
  endfor
  " silent call tbone#write_command(0, a:line1, a:line2, 1, a:pane)
  " silent call system("tmux send-keys -t " . a:pane . "  Enter")
endfunction

function! SendLineToTmuxPane(line, pane)
  silent call tbone#write_command(0, a:line, a:line, 1, a:pane)
  " silent call system("tmux send-keys -t " . a:pane . "  Enter")
endfunction

function! SendSymbolToTmuxPane(symbol, pane)
  let l:cmd = "tmux send-keys -t " . a:pane . " '" . a:symbol . "'"
  echom l:cmd
  call system(l:cmd)
endfunction

function! GetPhpDocsForSymbol(symbol, pane)
  " let l:cmd = shellescape(a:text)
  " let l:escaped_symbol = shellescape(a:symbol)
  let l:cmd = "tmux send-keys -t " . a:pane . " '" . 'doc ' . a:symbol . "' Enter"
  echom l:cmd
  call system(l:cmd)
endfunction

function! GetSingleLineVisualSelection()
  return getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
endfunction

function! SendToTmuxPane()
  exe "normal V\<C-[>"
  exe "silent '<,'>Twrite " . g:my_tmux_repl_pane
endfunction

function! KillTmuxRepl()
  if exists('g:my_tmux_repl_pane')
    call system("tmux kill-pane -t " . g:my_tmux_repl_pane)
  endif
endfunction

function! ClearRepl()
  call system("tmux send-keys -t " . g:my_tmux_repl_pane . " 'C-l'")
endfunction

function! GetTmuxSession()
  return systemlist("tmux display-message -p '#S'")[0]
endfunction

function! GetTmuxWindowName()
  return systemlist("tmux display-message -p '#{window_name}'")[0]
endfunction

function! GetTmuxPaneIndex()
  return systemlist("tmux display-message -p '#{pane_index}'")[0]
endfunction

function! GetTmuxPaneId()
  return systemlist("tmux display-message -p '#{pane_id}'")[0]
endfunction

function! GetTmuxPane()
  let l:session = GetTmuxSession()
  let l:window = GetTmuxWindowName()
  let l:pane_index = GetTmuxPaneIndex()
  return l:session . ":" . l:window . "." . l:pane_index
endfunction

function! CreateTmuxSplit()
  call system("tmux splitw")
  "let l:pane = GetTmuxPane()
  let l:pane = GetTmuxPaneId()
  call system("tmux last-pane")
  return l:pane
endfunction

function! CreateTmuxSplitAndRunCommand(command, split)
  let l:cmd = shellescape(a:command)
  call system("tmux splitw " . a:split . " " . l:cmd)
  "let l:pane = GetTmuxPane()
  let l:pane = GetTmuxPaneId()
  call system("tmux last-pane")
  return l:pane
endfunction


function! RunCommandInTmuxPane(pane, command)
  let l:cmd = shellescape(a:command)
  call system("tmux send-keys -t " . a:pane . " " . l:cmd . " Enter")
endfunction

function! RunCommandInSplit(command, split)
  call KillTmuxRepl()
  let l:escaped_cmd = shellescape(a:command)
  let l:project_dir = fnamemodify('.', ':p')
  let l:cmd = 'cd ' . l:project_dir . ' && ' . l:escaped_cmd
  let l:pane = CreateTmuxSplitAndRunCommand(l:cmd, a:split)
  let g:my_tmux_repl_pane = l:pane

  "call RunCommandInTmuxPane(l:pane, l:cmd)
endfunction

function! RunCommandInNewSessionWindow(command, session)
  call KillTmuxRepl()
  let l:escaped_cmd = shellescape(a:command)
  let l:project_dir = fnamemodify('.', ':p')
  " let l:cmd = 'cd ' . l:project_dir . ' && ' . l:escaped_cmd
  let l:cmd = 'cd ' . l:project_dir . ' && ' . a:command
  " let l:escaped_cmd = shellescape(l:cmd)
  let l:timestamp = systemlist('date "+%s"')[0]
  let g:my_tmux_repl_pane = a:session . ':' . l:timestamp
  let l:the_command = "tmux new-window -t " . a:session . " -n " . l:timestamp . ' "' . l:cmd . '"'
  echom l:the_command
  silent call system(l:the_command)
endfunction

function! RunNodeInNewSessionWindow(session)
  call KillTmuxRepl()
  let l:project_dir = fnamemodify('.', ':p')
  let l:file = '~/node_repl.js'
  if findfile('.derick/node_repl.js', l:project_dir) == '.derick/node_repl.js'
    let l:file = '.derick/node_repl.js'
  endif
  let l:cmd = 'cd ' . l:project_dir . ' && node ' . l:file
  let l:timestamp = systemlist('date "+%s"')[0]
  let g:my_tmux_repl_pane = a:session . ':' . l:timestamp
  let l:the_command = "tmux new-window -t " . a:session . " -n " . l:timestamp . ' "' . l:cmd . '"'
  silent call system(l:the_command)
endfunction

function! RunPhpUnitOnMethodInBufferInNewSessionWindow(buffer_name, method, session)
  call KillTmuxRepl()
  " if exists('g:phpunit_test_tmux_pane')
  "   call system("tmux kill-pane -t " . g:phpunit_test_tmux_pane)
  " endif
  let l:project_dir = fnamemodify('.', ':p')
  let l:phpunit_exe = fnamemodify('vendor/bin/phpunit ', ':p')
  let l:file = expand('%:p')
  let l:cmd = 'cd ' . l:project_dir . ' && clear && ' . l:phpunit_exe . ' --filter ' . a:method . ' ' . l:file
  let l:timestamp = systemlist('date "+%s"')[0]
  let g:my_tmux_repl_pane = a:session . ':' . l:timestamp
  " let g:phpunit_test_tmux_pane = a:session . ':' . l:timestamp
  let l:the_command = "tmux new-window -t " . a:session . " -n " . l:timestamp . ' "' . l:cmd . '; exec bash" '
  silent call system(l:the_command)
  " exe "Tmux splitw " . a:split . " '" . l:cmd . " ; read'"
endfunction
