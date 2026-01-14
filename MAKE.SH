#!/bin/sh
VERSION="1.3"
BUILDDATE=$(date +"%d%m%y")

has_cmd() {
    command -v "$1" >/dev/null 2>&1
}

# Detect installed archiver
ARCHIVER=""
if has_cmd 7z; then
    ARCHIVER="7z"
elif has_cmd zip; then
    ARCHIVER="zip"
else
    echo "Neither 'zip' nor '7z' is installed on this system."
    echo "Please install one of those and try again."
    exit 1
fi

# Determine build directory
if [ -d "/tmp" ]; then
    BUILDDIR="/tmp"
else
    BUILDDIR=".."
fi

# Build process
FILENAME="MM_LTMs_MurderMystery_v${VERSION}_dev${BUILDDATE}.pk3"
if [ -f ./MAKE.SH ] && [ -d ./SRC/ ]; then
    cd ./SRC
    echo "Making ${BUILDDIR}/${FILENAME}"

    # Remove old copy of the file
    if [ -f ${BUILDDIR}/${FILENAME} ]; then
        rm ${BUILDDIR}/${FILENAME}
    fi

    # make new copy
    if [ "$ARCHIVER" = "zip" ]; then
        zip -r "${BUILDDIR}/${FILENAME}" *
    elif [ "$ARCHIVER" = "7z" ]; then
        7z a "${BUILDDIR}/${FILENAME}" *
    fi

    echo "Finished making ${BUILDDIR}/${FILENAME} !"
else
    echo "Looks like you are not in the repository's folder. Failed to make"
fi
