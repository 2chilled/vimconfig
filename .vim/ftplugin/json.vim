function! DoPrettyJson()
  silent %!aeson-pretty -i 2
endfunction

command! PrettyJson call DoPrettyJson()
