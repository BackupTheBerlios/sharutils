# sharutils.m4 serial 2 (sharutils-4.3.75)
dnl Copyright (C) 2002 Free Software Foundation, Inc.
dnl This file is free software, distributed under the terms of the GNU
dnl General Public License.

dnl Authors:
dnl   Karl Eichwalder <ke@suse.de>, 2002.

AC_DEFUN([ke_CHECK_COMPRESS],
[
  AC_PATH_PROGS(COMPRESS, compress, no)
  if test $COMPRESS = no; then
    ADD_SCRIPT="$ADD_SCRIPT compress-dummy"
  else
    cp $srcdir/COPYING tCOPYING
    AC_MSG_CHECKING(whether compress works)
    if compress tCOPYING >/dev/null 2>&1; then
      AC_DEFINE([HAVE_COMPRESS], 1,
                [Define if compress is available.])
      AC_MSG_RESULT(yes)
    else
      ADD_SCRIPT="$ADD_SCRIPT compress-dummy"
      COMPRESS=no
      AC_MSG_RESULT([no, installing compress-dummy])
    fi
    rm -f tCOPYING tCOPYING.Z
  fi
])

AC_DEFUN([ke_CHECK_COMPRESS_AND_LINK],
[
  ke_CHECK_COMPRESS
  if test $COMPRESS = no; then
    AC_MSG_CHECKING(if compress link is wanted)
    AC_ARG_ENABLE(compress-link,
    [  --enable-compress-link        install compress link if the program is missing],
    [if test "$enableval" = yes; then
      AC_MSG_RESULT(yes)
      INSTALL_COMPRESS_LINK="compress-link"
    else
      AC_MSG_RESULT(no)
      INSTALL_COMPRESS_LINK=""
    fi], [
      AC_MSG_RESULT(no)
      INSTALL_COMPRESS_LINK=""
    ])
  fi
  AC_SUBST(INSTALL_COMPRESS_LINK)
])
