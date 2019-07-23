#!/bin/sh
up(){
  yarn
  yarn upgrade $(node -e 'pkg=JSON.parse(fs.readFileSync("package.json","utf8"));console.log(Object.keys(pkg.devDependencies||{}).concat(Object.keys(pkg.dependencies||{})).reduce((x,y)=>`${x} ${y}`))')
  touch node_modules/
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
