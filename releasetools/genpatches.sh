#!/bin/sh
# Generate patches based on latest source tree
# Assumes source tree is already setup and updated at $NETBSD
# MINIX NetBSD source import
: ${NETBSD=`pwd`/../netbsd}

# MINIX src
: ${SRC=`pwd`}

# Whitelists
: ${WHITELISTS=$SRC/releasetools/whitelist}

# Patches
: ${PATCHES=$SRC/releasetools/patches}

for list in `ls $WHITELISTS`
do
	for item in `cat $WHITELISTS/$list`
	do
		mkdir -p $PATCHES/$list
		echo $list/$item
		diff -ur $NETBSD/$list/$item $SRC/$list/$item > $PATCHES/$list/$item.patch
	done
done

