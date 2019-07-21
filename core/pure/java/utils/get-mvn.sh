#!/bin/sh
get(){
  wget -O - $(wget -O - http://maven.apache.org/download.cgi | grep 'bin.tar.gz"' | sed 's|^.*"\(http.*\)".*$|\1|') | tar -xzv
  mv apache-maven-*/ maven
}
[ -d maven ] || get
