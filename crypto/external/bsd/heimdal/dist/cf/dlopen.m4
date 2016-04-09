dnl
dnl Id
dnl

AC_DEFUN([rk_DLOPEN], [
	AC_FIND_FUNC_NO_LIBS(dlopen, dl,[
#ifdef HAVE_DLFCN_H
#include <dlfcn.h>
#endif],[0,0])
	AM_CONDITIONAL(HAVE_DLOPEN, test "$ac_cv_funclib_dlopen" != no)
])
