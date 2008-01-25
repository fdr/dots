" Vim syntax file
" Language:         Yet Another BNF
" Maintainer:       Jason Dusek 
" Last Change:      January 25, 2007

" Quit when a syntax file was already loaded  {{{
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
"}}}

syn match bnfNonTerminal "<\a\( \|\w\)*\w>" contained
syn region bnfProduction start="^\a" end="::="me=e-3 contained
syn match bnfOr "|" contained
syn match bnfQuantifier "+\|?\|*\|\.\." contained
syn match bnfSeperator "::=" contained
syn match bnfComment "#.*$" contained
syn match bnfQuoted #".*"# contains=bnfNonTerminal,bnfProduction,bnfOr,bnfQuantifier,bnfSeperator,bnfLiteral,bnfGrouping,bnfGroupDelim,bnfTerminalRangeDelim,bnfTerminalRange
syn match bnfQuoted #'.*'# contains=bnfNonTerminal,bnfProduction,bnfOr,bnfQuantifier,bnfSeperator,bnfLiteral,bnfGrouping,bnfGroupDelim,bnfTerminalRangeDelim,bnfTerminalRange
"syn match bnfLiteral #"[ \w]*"# contained
syn match bnfTerminal "^.*$" contains=bnfNonTerminal,bnfProduction,bnfOr,bnfQuantifier,bnfSeperator,bnfComment,bnfLiteral,bnfGrouping,bnfGroupDelim,bnfTerminalRangeDelim,bnfTerminalRange,bnfQuoted
syn region bnfGrouping matchgroup=bnfGroupDelim start='(' end=')' contains=bnfNonTerminal,bnfProduction,bnfOr,bnfQuantifier,bnfSeperator,bnfComment,bnfLiteral,bnfGrouping,bnfGroupDelim,bnfTerminalRangeDelim,bnfTerminalRange,bnfQuoted
syn region bnfTerminalRange matchgroup=bnfTerminalRangeDelim start=#\[# end=#\]# contains=bnfNonTerminal

hi def link bnfNonTerminal  Type
hi def link bnfProduction   Constant
hi bnfQuantifier ctermfg=1 gui=bold guifg=red
hi def link bnfOr  PreProc
hi def link bnfSeperator  PreProc
hi bnfTerminal  guifg=cyan ctermfg=cyan
hi def link bnfComment    Comment
hi bnfTerminalRangeDelim guifg=yellow gui=bold
hi bnfGroupDelim guifg=yellow gui=bold
hi def link bnfTerminalRange bnfTerminal
hi def link bnfQuoted bnfTerminal
"hi def link bnfLiteral     String
