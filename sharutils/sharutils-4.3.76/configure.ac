# Configure template for GNU shar utilities.
# Copyright (C) 1994, 1995, 1996, 2002 Free Software Foundation, Inc.
# Process this file with autoconf to produce a configure script.

# FIXME: AC_CHECK_HEADERS([sys/time.h])
# FIXME: AC_CHECK_FUNCS([gethostname getwd])

AC_PREREQ(2.53)
AC_INIT(sharutils, 4.3.76, bug-gnu-utils@gnu.org)
AC_CONFIG_SRCDIR([src/shar.c])
AM_CONFIG_HEADER(config.h)

AM_INIT_AUTOMAKE([1.6 gnits dist-bzip2])

changequote(,)dnl
case $VERSION in
  [0-9]*.[0-9]*.[0-9]*) DIST_ALPHA="README-alpha";;
  *) DIST_ALPHA=;;
esac
changequote([, ])dnl
AC_SUBST(DIST_ALPHA)

dnl AC_ARG_PROGRAM

ADD_PROG=
ADD_SCRIPT="mail-files mailshar"
DIST_MAN1PAGES=
NODIST_MAN1PAGES=
dnl MAN1PAGES=
MAN5PAGES=
AC_SUBST(ADD_PROG)
AC_SUBST(ADD_SCRIPT)
AC_SUBST(DIST_MAN1PAGES)
AC_SUBST(NODIST_MAN1PAGES)
dnl AC_SUBST(MAN1PAGES)
AC_SUBST(MAN5PAGES)

AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_PROG_RANLIB

dnl FIXME: Check that it is GNU diff indeed.
# Carefully avoid gdiff for X as found on SGI systems.
if (DISPLAY= gdiff /dev/null /dev/null) 2> /dev/null; then
  AC_PATH_PROGS(DIFF, gnudiff diffgnu gdiff diff, no)
else
  AC_PATH_PROGS(DIFF, gnudiff diffgnu diff, no)
fi

dnl FIXME: Check that mailer accepts -s.
PATH_save="$PATH"; PATH="$PATH:/usr/sbin:/usr/ucb:/usr/bin:/bin"
AC_PATH_PROGS(MAILER, Mail mailx elm mush mail, no)
PATH="$PATH_save"

dnl FIXME: Check that perl was found.
AC_PATH_PROG(PERL, perl, no)

AC_PATH_PROGS(SH, bash sh, no)

dnl FIXME: Check that it is GNU tar indeed.
AC_PATH_PROGS(TAR, gnutar targnu gtar tar, tar)

test $ac_cv_path_PERL = no || ADD_SCRIPT="$ADD_SCRIPT remsync"

dnl in m4/sharutils.m4
ke_CHECK_COMPRESS_AND_LINK

AC_AIX
AC_ISC_POSIX
AC_MINIX
AM_PROG_CC_STDC
AC_SYS_LARGEFILE
if test $cross_compiling = no; then
  AC_C_CHAR_UNSIGNED
fi
AC_C_CONST
AC_C_INLINE
AC_C_BIGENDIAN

AC_CHECK_HEADERS(limits.h locale.h memory.h string.h sys/wait.h unistd.h)
AC_HEADER_DIRENT
AC_HEADER_STAT
AC_HEADER_STDC
AC_STRUCT_TIMEZONE
AC_TYPE_SIZE_T

jm_PREREQ_ERROR
jm_FUNC_MALLOC
jm_FUNC_REALLOC
AC_CHECK_FUNCS(fchmod getcwd isascii memcpy strchr strerror uname)
AC_FUNC_ALLOCA
AC_FUNC_CLOSEDIR_VOID
AC_FUNC_FSEEKO
AC_FUNC_STRFTIME
AC_FUNC_VPRINTF
AC_REPLACE_FUNCS(memset mktime stpcpy strftime)
jm_AC_PREREQ_XSTRTOIMAX

AC_MSG_CHECKING(for /etc/systemid)
if test -f /etc/systemid; then
  AC_MSG_RESULT(yes)
  AC_DEFINE([HAVE_ETC_SYSTEMID], 1,
            [Define if the current hostname may be found in /etc/systemid.])
else
  AC_MSG_RESULT(no)
fi

AC_MSG_CHECKING(if uuencode and uudecode are wanted)
AC_ARG_ENABLE(uucode,
[  --disable-uucode        disable installation of uuencode and uudecode],
[if test "$enableval" = yes; then
  AC_MSG_RESULT(yes)
  ADD_PROG="uudecode uuencode"
  DIST_MAN1PAGES="uuencode.1"
  NODIST_MAN1PAGES="uudecode.1"
  MAN5PAGES="uuencode.5"
else
  AC_MSG_RESULT(no)
fi], [
  AC_MSG_RESULT(yes)
  ADD_PROG="uudecode uuencode"
  DIST_MAN1PAGES="uuencode.1"
  NODIST_MAN1PAGES="uudecode.1"
  MAN5PAGES="uuencode.5"
])

AM_GNU_GETTEXT
AM_WITH_DMALLOC

# sharutils is somewhat special about internationalization in that it
# always requires the GNU .mo files installed.
if test "x$CATOBJEXT" = "x.mo" || test "x$CATOBJEXT" = "x.cat"; then
  new_CATALOGS=""
  for cat in $CATALOGS; do
    lang=`echo $cat | sed "s/\(.*\)\..*/\1/"`
    new_CATALOGS="$new_CATALOGS $cat $lang.gmo"
  done
  CATALOGS="$new_CATALOGS"
fi

AC_DEFINE(_GNU_SOURCE, 1, [Make sure we see all GNU extensions.])

dnl ac_sources="$nls_cv_header_libgt"
dnl ac_dests="$nls_cv_header_intl"
dnl while test -n "$ac_sources"; do
dnl   set $ac_dests; ac_dest=$1; shift; ac_dests=$*
dnl   set $ac_sources; ac_source=$1; shift; ac_sources=$*
dnl   ac_config_links_1="$ac_config_links_1 $ac_dest:$ac_source"
dnl done
dnl AC_CONFIG_LINKS([$ac_config_links_1])

AC_CONFIG_FILES([
  Makefile
  contrib/Makefile
  doc/Makefile
  intl/Makefile
  lib/Makefile
  m4/Makefile
  po/Makefile.in
  src/Makefile
  src/compress-dummy
  src/mail-files
  src/mailshar
  src/remsync
  tests/Makefile
])
AC_CONFIG_COMMANDS([default],[[\
 test -z "$CONFIG_HEADERS" || echo timestamp > stamp-h]],[[]])
AC_OUTPUT
