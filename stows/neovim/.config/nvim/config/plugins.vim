" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Colors / Interface
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'AlessandroYorba/Alduin'
Plug 'nanotech/jellybeans.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'shinchu/lightline-gruvbox.vim'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ap/vim-buftabline'

" Essentials
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
" Plug 'autozimu/LanguageClient-neovim', {
"       \    'branch': 'next',
"       \    'do': 'bash install.sh'
"       \  }
Plug 'benmills/vimux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
" Plugin outside ~/.local/share/nvim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'Konfekt/FastFold'
" Plug 'Lokaltog/vim-easymotion'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
" Plug 'vim-syntastic/syntastic'
" Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'tobyS/vmustache'
Plug 'tommcdo/vim-fubitive'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-dirvish'
Plug 'airblade/vim-gitgutter'
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-scriptease'
" Plug 'roxma/nvim-completion-manager'
Plug 'godlygeek/tabular'
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

" Languages
Plug 'sheerun/vim-polyglot'

" Language-specific
" go
Plug 'fatih/vim-go'

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

" " powershell
" Plug 'PProvost/vim-ps1'
"
" javascript
" Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
" Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }

" python
" Plug 'zchee/deoplete-jedi'
" Plug 'python-mode/python-mode'

" css
" Plug 'ap/vim-css-color'

Plug 'amiorin/vim-project'
" Plug 'airblade/vim-rooter'

" Initialize plugin system
call plug#end()

set hidden

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
    \ 'vbnet'        : '--languages=vb',
  \ }


" editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" ack
" let g:ackprg = 'rg --vimgrep --no-heading -uu -i --ignore-file tags --ignore-file tags.vendor'
let g:ackprg = 'rg --vimgrep --no-heading '
" let g:ackprg = "ag --vimgrep"

" neomake
" let g:neomake_open_list=2
let g:neomake_open_list=0
let g:neomake_verbose=0
" let g:neomake_error_sign = {'text': '✗', 'texthl': 'NeomakeErrorSign'}

" augroup my_neomake
"   au!
"   autocmd! BufWritePost * Neomake
" augroup END

let g:neomake_ruby_enabled_makers = ['mri']
let g:neomake_javascript_enabled_makers = []
let g:neomake_vue_enabled_makers = []
let g:neomake_php_enabled_makers = ["php", "phpstan"] " php, phpstan, phpcs, phpmd, phplint

"--------------------ale---------------------------------------------------------
" let g:ale_php_phpstan_level = 4
" let g:ale_php_phpstan_configuration = 'phpstan.neon'
let g:ale_linters = {
      \    'php': ['php', 'phpstan'],
      \  }
let g:ale_fixers = {
      \    'javascript': ['prettier'],
      \  }
let g:ale_lint_on_enter=0
" let g:ale_fix_on_save = 1

"--------------------FZF---------------------------------------------------------
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

"---------------------DEOPLETE---------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources['php'] = ['buffer', 'file', 'tag']

"------------------DELIMITMATE---------------------------------------------------
" delimitmate settings
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_jump_expansion=1

"------------------PDV - PHP Documenter------------------------------------------
let g:pdv_template_dir = $HOME ."/.local/share/nvim/plugged/pdv/templates_snip"

"------------------Ultisnips-----------------------------------------------------
let g:UltiSnipsSnippetsDir = $HOME . "/.config/nvim/ultisnips"

"------------------Tagbar--------------------------------------------------------
" let g:tagbar_width = 60
let g:tagbar_autopreview = 0
let g:tagbar_expand = 1
let g:tagbar_autoclose = 0

"------------------Sneak---------------------------------------------------------
" let g:sneak#label = 0
let g:sneak#use_ic_scs = 1 " ignore case

"------------------Editor Config-------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"------------------vim-vue-------------------------------------------------------
let g:vue_disable_pre_processors=1


"------------------vim-dirvish---------------------------------------------------
let g:dirvish_mode = ':sort ,^.*[\/],'

"------------------emmet---------------------------------------------------------
" let g:user_emmet_leader_key = '<C-p>'

"------------------echodoc-------------------------------------------------------
" set cmdheight=2
" set noshowmode
let g:echodoc_enable_at_startup = 1

"------------------NERDTree------------------------------------------------------
let g:NERDTreeQuitOnOpen=1

" vim-go
let g:go_term_mode = "vsplit"


"------------------neoformat-----------------------------------------------------
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

"------------------languageClient-neovim-----------------------------------------
" let g:LanguageClient_autoStart = 1 " Automatically start language servers.
" let g:LanguageClient_devel = 1 " Use rust debug build
" let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
"
" let g:LanguageClient_serverCommands = {
"     \ 'groovy': [$HOME.'/bin/groovy-language-server'],
"     \ }

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>


"------------------git gutter----------------------------------------------------
let g:gitgutter_enabled=0


"------------------vim-project---------------------------------------------------
