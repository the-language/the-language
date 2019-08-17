#!/bin/sh
set -e
> lang.c
cd src
for f in *.c;do
  echo "#include \"src/$f\"" >> ../lang.c
done
cd ..
echo "#include \"src/lang.h\"" > lang.h
