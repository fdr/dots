
let s:line = getline(1)

if getline(1) =~ '^#!.*\<runhaskell\>'
  setfiletype haskell
endif

