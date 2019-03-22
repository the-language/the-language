## 編譯

```bash
cd arch
./make
```

### 依賴

* Maven `sudo apt install maven`
* GHC+Cabal `sudo apt install ghc cabal-install` 因為某個地區的網絡的某些狀況，不採用Stack
* NodeJS NPM https://nodejs.org/ `sudo apt install nodejs`
* yarn `npm i -g yarn`
* racket https://www.racket-lang.org/
* ant `sudo apt install ant`
* gradle `sudo apt install gradle`
* python `sudo apt install python`
* php `sudo apt install php php7.0-mbstring`
* git `sudo apt install git`
* jre `/usr/lib/jvm/default-java/jre/lib/rt.jar` jdk

```bash
raco pkg install --auto rash
raco pkg install --auto make
pip install js2py
cabal update
cabal install hslua
```
