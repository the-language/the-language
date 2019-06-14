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

支援 `alpinelinux/apk` `debian,ubuntu/apt` `archlinux/pacman` `windows/scoop`

* GNU coreutils, BASH, GNU tar, dos2unix, ... `sudo apk add bash` `sudo pacman -S dos2unix gawk` `sudo apt install dos2unix` `scoop install busybox`
* NodeJS NPM | `sudo apt install nodejs npm` `scoop install nodejs` `sudo pacman -S nodejs npm` `sudo apk add nodejs npm` https://nodejs.org/ or https://github.com/oracle/graal
* npx | `npm i -g npx`
* yarn | `npm i -g yarn` `sudo pacman -S yarn` `scoop install yarn`
* racket | `sudo apt install racket` `sudo pacman -S racket` `scoop install racket` `sudo apk add racket` https://github.com/tonyg/racket-alpine https://www.racket-lang.org/
* python2,3 pip2,3 2to3 | `sudo apt install python python3 python-pip python3-pip` `sudo pacman -S python2 python python2-pip python-pip` `sudo apk add python2 python3 py2-pip`
* [已不再依賴] js2py | `pip3 install js2py --user&&pip2 install js2py --user`
* racket-rash | `raco pkg install --auto rash` https://github.com/willghatch/racket-rash/tree/77363527621054ca4e64eda4f542a5c45f7b4861
* racket-make | `raco pkg install --auto make` https://github.com/racket/make/tree/813941bbe3ba757291993d0f068888967af4ba9c
* git | `sudo apt install git` `sudo pacman -S git` `sudo apk add git` `scoop install git-with-openssh`
* jdk9+ 或 graal | `sudo pacman -S jdk11-openjdk` `sudo apk add openjdk10` `scoop install openjdk11` 或 https://github.com/oracle/graal [需要加入$PATH]
* clang, clang-format | `sudo apt install clang clang-format` `sudo pacman -S clang` `sudo apk add clang libc-dev`
* GNU make | `sudo apt install make` `sudo pacman -S make` `sudo apk add make` `scoop install llvm`
* curl | `sudo pacman -S curl` `sudo apt install curl` `sudo apk add curl` `scoop install curl`
* [已不再依賴] golang 1.10+ | `sudo apt install golang-1.10` `sudo pacman -S go` `sudo apk add go`

### 運行依賴

* php | `sudo apt install php` `sudo pacman -S php`
