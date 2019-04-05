## 編譯

```bash
cd arch
./make
```

### 編譯依賴

* maven `sudo apt install maven`
* NodeJS NPM `sudo apt install nodejs` https://nodejs.org/
* yarn `npm i -g yarn`
* racket `sudo apt install racket` https://www.racket-lang.org/
* python `sudo apt install python python3 python-pip python3-pip`
* git `sudo apt install git`
* jre jdk `/usr/lib/jvm/default-java/jre/lib/rt.jar`
* clang `sudo apt install clang`
* clang-format `sudo apt install clang-format`
* make `sudo apt install make`
* wget `sudo apt install wget`
* golang 1.10+

```bash
raco pkg install --auto rash
raco pkg install --auto make
pip install js2py
```

## 運行依賴

* php+mbstring `sudo apt install php php7.0-mbstring`
