#!/bin/sh
if [ -f package.json ]; then
  npm update &
fi
for d in */; do
  cd "$d" ||exit
  if [ -f package.json ]; then
    npm update &
  fi
  cd .. ||exit
done

wait
