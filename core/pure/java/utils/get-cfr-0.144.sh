#!/bin/sh
if [ ! -f cfr-0.144.jar ] ;then
  t="$(mktemp)"
  rm "$t" ||exit
  curl https://www.benf.org/other/cfr/cfr-0.144.jar -o "$t"
  mv "$t" cfr-0.144.jar
fi

