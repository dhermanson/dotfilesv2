function! s:line_to_parts(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2], '^.*\ze;"\t')
  return { 'file': matchstr(parts[1], '\v\p+'),
        \  'excmd': matchstr(excmd, '\v\p+')}
endfunction

function! s:handle_selection(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

  let parts = s:line_to_parts(a:lines[1])
  execute cmd parts['file']
  let [magic, &magic] = [&magic, 0]
  execute parts['excmd']
  let &magic = magic

  execute "normal! zz"
endfunction

    "\ 'source': 'tail -n +7 ~/tags/tags.php tags',
function! s:taglist()
  call fzf#run({
    \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
    \            '| grep -v ^!',
    \ 'options': '-n 1 -d "\t" --with-nth 1,2,3,4 --expect=ctrl-t,ctrl-v,ctrl-x',
    \ 'sink*': function('s:handle_selection'),
    \ 'down':    '30%' })
endfunction

command! MyTagList call s:taglist()
