function! DoPrettyXml()
  silent %!xmllint --format -
endfunction

command! PrettyXml call DoPrettyXml()
