#!/bin/sh
for arch in x86_64-linux-gnu ;do
    ${arch}-gcj -O3 --main=testmain $(find ../java/src/ -name '*.java') -o a.out.${arch}
done
