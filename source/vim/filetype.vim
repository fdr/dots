if exists("did_load_filetypes")
  finish
endif
augroup markdown
  au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END

augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
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

augroup filetypedetect
  " those little /tmp files generated when I'm using vim
  " as a line editor should definitely be colored in.
  au! BufRead,BufNewFile */bash-fc-* setfiletype sh
  " it's important that .hrl files should be colored as .erl files
  au! BufRead,BufNewFile *.hrl setfiletype erlang
  " i made up yet another BNF 
  au! BufRead,BufNewFile *.yabnf setfiletype yabnf
  au! BufRead,BufNewFile *.bnf setfiletype yabnf
  " xen's .xm files are Python
  au! BufRead,BufNewFile *.xm setfiletype python
  " Files that are also Ruby. 
  au! BufRead,BufNewFile *.ru setfiletype ruby
  au! BufRead,BufNewFile *.rake setfiletype ruby
  au! BufRead,BufNewFile *.god setfiletype ruby
  " Files from Google mail text areas are mail.
  au! BufRead,BufNewFile mail.google.com_*body_* setfiletype mail
  au! BufRead,BufNewFile *.mail setfiletype mail
  au! BufRead,BufNewFile *.email setfiletype mail
  " NGinX configuration files.
  au! BufRead,BufNewFile nginx.conf setfiletype nginx
  au! BufRead,BufNewFile /etc/nginx/*.conf setfiletype nginx
  au! BufRead,BufNewFile /etc/nginx/*/*.conf setfiletype nginx
  " Relocated crontabs.
  au! BufRead,BufNewFile *.crontab setfiletype crontab 
augroup END




