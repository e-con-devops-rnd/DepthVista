#!/bin/bash

# This is an example installation script! For most systems it should work,
# but this script is specifically for installing Moped into an Arch Linux
# system with makepkg. That is, you need to make a PKGBUILD file for this.

# the package directory prefix, for example: /tmp/moped/
PREFIX="$1"
STARTDIR=$PWD
LIBDIR="$PREFIX/usr/lib"
SHAREDIR="$PREFIX/usr/local/share"
INCLUDEDIR="$PREFIX/usr/local/include"


echo "Installing DepthVistaSDK with prefix $PREFIX..."

cd $SHAREDIR/
if [ ! -d "DepthVistaSDK" ]; then
	mkdir DepthVistaSDK
fi
cd DepthVistaSDK
if [ ! -d "cmake" ]; then
	mkdir cmake
fi
cd $STARTDIR
cp cmake/* $SHAREDIR/DepthVistaSDK/cmake
echo "Share done\n"

cd $INCLUDEDIR/
if [ ! -d "DepthVistaSDK" ]; then
	mkdir DepthVistaSDK
fi
cd $STARTDIR
cp -r include/* $INCLUDEDIR/DepthVistaSDK
echo "Include done\n"

cp so/* $LIBDIR/
rsync -l so/libDepthVistaSDK.so* $LIBDIR/
rsync -l so/libopencv_world.so* $LIBDIR/
echo "Lib done\n"



echo "Installing DepthVistaSDK success."

exit 0

