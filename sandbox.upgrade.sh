#!/bin/sh
# mirror支援http://mirrors.ustc.edu.cn http://mirrors.tuna.tsinghua.edu.cn
mirror="$1"
error(){
    echo "$@"
    exit 1
}
fail(){
    exit 1
}
getarch_ret=''
getarch(){
    case "$(uname -m)" in
	x86_64)
	    getarch_ret=x86_64
	    ;;
	aarch64)
	    getarch_ret=aarch64
	    ;;
	*)
	    error "不支援$(uname -m)。"
	    ;;
    esac
}
wwwget(){
    if type wget 2>/dev/null >/dev/null; then
	wget -O - "$@"
    elif type curl 2>/dev/null >/dev/null; then
	curl "$@"
    else
	error "無wget/curl"
    fi
}
maybemirror_ret=''
maybemirror(){
    if [ -n "$mirror" ]; then
	maybemirror_ret="$mirror"
    else
	maybemirror_ret="$1"
    fi
}
geturl_ret=''
geturl(){
    getarch
    maybemirror "http://dl-cdn.alpinelinux.org"
    local t="$(mktemp)"
    local h="$maybemirror_ret"/alpine/edge/releases/"$getarch_ret"
    wwwget "$h" | grep "\"alpine-minirootfs-[0-9]*-$getarch_ret.tar.gz\"" | sed "s|^.*\"\(alpine-minirootfs-[^-]*-$getarch_ret.tar.gz\)\".*$|\1|" | tail -1 > "$t"
    geturl_ret="$h/$(cat "$t")"
    rm "$t"
}
getrootfs_ret=''
getrootfs(){
    geturl
    getrootfs_ret="$(mktemp)"
    wwwget "$geturl_ret" > "$getrootfs_ret"
}

init(){
    getrootfs
    mkdir sandbox ||fail
    tar -xzvf "$getrootfs_ret" -C sandbox
    rm -f "$getrootfs_ret"
    sed -i 's|/v[0-9\.]*/|/edge/|g' sandbox/etc/apk/repositories
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> sandbox/etc/apk/repositories
}
install_mirror(){
    if [ -n "$mirror" ]; then
	sed -i "s|http://dl-cdn.alpinelinux.org|$mirror|g" sandbox/etc/apk/repositories
    fi
}
chrt(){
    ./sandbox.sh "$@"
}
getnodeurl_ret=''
getnodeurl(){
    local t="$(mktemp)"
    wwwget https://nodejs.org/en/download/current/|grep '"http[.:/a-zA-Z0-9]*node-v[0-9.]*.tar.gz"'|sed 's|^.*"\(http[.:/a-zA-Z0-9]*node-v[0-9.]*.tar.gz\)".*$|\1|g'|head -1 > "$t"
    getnodeurl_ret="$(cat "$t")"
    rm "$t"
}
install_node(){
    chrt sh -c '[ -d /root/.nvm ] || git clone --depth 1 https://github.com/nvm-sh/nvm.git /root/.nvm'
    chrt sh -c '/root/.nvm/install.sh;. /root/.profile;nvm install node'
}
install_racket(){
    chrt apk add racket-dev
    # 不正常安裝racket-doc。以避免安裝它依賴的大量package。
    for doc in racket-doc string-constants-doc syntax-color-doc r6rs-doc r5rs-doc srfi-doc net-doc mzscheme-doc draw-doc slideshow-doc pict-doc typed-racket-doc scribble-doc; do
	chrt raco pkg install --deps force "$doc"
    done
    chrt raco pkg install --auto make
    chrt raco pkg install --auto rash
}
main(){
    [ -d sandbox ] || init
    install_mirror
    # https://github.com/proot-me/proot/commit/803e54d8a1b3d513108d3fc413ba6f7c80220b74可用。
    [ -d sandbox.proot ] || git clone --depth 1 https://github.com/proot-me/proot.git sandbox.proot ||fail
    sh -c 'cd sandbox.proot&&git pull'
    make -C sandbox.proot/src ||fail
    chrt apk upgrade
    chrt apk add bash openjdk10 make python2 python3 py2-pip clang wget git tar xz
    install_node
    install_racket
    exit
}

main
