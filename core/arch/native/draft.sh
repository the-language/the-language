#!/bin/sh
for arch in x86_64-linux-gnu ;do
    ${arch}-gcj -O3 --main=testmain $(find ../java/src/ -name '*.java') -o a.out.${arch}
    ${arch}-gcj -O3 -S $(find ../java/src/ -name '*.java') -o a.${arch}.s
    ${arch}-gcj -O3 -c $(find ../java/src/ -name '*.java') -o a.${arch}.o
     ~/src/retdec/build/bin/retdec-decompiler.py a.${arch}.o
done
