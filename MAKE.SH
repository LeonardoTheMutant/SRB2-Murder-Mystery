#!/bin/sh
VERSION="8.1-BETA"
BUILDDATE=$(date +"%d%m%y")
CURRENTDIR=$PWD

build()
{
    if [[ -f ${CURRENTDIR}/$1 ]]; then
        echo "Updating $1\nPlease wait..."
        zip -r -u ${CURRENTDIR}/$1 *
    else
        echo "Making $1\nPlease wait..."
        zip -r ${CURRENTDIR}/$1 *
    fi
    cd ..
    echo "\nFinished making $FILENAME !"
}

cd SRC/
if [[ $1 = "-release" ]]; then
    FILENAME="MM_MurderMystery_${VERSION}.pk3"
    build $FILENAME
else
    FILENAME="MM_MurderMystery_${VERSION}_dev${BUILDDATE}.pk3"
    build $FILENAME
fi