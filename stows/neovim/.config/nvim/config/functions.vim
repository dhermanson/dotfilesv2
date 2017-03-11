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
