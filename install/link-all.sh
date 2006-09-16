#!/bin/sh

for f in src/*
do
  here="${PWD}/${f}"
  there="${HOME}/.`basename ${f}`"
  rm -f ${there}
  ln -s ${here} ${there}
done
