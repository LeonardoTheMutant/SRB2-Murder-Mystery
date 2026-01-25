#!/bin/sh
VERSION="1.3"
BUILDDATE=$(date +"%d%m%y")
BASEDIR=$(dirname "$0")

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
    echo "Neither 'zip' nor '7z' is installed on this system. Please install one of those and try again."
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
if [ -f ${BASEDIR}/MAKE.SH ] && [ -d ${BASEDIR}/SRC/ ]; then
    cd ${BASEDIR}/SRC
    echo "Making ${BUILDDIR}/${FILENAME}"

    # Remove old copy of the file
    if [ -f ${BUILDDIR}/${FILENAME} ]; then
        rm ${BUILDDIR}/${FILENAME}
    fi

    # make new copy
    if [ "$ARCHIVER" = "zip" ]; then
        zip -r "${BUILDDIR}/${FILENAME}" *
    elif [ "$ARCHIVER" = "7z" ]; then
        7z a "${BUILDDIR}/${FILENAME}" * -tzip
    fi

    echo "Finished making ${BUILDDIR}/${FILENAME} !"
else
    echo "MAKE.SH is not in the repository's folder or SRC/ folder not found. Failed to make"
fi
