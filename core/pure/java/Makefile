Krakatau_VERSION=e533a7870d876a0632ae54d5efefea3c84426dcc
proguard_VER=6.1
proguard_VERSION=6.1.1

dep-luaj: luaj.tgz # 版本： d4603365b6cb6e9e1bc718d33550f5a352c9b372
	rm -fr dep-luaj/
	mkdir dep-luaj
	tar -xzvf luaj.tgz -C dep-luaj

dep-Krakatau: Makefile
	rm -fr dep-Krakatau/ Krakatau-$(Krakatau_VERSION)/
	curl https://codeload.github.com/Storyyeller/Krakatau/tar.gz/$(Krakatau_VERSION) | tar -xzv
	mv Krakatau-$(Krakatau_VERSION) dep-Krakatau

dep-proguard: Makefile
	rm -fr dep-proguard/ proguard$(proguard_VERSION)/
	curl -L http://prdownloads.sourceforge.net/proguard/$(proguard_VER)/proguard$(proguard_VERSION).tar.gz | tar -xzv
	mv proguard$(proguard_VERSION) dep-proguard

JRTExtractor.class: JRTExtractor.java
	rm -f JRTExtractor.class
	javac JRTExtractor.java

dep-rt.jar: JRTExtractor.class
	rm -f dep-rt.jar rt.jar
	java -ea JRTExtractor
	mv rt.jar dep-rt.jar
