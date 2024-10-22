#!/bin/sh
VERSION="1.0-ALPHA"
BUILDDATE=$(date +"%d%m%y")

if [ -d "/media/ramdisk" ]; then
    BUILDDIR="/media/ramdisk"
else
    BUILDDIR=".."
fi

FILENAME="MM_LTMs_MurderMystery_v${VERSION}_dev${BUILDDATE}.pk3"
if [ -f ./MAKE.SH ] && [ -d ./SRC/ ]; then
    cd ./SRC
    echo "Making ${BUILDDIR}/${FILENAME}"

    if [ -f $BUILDDIR/$FILENAME ]; then
        rm $BUILDIR/$FILENAME
    fi
    zip -r $BUILDDIR/$FILENAME *
    echo "Finished making ${BUILDDIR}/${FILENAME} !"
else
    echo "Looks like you are not in the repository's folder. Failed to make"
fi
