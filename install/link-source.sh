#!/bin/sh

tops='    source/bashrc       source/ghci         source/gvimrc
          source/haskeline    source/irbrc        source/irssi
          source/screenrc     source/vim          source/vimrc
'

for f in $tops 
do
  here="${PWD}/${f}"
  there="${HOME}/.`basename ${f}`"
  clean="rm -f ${there}"
  foo="ln -s ${here} ${there}"
  eval ${clean}
  eval ${foo}
done

sup="${HOME}/.sup"
if [ -d "$sup" ]
then
  rm "$sup/config.yaml"
  rm -rf "$sup/hooks"
  for f in source/sup/config.yaml source/sup/hooks
  do
    here="$PWD/$f"
    there="$sup/.`basename $f`"
    ln -s $here $there
  done
fi

