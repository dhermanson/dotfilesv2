set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
" set background=light
"colorscheme base16-tomorrow
"colorscheme base16-twilight
"colorscheme base16-chalk
"colorscheme base16-ashes
"colorscheme base16-ocean

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let alduin_Shout_Dragon_Aspect = 1
" colorscheme alduin 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox config
let g:gruvbox_italic=0
let g:gruvbox_invert_signs=1
let g:gruvbox_contrast_dark='soft'
"let g:gruvbox_contrast_light='soft'
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1
colorscheme gruvbox
" check Normal highlight and set this to whatever bg is
highlight SignColumn ctermbg=236
highlight VertSplit ctermbg=236
" let g:airline_theme = 'gruvbox'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" base16 config
"colorscheme base16-gruvbox-dark-soft
"" highlight SignColumn ctermbg=236
"" highlight VertSplit ctermbg=236
"" base 16 color tweaks
"highlight VertSplit ctermbg=0
"highlight LineNr ctermbg=0
"highlight CursorLineNr ctermbg=0
"highlight GitGutterAdd ctermbg=0
"highlight GitGutterChange ctermbg=0
"highlight GitGutterDelete ctermbg=0
"highlight GitGutterChangeDelete ctermbg=0
"highlight GitGutterAddLine ctermbg=0
"highlight GitGutterChangeLine ctermbg=0
"highlight GitGutterDeleteLine ctermbg=0
"highlight GitGutterChangeDeleteLine ctermbg=0
"let g:airline_theme = 'base16'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jellybeans config
" colorscheme jellybeans
" let g:jellybeans_use_term_italics = 1
" let g:jellybeans_use_gui_italics = 1
" let g:airline_theme = 'jellybeans'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme jellybeans
"highlight SignColumn ctermbg=233
"highlight VertSplit ctermbg=233

highlight Comment cterm=italic

"colorscheme jellybeans<Paste>

" " airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" if !has('gui_running')		
"   let g:airline_left_sep=''		
"   let g:airline_right_sep=''		
" endif
" if !exists('g:airline_symbols')		
"   let g:airline_symbols = {}		
" endif		
" " let g:airline_symbols.space = "\ua0"
"
" " lightline
" let g:lightline = {
"       \ 'colorscheme': 'gruvbox',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'fugitive', 'filename' ] ]
"       \ },
"       \ 'component_function': {
"       \   'fugitive': 'LightlineFugitive',
"       \   'readonly': 'LightlineReadonly',
"       \   'modified': 'LightlineModified',
"       \   'filename': 'LightlineFilename'
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' }
"       \ }
" " change separator and subseparator
" let g:lightline.separator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '|', 'right': '|' }
"
" function! LightlineModified()
"   if &filetype == "help"
"     return ""
"   elseif &modified
"     return "+"
"   elseif &modifiable
"     return ""
"   else
"     return ""
"   endif
" endfunction
"
" function! LightlineReadonly()
" 	return &readonly ? '' : ''
" endfunction
" function! LightlineFugitive()
" 	if exists('*fugitive#head')
" 		let branch = fugitive#head()
" 		return branch !=# '' ? ''.branch : ''
" 	endif
" 	return ''
" endfunction
"
"
" function! LightlineFilename()
"   return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
"        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
"        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
" endfunction

" fzf
let g:fzf_colors = { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
