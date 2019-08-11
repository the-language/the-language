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

* hanazono字體 | `pacman -S ttf-hanazono` https://ctext.org/font-test-page/zh
* Racket終端Unicode支援 | `raco pkg install --auto readline-gpl`

### 編譯依賴

支援 `alpinelinux/apk` `debian,ubuntu/apt` `archlinux/pacman` `windows/msys2/pacman`[注：需要加`mingw-w64-x86_64-`等前綴] `windows/scoop`[注：clang，racket-rash暫時無法正常工作。clang缺少`.h`。racket-rash對path處理不正確。]

* GNU coreutils, BASH, GNU tar, dos2unix, ... `apk add bash binutils` `pacman -S dos2unix gawk` `apt install dos2unix` `scoop install busybox`
* NodeJS NPM | `apt install nodejs npm` `scoop install nodejs` `pacman -S nodejs npm` `apk add nodejs npm` https://nodejs.org/ or https://github.com/oracle/graal
* npx | `npm i -g npx`
* yarn | `npm i -g yarn` `pacman -S yarn` `scoop install yarn`
* racket | `apt install racket` `pacman -S racket` `scoop install racket` `apk add racket` https://github.com/tonyg/racket-alpine https://www.racket-lang.org/
* python2,3 pip2,3 2to3 | `apt install python python3 python-pip python3-pip` `pacman -S python2 python python2-pip python-pip` `apk add python2 python3 py2-pip` `scoop install python27 python36`[需要先`scoop bucket add versions`]
* [已不再依賴] js2py | `pip3 install js2py --user&&pip2 install js2py --user`
* racket-rash | `raco pkg install --auto rash` https://github.com/willghatch/racket-rash/tree/3a7282a89dbf02528464ac9f17f4ff6b60700e10
* racket-make | `raco pkg install --auto make` https://github.com/racket/make/tree/813941bbe3ba757291993d0f068888967af4ba9c
* git | `apt install git` `pacman -S git` `apk add git` `scoop install git-with-openssh`
* jdk9+ 或 graal | `pacman -S jdk11-openjdk` `apk add openjdk11` `scoop install openjdk12`[需要先`scoop bucket add java`] 或 https://github.com/oracle/graal [需要加入$PATH]
* clang, clang-format | `apt install clang clang-format` `pacman -S clang` `apk add clang libc-dev` `scoop install llvm gcc`
* GNU make | `apt install make` `pacman -S make` `apk add make` `scoop install make`
* curl | `pacman -S curl` `apt install curl` `apk add curl` `scoop install curl`
* [已不再依賴] golang 1.10+ | `apt install golang-1.10` `pacman -S go` `apk add go`

### 運行依賴

* php | `apt install php` `pacman -S php` `scoop install php` `apk add php`
