#!/bin/sh
# Generate patches based on latest source tree
# Assumes source tree is already setup at $NETBSD
# MINIX NetBSD source import
: ${NETBSD=`pwd`/../netbsd}

# MINIX src
: ${SRC=`pwd`}

# Checkout Date
: ${DATE=`date -u "+ %F 12:00:00 UTC"`}

# Whitelists
: ${WHITELISTS=$SRC/releasetools/whitelist}

# Patches
: ${PATCHES=$SRC/releasetools/patches}
cd $NETBSD
./netbsd-cvs.sh update -A -Pd -D $DATE

for list in `ls $WHITELISTS`
do
	for item in `cat $SRC/$list`
	do
		mkdir -p $PATCHES/$list
		diff -u $NETBSD/$list/$item $SRC/$list/$item > $PATCHES/$list/$item.patch
	done
done

