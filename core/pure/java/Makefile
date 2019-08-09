Krakatau_VERSION=900d030e2c7232d135eb05a4e3ecd1f8d0b51ac8
proguard_VER=6.1
proguard_VERSION=6.1.1

clean:
	rm -fr dep-*

dep-jd-cli.jar: # FIXME:Makefile更新时未处理。
	rm -fr dep-jd-cli.jar jd-cli.jar
	curl -L https://github.com/kwart/jd-cmd/releases/download/jd-cmd-0.9.2.Final/jd-cli-0.9.2-dist.tar.gz | tar -xzv jd-cli.jar
	mv jd-cli.jar dep-jd-cli.jar

# luaj編譯腳本在./utils/luaj-builder/build.sh
# 版本 https://github.com/luaj/luaj/commit/6d2deb4cb6e951b5818c2966850777e9049c8330
dep-luaj: luaj.tgz
	rm -fr dep-luaj/
	mkdir dep-luaj
	tar -xzvf luaj.tgz -C dep-luaj
	touch dep-luaj/

dep-Krakatau: # FIXME:Makefile更新时未处理。
	rm -fr dep-Krakatau/ Krakatau-$(Krakatau_VERSION)/
	curl https://codeload.github.com/Storyyeller/Krakatau/tar.gz/$(Krakatau_VERSION) | tar -xzv
	mv Krakatau-$(Krakatau_VERSION) dep-Krakatau

dep-proguard: # FIXME:Makefile更新时未处理。
	rm -fr dep-proguard/ proguard$(proguard_VERSION)/
	curl -L http://prdownloads.sourceforge.net/proguard/$(proguard_VER)/proguard$(proguard_VERSION).tar.gz | tar -xzv
	mv proguard$(proguard_VERSION) dep-proguard

JRTExtractor.class: JRTExtractor.java
	rm -f JRTExtractor.class
	javac JRTExtractor.java

dep-rt.jar: JRTExtractor.class
	./gen.dep-rt.jar.sh

dep-maven: # FIXME:Makefile或maven更新时未处理。
	rm -fr dep-maven apache-maven-*
	curl $(shell sh -c "curl http://maven.apache.org/download.cgi | grep 'bin.tar.gz\"' | sed 's|^.*\"\(http.*\)\".*|\1|'") | tar -xzv
	mv apache-maven-*/ dep-maven
