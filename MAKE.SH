#!/bin/sh
VERSION="10.1-BETA"
BUILDDATE=$(date +"%d%m%y")

build()
{
    echo "Making $1"
    echo "Please wait..."
    if [ -f ../$1 ]; then
        rm ../$1
    fi
    zip -r ../$1 *
    echo "Finished making $FILENAME !"
}

FILENAME="MM_MurderMystery_v${VERSION}_dev${BUILDDATE}.pk3"
if [ -f ./MAKE.SH ] && [ -d ./SRC/ ]; then
    cd ./SRC
    build $FILENAME
else
    echo "Looks like you are not in the repository's folder. Failed to make"
fi
