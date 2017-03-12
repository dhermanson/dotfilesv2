set nocompatible

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/colors.vim
source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/keys.vim



"" tags
""nnoremap <Leader>lt :tag<space>
""nnoremap <Leader>t :tselect 
"set tags+=tags.vendor
"
"
"nnoremap <Leader>ug :Unite -buffer-name=grep-results grep<CR>
"nnoremap <Leader>ub :Unite -buffer-name=buffers buffer <CR>
"
"nnoremap <Leader>ur :UniteResume<CR>
"nnoremap <Leader>un :UniteNext<CR>
"nnoremap <Leader>up :UnitePrevious<CR>
"
"
"
"" vim-ruby settings
"let g:rubycomplete_buffer_loading=1
"let g:rubycomplete_classes_in_global=1
"let g:rubycomplete_rails=1
"let g:rubycomplete_load_gemfile=1
"
"
"" indent-guides settings
"let g:indent_guides_enable_on_vim_startup = 0
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 2
"
"" tern_for_vim settings
"set updatetime=1000
"let g:tern_show_argument_hints = 'on_hold'
"let g:tern_show_signature_in_pum = 1
"
"" sql_complete settings
"let g:ftplugin_sql_omni_key = '<C-C>'
"let g:sql_type_default = 'pgsql'
"
"" vim-slime
"let g:slime_target = "tmux"
"" selects entire buffer and slimes it
""nnoremap <space>bs gg<S-v><S-g><C-c><C-C>
"
"" dbext configuration
"" TODO: configure dbext, cuz i just turned off all mapping with
""       the line below this one
"let g:dbext_default_usermaps = 0
"let g:dbext_default_use_sep_result_buffer = 1
"let g:dbext_default_buffer_lines = 25
""let g:dbext_default_window_use_horiz = 0  " Use vertical split
""let g:dbext_default_window_use_right = 1   " Right
""let g:dbext_default_window_width = 80
"
"" python
"let g:jedi#popup_on_dot = 1
"let g:jedi#auto_close_doc = 0
"let g:jedi#show_call_signatures = 2
"let g:jedi#popup_select_first = 1
"
"" vim-rest-console
"let g:vrc_trigger = '<Leader>.mr'
"
"
"
"nnoremap <Leader>.p :set paste!<CR>
"nnoremap <Leader>.ev :e $MYVIMRC<CR>
"nnoremap <Leader>.sv :source $MYVIMRC<CR>
"nnoremap <Leader>.egt :e ~/todo.txt<CR>
"nnoremap <Leader>.ept :e .derick/todo.txt<CR>
"nnoremap <Leader>.epn :e .derick/notes.md<CR>
"
""vnoremap <Leader>,b64e :!python -m base64 -e<CR>
""vnoremap <Leader>,b64d :!python -m base64 -d<CR>
"
""let g:pymode_rope_autoimport = 1
""let g:pymode_run_bind = '<localleader>r'
""let g:pymode_breakpoint_bind = '<localleader>b'
""let g:pymode_lint = 0
""let g:pymode_lint_cwindow = 0
""let g:pymode_lint_checkers = []
"
"" view
"set viewdir=$HOME/.vim_view//
"au BufWritePost,BufLeave,WinLeave *.rest mkview " for tabs
"au BufWinEnter *.rest silent loadview
"
"
"
"" tagbar settings
"nnoremap <Leader>0 :TagbarToggle<CR>
"nnoremap <Leader>9 :TagbarTogglePause<CR>
"let g:tagbar_type_ruby = {
"    \ 'kinds' : [
"        \ 'm:modules',
"        \ 'c:classes',
"        \ 'd:describes',
"        \ 'C:contexts',
"        \ 'f:methods',
"        \ 'F:singleton methods'
"    \ ]
"\ }
"
"let g:tagbar_type_elixir = {
"    \ 'ctagstype' : 'elixir',
"    \ 'kinds' : [
"        \ 'f:functions',
"        \ 'functions:functions',
"        \ 'c:callbacks',
"        \ 'd:delegates',
"        \ 'e:exceptions',
"        \ 'i:implementations',
"        \ 'a:macros',
"        \ 'o:operators',
"        \ 'm:modules',
"        \ 'p:protocols',
"        \ 'r:records'
"    \ ]
"\ }
"
"let g:tagbar_type_typescript = {
"  \ 'ctagstype': 'typescript',
"  \ 'kinds': [
"    \ 'c:classes',
"    \ 'n:modules',
"    \ 'f:functions',
"    \ 'v:variables',
"    \ 'v:varlambdas',
"    \ 'm:members',
"    \ 'i:interfaces',
"    \ 'e:enums',
"  \ ]
"\ }
"
"let g:tagbar_type_snippets = {
"    \ 'ctagstype' : 'snippets',
"    \ 'kinds' : [
"        \ 's:snippets',
"    \ ]
"\ }
"
"let g:tagbar_type_php  = {
"    \ 'ctagstype' : 'php',
"    \ 'kinds'     : [
"        \ 'y:interfaces',
"        \ 'z:classes',
"        \ 'w:constants',
"        \ 'm:methods',
"        \ 'x:functions',
"        \ 't:traits',
"        \ 'p:properties',
"        \ 'r:static_properties',
"        \ 's:static_methods',
"    \ ]
"  \ }
"
"let g:tagbar_type_markdown = {
"    \ 'ctagstype' : 'markdown',
"    \ 'kinds' : [
"        \ 'h:Heading_L1',
"        \ 'i:Heading_L2',
"        \ 'k:Heading_L3'
"    \ ]
"\ }
"
""" youcompleteme
""let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
""let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"
"" ultisnips
"nnoremap <Leader>.es :UltiSnipsEdit<CR>
"nnoremap <Leader>.eas :e ~/.vim/Ultisnips/all.snippets<CR>
"
""inoremap <c-l> <esc>:Unite ultisnips -start-insert<CR>
"inoremap <M-s> <c-o>:Snippets<CR>
""inoremap <M-s> <c-o>:Unite ultisnips -start-insert<CR>
"
"nnoremap <Leader>.os :syntax on<CR>
"
"nnoremap <Leader>.sc :SyntasticCheck<CR>
"nnoremap <Leader>.st :SyntasticToggleMode<CR>
"
"
"
"
"vnoremap <Leader>be y:call Base64Encode(@@)<CR>
"vnoremap <Leader>bd y:call Base64Decode(@@)<CR>
"
"nnoremap <Leader>,jt :%!python -m json.tool<CR>
"
"
"nnoremap <Leader>,a yiw:call AckSearchWord(@@, '.')<CR>
"
"
""imap <c-x><c-f> <plug>(fzf-complete-path)
"
""" omnisharp
""let g:OmniSharp_selector_ui = 'ctrlp'
""let g:OmniSharp_server_type = 'roslyn'
"
"
"
"" php documentor snippets location
"let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
"
""------------php cs-fixer----------------------------------------
"let g:php_cs_fixer_level = "symfony"              " which level ?
"let g:php_cs_fixer_config = "default"             " configuration
""let g:php_cs_fixer_config_file = '.php_cs'       " configuration file
"let g:php_cs_fixer_php_path = "php"               " Path to PHP
"" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "-braces,-psr0"  " need psr0 here because laravel's app/ should be App
"let g:php_cs_fixer_enable_default_mapping = 0     " Enable the mapping by default (<leader>pcd)
"let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
"let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.
""----------------------------------------------------------------
"
"" markown
"let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_json_frontmatter = 1
"let g:vim_markdown_conceal = 0
"
"" neovim
"" deoplete.
"if has('nvim')
"  let g:deoplete#enable_at_startup = 1
"  "let g:deoplete#omni_patterns = {}
"  "let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
"  "let g:deoplete#auto_completion_start_length = 2
"  let g:deoplete#sources = {}
"  let g:deoplete#sources['php'] = ['omni', 'tag', 'file', 'ultisnips', 'buffer', 'member']
"  let g:deoplete#enable_ignore_case = 1
"  let g:deoplete#enable_smart_case = 1
"  "let g:deoplete#keyword_patterns = {}
"  "let g:deoplete#keyword_patterns['php'] = 'function\w*'
"  "let g:deoplete#sources._ = []
"  "let g:deoplete#file#enable_buffer_path = 1
"  
"  "call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
"endif
"
"" alchemist.vim
""let g:alchemist_iex_term_split = 'vsplit'
"
""if has('gui_macvim') && has('gui_running')
"  "let g:my_tmux_pane= 'runner'
""else
"  "let g:my_tmux_pane= 'runner'
""endif
"
"
"
"" slimux
""nnoremap <M-s> :SlimuxREPLSendLine<CR>
""vnoremap <M-s> :\<C-u>execute "'<,'>SlimuxREPLSendSelection" <CR>
""inoremap <silent> <M-s> <C-o>:SlimuxREPLSendLine<CR>
"
""-------- Functions ------------------------------- 
"
"function! AckSearchWord(word, directory)
"  execute "Ack " . a:word . " " . a:directory
"endfunction
"
"function! Base64Encode(value)
"ruby <<EOF
"  require 'base64'
"
"  value = Vim::evaluate('a:value').strip
"  encoded = Base64.encode64(value).strip
"  line = Vim::Buffer.current.line_number
"
"  Vim::Buffer.current.append(line, encoded)
"EOF
"endfunction
"
"function! Base64Decode(value)
"ruby <<EOF
"  require 'base64'
"
"  value = Vim::evaluate('a:value').strip
"  encoded = Base64.decode64(value).strip
"  line = Vim::Buffer.current.line_number
"
"  Vim::Buffer.current.append(line, encoded)
"EOF
"endfunction
"
"
"function! WriteNumberList(numbers)
"  ruby <<EOL
"  buffer = Vim::Buffer.current
"  current_line = buffer.line_number
"  numbers = Vim::evaluate("a:numbers")
"
"  numbers.times do |num|
"    Vim::Buffer.current.append current_line, num.to_s
"    current_line += 1
"  end
"EOL
"endfunction
"
""function! RunPhpSpecOnBuffer(buffer_name)
"  "" TODO: don't hardcode console:runner.1
"  ""       maybe use a global config or something
"  ""exe "Tmux send-keys -t console:runner.1 'clear; phpspec run " . fnameescape(a:buffer_name) . "' Enter"
"  "exe "Start phpspec run " . fnameescape(a:buffer_name) . " && read"
""endfunction
"
"
"
"function! RunNodeInSplit(split)
"  call KillTmuxRepl()
"  let l:project_dir = fnamemodify('.', ':p')
"  let l:file = '~/node_repl.js'
"  if findfile('.derick/node_repl.js', l:project_dir) == '.derick/node_repl.js'
"    let l:file = '.derick/node_repl.js'
"  endif
"  let l:cmd = 'cd ' . l:project_dir . ' && node ' . l:file
"  let l:pane = CreateTmuxSplitAndRunCommand(l:cmd, a:split)
"  let g:my_tmux_repl_pane = l:pane
"
"  "call RunCommandInTmuxPane(l:pane, l:cmd)
"endfunction
"
"nnoremap <silent> <leader>rs :call RunCommandInSplit("bash", "-v")<CR>
"nnoremap <silent> <leader>rv :call RunCommandInSplit("bash", "-h")<CR>
"
""-------------Auto-Commands--------------"
"
"augroup filetype_dosini
"  autocmd!
"  autocmd BufRead,BufNewFile php-fpm.conf set syntax=dosini
"  autocmd BufRead,BufNewFile php.ini set syntax=dosini
"  autocmd BufRead,BufNewFile www.conf set syntax=dosini
"  autocmd BufRead,BufNewFile *.conf set syntax=dosini
"augroup END
"
"augroup filetype_css
"  autocmd!
"  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"augroup END
"
"" surround settings for erb templates
"augroup filetype_erb
"  autocmd!
"  autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
"  autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"
"augroup END
"
"" cucumber
"augroup my_cucumber
"  autocmd!
"  autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
"  "autocmd FileType cucumber nnoremap <buffer> <localleader>rb :Start behat % && read<CR>
"  autocmd FileType cucumber nnoremap <buffer> <localleader>rb :call RunBehatOnFile()<CR>
"augroup END
"
"
"augroup ApiBlueprint
"  autocmd!
"  autocmd FileType apiblueprint nnoremap <buffer> <localleader>md :Dispatch gulp apidocs<CR>
"augroup END
"
"
"augroup html
"  autocmd!
"  "autocmd BufWritePre,BufRead *.html :normal; gg=G
"  autocmd BufNewFile,BufRead *.html setlocal nowrap
"  "autocmd FileType html nnoremap <buffer> <localleader>e :echo "You've opened a html file!"<CR>
"augroup END
"
"augroup my_java
"  autocmd!
"  autocmd FileType java setlocal omnifunc=javacomplete#Complete
"  autocmd FileType java setlocal tags+=~/tags/java.tags
"augroup END
"
"augroup my_javascript
"  autocmd!
"  autocmd FileType javascript nnoremap <buffer> <localleader>e :echo "You've opened a javascript file!"<CR>
"  autocmd FileType javascript nnoremap <buffer> <localleader>e :echo "You've opened a javascript file!"<CR>
"  autocmd FileType javascript nnoremap <buffer> <leader>rs :call RunNodeInSplit("-v")<CR>
"  autocmd FileType javascript nnoremap <buffer> <leader>rv :call RunNodeInSplit("-h")<CR>
"  autocmd FileType javascript nnoremap <buffer> <M-r> :w<CR> :VimuxRunCommand("clear && node " . bufname("%") . ' \| tap-spec')<CR>
"  autocmd FileType javascript inoremap <buffer> <M-r> <Esc>:w<CR>:call VimuxRunCommand("clear && node " . bufname("%") . ' \| tap-spec')<CR>
"  "autocmd FileType javascript nnoremap <buffer> <localleader>rr :call RunCommandInSplit("node " . bufname("%") . ' \| tap-spec && read', '-h')<CR>
"  "autocmd FileType javascript nnoremap <buffer> <localleader>rr :call RunTapeOnFile('%')<CR>
"  autocmd Filetype *.txt set spell
"augroup END
"
"
"augroup typescript
"  autocmd!
"  " tsuquyomi
"  autocmd FileType typescript nnoremap <buffer> <localleader>d :TsuquyomiDefinition<CR>
"  autocmd FileType typescript nnoremap <buffer> <localleader>r :TsuquyomiReferences<CR>
"  autocmd FileType typescript nnoremap <buffer> <localleader>c :TsuquyomiRenameSymbolC<CR>
"  autocmd FileType typescript nnoremap <buffer> <localleader>b :TsuquyomiGoBack<CR>
"  autocmd FileType typescript nnoremap <buffer> <localleader>ef :TsuquyomiGeterr<CR>
"  autocmd FileType typescript nnoremap <buffer> <localleader>ep :TsuquyomiGeterrProject<CR>
"  autocmd FileType typescript nnoremap <buffer> <localleader>t :YcmCompleter GetType<CR>
"  autocmd FileType typescript setlocal completeopt+=menu,preview
"  "autocmd FileType typescript nnoremap <buffer> <localleader>r :call RunTypescriptFile()<CR>
"augroup END
"
"augroup my_ruby
"  autocmd!
"  autocmd FileType ruby nnoremap <buffer> <leader>rs :call RunCommandInSplit("pry", "-v")<CR>
"  autocmd FileType ruby nnoremap <buffer> <leader>rv :call RunCommandInSplit("pry", "-h")<CR>
"  " rails
"  autocmd FileType ruby nnoremap <buffer> <localleader>rr :Rake 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rev :Eview<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rem :Emodel<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rec :Econtroller<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rsv :Sview<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rsm :Smodel<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rsc :Scontroller<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rvv :Vview<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rvm :Vmodel<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rvc :Vcontroller<CR>
"  autocmd FileType ruby nnoremap <buffer> <localleader>rgc :Rgenerate controller 
"
"  autocmd FileType ruby nnoremap <buffer> <localleader>rev<Space> :Eview 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rem<Space> :Emodel 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rec<Space> :Econtroller 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rsv<Space> :Sview 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rsm<Space> :Smodel 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rsc<Space> :Scontroller 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rvv<Space> :Vview 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rvm<Space> :Vmodel 
"  autocmd FileType ruby nnoremap <buffer> <localleader>rvc<Space> :Vcontroller 
"
"  autocmd FileType ruby nnoremap <buffer> <localleader>mtp :Dispatch create-ruby-ctags.sh<CR>
"augroup END
"
"augroup my_elixir
"  autocmd!
"  autocmd FileType elixir setlocal tags+=~/tags/tags.elixir
"  autocmd FileType elixir imap <buffer> <M-d> <Esc><s-k> <C-w>pa<C-x><C-o>
"augroup END
"
"augroup my_vimscript
"  autocmd!
"  autocmd FileType vim setlocal omnifunc=syntaxcomplete#Complete
"augroup END
"
""augroup my_netrw
"    "au!
"    ""au VimEnter * sil! au! FileExplorer *
"    ""au BufEnter * if s:isdir(expand('%')) | bd | exe 'Ranger' | endif
"    "au BufEnter * if s:isdir(expand('%')) | let g:netrw_list_hide= '^.*/tmp/.*$,^.*\.so$,^.*\.swp$,^.*\.zip$,^.*\.class$,^\.\.\=/\=$' | endif
""augroup END
"
""fu! s:isdir(dir) abort
"    "return !empty(a:dir) && (isdirectory(a:dir) ||
"                "\ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
""endfu
"
""inoremap <c-space> <esc>:CtrlPBufTagAll <CR>
"
"
""let g:dbext_default_profile_homestead = 'type=MYSQL:user=dev:passwd=dev:srvname=192.168.10.10:dbname=home    stead:host=192.168.10.10:port=3306'
""let g:dbext_default_profile = 'homestead'
"
"
"" nerdtree
""nnoremap <leader>t :NERDTreeToggle<CR>
"
"
function! SetupLaravelProject()
  let g:projectionist_heuristics = {
        \   "artisan": {
        \     "app/*.php": {
        \       "alternate": "tests/{}Test.php"
        \     },
        \     "app/Models/*.php": {
        \       "type": "model",
        \       "template": ["<?php", "", "namespace App\Models;", "", "class {} {", "}"]
        \     },
        \     "app/Events/*.php": {
        \       "type": "event"
        \     },
        \     "app/Exceptions/*.php": {
        \       "type": "exception"
        \     },
        \     "app/Http/routes.php": {
        \       "type": "routes"
        \     },
        \     "app/Http/Kernel.php": {
        \       "type": "kernel"
        \     },
        \     "app/Http/Controllers/*.php": {
        \       "type": "controller"
        \     },
        \     "app/Http/Middleware/*.php": {
        \       "type": "middleware"
        \     },
        \     "app/Http/Requests/*Request.php": {
        \       "type": "request"
        \     },
        \     "app/Jobs/*.php": {
        \       "type": "job"
        \     },
        \     "app/Listeners/*.php": {
        \       "type": "listener"
        \     },
        \     "app/Policies/*.php": {
        \       "type": "policy"
        \     },
        \     "app/Providers/*.php": {
        \       "type": "provider"
        \     },
        \     "app/Repositories/*.php": {
        \       "type": "repository"
        \     },
        \     "app/Services/*.php": {
        \       "type": "service"
        \     },
        \     "config/*.php": {
        \       "type": "config"
        \     },
        \     "database/migrations/*.php": {
        \       "type": "migration"
        \     },
        \     "database/seeds/*Seeder.php": {
        \       "type": "seeder"
        \     },
        \     "resources/assets/docs/*.md": {
        \       "type": "doc"
        \     },
        \     "resources/views/*.blade.php": {
        \       "type": "view"
        \     },
        \     "spec/*Spec.php": {
        \       "type": "spec",
        \       "alternate": "app/{}.php",
        \       "dispatch": "vendor/bin/phpspec run {file}",
        \       "start": "vendor/bin/phpspec run {file}"
        \     },
        \     "tests/*Test.php": {
        \       "type": "test",
        \       "alternate": "app/{}.php",
        \       "dispatch": "vendor/bin/phpunit {file}",
        \       "start": "vendor/bin/phpunit {file}"
        \     },
        \     "phpspec.yml": {
        \       "type": "phpspec.yml",
        \       "template": [
        \         "suites:",
        \         "    main:",
        \         "        namespace: App",
        \         "        psr4_prefix: App",
        \         "        src_path: app",
        \         "        src_path: app"
        \       ]
        \     }
        \   }
        \ }

  nnoremap <leader>emo :Emodel 
  nnoremap <leader>vmo :Vmodel 
  nnoremap <leader>smo :Smodel 
  nnoremap <leader>eev :Eevent 
  nnoremap <leader>vev :Vevent 
  nnoremap <leader>sev :Sevent 
  nnoremap <leader>eex :Eexception 
  nnoremap <leader>vex :Vexception 
  nnoremap <leader>sex :Sexception 
  nnoremap <leader>ero :Eroutes <CR>
  nnoremap <leader>vro :Vroutes <CR>
  nnoremap <leader>sro :Sroutes <CR>
  nnoremap <leader>ek :Ekernel <CR>
  nnoremap <leader>vk :Vkernel <CR>
  nnoremap <leader>sk :Skernel <CR>
  nnoremap <leader>eco :Econtroller 
  nnoremap <leader>vco :Vcontroller 
  nnoremap <leader>sco :Scontroller 
  nnoremap <leader>emid :Emiddleware 
  nnoremap <leader>vmid :Vmiddleware 
  nnoremap <leader>smid :Smiddleware 
  nnoremap <leader>ere :Erequest 
  nnoremap <leader>vre :Vrequest 
  nnoremap <leader>sre :Srequest 
  nnoremap <leader>ej :Ejob 
  nnoremap <leader>vj :Vjob 
  nnoremap <leader>sj :Sjob 
  nnoremap <leader>el :Elistener 
  nnoremap <leader>vl :Vlistener 
  nnoremap <leader>sl :Slistener 
  nnoremap <leader>epo :Epolicy 
  nnoremap <leader>vpo :Vpolicy 
  nnoremap <leader>spo :Spolicy 
  nnoremap <leader>epr :Eprovider 
  nnoremap <leader>vpr :Vprovider 
  nnoremap <leader>spr :Sprovider 
  nnoremap <leader>ecfg :Econfig 
  nnoremap <leader>vcfg :Vconfig 
  nnoremap <leader>scfg :Sconfig 
  nnoremap <leader>emig :Emigration 
  nnoremap <leader>vmig :Vmigration 
  nnoremap <leader>smig :Smigration 
  nnoremap <leader>ese :Eseeder 
  nnoremap <leader>vse :Vseeder 
  nnoremap <leader>sse :Sseeder 
  nnoremap <leader>esp :Espec 
  nnoremap <leader>vsp :Vspec 
  nnoremap <leader>ssp :Sspec 
  nnoremap <leader>ed :Edoc 
  nnoremap <leader>vd :Vdoc 
  nnoremap <leader>sd :Sdoc 
  nnoremap <leader>ev :Eview 
  nnoremap <leader>vv :Vview 
  nnoremap <leader>sv :Sview 
  nnoremap <leader>etr :Etransformer 
  nnoremap <leader>vtr :Vtransformer 
  nnoremap <leader>str :Stransformer 
  nnoremap <leader>ete :Etest 
  nnoremap <leader>vte :Vtest 
  nnoremap <leader>ste :Stest 
  nnoremap <leader>ea :A<CR>
  nnoremap <leader>sa :AS<CR>
  nnoremap <leader>va :AV<CR>
  nnoremap <leader>sp :Dispatch phpspec describe App/
  augroup my_laravel
    autocmd!
    autocmd FileType php nnoremap <buffer> <silent> <leader>rs :call RunArtisanTinkerInSplit("-v")<CR>
    autocmd FileType php nnoremap <buffer> <silent> <leader>rv :call RunArtisanTinkerInSplit("-h")<CR>
  augroup END

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
        create = %Q( mysqladmin -u #{user} --password=#{pass} create #{db})
        grant = %Q( mysql -u #{user} --password=#{pass} -e "grant all on #{db}.* to #{user}@localhost" )
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
    #require 'dotenv'

    #if File.exists? '.env'
    #  Dotenv.load '.env'

    #  db = ENV['DB_DATABASE']
    #  user = ENV['DB_USERNAME']
    #  pass = ENV['DB_PASSWORD']

    #  unless user.nil? and pass.nil?
    #   if db.nil?
    #     puts "No database configured"
    #   else
    #    create = %Q( tmux splitw 'mysqladmin -u #{user} --password=#{pass} create #{db} ')
    #    grant = %Q( tmux splitw 'mysql -u #{user} --password=#{pass} -e "grant all on #{db}.* to #{user}@localhost"' )
    #    system create
    #    sleep 1
    #    system grant
    #   end

    #  end
    #end
  end
EOD
  endfunction

function! RunMycli(split)
  ruby <<EOD
split = VIM::evaluate('a:split')
fork do
  require 'dotenv'

  create_database

  if File.exists? '.env'
    Dotenv.load '.env'

    host = ENV['DB_HOST']
    port = ENV['DB_PORT']
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
end
EOD
endfunction

  nnoremap <leader>dbj :call RunMycli('-v')<CR>
  nnoremap <leader>dbl :call RunMycli('-h')<CR>

  function! RunArtisanCommand(cmd)
    let escaped_cmd = "php artisan " . shellescape(a:cmd)

    let run_script = $HOME."/.config/nvim/bin/run_then_close_tmux_window"

    let script_command = run_script . " " . escaped_cmd

    " call dispatch#start("tmux neww '" . script_command . "'")
    call system("tmux neww '" . script_command . "'")
  endfunction

  " make sure dependencies installed...can run in background
  call system("tmux splitw -b -p 5 'ruby " . $HOME . "/.config/nvim/bin/laravel/open_mycli.rb'")
  call system("tmux last-pane")


  function! GetAvailableArtisanCommands()
    let results = system("php artisan --no-ansi list")
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

  function! RunArtisan()
    let width = +system("tput cols")
    let preview = 'down:75%'

    " TODO: fix this
    let width = 200
    if width > 160
      let preview = 'right:70%'
    endif

    call fzf#run({
        \  'source': GetAvailableArtisanCommands(),
        \  'sink': function('RunArtisanCommand'),
        \  'options': '--ansi -i --preview-window=' . l:preview . ' --preview="php artisan {} --help" --bind alt-j:preview-down,alt-k:preview-up',
        \  })
  endfunction

  nnoremap <silent> <leader>a :call RunArtisan()<CR>
  "nnoremap <silent> <leader>a :call fzf#run({
        "\  'source': GetAvailableArtisanCommands(),
        "\  'sink': function('RunArtisanCommand'),
        "\  'options': '--ansi -i --preview="php artisan {} --help" --bind alt-j:preview-down,alt-k:preview-up',
        "\  })<CR>
endfunction

function! SetupProjectType()
  if filereadable("artisan")
    call SetupLaravelProject()
  endif
endfunction

augroup my_vimenter
  autocmd!
  autocmd VimEnter * call SetupProjectType()
augroup END
