"TODO: don't align lists...i think it might be slowing down list generation
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --PHP-kinds=tzxyprms --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  "return map(lines, 'join(v:val, "\t")')
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
  execute "normal! zz"
endfunction

function! s:line_to_parts(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2], '\v\p+')
  return { 'excmd': excmd }
endfunction

function! s:handle_selection(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

  if cmd ==# 'split'
    execute 'split'
  elseif cmd ==# 'vertical split'
    execute 'vertical split'
  elseif cmd ==# 'tabe'
    execute 'tabe'
  endif

  let parts = s:line_to_parts(a:lines[1])

  let [magic, &magic] = [&magic, 0]
  execute parts['excmd']
  let &magic = magic

  execute "normal! zz"

endfunction

    "\ 'options': '-n 1 -d "\t" --with-nth 1,4.. --expect=ctrl-t,ctrl-v,ctrl-x',
function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '-n 1 -d "\t" --with-nth 1,3,4 --tiebreak=index --expect=ctrl-t,ctrl-v,ctrl-x',
    \ 'down':    '30%',
    \ 'sink*':    function('s:handle_selection')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! MyBufferTags call s:btags()
