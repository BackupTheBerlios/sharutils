## Makefile for the doc subdirectory of the GNU NLS Utilities
## Copyright (C) 1995, 1996 Free Software Foundation, Inc.
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

## Process this file with automake to produce Makefile.in.

info_TEXINFOS = sharutils.texi

DISTCLEANFILES = uudecode.1

mandir = @mandir@
man1dir = $(mandir)/man1
man5dir = $(mandir)/man5

DIST_MAN1PAGES = shar.1 unshar.1 @DIST_MAN1PAGES@
NODIST_MAN1PAGES = @NODIST_MAN1PAGES@
man1_MANS = $(DIST_MAN1PAGES) $(NODIST_MAN1PAGES)
noinst_MANS = uuencode.1 uuencode.5
noinst_man1_MANS = uudecode.1
man5_MANS = @MAN5PAGES@

# dist_man_MANS = @MAN1PAGES@ @MAN5PAGES@

EXTRA_DIST = $(DIST_MAN1PAGES) $(man5_MANS) doclicense.texi

uudecode.1: Makefile
	man1base=`echo $(man1dir) | sed 's@.*/\(.*\)@\1@'`; \
	echo ".so $$man1base/uuencode.1" > $@
