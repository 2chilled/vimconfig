function! DoPrettyXml()
  silent %!xmllint --format -
endfunction

command! PrettyXml call DoPrettyXml()

" size of a hard tabstop
set tabstop=2
" size of an "indent"
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
