FROM archlinux/base
RUN echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN pacman -Sy --noconfirm yarn nodejs npm dos2unix racket jdk11-openjdk clang make curl git python2 gawk php base
RUN archlinux-java set java-11-openjdk
RUN raco pkg install --batch --installation --auto rash

RUN pacman -Sy --noconfirm sudo
