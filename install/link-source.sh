#!/bin/sh

for f in source/*
do
  here="${PWD}/${f}"
  there="${HOME}/.`basename ${f}`"
  clean="rm -f ${there}"
  foo="ln -s ${here} ${there}"
  eval ${clean}
  eval ${foo}
done

