#!/bin/sh
# $1 = whitelist working directory
# $2 = where to copy $dir to, normally name of whitelist

# New source tree
: ${SRC=`pwd`/../newsrc}

cd $1
mkdir -p $SRC/$2
while read dir
do
cp -rf $dir $SRC/$2
done
cd $MINIX
