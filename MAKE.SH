#!/bin/sh
VERSION="10.0-BETA"
BUILDDATE=$(date +"%d%m%y")

build()
{
    echo "Making $1"
    echo "Please wait..."
    if [ -f $1 ]; then
        rm ./$1
    fi
    zip -r $1 ./SRC/
    echo "Finished making $FILENAME !"
}

FILENAME="MM_MurderMystery_${VERSION}_dev${BUILDDATE}.pk3"
if [ -f ${PWD}/MAKE.SH ]; then
    build $FILENAME
else
    echo "Looks like you are not in the repository's folder. Failed to make"
fi