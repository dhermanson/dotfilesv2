let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
"colorscheme base16-tomorrow
"colorscheme base16-twilight
"colorscheme base16-chalk
"colorscheme base16-ashes
"colorscheme base16-ocean

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

"colorscheme jellybeans
"highlight SignColumn ctermbg=233
"highlight VertSplit ctermbg=233

highlight Comment cterm=italic

"colorscheme jellybeans<Paste>

" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction


function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
