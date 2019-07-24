#!/bin/sh

set -e

up(){
  rm -fr node_modules yarn.lock
  npm install
  npm update
  rm -fr node_modules package-lock.json
  yarn
}
if [ -f package.json ]; then
  up &
fi
for d in */; do
  cd "$d"
  if [ -f package.json ]; then
    up &
  fi
  cd ..
done

wait
