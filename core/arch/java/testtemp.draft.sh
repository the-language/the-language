#!/bin/sh
export CLASSPATH=./luaj/luaj-jse-3.0.2.jar:./luaj-out:.
javac testtemp.java && java testtemp
