#!/bin/sh
# mirror支援http://mirrors.ustc.edu.cn http://mirrors.tuna.tsinghua.edu.cn
mirror="$1"

# ..._ret風格允許出錯時正常調用fail()
error(){
    echo "$@"
    exit 1
}
fail(){
    exit 1
}
getarch_ret=''
getarch_ret_archlinuxsource=''
getarch(){
    case "$(uname -m)" in
	x86_64)
	    getarch_ret=x86_64
	    getarch_ret_archlinuxsource='archlinux/$repo/os/$arch'
	    ;;
	aarch64)
	    getarch_ret=aarch64
	    getarch_ret_archlinuxsource='archlinuxarm/$arch/$repo'
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
    local h="$maybemirror_ret"/alpine/latest-stable/releases/"$getarch_ret"
    wwwget "$h" | grep "\"alpine-minirootfs-[^-]*-$getarch_ret.tar.gz\"" | sed "s|^.*\"\(alpine-minirootfs-[^-]*-$getarch_ret.tar.gz\)\".*$|\1|" | tail -1 > "$t" ||fail
    geturl_ret="$h/$(cat "$t")"
    rm "$t"
}
getrootfs_ret=''
getrootfs(){
    geturl
    getrootfs_ret="$(mktemp)"
    wwwget "$geturl_ret" > "$getrootfs_ret" ||fail
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
    for f in host.conf hosts nsswitch.conf resolv.conf; do
	cp "/etc/$f" sandbox/etc/
    done
    USER=root HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin ./sandbox.proot/src/proot -0 -r sandbox --kill-on-exit -b /dev/ -b /sys/ -b /proc/ -b /tmp/ -b . -b sandbox.profile:/root/.profile "$@"
}
getnodeurl_ret=''
getnodeurl(){
    local t="$(mktemp)"
    wwwget https://nodejs.org/en/download/current/|grep '"http[.:/a-zA-Z0-9]*node-v[0-9.]*.tar.gz"'|sed 's|^.*"\(http[.:/a-zA-Z0-9]*node-v[0-9.]*.tar.gz\)".*$|\1|g'|head -1 > "$t" ||fail
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
into_archlinux(){
    chrt apk upgrade
    chrt apk add pacman bash
    cat << 'EOT' > sandbox/etc/pacman.conf
#
# /etc/pacman.conf
#
# See the pacman.conf(5) manpage for option and repository directives

#
# GENERAL OPTIONS
#
[options]
# The following paths are commented out with their default values listed.
# If you wish to use different paths, uncomment and update the paths.
#RootDir     = /
#DBPath      = /var/lib/pacman/
#CacheDir    = /var/cache/pacman/pkg/
#LogFile     = /var/log/pacman.log
#GPGDir      = /etc/pacman.d/gnupg/
#HookDir     = /etc/pacman.d/hooks/
HoldPkg     = pacman glibc
#XferCommand = /usr/bin/curl -L -C - -f -o %o %u
#XferCommand = /usr/bin/wget --passive-ftp -c -O %o %u
#CleanMethod = KeepInstalled
#UseDelta    = 0.7
Architecture = auto

# Pacman won't upgrade packages listed in IgnorePkg and members of IgnoreGroup
#IgnorePkg   =
#IgnoreGroup =

#NoUpgrade   =
#NoExtract   =

# Misc options
#UseSyslog
#Color
#TotalDownload
CheckSpace
#VerbosePkgLists

# By default, pacman accepts packages signed by keys that its local keyring
# trusts (see pacman-key and its man page), as well as unsigned packages.
SigLevel    = Required DatabaseOptional
LocalFileSigLevel = Optional
#RemoteFileSigLevel = Required

# NOTE: You must run `pacman-key --init` before first using pacman; the local
# keyring can then be populated with the keys of all official Arch Linux
# packagers with `pacman-key --populate archlinux`.

#
# REPOSITORIES
#   - can be defined here or included from another file
#   - pacman will search repositories in the order defined here
#   - local/custom mirrors can be added here or in separate files
#   - repositories listed first will take precedence when packages
#     have identical names, regardless of version number
#   - URLs will have $repo replaced by the name of the current repo
#   - URLs will have $arch replaced by the name of the architecture
#
# Repository entries are of the format:
#       [repo-name]
#       Server = ServerName
#       Include = IncludePath
#
# The header [repo-name] is crucial - it must be present and
# uncommented to enable the repo.
#

# The testing repositories are disabled by default. To enable, uncomment the
# repo name header and Include lines. You can add preferred servers immediately
# after the header, and they will be used before the default mirrors.

#[testing]
#Include = /etc/pacman.d/mirrorlist

[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

#[community-testing]
#Include = /etc/pacman.d/mirrorlist

[community]
Include = /etc/pacman.d/mirrorlist

# If you want to run 32 bit applications on your x86_64 system,
# enable the multilib repositories as required here.

#[multilib-testing]
#Include = /etc/pacman.d/mirrorlist

#[multilib]
#Include = /etc/pacman.d/mirrorlist

# An example of a custom package repository.  See the pacman manpage for
# tips on creating your own repositories.
#[custom]
#SigLevel = Optional TrustAll
#Server = file:///home/custompkgs
EOT
    getarch
    mkdir -p sandbox/etc/pacman.d
    if [ -n "$mirror" ]; then
	echo "Server = $mirror/$getarch_ret_archlinuxsource" > sandbox/etc/pacman.d/mirrorlist
    else
	echo "##
## Arch Linux repository mirrorlist
## Generated on 2019-01-09
##

## Worldwide
Server = http://mirrors.evowise.com/$getarch_ret_archlinuxsource
Server = http://mirror.rackspace.com/$getarch_ret_archlinuxsource" > sandbox/etc/pacman.d/mirrorlist
    fi
    tar -xzvf sandbox.etc_pacman.d_gnupg.tar.gz -C sandbox
    chrt pacman -Sy
    
    cd sandbox
    mv sbin/* bin/* usr/bin ||fail
    mv lib/* usr/lib ||fail
    rmdir sbin bin lib ||fail
    ln -s usr/bin sbin ||fail
    ln -s usr/bin bin ||fail
    ln -s usr/lib lib ||fail
    cd usr
    mv sbin/* bin ||fail
    rmdir sbin ||fail
    ln -s bin sbin ||fail
    cd ..
    cd var
    mkdir -p ../run/lock
    mv lock/* ../run/lock ||fail
    rmdir lock ||fail
    ln -s ../run/lock lock ||fail
    cd ..
    cd ..
    
    chrt sh -c 'until pacman -S --noconfirm --force pacman bash coreutils busybox musl base;do true;done'
}
main(){
    [ -d sandbox ] || init
    install_mirror
    # https://github.com/termux/proot/commit/0717de26d1394fec3acf90efdc1d172e01bc932b可用。
    [ -d sandbox.proot ] || git clone --depth 1 https://github.com/termux/proot.git sandbox.proot ||fail
    sh -c 'cd sandbox.proot&&git pull'
    make -C sandbox.proot/src ||fail
    [ ! -L sandbox/bin ] && into_archlinux
    #chrt apk add bash openjdk10 make python2 python3 py2-pip clang wget git tar xz
    #chrt sh -c 'wget -O /usr/local/bin/pacapt https://github.com/icy/pacapt/raw/ng/pacapt;chmod 755 /usr/local/bin/pacapt;ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman'
    #install_node
    #install_racket
    exit
}

main
