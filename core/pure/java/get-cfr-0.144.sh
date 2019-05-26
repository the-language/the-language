#!/bin/sh
if [ ! -f cfr-0.144.jar ] ;then
  t="$(mktemp)"
  rm "$t" ||exit
  wget -O "$t" https://www.benf.org/other/cfr/cfr-0.144.jar
  mv "$t" cfr-0.144.jar
fi

