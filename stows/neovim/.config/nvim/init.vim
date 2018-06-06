set nocompatible
syntax on
filetype plugin indent on

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/colors.vim
source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/keys.vim

" setup projects
let s:vim_project_file = $HOME.'/projects.vim'
if filereadable(s:vim_project_file)
  :execute 'source ' . fnameescape(s:vim_project_file)
endif



" tagbar settings
let g:tagbar_type_vbnet = {
    \ 'ctagstype' : 'vb',
    \ 'kinds' : [
        \ 'f:functions',
        \ 's:subroutine',
    \ ]
\ }
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'f:functions',
        \ 'v:private variables',
        \ 'u:public variables',
        \ 'c:classes',
    \ ]
\ }

let g:tagbar_type_groovy = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

let g:tagbar_type_snippets = {
    \ 'ctagstype' : 'snippets',
    \ 'kinds' : [
        \ 's:snippets',
    \ ]
\ }

let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'y:interfaces',
        \ 'z:classes',
        \ 'w:constants',
        \ 'm:methods',
        \ 'x:functions',
        \ 't:traits',
        \ 'p:properties',
        \ 'r:static_properties',
        \ 's:static_methods',
    \ ]
  \ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

function! RunNodeInSplit(split)
 call KillTmuxRepl()
 let l:project_dir = fnamemodify('.', ':p')
 let l:file = $HOME.'/node_repl.js'
 if findfile('.derick/node_repl.js', l:project_dir) == '.derick/node_repl.js'
   let l:file = '.derick/node_repl.js'
 endif
 let l:cmd = 'cd ' . l:project_dir . ' && node ' . l:file
"  let l:cmd = 'cd ' . l:project_dir . ' && node '
 let l:pane = CreateTmuxSplitAndRunCommand(l:cmd, a:split)
 let g:my_tmux_repl_pane = l:pane

 "call RunCommandInTmuxPane(l:pane, l:cmd)
endfunction

augroup my_sql
 autocmd!
 autocmd FileType sql nnoremap <buffer> <M-r><M-j> :call RunMycli('-v')<CR>
 autocmd FileType sql nnoremap <buffer> <M-r><M-l> :call RunMycli('-h')<CR>
augroup END

augroup my_javascript
 autocmd!
 autocmd FileType javascript nnoremap <buffer> <localleader>e :echo "You've opened a javascript file!"<CR>
 autocmd FileType javascript nnoremap <buffer> <localleader>e :echo "You've opened a javascript file!"<CR>
 autocmd FileType javascript nnoremap <buffer> <M-r><M-j> :call RunNodeInSplit("-v")<CR>
 autocmd FileType javascript nnoremap <buffer> <M-r><M-l> :call RunNodeInSplit("-h")<CR>
 autocmd FileType javascript nnoremap <buffer> <M-r><M-o> :call RunNodeInNewSessionWindow("repl")<CR>
augroup END

augroup my_sh
 autocmd!
 autocmd BufNewFile,BufRead .env* setfiletype sh
 autocmd FileType sh nnoremap <buffer> <silent> <M-r><M-j> :call RunCommandInSplit("bash", "-v")<CR>
 autocmd FileType sh nnoremap <buffer> <silent> <M-r><M-l> :call RunCommandInSplit("bash", "-h")<CR>
augroup END

augroup my_python
 autocmd!
 autocmd FileType python nnoremap <buffer> <M-r><M-j> :call RunCommandInSplit("ipython", "-v")<CR>
 autocmd FileType python nnoremap <buffer> <M-r><M-l> :call RunCommandInSplit("ipython", "-h")<CR>
augroup END

