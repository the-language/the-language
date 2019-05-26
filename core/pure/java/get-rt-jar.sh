#!/bin/sh
[ -f rt.jar ] || (javac JRTExtractor.java && java -ea JRTExtractor)
