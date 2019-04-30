#!/bin/sh
node -e "const TheLanguage=require('$(dirname $"0")/ecmascript/lang.js');const L=TheLanguage;for(const k in L){this[k]=L[k];}" -i