augroup my_ruby
 autocmd!
 autocmd FileType ruby nnoremap <buffer> <M-r><M-j> :call RunCommandInSplit("pry", "-v")<CR>
 autocmd FileType ruby nnoremap <buffer> <M-r><M-l> :call RunCommandInSplit("pry", "-h")<CR>
 autocmd FileType ruby nnoremap <buffer> <silent> <M-r><M-o> :call RunCommandInNewSessionWindow("pry", "repl")<CR>
 autocmd FileType ruby inoremap <buffer> <silent> <M-i> <Esc>mayiW`a:call TabCompleteInTmuxPrySession(@@, g:my_tmux_repl_pane)<CR>a
 autocmd FileType ruby nnoremap <buffer> <silent> <M-d> mayiW`a:call ShowPryDocForExpression(@@, g:my_tmux_repl_pane)<CR>
 autocmd FileType ruby inoremap <buffer> <silent> <M-d> <Esc>mayiW`a:call ShowPryDocForExpression(@@, g:my_tmux_repl_pane)<CR>a
 autocmd FileType ruby nnoremap <buffer> <silent> <M-BS> :call DeleteAllTextOnReplLine(g:my_tmux_repl_pane)<CR>
 autocmd FileType ruby inoremap <buffer> <silent> <M-BS> <C-o>:call DeleteAllTextOnReplLine(g:my_tmux_repl_pane)<CR>
augroup END

augroup my_groovy
 autocmd!
 autocmd FileType groovy nnoremap <buffer> <silent> <M-r><M-j> :call RunCommandInSplit("groovysh", "-v")<CR>
 autocmd FileType groovy nnoremap <buffer> <silent> <M-r><M-l> :call RunCommandInSplit("groovysh", "-h")<CR>
 autocmd FileType groovy nnoremap <buffer> <silent> <M-r><M-o> :call RunCommandInNewSessionWindow("groovysh", "repl")<CR>
 autocmd FileType groovy nnoremap <buffer> <silent> <M-r><M-p> :call SendSymbolToTmuxPaneAndEnter(":purge all", g:my_tmux_repl_pane)<CR>
 autocmd FileType groovy nnoremap <buffer> <silent> <M-r><M-c> :call ClearTmuxRepl(g:my_tmux_repl_pane)<CR>
 autocmd FileType groovy nnoremap <buffer> <silent> <M-BS> :call DeleteAllTextOnReplLine(g:my_tmux_repl_pane)<CR>
 autocmd FileType groovy inoremap <buffer> <silent> <M-i> <Esc>mayiW`a:call TabCompleteInTmuxGroovyShSession(@@, g:my_tmux_repl_pane)<CR>a
 autocmd FileType groovy inoremap <buffer> <silent> <M-BS> <C-o>:call DeleteAllTextOnReplLine(g:my_tmux_repl_pane)<CR>
augroup END

augroup my_vue
  autocmd!
  autocmd FileType vue syntax sync fromstart
augroup END


function! RunSchemaspyOnProjectDatabase()
  let l:project_dir = fnamemodify('.', ':p')

  ruby <<EOD
  require 'fileutils'
  require 'pathname'

  # ip = VIM::evaluate('l:ip')
  project_dir = VIM::evaluate('l:project_dir')
  directory = Pathname.new(project_dir) + '.derick/schema'
  FileUtils.mkdir_p directory

  fork do
    require 'dotenv'

    if File.exists? '.env'
      Dotenv.load '.env'

      db = ENV['DB_DATABASE']
      user = ENV['DB_USERNAME']
      pass = ENV['DB_PASSWORD']

      unless db.nil? and user.nil? and pass.nil? and ip.nil? and directory.nil?
        cmd = %Q( tmux splitw -p 10 'schemaspy #{directory} #{db} #{user} #{pass} && open #{directory}/relationships.html' )
        system cmd
        system 'tmux last-pane'
      end
    end
  end
EOD
endfunction

function! OpenSchemaspyFileInBrowser()
  call system('open .derick/schema/relationships.html')
endfunction
  
function! DumpProjectDatabase()
  let l:project_dir = fnamemodify('.', ':p')

  ruby <<EOD
  require 'dotenv'
  require 'date'
  require 'fileutils'
  require 'pathname'

  if File.exists? '.env'
    Dotenv.load '.env'

    db = ENV['DB_DATABASE']
    user = ENV['DB_USERNAME']
    pass = ENV['DB_PASSWORD']

    unless user.nil? and pass.nil?
      if db.nil?
        puts "No database configured"
      else
        # FileUtils::mkdir_p "./derick/database"
        project_dir = VIM::evaluate('l:project_dir')
        directory = Pathname.new(project_dir) + '.derick/database'
        FileUtils.mkdir_p directory
        now_format = DateTime.now.strftime("%Y_%m_%d_%H_%M_%S")
        dump_file = "#{directory}/dev_dump_#{db}_#{now_format}.sql"
        cmd = %Q( tmux splitw -p 10 ' mysqldump --databases #{db} -u #{user} --password=#{pass} > #{dump_file} ' )
        system cmd
        system 'tmux last-pane'
      end

    end
  end
