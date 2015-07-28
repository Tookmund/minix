BUILDTIME:=$(shell date +%CC%yy%mm%dd)
BUILDMACHINE := $(shell echo `whoami`@`hostname`:`pwd`)
version.h: version.h.def
	echo "#ifndef _VERSION_H_" > version.h
	echo "#def _VERSION_H_" >> version.h
	echo "#define OS_BUILDTIME ${BUILDTIME}" >> version.h
	echo "#define OS_BUILDMACHINE ${BUILDMACHINE}" >> version.h
	cat version.h.def >> version.h

