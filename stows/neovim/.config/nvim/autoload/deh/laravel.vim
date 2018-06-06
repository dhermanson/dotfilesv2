if exists('g:loaded_deh_laravel')
  finish
endif
let g:loaded_deh_laravel = 1

function! deh#laravel#setup(project_name)
  let b:deh_laravel_project = 1

  call deh#laravel#setup_php_filetype_mappings()

  nnoremap <silent> <buffer> <leader>pll :call system("tmux splitw -h -p 40 'tail -f storage/logs/laravel.log'")<CR>:call system("tmux last-pane")<CR>
  nnoremap <silent> <buffer> <leader>plj :call system("tmux splitw -v -p 10 'tail -f storage/logs/laravel.log'")<CR>:call system("tmux last-pane")<CR>
  nnoremap <silent> <buffer> <leader>plc :call system("echo '' > storage/logs/laravel.log'")<CR>

  nnoremap <silent> <buffer> <leader>pmdoc :call deh#laravel#run_npm_docs()<CR>
  nnoremap <silent> <buffer> <leader>pdoc :call system('open public/docs/index.html')<CR>
  nnoremap <silent> <buffer> <leader>pwd :call deh#laravel#run_npm_watch_docs()<CR>
  nnoremap <silent> <buffer> <leader>pldoc :call system('open https://laravel.com/docs')<CR>
  nnoremap <silent> <buffer> <leader>pdbsc :call RunSchemaspyOnProjectDatabase()<CR>
  nnoremap <silent> <buffer> <leader>pdbso :call OpenSchemaspyFileInBrowser()<CR>
  nnoremap <silent> <buffer> <leader>pdbc :call CreateProjectDatabase()<CR>
  nnoremap <silent> <buffer> <leader>pdbd :call DropProjectDatabase()<CR>
  nnoremap <silent> <buffer> <leader>pdbp :call DumpProjectDatabase()<CR>
  nnoremap <silent> <buffer> <leader>pdbrj :call RunMycli('-v')<CR>
  nnoremap <silent> <buffer> <leader>pdbrl :call RunMycli('-h')<CR>
  nnoremap <silent> <buffer> <leader>pris :call OpenProjectRootInVagrantSplit("-v")<CR>
  nnoremap <silent> <buffer> <leader>priv :call OpenProjectRootInVagrantSplit("-h")<CR>
  nnoremap <silent> <buffer> <silent> <leader>pa :call deh#laravel#run_artisan()<CR>
  nnoremap <silent> <buffer> <silent> <M-a> :call deh#laravel#run_artisan()<CR>
endfunction

function! deh#laravel#setup_php_filetype_mappings()
  if (&ft=='php')
    nnoremap <silent> <buffer> <M-r><M-j> :call RunArtisanTinkerInSplit("-v")<CR>
    nnoremap <silent> <buffer> <M-r><M-l> :call RunArtisanTinkerInSplit("-h")<CR>
    nnoremap <silent> <buffer> <M-r><M-o> :call RunCommandInNewSessionWindow('php artisan tinker' , "repl")<CR>
    inoremap <silent> <buffer> <M-r><M-o> <C-o>:call RunCommandInNewSessionWindow('php artisan tinker' , "repl")<CR>
    nnoremap <silent> <buffer> <leader>rrs :call RunArtisanTinkerInVagrantSplit("-v")<CR>
    nnoremap <silent> <buffer> <leader>rrv :call RunArtisanTinkerInVagrantSplit("-h")<CR>
    nnoremap <silent> <buffer> <localleader>rs :call RunPhpSpecOnBuffer(bufname('%')) <CR>
    nnoremap <silent> <buffer> <M-D> :! open http://php.net/<cword><CR><Esc>
    inoremap <silent> <buffer> <M-D> <C-o>:! open http://php.net/<cword><CR>
  endif
endfunction

function! deh#laravel#run_npm_docs()
  call system('npm run docs')
endfunction

function! deh#laravel#run_npm_watch_docs()
  ruby <<EOD
  system 'tmux neww "npm run watch-docs"'
  system 'tmux last-window'

  fork do
    sleep 1
    system 'open http://localhost:3000'
  end
EOD
endfunction

function! deh#laravel#run_artisan_command(cmd)
  " let escaped_cmd = "php -dxdebug.remote_enable=0 -dxdebug.remote_autostart=0 artisan " . shellescape(a:cmd)
  let escaped_cmd = "php artisan " . shellescape(a:cmd)

  let run_script = $HOME."/.config/nvim/bin/run_then_close_tmux_window"

  let script_command = run_script . " " . escaped_cmd

  " call dispatch#start("tmux neww '" . script_command . "'")
  call system("tmux neww '" . script_command . "'")
endfunction

function! deh#laravel#get_available_artisan_commands()
  let results = system("php -dxdebug.remote_enable=0 -dxdebug.remote_autostart=0 artisan --no-ansi list")
  let lines = split(results, "\n")

  let commands = []
  let available_commands_hit = 0

  for line in lines
    if !available_commands_hit
      if line == "Available commands:"
        let available_commands_hit = 1
        continue
      endif
    else
      let cmd = split(line)
      if (len(cmd) > 1)
        let c = cmd[0]
        "let trimmed = substitute(c, '^\s*', '', '') 
        let commands = commands + [c]
      endif
    endif
  endfor

  return commands

endfunction

function! deh#laravel#run_artisan()
  let width = +system("tput cols")
  let preview = 'down:25%'

  " TODO: fix this
  let width = 200
  if width > 160
    let preview = 'right:70%'
  endif

  call fzf#run({
      \  'source': deh#laravel#get_available_artisan_commands(),
      \  'sink': function('deh#laravel#run_artisan_command'),
      \  'options': '--ansi -i --preview-window=' . l:preview . ' --preview="php -dxdebug.remote_enable=0 -dxdebug.remote_autostart=0 artisan {} --help" --bind alt-j:preview-down,alt-k:preview-up',
      \  })
endfunction
