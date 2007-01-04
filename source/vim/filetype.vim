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

