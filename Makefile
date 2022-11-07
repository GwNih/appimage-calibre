.PHONY: all

all:
	rm -rf build/
	mkdir -p build/calibre.AppDir/
	cp calibre.desktop build/calibre.AppDir/
	curl --location -o build/calibre.AppDir/AppRun https://github.com/AppImage/AppImageKit/releases/download/13/AppRun-x86_64
	chmod +x build/calibre.AppDir/AppRun
	mkdir -p build/calibre.AppDir/usr/bin/
	cd build/calibre.AppDir/usr/bin/ \
	&& curl -o - https://download.calibre-ebook.com/6.8.0/calibre-6.8.0-x86_64.txz | tar -xJf -
	cp build/calibre.AppDir/usr/bin/resources/content-server/calibre.png build/calibre.AppDir
	curl --location -o appimagetool-x86_64.AppImage https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage
	./appimagetool-x86_64.AppImage build/calibre.AppDir/
	rm -Rf build/ appimagetool-x86_64.AppImage
