" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')


" Colors / Interface
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" Essentials
Plug 'benmills/vimux'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
" Plugin outside ~/.local/share/nvim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Konfekt/FastFold'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'Raimondi/delimitMate'
" Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Languages
Plug 'sheerun/vim-polyglot'

" Language-specific
" php
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'tobyS/pdv', { 'for': 'php' }

" api blueprint
Plug 'kylef/apiblueprint.vim', { 'for': 'apiblueprint' }

" html-like
Plug 'mattn/emmet-vim'

" ruby
Plug 'tpope/gem-ctags', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/rbenv-ctags', { 'for': 'ruby' }

" javascript
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }

" Initialize plugin system
call plug#end()

" Vimux
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" CtrlP (maybe get rid of CtrlP?)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_max_files=0
let g:ctrlp_by_filename=0
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
"let g:ctrlp_match_window = 'min:4,max:72'
"let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          "\ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_custom_ignore = '\v[\/](vendor|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:50,results:30'
let g:ctrlp_buftag_types = {
    \ 'php'        : '--fields=K --PHP-kinds=mctdfip --languages=php',
  \ }


" editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" ack
let g:ackprg = 'rg --vimgrep --no-heading'

" syntastic
"" syntastic settings
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_debug = 0
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=0
"let g:syntastic_check_on_open=0
"let g:syntastic_check_on_wq=0
"let g:syntastic_aggregate_errors=1
"let g:syntastic_ruby_checkers = ['mri']
"let g:syntastic_javascript_checkers = ['eslint', 'jshint']
""let g:syntastic_apiblueprint_checkers = ['drafter']
""let g:syntastic_apiblueprint_drafter_exec = "/usr/local/bin/drafter"
""let g:syntastic_python_python_exec = '/usr/local/bin/python3'
"let g:syntastic_python_python_exec = 'python3'
"let g:syntastic_python_checkers = ['mypy', 'python']
""let g:syntastic_python_mypy_exec = '/usr/local/bin/mypy'
"let g:syntastic_cs_checkers = ['mcs']
""let g:syntastic_typescript_tsc_args = '--module commonjs --target ES5 --experimentalDecorators'
"let g:syntastic_typescript_tsc_fname = ''
"let g:syntastic_typescript_checkers = ['']
"let g:syntastic_php_checkers = ["php"] " php, phpcs, phpmd, phplint
""let g:syntastic_php_phpmd_args = 'text unusedcode'
"let g:syntastic_php_phpcs_args = '--standard=~/phpcsconfig.xml'
"let g:syntastic_mode_map = {
"    \ "mode": "active",
"    \ "active_filetypes": ["javascript", "python", "ruby", "php"],
"    \ "passive_filetypes": ["html", "blade"] }

" neomake
let g:neomake_open_list=1
let g:neomake_verbose=0

augroup my_neomake
  au!
  autocmd! BufWritePost * Neomake
augroup END

let g:neomake_ruby_enabled_makers = ['mri']
let g:neomake_javascript_enabled_makers = ['eslint', 'jshint']
let g:neomake_php_enabled_makers = ["php", "phpstan"] " php, phpstan, phpcs, phpmd, phplint
function! ProcessEntry(entry)
  let a:entry.type = 'E'
endfunction
let g:neomake_php_phpstan_maker = {
      \ 'args': ['analyse', '--no-ansi', '--no-progress', '--autoload-file=vendor/autoload.php'],
      \ 'errorformat':
      \   '%-G\ -%.%#,'.
      \   '%-G\ \[%.%#,'.
      \   '%EFile:%f:\ \ %l\ %m,'.
      \   '%E\ \ %l\ %m,'.
      \   '%-G%.%#',
      \ 'mapexpr': '"File:" . neomake_bufname . ":" . v:val',
      \ 'postprocess': function('ProcessEntry')
      \}

"fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" deoplete
let g:deoplete#enable_at_startup = 1
"let g:deoplete#omni_patterns = {}
"let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
"let g:deoplete#auto_completion_start_length = 2
let g:deoplete#sources = {}
let g:deoplete#sources['php'] = ['omni', 'tag', 'file', 'ultisnips', 'buffer', 'member']
let g:deoplete#sources['vim'] = ['omni', 'tag', 'file', 'ultisnips', 'buffer', 'member']
let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'ternjs']
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions['javascript'] = [
  \ 'tern#Complete'
\]
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
"let g:deoplete#keyword_patterns = {}
"let g:deoplete#keyword_patterns['php'] = 'function\w*'
"let g:deoplete#sources._ = []
"let g:deoplete#file#enable_buffer_path = 1

"call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

" delimitmate settings
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_jump_expansion=1
