#!/bin/sh

up(){
  yarn
  yarn add $(node -e 'dep=JSON.parse(fs.readFileSync("package.json","utf8")).dependencies;if(dep){console.log(Object.keys(dep).reduce((x,y)=>`${x} ${y}`))}')
  yarn add --dev $(node -e 'dep=JSON.parse(fs.readFileSync("package.json","utf8")).devDependencies;if(dep){console.log(Object.keys(dep).reduce((x,y)=>`${x} ${y}`))}')
  touch node_modules/
}
for d in */; do
  cd "$d"
  if [ -f package.json ]; then
    up &
  fi
  cd ..
done

wait
