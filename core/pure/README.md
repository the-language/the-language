## 編譯

```bash
racket gen.Makefile.rkt
make -j8
```
或`racket do-make.rkt`

## 測試
```bash
racket test.rkt
```

## 依賴

### 可選依賴

* hanazono字體 | `sudo pacman -S ttf-hanazono` https://ctext.org/font-test-page/zh
* Racket終端Unicode支援 | `raco pkg install --auto readline-gpl`

### 編譯依賴

* GNU coreutils, BASH, GNU tar, dos2unix, ... `sudo apk add bash` `sudo pacman -S dos2unix gawk` `sudo apt install dos2unix`
* NodeJS NPM | `sudo apt install nodejs npm` `sudo pacman -S nodejs npm` `sudo apk add nodejs npm` https://nodejs.org/ or https://github.com/oracle/graal
* npx | `npm i -g npx`
* yarn | `npm i -g yarn` `sudo pacman -S yarn`
* racket | `sudo apt install racket` `sudo pacman -S racket` https://github.com/tonyg/racket-alpine https://www.racket-lang.org/
* python2,3 pip2,3 2to3 | `sudo apt install python python3 python-pip python3-pip` `sudo pacman -S python2 python python2-pip python-pip` `sudo apk add python2 python3 py2-pip`
* [已不再依賴] js2py | `pip3 install js2py --user&&pip2 install js2py --user`
* racket-rash | `raco pkg install --auto rash` https://github.com/willghatch/racket-rash/tree/77363527621054ca4e64eda4f542a5c45f7b4861
* racket-make | `raco pkg install --auto make` https://github.com/racket/make/tree/813941bbe3ba757291993d0f068888967af4ba9c
* git | `sudo apt install git` `sudo pacman -S git` `sudo apk add git`
* jre, jdk, `/usr/lib/jvm/*/jre/lib/rt.jar` | `sudo pacman -S jdk11-openjdk jre8-openjdk` `sudo apk add openjdk8` [Alpine : Add /usr/lib/jvm/java-1.8-openjdk/bin/ to $PATH] or https://github.com/oracle/graal
* clang, clang-format | `sudo apt install clang clang-format` `sudo pacman -S clang` `sudo apk add clang libc-dev`
* GNU make | `sudo apt install make` `sudo pacman -S make` `sudo apk add make`
* wget | `sudo apt install wget` `sudo pacman -S wget` `sudo apk add wget`
* [已不再依賴] golang 1.10+ | `sudo apt install golang-1.10` `sudo pacman -S go` `sudo apk add go`
* luarocks | `sudo pacman -S luarocks`
* `~/.luarocks/bin/luasrcdiet` | `luarocks install luasrcdiet --local` https://github.com/jirutka/luasrcdiet

### 運行依賴

* php | `sudo apt install php` `sudo pacman -S php`
