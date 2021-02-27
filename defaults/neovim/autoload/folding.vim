function! folding#MarkerFoldsText() " {{{1
  let l:line = getline(v:foldstart)
  let l:comment_char = substitute(&commentstring, '\s*%s', '', '')
  let l:fold_title =
    \ trim(substitute(l:line, l:comment_char . '\s*\(.*\){\{3}\d*', '\1', ''))
  return folding#FoldsTextFormat(l:fold_title)
endfunction " }}}1

function! folding#FoldsTextFormat(fold_title) " {{{1
  let l:fold_title = a:fold_title
  let l:last_foldtext_column = 78
  let l:dashes = repeat(v:folddashes, 2)
  let l:fold_size = v:foldend - v:foldstart + 1

  " Calculate how many filler characters should be displayed
  let l:fill_num =
    \ l:last_foldtext_column - strchars("+" . l:dashes . " " . l:fold_title
                                        \ . "  " . l:fold_size . " lines")

  " If the fold title isn't too long append a space. If it is, cut the fold
  " title short and add three dots at the end of it.
  if l:fill_num >= 0
    let l:fold_title .= " "
  else
    let l:fold_title =
      \ substitute(l:fold_title,
                   \ '\(.*\)\(.\{' . (abs(l:fill_num) + 2) . '\}\)',
                   \ '\1...',
                   \ '')
  endif

  return
    \ "+" . l:dashes . " " . l:fold_title
    \ . repeat("·", l:fill_num) . " " . l:fold_size . " lines"
endfunction " }}}1

" vim:fdm=marker
