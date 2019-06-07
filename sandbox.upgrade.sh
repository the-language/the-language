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
getver_ret=''
getver(){
    local ret="$(mktemp)"
    wwwget https://www.alpinelinux.org/downloads/ | grep 'alpine-minirootfs-' | sed 's|^.*alpine-minirootfs-\([^-]*\).*$|\1|' | head -1 > "$ret"
    getver_ret="$(cat "$ret")"
    rm "$ret"
}
maybemirror_ret=''
maybemirror(){
    if [ -n "$mirror" ]; then
	maybemirror_ret="$mirror"
    else
	maybemirror_ret="$1"
    fi
}
getrootfs_ret=''
getrootfs(){
    getarch
    getver
    getrootfs_ret="$(mktemp)"
    maybemirror "http://dl-cdn.alpinelinux.org"
    wwwget "$maybemirror_ret"/alpine/latest-stable/releases/"$getarch_ret"/alpine-minirootfs-"$getver_ret"-"$getarch_ret".tar.gz > "$getrootfs_ret"
}

init(){
    getrootfs
    mkdir sandbox ||fail
    tar -xzvf "$getrootfs_ret" -C sandbox ||fail
    rm -f "$getrootfs_ret"
    if [ -n "$mirror" ]; then
	sed -i "s|http://dl-cdn.alpinelinux.org|$mirror|g" sandbox/etc/apk/repositories
    fi
}
chrt(){
    ./sandbox.sh "$@"
}
main(){
    [ -d sandbox ] || init
    sed -i 's|/v[0-9\.]*/|/edge/|g' sandbox/etc/apk/repositories
    # https://github.com/proot-me/proot/commit/803e54d8a1b3d513108d3fc413ba6f7c80220b74可用。
    [ -d sandbox.proot ] || git clone --depth 1 https://github.com/proot-me/proot.git sandbox.proot ||fail
    [ -f ./sandbox.proot/src/proot ] || make -C sandbox.proot/src ||fail
    chrt apk upgrade
    chrt apk add nodejs npm bash openjdk10 make python2 python3 py2-pip
    exit
}

main
