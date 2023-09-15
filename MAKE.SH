#!/bin/sh
VERSION="8.2-BETA"
BUILDDATE=$(date +"%d%m%y")
CURRENTDIR=$PWD

build()
{
    if [[ -f ${CURRENTDIR}/$1 ]]; then
        echo "Updating $1"
        echo "Please wait..."
        zip -r -u ${CURRENTDIR}/$1 *
    else
        echo "Making $1"
        echo "Please wait..."
        zip -r ${CURRENTDIR}/$1 *
    fi
    cd ..
    echo "Finished making $FILENAME !"
}

cd SRC/
FILENAME="MM_MurderMystery_${VERSION}_dev${BUILDDATE}.pk3"
build $FILENAME