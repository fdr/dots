set background=dark
set paste
set autoindent
set ruler
set showcmd
set incsearch
set foldmethod=indent
set autowriteall
set autoread
set foldminlines=4

set shiftwidth=2
set tabstop=2
set noexpandtab


filetype plugin indent on

autocmd FileType text setlocal textwidth=64 wrap

if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
	\	if &omnifunc == "" |
	\		setlocal omnifunc=syntaxcomplete#Complete |
	\	endif
endif

