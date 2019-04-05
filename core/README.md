## 編譯

```bash
cd arch
./make
```

### 依賴

* Maven `sudo apt install maven`
* GHC+Cabal `sudo apt install ghc cabal-install` 因為某個地區的網絡的某些狀況，不採用Stack
* NodeJS NPM `sudo apt install nodejs` https://nodejs.org/
* yarn `npm i -g yarn`
* racket `sudo apt install racket` https://www.racket-lang.org/
* python `sudo apt install python python3 python-pip python3-pip`
* php+mbstring `sudo apt install php php7.0-mbstring`
* git `sudo apt install git`
* jre jdk `/usr/lib/jvm/default-java/jre/lib/rt.jar`
* clang `sudo apt install clang`
* clang-format `sudo apt install clang-format`
* make `sudo apt install make`
* libc-dev `sudo apt install libc-dev`
* wget `sudo apt install wget`
* golang 1.10+

```bash
raco pkg install --auto rash
raco pkg install --auto make
pip install js2py
cabal update
cabal install hslua
```
