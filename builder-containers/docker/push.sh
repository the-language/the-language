#!/bin/sh
set -e
docker build -t zaoqi/the-language-builder .
exec docker push zaoqi/the-language-builder
