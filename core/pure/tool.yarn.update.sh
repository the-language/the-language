#!/bin/sh
up(){
  yarn
  yarn upgrade
}
if [ -f package.json ]; then
  up &
fi
for d in */; do
  cd "$d" ||exit
  if [ -f package.json ]; then
    up &
  fi
  cd .. ||exit
done

wait
