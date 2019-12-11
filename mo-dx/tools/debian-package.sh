#!/bin/bash
which dpkg-deb
if [ $? != 0 ]; then
	echo "Error: dpkg-deb is missing!  You need to install dpkg."
	exit 1
fi

DIR="$(pwd)"
PWD="$(cd ${0%/*}/;pwd)"

PACKAGE=$1
VERSION=$2 
DESCRIPTION="AICRA \
 This script builds the demos for model optimizer in aicraOS.\
 If you want the gui frontend install mo-gui as well.\
 For more information, please visit https://www.librerespin.io" 
SECTION="Desktop" 
PRIORITY="optional" 
MAINTAINER="$3 <$4>" 
DEPENDS="git"
INSTALLEDSIZE_BYTES=`du --apparent-size -bs $PWD/../build/debian/ | cut -f1`
INSTALLEDSIZE=$(($INSTALLEDSIZE_BYTES/1024))
ARCHITECTURE=$5
HOMEPAGE="https://www.faqlinux.com/"

mkdir -p $PWD/../build/debian/DEBIAN/
echo "Package: $PACKAGE" > $PWD/../build/debian/DEBIAN/control
echo "Version: $VERSION" >> $PWD/../build/debian/DEBIAN/control
echo "Section: $SECTION" >> $PWD/../build/debian/DEBIAN/control
echo "Priority: $PRIORITY" >> $PWD/../build/debian/DEBIAN/control
echo "Architecture: $ARCHITECTURE" >> $PWD/../build/debian/DEBIAN/control
echo "Depends: $DEPENDS" >> $PWD/../build/debian/DEBIAN/control
echo "Suggests: $SUGGESTS" >> $PWD/../build/debian/DEBIAN/control
echo "Maintainer: $MAINTAINER" >> $PWD/../build/debian/DEBIAN/control
echo "Description: $DESCRIPTION" >> $PWD/../build/debian/DEBIAN/control
echo "Installed-size: $INSTALLEDSIZE" >> $PWD/../build/debian/DEBIAN/control
echo "Homepage: $HOMEPAGE" >> $PWD/../build/debian/DEBIAN/control


sudo chown -R root:root $PWD/../build/debian
sudo chmod -R 755 $PWD/../build/debian
[ -d $PWD/../dist ] || mkdir -p $PWD/../dist
sudo dpkg-deb --build $PWD/../build/debian $PWD/../dist/$PACKAGE\_$VERSION\_$ARCHITECTURE.deb
sudo chown -R $USER:$USER $PWD/../build/debian
cd $DIR

