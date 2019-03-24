#!/bin/sh
for arch in x86_64-linux-gnu ;do
    ${arch}-gcj -O3 -S $(find ../java/src/ -name '*.java') -o a.${arch}.s
done
