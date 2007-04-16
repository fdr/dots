" markdown filetype file
if exists("did_load_filetypes")
  finish
endif
augroup markdown
  au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END

" rake files should be recognized, too
augroup ruby
  au! BufRead,BufNewFile *.rake  setfiletype ruby
augroup END

augroup filetypedetect
  " those little /tmp files generated when I'm using vim
  " as a line editor should definitely be colored in.
  au! BufRead,BufNewFile */bash-fc-* setfiletype sh
  " it's important that .hrl files should be colored as .erl files
  au! BufRead,BufNewFile *.hrl setfiletype erlang
augroup END

