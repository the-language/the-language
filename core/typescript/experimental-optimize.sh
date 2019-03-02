#!/bin/sh
cat > lang.experimental.optimized.temp.js << EOF
var __The__Language__={};
(function(){
var exports=__The__Language__;
$(cat lang.js)
})();
EOF
npx prepack --out lang.experimental.optimized.js lang.experimental.optimized.temp.js
mv lang.experimental.optimized.js lang.experimental.optimized.temp.js

removeds='var __The__Language__; *(function () { *var $$0 = { *enumerable: false, *configurable: true, *writable: false *}; *var _$0 = this; *var _$1 = _$0.Object; *var _$2 = _$1.defineProperty;
_$0.__The__Language__ = _0; *}).call(this);
$$0.value =[^;]*;'

sed -i ":label;N;s/\n/ /;b label" lang.experimental.optimized.temp.js
echo "$removeds" | (while read line
do
     sed -i "s|$line||g" lang.experimental.optimized.temp.js
done)

cat > lang.experimental.optimized.js << EOF
(function(){
$(cat lang.experimental.optimized.temp.js)
module.exports=_0;
})();
EOF
mv lang.experimental.optimized.js lang.experimental.optimized.temp.js

npx google-closure-compiler -W QUIET --language_out ECMASCRIPT3 --js lang.experimental.optimized.temp.js > lang.experimental.optimized.js

rm lang.experimental.optimized.temp.js