EOD
endfunction

function! DropProjectDatabase()
  ruby <<EOD
  fork do
    require 'dotenv'

    if File.exists? '.env'
      Dotenv.load '.env'

      db = ENV['DB_DATABASE']
      user = ENV['DB_USERNAME']
      pass = ENV['DB_PASSWORD']

      unless user.nil? and pass.nil?
        if db.nil?
          puts "No database configured"
        else
          cmd = %Q( tmux splitw 'mysqladmin -u #{user} --password=#{pass} drop #{db} ')
          system cmd
        end

      end
    end
  end
EOD
endfunction

ruby << EOD
require 'dotenv'

def project_database_exists
  if File.exists? '.env'
    Dotenv.load '.env'

    db = ENV['DB_DATABASE']
    user = ENV['DB_USERNAME']
    pass = ENV['DB_PASSWORD']

    if db.nil? or user.nil? or pass.nil?
      false
    else
      system %Q( mysql -u #{user} --password=#{pass} -e 'use  #{db}')
    end

  else
    false
  end
end

def create_database
  if File.exists? '.env'
    Dotenv.load '.env'

    db = ENV['DB_DATABASE']
    user = ENV['DB_USERNAME']
    pass = ENV['DB_PASSWORD']

    unless user.nil? and pass.nil?
     if db.nil?
       puts "No database configured"
     else
       #create = %Q( mysqladmin -u #{user} --password=#{pass} create #{db})
      create = %Q( mysql -u #{user} --password=#{pass} -e 'create database `#{db}` character set utf8mb4 collate utf8mb4_unicode_ci')
      grant = %Q( mysql -u #{user} --password=#{pass} -e "grant all on `#{db}`.* to '#{user}'@'%'" )
      system create
      system grant
     end

    end
  end
end
EOD

function! CreateProjectDatabase()
  ruby <<EOD
  fork do
    unless project_database_exists
      create_database
    end
  end
EOD
  endfunction

function! RunMycli(split)
  call KillTmuxRepl()
  ruby <<EOD
  split = VIM::evaluate('a:split')

  require 'dotenv'

  create_database

  if File.exists? '.env'
    Dotenv.load '.env'

    host = ENV['DB_HOST'] || '127.0.0.1'
    port = ENV['DB_PORT'] || '3306'
    db = ENV['DB_DATABASE']
    user = ENV['DB_USERNAME']
    pass = ENV['DB_PASSWORD']

    unless host.nil? and
           port.nil? and
           user.nil? and
           pass.nil?
      if db.nil?
        system "tmux splitw #{split} 'mycli -h #{host} -P #{port} -u #{user} -p #{pass}'"
      else
        system "tmux splitw #{split} 'mycli -h #{host} -P #{port} -D #{db} -u #{user} -p #{pass}'"
      end

    end
  else
    system "tmux splitw 'mycli --login-path=local'"
  end
EOD
  let l:pane = GetTmuxPaneId()
  " call system("tmux last-pane")
  let g:my_tmux_repl_pane = l:pane
  
endfunction

function! RunMochaOnBuffer(buffer_name, split)
  let l:project_dir = fnamemodify('.', ':p')
  let l:mocha_exe = fnamemodify('node_modules/.bin/mocha ', ':p')
  let l:file = expand('%:p')
  let l:cmd = 'cd ' . l:project_dir . ' && clear && webpack --display none ' . l:file . ' .test-output.js && ' . l:mocha_exe . ' .test-output.js'
  exe "Tmux splitw " . a:split . " '" . l:cmd . " ; read'"
endfunction


function! RunTapeBuffer(buffer_name, split, debug)
  let l:project_dir = fnamemodify('.', ':p')
  let l:file = expand('%:p')

  if (a:debug)
    let l:node_exe = 'node --inspect --debug-brk'
    let l:cmd = 'cd ' . l:project_dir . ' && clear && webpack --config=.derick/webpack.config.js --display none ' . l:file . ' .test-output.js && ' . l:node_exe . ' .test-output.js | tap-spec'
  else
    let l:node_exe = 'babel-node'
    let l:cmd = 'cd ' . l:project_dir . ' && clear && ' . l:node_exe . ' ' . l:file . ' | tap-spec'
  endif

  ruby <<EOD
  cmd = VIM::evaluate('l:cmd')
  split = VIM::evaluate('a:split')
  debug = VIM::evaluate('a:debug')

  if debug == 1
    system "tmux splitw -p 10 -v '#{cmd}'"
    # system cmd
    # pid = fork do
    #   require 'pty'
    #
    #   PTY.spawn(cmd) do |stdout, stdin, pid|
    #     stdout.each { |line|
    #
    #       if match = line.match(/chrome-devtools:\S*/)
    #         url = match[0]
    #         puts url
    #         system "osascript",  "tell application \"Google Chrome\" to open location \"#{url}\""
    #       end
    #
    #     }
    #   end
    # end
    # Process.detach(pid)
  else
    system "tmux splitw #{split} '#{cmd} ; exec bash'"
  end

EOD
  " exe "Tmux splitw " . a:split . " '" . l:cmd . " ; exec bash'"
endfunction

"------------PHP STUFF MOVE IT!--------------------------------------------------

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

function! RunPhpUnitOnBuffer(buffer_name, split)
  let l:project_dir = fnamemodify('.', ':p')
  let l:phpunit_exe = fnamemodify('vendor/bin/phpunit ', ':p')
  let l:file = expand('%:p')
  let l:cmd = 'cd ' . l:project_dir . ' && clear && ' . l:phpunit_exe . ' ' . l:file
  exe "Tmux splitw " . a:split . " '" . l:cmd . " ; read'"
endfunction

function! RunPhpUnitOnMethodInBuffer(buffer_name, method, split)
  " TODO: don't hardcode console:runner.1
  "       maybe use a global config or something
  "exe "Tmux send-keys -t console:runner.1 'clear; phpspec run " . fnameescape(a:buffer_name) . "' Enter"
  let l:project_dir = fnamemodify('.', ':p')
  let l:phpunit_exe = fnamemodify('vendor/bin/phpunit ', ':p')
  let l:file = expand('%:p')
  let l:cmd = 'cd ' . l:project_dir . ' && clear && ' . l:phpunit_exe . ' --filter ' . a:method . ' ' . l:file
  "exe "Start phpunit run " . fnameescape(a:buffer_name) . " && read"
  "exe "Tmux neww -t runner"
  "exe "Tmux send-keys -t runner '" . l:cmd . "' Enter"
  "exe "Tmux neww -t runner '" . l:cmd . "'"
  exe "Tmux splitw " . a:split . " '" . l:cmd . " ; read'"
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

function! RunArtisanTinkerInVagrantSplit(split)
  call KillTmuxRepl()
  let l:project_dir = fnamemodify('.', ':p')
  let l:cmd = "ssh vagrant@127.0.0.1 -p 2222 -t 'cd project && php artisan tinker'"
  let l:pane = CreateTmuxSplitAndRunCommand(l:cmd, a:split)
  let g:my_tmux_repl_pane = l:pane

  "call RunCommandInTmuxPane(l:pane, l:cmd)
endfunction

function! OpenProjectRootInVagrantSplit(split)
  let l:project_dir = fnamemodify('.', ':p')
  let l:cmd = "ssh vagrant@127.0.0.1 -p 2222 -t 'cd project && bash'"
  let l:pane = CreateTmuxSplitAndRunCommand(l:cmd, a:split)
  call system("tmux last-pane")

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

augroup my_on_exit
  autocmd!
  autocmd VimLeavePre * call KillTmuxRepl()
augroup END
