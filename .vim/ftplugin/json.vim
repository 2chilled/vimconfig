function! DoPrettyJson()
  silent %!python -c "import json; import sys; json.dump(json.load(sys.stdin), sys.stdout, sort_keys=True, indent=2, separators=(',', ': '))"
endfunction

command! PrettyJson call DoPrettyJson()
