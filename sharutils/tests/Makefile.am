## Makefile for the checks subdirectory of the GNU Shar utilities.
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

TESTS = uutest-1 uude-1 shar-1
TESTS_ENVIRONMENT = top_srcdir=$(top_srcdir) PATH="../src:$$PATH"

EXTRA_DIST = $(TESTS) testdata shar-1.ok

all-local: shar-1.ok

shar-1.ok: ../configure.ac
	umask 022 && echo "This is a test" > shar-1.in
	PATH=../src:$$PATH shar -f shar-1.in | \
	 sed -e 6,10d -e 's/_sh[0-9][0-9][0-9][0-9][0-9]/_shPID/' \
	     -e 's/-am ..........//' \
	     -e 's/(set .. .. .. .. .. .. ../(set .../' > $@
