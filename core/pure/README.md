## 編譯

```bash
racket gen.Makefile.rkt
make -j8
```
## 測試
```bash
racket test.rkt
./do_testmain.sh
```

### 編譯依賴

* GNU coreutils, BASH, GNU tar, ... `sudo apk add bash`
* NodeJS NPM | `sudo apt install nodejs npm` `sudo pacman -S nodejs npm` `sudo apk add nodejs npm` https://nodejs.org/
* yarn | `npm i -g yarn` `sudo pacman -S yarn`
* racket | `sudo apt install racket` `sudo pacman -S racket` https://github.com/tonyg/racket-alpine https://www.racket-lang.org/
* python2,3 pip2,3 2to3 | `sudo apt install python python3 python-pip python3-pip` `sudo pacman -S python2 python python2-pip python-pip` `sudo apk add python2 python3 py2-pip`
* git | `sudo apt install git` `sudo pacman -S git` `sudo apk add git`
* jre, jdk8 | `sudo pacman -S jdk8-openjdk` `sudo apk add openjdk8` [Alpine : Add /usr/lib/jvm/java-1.8-openjdk/bin/ to $PATH]
* clang, clang-format | `sudo apt install clang clang-format` `sudo pacman -S clang` `sudo apk add clang libc-dev`
* GNU make | `sudo apt install make` `sudo pacman -S make` `sudo apk add make`
* wget | `sudo apt install wget` `sudo pacman -S wget` `sudo apk add wget`
* golang 1.10+ | `sudo apt install golang-1.10` `sudo pacman -S go` `sudo apk add go`

```bash
raco pkg install --auto rash
raco pkg install --auto make
pip3 install js2py --user
pip2 install js2py --user
```

## 運行依賴

* php+mbstring | `sudo apt install php php7.0-mbstring` `sudo pacman -S php`
