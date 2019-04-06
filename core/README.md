## 編譯

```bash
cd arch
./make
```

### 編譯依賴

* GNU coreutils, BASH, GNU tar, ...
* NodeJS NPM | `sudo apt install nodejs npm` `sudo pacman -S nodejs npm` https://nodejs.org/
* yarn | `npm i -g yarn` `sudo pacman -S yarn`
* racket | `sudo apt install racket` https://www.racket-lang.org/
* python | `sudo apt install python python3 python-pip python3-pip` `sudo pacman -S python2 python2-pip python python-pip`
* git | `sudo apt install git` `sudo pacman -S git`
* jre, jdk8, `/usr/lib/jvm/default-java/jre/lib/rt.jar` | `sudo pacman -S jdk8-openjdk`
* clang, clang-format | `sudo apt install clang clang-format` `sudo pacman -S clang`
* GNU make | `sudo apt install make` `sudo pacman -S make`
* wget | `sudo apt install wget` `sudo pacman -S wget`
* golang 1.10+ | `sudo pacman -S go`

```bash
raco pkg install --auto rash
raco pkg install --auto make
pip install js2py
```

## 運行依賴

* php+mbstring | `sudo apt install php php7.0-mbstring` `sudo pacman -S php`
