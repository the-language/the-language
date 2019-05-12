#!/bin/sh
yarn
npx lua2php lang.lua | sed 's|^return .*$||' > lang.php
