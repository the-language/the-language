#!/bin/sh
get(){
  curl $(echo $(curl https://ant.apache.org/bindownload.cgi | grep 'bin.tar.gz"' | sed 's|^.*"\(http.*\)".*$|\1|') | awk '{print $1}') | tar -xzv
  mv apache-ant-*/ ant
}
[ -d ant ] || get
