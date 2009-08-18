if exists("did_load_filetypes")
  finish
endif
augroup markdown
  au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END

" Handle escript Erlang files.
au BufRead *
\ if getline(1) =~ "escript" |
\   set filetype=erlang |
\ endif

" /etc/init.d/ scripts rooted elsewhere
au BufNewFile,BufRead */etc/init.d/*
\ if getline(1) ==? "#!/sbin/runscript" |
\     set filetype=gentoo-init-d |
\ endif

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
  " i made up yet another BNF 
  au! BufRead,BufNewFile *.yabnf setfiletype yabnf
  au! BufRead,BufNewFile *.bnf setfiletype yabnf
  " xen's .xm files are python
  au! BufRead,BufNewFile *.xm setfiletype python
augroup END

