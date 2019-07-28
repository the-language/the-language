#!/bin/sh
# OSX的APFS掛載到Docker直接運行JRTExtractor時十分緩慢
set -e
pwd="$(pwd)"
tmp="$(mktemp -d)"
cp JRTExtractor.class "$tmp"/
cd "$tmp"
java -ea JRTExtractor
mv rt.jar "$pwd"/dep-rt.jar
cd "$pwd"
rm -fr "$tmp"
