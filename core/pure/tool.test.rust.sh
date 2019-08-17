#!/bin/sh
# 因為有bug所以不加入test.sh
set -e
cd rust/the_lang
RUST_BACKTRACE=1 cargo test --release -- --nocapture
