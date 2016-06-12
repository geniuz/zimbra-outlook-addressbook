# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 1998-2016 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
##---------------------------------------------------------------------------
#
# Top-level Makefile template
#

PACKAGE= OpenLDAP
VERSION= 2.4.39
RELEASEDATE= 2016/02/05


SHELL = /bin/sh

top_builddir = ../../..

srcdir = .
top_srcdir = ../../..

prefix = /opt/zimbra/openldap-2.4.39.2z
exec_prefix = ${prefix}
ldap_subdir = /openldap

bindir = ${exec_prefix}/bin
datarootdir = ${prefix}/share
datadir = ${datarootdir}$(ldap_subdir)
includedir = ${prefix}/include
infodir = ${datarootdir}/info
libdir = ${exec_prefix}/lib
libexecdir = /opt/zimbra/openldap-2.4.39.2z/sbin
localstatedir = /opt/zimbra/data/ldap/state
mandir = ${datarootdir}/man
moduledir = /opt/zimbra/openldap-2.4.39.2z/sbin$(ldap_subdir)
sbindir = ${exec_prefix}/sbin
sharedstatedir = ${prefix}/com
sysconfdir = ${prefix}/etc$(ldap_subdir)
schemadir = $(sysconfdir)/schema

PLAT = UNIX
EXEEXT = 
OBJEXT = o

BUILD_LIBS_DYNAMIC = shared

SHTOOL = $(top_srcdir)/build/shtool

INSTALL = $(SHTOOL) install -c
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644
INSTALL_SCRIPT = $(INSTALL)

STRIP = -s

LINT = lint
5LINT = 5lint

MKDEP = $(top_srcdir)/build/mkdep $(MKDEPFLAG) \
	-d "$(srcdir)" -c "$(MKDEP_CC)" -m "$(MKDEP_CFLAGS)"
MKDEP_CC	= cc
MKDEP_CFLAGS = -M

MKVERSION = $(top_srcdir)/build/mkversion -v "$(VERSION)"

LIBTOOL = $(SHELL) $(top_builddir)/libtool
LIBRELEASE = 2.4
LIBVERSION = 12:2:10
LTVERSION = -release $(LIBRELEASE) -version-info $(LIBVERSION)

# libtool --only flag for libraries: platform specific
NT_LTONLY_LIB = # --only-$(BUILD_LIBS_DYNAMIC)
LTONLY_LIB = $(UNIX_LTONLY_LIB)

# libtool --only flag for modules: depends on linkage of module
# The BUILD_MOD macro is defined in each backend Makefile.in file
LTONLY_yes = --tag=disable-shared
LTONLY_mod = --tag=disable-static
LTONLY_MOD = $(LTONLY_$(BUILD_MOD))

# platform-specific libtool flags
NT_LTFLAGS_LIB = -no-undefined -avoid-version -rpath $(libdir)
NT_LTFLAGS_MOD = -no-undefined -avoid-version -rpath $(moduledir)
UNIX_LTFLAGS_LIB = $(LTVERSION) -rpath $(libdir)
UNIX_LTFLAGS_MOD = $(LTVERSION) -rpath $(moduledir)

# libtool flags
LTFLAGS     = $(UNIX_LTFLAGS)
LTFLAGS_LIB = $(UNIX_LTFLAGS_LIB)
LTFLAGS_MOD = $(UNIX_LTFLAGS_MOD)

# LIB_DEFS defined in liblber and libldap Makefile.in files.
# MOD_DEFS defined in backend Makefile.in files.

# platform-specific LINK_LIBS defined in various Makefile.in files.
# LINK_LIBS referenced in library and module link commands.
LINK_LIBS = $(MOD_LIBS) $(UNIX_LINK_LIBS)

LTSTATIC = 

LTLINK   = $(LIBTOOL) --mode=link \
	$(CC) $(LTSTATIC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS)

LTCOMPILE_LIB = $(LIBTOOL) $(LTONLY_LIB) --mode=compile \
	$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(LIB_DEFS) -c

LTLINK_LIB = $(LIBTOOL) $(LTONLY_LIB) --mode=link \
	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB)

LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
	$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(MOD_DEFS) -c

LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)

LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL) 
LTFINISH = $(LIBTOOL) --mode=finish

# Misc UNIX commands used in build environment
AR = ar
BASENAME = basename
CAT = cat
CHMOD = chmod
DATE = date
ECHO = $(SHTOOL) echo
HOSTNAME = $(SHTOOL) echo -e "%h%d"
LN = $(SHTOOL) mkln
LN_H = $(LN)
LN_S = $(LN) -s
MAKEINFO = ${SHELL} /mnt/zimbra-foss/ThirdParty/openldap/openldap-2.4.39.2z/build/missing --run makeinfo
MKDIR = $(SHTOOL) mkdir -p
MV = $(SHTOOL) move
PWD = pwd
RANLIB = ranlib
RM = rm -f
SED = sed
SUBST = $(SHTOOL) subst

# For manual pages
# MANCOMPRESS=@MANCOMPRESS@
# MANCOMPRESSSUFFIX=@MANCOMPRESSSUFFIX@
MANCOMPRESS=$(CAT)
MANCOMPRESSSUFFIX=

SOELIM=soelim

INCLUDEDIR= $(top_srcdir)/include
LDAP_INCPATH= -I$(LDAP_INCDIR) -I$(INCLUDEDIR)
LDAP_LIBDIR= $(top_builddir)/libraries

LUTIL_LIBS =  -lcrypt
LTHREAD_LIBS =  -pthread

BDB_LIBS = 
SLAPD_NDB_LIBS = 

LDAP_LIBLBER_LA = $(LDAP_LIBDIR)/liblber/liblber.la
LDAP_LIBLDAP_LA = $(LDAP_LIBDIR)/libldap/libldap.la
LDAP_LIBLDAP_R_LA = $(LDAP_LIBDIR)/libldap_r/libldap_r.la

LDAP_LIBREWRITE_A = $(LDAP_LIBDIR)/librewrite/librewrite.a
LDAP_LIBLUNICODE_A = $(LDAP_LIBDIR)/liblunicode/liblunicode.a
LDAP_LIBLUTIL_A = $(LDAP_LIBDIR)/liblutil/liblutil.a

LDAP_L = $(LDAP_LIBLUTIL_A) \
	$(LDAP_LIBLDAP_LA) $(LDAP_LIBLBER_LA)
SLAPD_L = $(LDAP_LIBLUNICODE_A) $(LDAP_LIBREWRITE_A) \
	$(LDAP_LIBLUTIL_A) $(LDAP_LIBLDAP_R_LA) $(LDAP_LIBLBER_LA)

WRAP_LIBS = 
# AutoConfig generated 
AC_CC	= cc
AC_CFLAGS = -g -O0
AC_DEFS = -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include 	  -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include  # -DHAVE_CONFIG_H
AC_LDFLAGS = -L/opt/zimbra/openssl-1.0.1j/lib -L/opt/zimbra/cyrus-sasl-2.1.26.2z/lib -L/opt/zimbra/openldap-2.4.39.2z/lib -L/opt/zimbra/libtool-2.2.6b/lib -Wl,-rpath,/opt/zimbra/openssl-1.0.1j/lib -Wl,-rpath,/opt/zimbra/cyrus-sasl-2.1.26.2z/lib -Wl,-rpath,/opt/zimbra/openldap-2.4.39.2z/lib -Wl,-rpath,/opt/zimbra/libtool-2.2.6b/lib
AC_LIBS = -lresolv 

KRB4_LIBS = 
KRB5_LIBS = 
KRB_LIBS =  
SASL_LIBS = -lsasl2
TLS_LIBS = -lssl -lcrypto
AUTH_LIBS = 
SECURITY_LIBS = $(SASL_LIBS) $(KRB_LIBS) $(TLS_LIBS) $(AUTH_LIBS)
ICU_LIBS = 

MODULES_CPPFLAGS = 
MODULES_LDFLAGS = -dlopen self
MODULES_LIBS = -lltdl
SLAPD_PERL_LDFLAGS = 

SLAPD_SQL_LDFLAGS = 
SLAPD_SQL_INCLUDES = 
SLAPD_SQL_LIBS = 

SLAPD_LIBS =       $(ICU_LIBS)

# Our Defaults
CC = $(AC_CC)
DEFS = $(LDAP_INCPATH) $(XINCPATH) $(XDEFS) $(AC_DEFS) $(DEFINES)
CFLAGS = $(AC_CFLAGS) $(DEFS)
LDFLAGS = $(LDAP_LIBPATH) $(AC_LDFLAGS) $(XLDFLAGS)
LIBS = $(XLIBS) $(XXLIBS) $(AC_LIBS) $(XXXLIBS)

LT_CFLAGS = $(AC_CFLAGS)
LT_CPPFLAGS = $(DEFS)

all:		all-common all-local FORCE
install:	install-common install-local FORCE
clean:		clean-common clean-local FORCE
veryclean:	veryclean-common veryclean-local FORCE
depend:		depend-common depend-local FORCE

# empty common rules
all-common:
install-common:
clean-common:
veryclean-common:	clean-common FORCE
depend-common:
lint-common:
lint5-common:

# empty local rules
all-local:
install-local:
clean-local:
veryclean-local:	clean-local FORCE
depend-local:
lint-local:
lint5-local:

veryclean: FORCE
	$(RM) Makefile
	$(RM) -r .libs

Makefile: Makefile.in $(top_srcdir)/build/top.mk

pathtest:
	$(SHTOOL) --version

# empty rule for forcing rules
FORCE:

##---------------------------------------------------------------------------

# Makefile.in for back-sock
# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 2007-2016 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.
##
## ACKNOWLEDGEMENTS:
## This work was initially developed by Brian Candler for inclusion
## in OpenLDAP Software.

SRCS	= init.c config.c opensock.c search.c bind.c unbind.c add.c \
		delete.c modify.c modrdn.c compare.c result.c
OBJS	= init.lo config.lo opensock.lo search.lo bind.lo unbind.lo add.lo \
		delete.lo modify.lo modrdn.lo compare.lo result.lo

LDAP_INCDIR= ../../../include       
LDAP_LIBDIR= ../../../libraries

BUILD_OPT = "--enable-sock"
BUILD_MOD = mod

mod_DEFS = -DSLAPD_IMPORT
MOD_DEFS = $(mod_DEFS)

shared_LDAP_LIBS = $(LDAP_LIBLDAP_R_LA) $(LDAP_LIBLBER_LA)
NT_LINK_LIBS = -L.. -lslapd $(shared_LDAP_LIBS)
UNIX_LINK_LIBS = $(shared_LDAP_LIBS)

LIBBASE = back_sock

XINCPATH = -I.. -I$(srcdir)/..
XDEFS = $(MODULES_CPPFLAGS)

all-local-lib:	../.backend

../.backend: lib$(LIBBASE).a
	@touch $@

# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 1998-2016 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.
##---------------------------------------------------------------------------
#
# Makefile Template for Server Modules
#

LIBRARY = $(LIBBASE).la
LIBSTAT = lib$(LIBBASE).a

MKDEPFLAG = -l

.SUFFIXES: .c .o .lo

.c.lo:
	$(LTCOMPILE_MOD) $<

all-no lint-no 5lint-no depend-no install-no: FORCE
	@echo "run configure with $(BUILD_OPT) to make $(LIBBASE)"

all-common: all-$(BUILD_MOD)

version.c: Makefile
	$(RM) $@
	$(MKVERSION) $(LIBBASE) > $@

version.lo: version.c $(OBJS)

$(LIBRARY): version.lo
	$(LTLINK_MOD) -module -o $@ $(OBJS) version.lo $(LINK_LIBS)

$(LIBSTAT): version.lo
	$(AR) ruv $@ `echo $(OBJS) | sed 's/\.lo/.o/g'` version.o
	@$(RANLIB) $@

clean-common: clean-lib FORCE
veryclean-common: veryclean-lib FORCE


lint-common: lint-$(BUILD_MOD)

5lint-common: 5lint-$(BUILD_MOD)

depend-common: depend-$(BUILD_MOD)

install-common: install-$(BUILD_MOD)

all-local-mod:
all-mod: $(LIBRARY) all-local-mod FORCE

all-local-lib:
all-yes: $(LIBSTAT) all-local-lib FORCE

install-mod: $(LIBRARY)
	@-$(MKDIR) $(DESTDIR)$(moduledir)
	$(LTINSTALL) $(INSTALLFLAGS) -m 755 $(LIBRARY) $(DESTDIR)$(moduledir)

install-local-lib:
install-yes: install-local-lib FORCE

lint-local-lib:
lint-yes lint-mod: lint-local-lib FORCE
	$(LINT) $(DEFS) $(DEFINES) $(SRCS)

5lint-local-lib:
5lint-yes 5lint-mod: 5lint-local-lib FORCE
	$(5LINT) $(DEFS) $(DEFINES) $(SRCS)

clean-local-lib:
clean-lib: 	clean-local-lib FORCE
	$(RM) $(LIBRARY) $(LIBSTAT) version.c *.o *.lo a.out core .libs/*

depend-local-lib:
depend-yes depend-mod: depend-local-lib FORCE
	$(MKDEP) $(DEFS) $(DEFINES) $(SRCS)

veryclean-local-lib:
veryclean-lib: 	clean-lib veryclean-local-lib

Makefile: $(top_srcdir)/build/mod.mk

# DO NOT DELETE THIS LINE -- mkdep uses it.
# DO NOT PUT ANYTHING AFTER THIS LINE, IT WILL GO AWAY.


#
# files: -I../../../include -I../../../include -I.. -I./.. -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include init.c config.c opensock.c search.c bind.c unbind.c add.c delete.c modify.c modrdn.c compare.c result.c
# command: cc -M -I.  -I../../../include -I../../../include -I.. -I./.. -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include init.c config.c opensock.c search.c bind.c unbind.c add.c delete.c modify.c modrdn.c compare.c result.c
#

init.lo: init.c
init.lo: /usr/include/stdc-predef.h
init.lo: ../../../include/portable.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
init.lo: ../../../include/ac/fdset.h
init.lo: /usr/include/bits/types.h
init.lo: /usr/include/features.h
init.lo: /usr/include/sys/cdefs.h
init.lo: /usr/include/bits/wordsize.h
init.lo: /usr/include/gnu/stubs.h
init.lo: /usr/include/gnu/stubs-64.h
init.lo: /usr/include/bits/typesizes.h
init.lo: ../../../include/ldap_cdefs.h
init.lo: ../../../include/ldap_features.h
init.lo: ../../../include/ac/assert.h
init.lo: /usr/include/assert.h
init.lo: ../../../include/ac/localize.h
init.lo: /usr/include/stdio.h
init.lo: /usr/include/libio.h
init.lo: /usr/include/_G_config.h
init.lo: /usr/include/wchar.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
init.lo: /usr/include/bits/stdio_lim.h
init.lo: /usr/include/bits/sys_errlist.h
init.lo: ../../../include/ac/socket.h
init.lo: /usr/include/sys/types.h
init.lo: /usr/include/time.h
init.lo: /usr/include/endian.h
init.lo: /usr/include/bits/endian.h
init.lo: /usr/include/bits/byteswap.h
init.lo: /usr/include/bits/byteswap-16.h
init.lo: /usr/include/sys/select.h
init.lo: /usr/include/bits/select.h
init.lo: /usr/include/bits/sigset.h
init.lo: /usr/include/bits/time.h
init.lo: /usr/include/sys/sysmacros.h
init.lo: /usr/include/bits/pthreadtypes.h
init.lo: /usr/include/poll.h
init.lo: /usr/include/sys/poll.h
init.lo: /usr/include/bits/poll.h
init.lo: /usr/include/sys/socket.h
init.lo: /usr/include/sys/uio.h
init.lo: /usr/include/bits/uio.h
init.lo: /usr/include/bits/socket.h
init.lo: /usr/include/bits/socket_type.h
init.lo: /usr/include/bits/sockaddr.h
init.lo: /usr/include/asm/socket.h
init.lo: /usr/include/asm-generic/socket.h
init.lo: /usr/include/asm/sockios.h
init.lo: /usr/include/asm-generic/sockios.h
init.lo: /usr/include/sys/un.h
init.lo: /usr/include/string.h
init.lo: /usr/include/xlocale.h
init.lo: /usr/include/netinet/in.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
init.lo: /usr/include/stdint.h
init.lo: /usr/include/bits/wchar.h
init.lo: /usr/include/bits/in.h
init.lo: /usr/include/netinet/tcp.h
init.lo: /usr/include/arpa/inet.h
init.lo: /usr/include/arpa/nameser.h
init.lo: /usr/include/sys/param.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
init.lo: /usr/include/limits.h
init.lo: /usr/include/bits/posix1_lim.h
init.lo: /usr/include/bits/local_lim.h
init.lo: /usr/include/linux/limits.h
init.lo: /usr/include/bits/posix2_lim.h
init.lo: /usr/include/signal.h
init.lo: /usr/include/bits/signum.h
init.lo: /usr/include/bits/siginfo.h
init.lo: /usr/include/bits/sigaction.h
init.lo: /usr/include/bits/sigcontext.h
init.lo: /usr/include/bits/sigstack.h
init.lo: /usr/include/sys/ucontext.h
init.lo: /usr/include/bits/sigthread.h
init.lo: /usr/include/bits/param.h
init.lo: /usr/include/linux/param.h
init.lo: /usr/include/asm/param.h
init.lo: /usr/include/asm-generic/param.h
init.lo: /usr/include/sys/bitypes.h
init.lo: /usr/include/arpa/nameser_compat.h
init.lo: /usr/include/netdb.h
init.lo: /usr/include/rpc/netdb.h
init.lo: /usr/include/bits/netdb.h
init.lo: /usr/include/resolv.h
init.lo: ../slap.h
init.lo: ../../../include/ldap_defaults.h
init.lo: ../../../include/ldap_config.h
init.lo: ../../../include/ac/stdlib.h
init.lo: /usr/include/stdlib.h
init.lo: /usr/include/bits/waitflags.h
init.lo: /usr/include/bits/waitstatus.h
init.lo: /usr/include/alloca.h
init.lo: /usr/include/bits/stdlib-float.h
init.lo: ../../../include/ac/syslog.h
init.lo: /usr/include/syslog.h
init.lo: /usr/include/sys/syslog.h
init.lo: /usr/include/bits/syslog-path.h
init.lo: ../../../include/ac/regex.h
init.lo: /usr/include/regex.h
init.lo: ../../../include/ac/signal.h
init.lo: ../../../include/ac/time.h
init.lo: /usr/include/sys/time.h
init.lo: ../../../include/ac/param.h
init.lo: ../../../include/ac/unistd.h
init.lo: /usr/include/unistd.h
init.lo: /usr/include/bits/posix_opt.h
init.lo: /usr/include/bits/environments.h
init.lo: /usr/include/bits/confname.h
init.lo: /usr/include/getopt.h
init.lo: ../../../include/lutil_lockf.h
init.lo: ../../../include/avl.h
init.lo: ../../../include/ldap_cdefs.h
init.lo: ../../../include/ldap_log.h
init.lo: ../../../include/ldap.h
init.lo: ../../../include/lber.h
init.lo: ../../../include/lber_types.h
init.lo: ../../../include/ldap_features.h
init.lo: ../../../include/ldap_schema.h
init.lo: ../../../include/lber_pvt.h
init.lo: ../../../include/ldap_pvt.h
init.lo: ../../../include/ldap_pvt_uc.h
init.lo: ../../../include/ac/bytes.h
init.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
init.lo: ../../../include/ldap_pvt_thread.h
init.lo: ../../../include/ldap_int_thread.h
init.lo: /usr/include/pthread.h
init.lo: /usr/include/sched.h
init.lo: /usr/include/bits/sched.h
init.lo: /usr/include/bits/setjmp.h
init.lo: ../../../include/ldap_queue.h
init.lo: ../proto-slap.h
init.lo: back-sock.h
init.lo: proto-sock.h
config.lo: config.c
config.lo: /usr/include/stdc-predef.h
config.lo: ../../../include/portable.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
config.lo: ../../../include/ac/fdset.h
config.lo: /usr/include/bits/types.h
config.lo: /usr/include/features.h
config.lo: /usr/include/sys/cdefs.h
config.lo: /usr/include/bits/wordsize.h
config.lo: /usr/include/gnu/stubs.h
config.lo: /usr/include/gnu/stubs-64.h
config.lo: /usr/include/bits/typesizes.h
config.lo: ../../../include/ldap_cdefs.h
config.lo: ../../../include/ldap_features.h
config.lo: ../../../include/ac/assert.h
config.lo: /usr/include/assert.h
config.lo: ../../../include/ac/localize.h
config.lo: /usr/include/stdio.h
config.lo: /usr/include/libio.h
config.lo: /usr/include/_G_config.h
config.lo: /usr/include/wchar.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
config.lo: /usr/include/bits/stdio_lim.h
config.lo: /usr/include/bits/sys_errlist.h
config.lo: ../../../include/ac/string.h
config.lo: /usr/include/string.h
config.lo: /usr/include/xlocale.h
config.lo: ../../../include/ac/socket.h
config.lo: /usr/include/sys/types.h
config.lo: /usr/include/time.h
config.lo: /usr/include/endian.h
config.lo: /usr/include/bits/endian.h
config.lo: /usr/include/bits/byteswap.h
config.lo: /usr/include/bits/byteswap-16.h
config.lo: /usr/include/sys/select.h
config.lo: /usr/include/bits/select.h
config.lo: /usr/include/bits/sigset.h
config.lo: /usr/include/bits/time.h
config.lo: /usr/include/sys/sysmacros.h
config.lo: /usr/include/bits/pthreadtypes.h
config.lo: /usr/include/poll.h
config.lo: /usr/include/sys/poll.h
config.lo: /usr/include/bits/poll.h
config.lo: /usr/include/sys/socket.h
config.lo: /usr/include/sys/uio.h
config.lo: /usr/include/bits/uio.h
config.lo: /usr/include/bits/socket.h
config.lo: /usr/include/bits/socket_type.h
config.lo: /usr/include/bits/sockaddr.h
config.lo: /usr/include/asm/socket.h
config.lo: /usr/include/asm-generic/socket.h
config.lo: /usr/include/asm/sockios.h
config.lo: /usr/include/asm-generic/sockios.h
config.lo: /usr/include/sys/un.h
config.lo: /usr/include/netinet/in.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
config.lo: /usr/include/stdint.h
config.lo: /usr/include/bits/wchar.h
config.lo: /usr/include/bits/in.h
config.lo: /usr/include/netinet/tcp.h
config.lo: /usr/include/arpa/inet.h
config.lo: /usr/include/arpa/nameser.h
config.lo: /usr/include/sys/param.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
config.lo: /usr/include/limits.h
config.lo: /usr/include/bits/posix1_lim.h
config.lo: /usr/include/bits/local_lim.h
config.lo: /usr/include/linux/limits.h
config.lo: /usr/include/bits/posix2_lim.h
config.lo: /usr/include/signal.h
config.lo: /usr/include/bits/signum.h
config.lo: /usr/include/bits/siginfo.h
config.lo: /usr/include/bits/sigaction.h
config.lo: /usr/include/bits/sigcontext.h
config.lo: /usr/include/bits/sigstack.h
config.lo: /usr/include/sys/ucontext.h
config.lo: /usr/include/bits/sigthread.h
config.lo: /usr/include/bits/param.h
config.lo: /usr/include/linux/param.h
config.lo: /usr/include/asm/param.h
config.lo: /usr/include/asm-generic/param.h
config.lo: /usr/include/sys/bitypes.h
config.lo: /usr/include/arpa/nameser_compat.h
config.lo: /usr/include/netdb.h
config.lo: /usr/include/rpc/netdb.h
config.lo: /usr/include/bits/netdb.h
config.lo: /usr/include/resolv.h
config.lo: ../slap.h
config.lo: ../../../include/ldap_defaults.h
config.lo: ../../../include/ldap_config.h
config.lo: ../../../include/ac/stdlib.h
config.lo: /usr/include/stdlib.h
config.lo: /usr/include/bits/waitflags.h
config.lo: /usr/include/bits/waitstatus.h
config.lo: /usr/include/alloca.h
config.lo: /usr/include/bits/stdlib-float.h
config.lo: ../../../include/ac/syslog.h
config.lo: /usr/include/syslog.h
config.lo: /usr/include/sys/syslog.h
config.lo: /usr/include/bits/syslog-path.h
config.lo: ../../../include/ac/regex.h
config.lo: /usr/include/regex.h
config.lo: ../../../include/ac/signal.h
config.lo: ../../../include/ac/time.h
config.lo: /usr/include/sys/time.h
config.lo: ../../../include/ac/param.h
config.lo: ../../../include/ac/unistd.h
config.lo: /usr/include/unistd.h
config.lo: /usr/include/bits/posix_opt.h
config.lo: /usr/include/bits/environments.h
config.lo: /usr/include/bits/confname.h
config.lo: /usr/include/getopt.h
config.lo: ../../../include/lutil_lockf.h
config.lo: ../../../include/avl.h
config.lo: ../../../include/ldap_cdefs.h
config.lo: ../../../include/ldap_log.h
config.lo: ../../../include/ldap.h
config.lo: ../../../include/lber.h
config.lo: ../../../include/lber_types.h
config.lo: ../../../include/ldap_features.h
config.lo: ../../../include/ldap_schema.h
config.lo: ../../../include/lber_pvt.h
config.lo: ../../../include/ldap_pvt.h
config.lo: ../../../include/ldap_pvt_uc.h
config.lo: ../../../include/ac/bytes.h
config.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
config.lo: ../../../include/ldap_pvt_thread.h
config.lo: ../../../include/ldap_int_thread.h
config.lo: /usr/include/pthread.h
config.lo: /usr/include/sched.h
config.lo: /usr/include/bits/sched.h
config.lo: /usr/include/bits/setjmp.h
config.lo: ../../../include/ldap_queue.h
config.lo: ../proto-slap.h
config.lo: ../config.h
config.lo: back-sock.h
config.lo: proto-sock.h
opensock.lo: opensock.c
opensock.lo: /usr/include/stdc-predef.h
opensock.lo: ../../../include/portable.h
opensock.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
opensock.lo: ../../../include/ac/fdset.h
opensock.lo: /usr/include/bits/types.h
opensock.lo: /usr/include/features.h
opensock.lo: /usr/include/sys/cdefs.h
opensock.lo: /usr/include/bits/wordsize.h
opensock.lo: /usr/include/gnu/stubs.h
opensock.lo: /usr/include/gnu/stubs-64.h
opensock.lo: /usr/include/bits/typesizes.h
opensock.lo: ../../../include/ldap_cdefs.h
opensock.lo: ../../../include/ldap_features.h
opensock.lo: ../../../include/ac/assert.h
opensock.lo: /usr/include/assert.h
opensock.lo: ../../../include/ac/localize.h
opensock.lo: /usr/include/stdio.h
opensock.lo: /usr/include/libio.h
opensock.lo: /usr/include/_G_config.h
opensock.lo: /usr/include/wchar.h
opensock.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
opensock.lo: /usr/include/bits/stdio_lim.h
opensock.lo: /usr/include/bits/sys_errlist.h
opensock.lo: ../../../include/ac/errno.h
opensock.lo: /usr/include/errno.h
opensock.lo: /usr/include/bits/errno.h
opensock.lo: /usr/include/linux/errno.h
opensock.lo: /usr/include/asm/errno.h
opensock.lo: /usr/include/asm-generic/errno.h
opensock.lo: /usr/include/asm-generic/errno-base.h
opensock.lo: ../../../include/ac/string.h
opensock.lo: /usr/include/string.h
opensock.lo: /usr/include/xlocale.h
opensock.lo: ../../../include/ac/socket.h
opensock.lo: /usr/include/sys/types.h
opensock.lo: /usr/include/time.h
opensock.lo: /usr/include/endian.h
opensock.lo: /usr/include/bits/endian.h
opensock.lo: /usr/include/bits/byteswap.h
opensock.lo: /usr/include/bits/byteswap-16.h
opensock.lo: /usr/include/sys/select.h
opensock.lo: /usr/include/bits/select.h
opensock.lo: /usr/include/bits/sigset.h
opensock.lo: /usr/include/bits/time.h
opensock.lo: /usr/include/sys/sysmacros.h
opensock.lo: /usr/include/bits/pthreadtypes.h
opensock.lo: /usr/include/poll.h
opensock.lo: /usr/include/sys/poll.h
opensock.lo: /usr/include/bits/poll.h
opensock.lo: /usr/include/sys/socket.h
opensock.lo: /usr/include/sys/uio.h
opensock.lo: /usr/include/bits/uio.h
opensock.lo: /usr/include/bits/socket.h
opensock.lo: /usr/include/bits/socket_type.h
opensock.lo: /usr/include/bits/sockaddr.h
opensock.lo: /usr/include/asm/socket.h
opensock.lo: /usr/include/asm-generic/socket.h
opensock.lo: /usr/include/asm/sockios.h
opensock.lo: /usr/include/asm-generic/sockios.h
opensock.lo: /usr/include/sys/un.h
opensock.lo: /usr/include/netinet/in.h
opensock.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
opensock.lo: /usr/include/stdint.h
opensock.lo: /usr/include/bits/wchar.h
opensock.lo: /usr/include/bits/in.h
opensock.lo: /usr/include/netinet/tcp.h
opensock.lo: /usr/include/arpa/inet.h
opensock.lo: /usr/include/arpa/nameser.h
opensock.lo: /usr/include/sys/param.h
opensock.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
opensock.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
opensock.lo: /usr/include/limits.h
opensock.lo: /usr/include/bits/posix1_lim.h
opensock.lo: /usr/include/bits/local_lim.h
opensock.lo: /usr/include/linux/limits.h
opensock.lo: /usr/include/bits/posix2_lim.h
opensock.lo: /usr/include/signal.h
opensock.lo: /usr/include/bits/signum.h
opensock.lo: /usr/include/bits/siginfo.h
opensock.lo: /usr/include/bits/sigaction.h
opensock.lo: /usr/include/bits/sigcontext.h
opensock.lo: /usr/include/bits/sigstack.h
opensock.lo: /usr/include/sys/ucontext.h
opensock.lo: /usr/include/bits/sigthread.h
opensock.lo: /usr/include/bits/param.h
opensock.lo: /usr/include/linux/param.h
opensock.lo: /usr/include/asm/param.h
opensock.lo: /usr/include/asm-generic/param.h
opensock.lo: /usr/include/sys/bitypes.h
opensock.lo: /usr/include/arpa/nameser_compat.h
opensock.lo: /usr/include/netdb.h
opensock.lo: /usr/include/rpc/netdb.h
opensock.lo: /usr/include/bits/netdb.h
opensock.lo: /usr/include/resolv.h
opensock.lo: ../../../include/ac/unistd.h
opensock.lo: /usr/include/unistd.h
opensock.lo: /usr/include/bits/posix_opt.h
opensock.lo: /usr/include/bits/environments.h
opensock.lo: /usr/include/bits/confname.h
opensock.lo: /usr/include/getopt.h
opensock.lo: ../../../include/lutil_lockf.h
opensock.lo: ../slap.h
opensock.lo: ../../../include/ldap_defaults.h
opensock.lo: ../../../include/ldap_config.h
opensock.lo: ../../../include/ac/stdlib.h
opensock.lo: /usr/include/stdlib.h
opensock.lo: /usr/include/bits/waitflags.h
opensock.lo: /usr/include/bits/waitstatus.h
opensock.lo: /usr/include/alloca.h
opensock.lo: /usr/include/bits/stdlib-float.h
opensock.lo: ../../../include/ac/syslog.h
opensock.lo: /usr/include/syslog.h
opensock.lo: /usr/include/sys/syslog.h
opensock.lo: /usr/include/bits/syslog-path.h
opensock.lo: ../../../include/ac/regex.h
opensock.lo: /usr/include/regex.h
opensock.lo: ../../../include/ac/signal.h
opensock.lo: ../../../include/ac/time.h
opensock.lo: /usr/include/sys/time.h
opensock.lo: ../../../include/ac/param.h
opensock.lo: ../../../include/avl.h
opensock.lo: ../../../include/ldap_cdefs.h
opensock.lo: ../../../include/ldap_log.h
opensock.lo: ../../../include/ldap.h
opensock.lo: ../../../include/lber.h
opensock.lo: ../../../include/lber_types.h
opensock.lo: ../../../include/ldap_features.h
opensock.lo: ../../../include/ldap_schema.h
opensock.lo: ../../../include/lber_pvt.h
opensock.lo: ../../../include/ldap_pvt.h
opensock.lo: ../../../include/ldap_pvt_uc.h
opensock.lo: ../../../include/ac/bytes.h
opensock.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
opensock.lo: ../../../include/ldap_pvt_thread.h
opensock.lo: ../../../include/ldap_int_thread.h
opensock.lo: /usr/include/pthread.h
opensock.lo: /usr/include/sched.h
opensock.lo: /usr/include/bits/sched.h
opensock.lo: /usr/include/bits/setjmp.h
opensock.lo: ../../../include/ldap_queue.h
opensock.lo: ../proto-slap.h
opensock.lo: back-sock.h
opensock.lo: proto-sock.h
search.lo: search.c
search.lo: /usr/include/stdc-predef.h
search.lo: ../../../include/portable.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
search.lo: ../../../include/ac/fdset.h
search.lo: /usr/include/bits/types.h
search.lo: /usr/include/features.h
search.lo: /usr/include/sys/cdefs.h
search.lo: /usr/include/bits/wordsize.h
search.lo: /usr/include/gnu/stubs.h
search.lo: /usr/include/gnu/stubs-64.h
search.lo: /usr/include/bits/typesizes.h
search.lo: ../../../include/ldap_cdefs.h
search.lo: ../../../include/ldap_features.h
search.lo: ../../../include/ac/assert.h
search.lo: /usr/include/assert.h
search.lo: ../../../include/ac/localize.h
search.lo: /usr/include/stdio.h
search.lo: /usr/include/libio.h
search.lo: /usr/include/_G_config.h
search.lo: /usr/include/wchar.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
search.lo: /usr/include/bits/stdio_lim.h
search.lo: /usr/include/bits/sys_errlist.h
search.lo: ../../../include/ac/socket.h
search.lo: /usr/include/sys/types.h
search.lo: /usr/include/time.h
search.lo: /usr/include/endian.h
search.lo: /usr/include/bits/endian.h
search.lo: /usr/include/bits/byteswap.h
search.lo: /usr/include/bits/byteswap-16.h
search.lo: /usr/include/sys/select.h
search.lo: /usr/include/bits/select.h
search.lo: /usr/include/bits/sigset.h
search.lo: /usr/include/bits/time.h
search.lo: /usr/include/sys/sysmacros.h
search.lo: /usr/include/bits/pthreadtypes.h
search.lo: /usr/include/poll.h
search.lo: /usr/include/sys/poll.h
search.lo: /usr/include/bits/poll.h
search.lo: /usr/include/sys/socket.h
search.lo: /usr/include/sys/uio.h
search.lo: /usr/include/bits/uio.h
search.lo: /usr/include/bits/socket.h
search.lo: /usr/include/bits/socket_type.h
search.lo: /usr/include/bits/sockaddr.h
search.lo: /usr/include/asm/socket.h
search.lo: /usr/include/asm-generic/socket.h
search.lo: /usr/include/asm/sockios.h
search.lo: /usr/include/asm-generic/sockios.h
search.lo: /usr/include/sys/un.h
search.lo: /usr/include/string.h
search.lo: /usr/include/xlocale.h
search.lo: /usr/include/netinet/in.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
search.lo: /usr/include/stdint.h
search.lo: /usr/include/bits/wchar.h
search.lo: /usr/include/bits/in.h
search.lo: /usr/include/netinet/tcp.h
search.lo: /usr/include/arpa/inet.h
search.lo: /usr/include/arpa/nameser.h
search.lo: /usr/include/sys/param.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
search.lo: /usr/include/limits.h
search.lo: /usr/include/bits/posix1_lim.h
search.lo: /usr/include/bits/local_lim.h
search.lo: /usr/include/linux/limits.h
search.lo: /usr/include/bits/posix2_lim.h
search.lo: /usr/include/signal.h
search.lo: /usr/include/bits/signum.h
search.lo: /usr/include/bits/siginfo.h
search.lo: /usr/include/bits/sigaction.h
search.lo: /usr/include/bits/sigcontext.h
search.lo: /usr/include/bits/sigstack.h
search.lo: /usr/include/sys/ucontext.h
search.lo: /usr/include/bits/sigthread.h
search.lo: /usr/include/bits/param.h
search.lo: /usr/include/linux/param.h
search.lo: /usr/include/asm/param.h
search.lo: /usr/include/asm-generic/param.h
search.lo: /usr/include/sys/bitypes.h
search.lo: /usr/include/arpa/nameser_compat.h
search.lo: /usr/include/netdb.h
search.lo: /usr/include/rpc/netdb.h
search.lo: /usr/include/bits/netdb.h
search.lo: /usr/include/resolv.h
search.lo: ../../../include/ac/string.h
search.lo: ../slap.h
search.lo: ../../../include/ldap_defaults.h
search.lo: ../../../include/ldap_config.h
search.lo: ../../../include/ac/stdlib.h
search.lo: /usr/include/stdlib.h
search.lo: /usr/include/bits/waitflags.h
search.lo: /usr/include/bits/waitstatus.h
search.lo: /usr/include/alloca.h
search.lo: /usr/include/bits/stdlib-float.h
search.lo: ../../../include/ac/syslog.h
search.lo: /usr/include/syslog.h
search.lo: /usr/include/sys/syslog.h
search.lo: /usr/include/bits/syslog-path.h
search.lo: ../../../include/ac/regex.h
search.lo: /usr/include/regex.h
search.lo: ../../../include/ac/signal.h
search.lo: ../../../include/ac/time.h
search.lo: /usr/include/sys/time.h
search.lo: ../../../include/ac/param.h
search.lo: ../../../include/ac/unistd.h
search.lo: /usr/include/unistd.h
search.lo: /usr/include/bits/posix_opt.h
search.lo: /usr/include/bits/environments.h
search.lo: /usr/include/bits/confname.h
search.lo: /usr/include/getopt.h
search.lo: ../../../include/lutil_lockf.h
search.lo: ../../../include/avl.h
search.lo: ../../../include/ldap_cdefs.h
search.lo: ../../../include/ldap_log.h
search.lo: ../../../include/ldap.h
search.lo: ../../../include/lber.h
search.lo: ../../../include/lber_types.h
search.lo: ../../../include/ldap_features.h
search.lo: ../../../include/ldap_schema.h
search.lo: ../../../include/lber_pvt.h
search.lo: ../../../include/ldap_pvt.h
search.lo: ../../../include/ldap_pvt_uc.h
search.lo: ../../../include/ac/bytes.h
search.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
search.lo: ../../../include/ldap_pvt_thread.h
search.lo: ../../../include/ldap_int_thread.h
search.lo: /usr/include/pthread.h
search.lo: /usr/include/sched.h
search.lo: /usr/include/bits/sched.h
search.lo: /usr/include/bits/setjmp.h
search.lo: ../../../include/ldap_queue.h
search.lo: ../proto-slap.h
search.lo: back-sock.h
search.lo: proto-sock.h
bind.lo: bind.c
bind.lo: /usr/include/stdc-predef.h
bind.lo: ../../../include/portable.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
bind.lo: ../../../include/ac/fdset.h
bind.lo: /usr/include/bits/types.h
bind.lo: /usr/include/features.h
bind.lo: /usr/include/sys/cdefs.h
bind.lo: /usr/include/bits/wordsize.h
bind.lo: /usr/include/gnu/stubs.h
bind.lo: /usr/include/gnu/stubs-64.h
bind.lo: /usr/include/bits/typesizes.h
bind.lo: ../../../include/ldap_cdefs.h
bind.lo: ../../../include/ldap_features.h
bind.lo: ../../../include/ac/assert.h
bind.lo: /usr/include/assert.h
bind.lo: ../../../include/ac/localize.h
bind.lo: /usr/include/stdio.h
bind.lo: /usr/include/libio.h
bind.lo: /usr/include/_G_config.h
bind.lo: /usr/include/wchar.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
bind.lo: /usr/include/bits/stdio_lim.h
bind.lo: /usr/include/bits/sys_errlist.h
bind.lo: ../../../include/ac/socket.h
bind.lo: /usr/include/sys/types.h
bind.lo: /usr/include/time.h
bind.lo: /usr/include/endian.h
bind.lo: /usr/include/bits/endian.h
bind.lo: /usr/include/bits/byteswap.h
bind.lo: /usr/include/bits/byteswap-16.h
bind.lo: /usr/include/sys/select.h
bind.lo: /usr/include/bits/select.h
bind.lo: /usr/include/bits/sigset.h
bind.lo: /usr/include/bits/time.h
bind.lo: /usr/include/sys/sysmacros.h
bind.lo: /usr/include/bits/pthreadtypes.h
bind.lo: /usr/include/poll.h
bind.lo: /usr/include/sys/poll.h
bind.lo: /usr/include/bits/poll.h
bind.lo: /usr/include/sys/socket.h
bind.lo: /usr/include/sys/uio.h
bind.lo: /usr/include/bits/uio.h
bind.lo: /usr/include/bits/socket.h
bind.lo: /usr/include/bits/socket_type.h
bind.lo: /usr/include/bits/sockaddr.h
bind.lo: /usr/include/asm/socket.h
bind.lo: /usr/include/asm-generic/socket.h
bind.lo: /usr/include/asm/sockios.h
bind.lo: /usr/include/asm-generic/sockios.h
bind.lo: /usr/include/sys/un.h
bind.lo: /usr/include/string.h
bind.lo: /usr/include/xlocale.h
bind.lo: /usr/include/netinet/in.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
bind.lo: /usr/include/stdint.h
bind.lo: /usr/include/bits/wchar.h
bind.lo: /usr/include/bits/in.h
bind.lo: /usr/include/netinet/tcp.h
bind.lo: /usr/include/arpa/inet.h
bind.lo: /usr/include/arpa/nameser.h
bind.lo: /usr/include/sys/param.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
bind.lo: /usr/include/limits.h
bind.lo: /usr/include/bits/posix1_lim.h
bind.lo: /usr/include/bits/local_lim.h
bind.lo: /usr/include/linux/limits.h
bind.lo: /usr/include/bits/posix2_lim.h
bind.lo: /usr/include/signal.h
bind.lo: /usr/include/bits/signum.h
bind.lo: /usr/include/bits/siginfo.h
bind.lo: /usr/include/bits/sigaction.h
bind.lo: /usr/include/bits/sigcontext.h
bind.lo: /usr/include/bits/sigstack.h
bind.lo: /usr/include/sys/ucontext.h
bind.lo: /usr/include/bits/sigthread.h
bind.lo: /usr/include/bits/param.h
bind.lo: /usr/include/linux/param.h
bind.lo: /usr/include/asm/param.h
bind.lo: /usr/include/asm-generic/param.h
bind.lo: /usr/include/sys/bitypes.h
bind.lo: /usr/include/arpa/nameser_compat.h
bind.lo: /usr/include/netdb.h
bind.lo: /usr/include/rpc/netdb.h
bind.lo: /usr/include/bits/netdb.h
bind.lo: /usr/include/resolv.h
bind.lo: ../../../include/ac/string.h
bind.lo: ../slap.h
bind.lo: ../../../include/ldap_defaults.h
bind.lo: ../../../include/ldap_config.h
bind.lo: ../../../include/ac/stdlib.h
bind.lo: /usr/include/stdlib.h
bind.lo: /usr/include/bits/waitflags.h
bind.lo: /usr/include/bits/waitstatus.h
bind.lo: /usr/include/alloca.h
bind.lo: /usr/include/bits/stdlib-float.h
bind.lo: ../../../include/ac/syslog.h
bind.lo: /usr/include/syslog.h
bind.lo: /usr/include/sys/syslog.h
bind.lo: /usr/include/bits/syslog-path.h
bind.lo: ../../../include/ac/regex.h
bind.lo: /usr/include/regex.h
bind.lo: ../../../include/ac/signal.h
bind.lo: ../../../include/ac/time.h
bind.lo: /usr/include/sys/time.h
bind.lo: ../../../include/ac/param.h
bind.lo: ../../../include/ac/unistd.h
bind.lo: /usr/include/unistd.h
bind.lo: /usr/include/bits/posix_opt.h
bind.lo: /usr/include/bits/environments.h
bind.lo: /usr/include/bits/confname.h
bind.lo: /usr/include/getopt.h
bind.lo: ../../../include/lutil_lockf.h
bind.lo: ../../../include/avl.h
bind.lo: ../../../include/ldap_cdefs.h
bind.lo: ../../../include/ldap_log.h
bind.lo: ../../../include/ldap.h
bind.lo: ../../../include/lber.h
bind.lo: ../../../include/lber_types.h
bind.lo: ../../../include/ldap_features.h
bind.lo: ../../../include/ldap_schema.h
bind.lo: ../../../include/lber_pvt.h
bind.lo: ../../../include/ldap_pvt.h
bind.lo: ../../../include/ldap_pvt_uc.h
bind.lo: ../../../include/ac/bytes.h
bind.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
bind.lo: ../../../include/ldap_pvt_thread.h
bind.lo: ../../../include/ldap_int_thread.h
bind.lo: /usr/include/pthread.h
bind.lo: /usr/include/sched.h
bind.lo: /usr/include/bits/sched.h
bind.lo: /usr/include/bits/setjmp.h
bind.lo: ../../../include/ldap_queue.h
bind.lo: ../proto-slap.h
bind.lo: back-sock.h
bind.lo: proto-sock.h
unbind.lo: unbind.c
unbind.lo: /usr/include/stdc-predef.h
unbind.lo: ../../../include/portable.h
unbind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
unbind.lo: ../../../include/ac/fdset.h
unbind.lo: /usr/include/bits/types.h
unbind.lo: /usr/include/features.h
unbind.lo: /usr/include/sys/cdefs.h
unbind.lo: /usr/include/bits/wordsize.h
unbind.lo: /usr/include/gnu/stubs.h
unbind.lo: /usr/include/gnu/stubs-64.h
unbind.lo: /usr/include/bits/typesizes.h
unbind.lo: ../../../include/ldap_cdefs.h
unbind.lo: ../../../include/ldap_features.h
unbind.lo: ../../../include/ac/assert.h
unbind.lo: /usr/include/assert.h
unbind.lo: ../../../include/ac/localize.h
unbind.lo: /usr/include/stdio.h
unbind.lo: /usr/include/libio.h
unbind.lo: /usr/include/_G_config.h
unbind.lo: /usr/include/wchar.h
unbind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
unbind.lo: /usr/include/bits/stdio_lim.h
unbind.lo: /usr/include/bits/sys_errlist.h
unbind.lo: ../../../include/ac/socket.h
unbind.lo: /usr/include/sys/types.h
unbind.lo: /usr/include/time.h
unbind.lo: /usr/include/endian.h
unbind.lo: /usr/include/bits/endian.h
unbind.lo: /usr/include/bits/byteswap.h
unbind.lo: /usr/include/bits/byteswap-16.h
unbind.lo: /usr/include/sys/select.h
unbind.lo: /usr/include/bits/select.h
unbind.lo: /usr/include/bits/sigset.h
unbind.lo: /usr/include/bits/time.h
unbind.lo: /usr/include/sys/sysmacros.h
unbind.lo: /usr/include/bits/pthreadtypes.h
unbind.lo: /usr/include/poll.h
unbind.lo: /usr/include/sys/poll.h
unbind.lo: /usr/include/bits/poll.h
unbind.lo: /usr/include/sys/socket.h
unbind.lo: /usr/include/sys/uio.h
unbind.lo: /usr/include/bits/uio.h
unbind.lo: /usr/include/bits/socket.h
unbind.lo: /usr/include/bits/socket_type.h
unbind.lo: /usr/include/bits/sockaddr.h
unbind.lo: /usr/include/asm/socket.h
unbind.lo: /usr/include/asm-generic/socket.h
unbind.lo: /usr/include/asm/sockios.h
unbind.lo: /usr/include/asm-generic/sockios.h
unbind.lo: /usr/include/sys/un.h
unbind.lo: /usr/include/string.h
unbind.lo: /usr/include/xlocale.h
unbind.lo: /usr/include/netinet/in.h
unbind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
unbind.lo: /usr/include/stdint.h
unbind.lo: /usr/include/bits/wchar.h
unbind.lo: /usr/include/bits/in.h
unbind.lo: /usr/include/netinet/tcp.h
unbind.lo: /usr/include/arpa/inet.h
unbind.lo: /usr/include/arpa/nameser.h
unbind.lo: /usr/include/sys/param.h
unbind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
unbind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
unbind.lo: /usr/include/limits.h
unbind.lo: /usr/include/bits/posix1_lim.h
unbind.lo: /usr/include/bits/local_lim.h
unbind.lo: /usr/include/linux/limits.h
unbind.lo: /usr/include/bits/posix2_lim.h
unbind.lo: /usr/include/signal.h
unbind.lo: /usr/include/bits/signum.h
unbind.lo: /usr/include/bits/siginfo.h
unbind.lo: /usr/include/bits/sigaction.h
unbind.lo: /usr/include/bits/sigcontext.h
unbind.lo: /usr/include/bits/sigstack.h
unbind.lo: /usr/include/sys/ucontext.h
unbind.lo: /usr/include/bits/sigthread.h
unbind.lo: /usr/include/bits/param.h
unbind.lo: /usr/include/linux/param.h
unbind.lo: /usr/include/asm/param.h
unbind.lo: /usr/include/asm-generic/param.h
unbind.lo: /usr/include/sys/bitypes.h
unbind.lo: /usr/include/arpa/nameser_compat.h
unbind.lo: /usr/include/netdb.h
unbind.lo: /usr/include/rpc/netdb.h
unbind.lo: /usr/include/bits/netdb.h
unbind.lo: /usr/include/resolv.h
unbind.lo: ../../../include/ac/string.h
unbind.lo: ../slap.h
unbind.lo: ../../../include/ldap_defaults.h
unbind.lo: ../../../include/ldap_config.h
unbind.lo: ../../../include/ac/stdlib.h
unbind.lo: /usr/include/stdlib.h
unbind.lo: /usr/include/bits/waitflags.h
unbind.lo: /usr/include/bits/waitstatus.h
unbind.lo: /usr/include/alloca.h
unbind.lo: /usr/include/bits/stdlib-float.h
unbind.lo: ../../../include/ac/syslog.h
unbind.lo: /usr/include/syslog.h
unbind.lo: /usr/include/sys/syslog.h
unbind.lo: /usr/include/bits/syslog-path.h
unbind.lo: ../../../include/ac/regex.h
unbind.lo: /usr/include/regex.h
unbind.lo: ../../../include/ac/signal.h
unbind.lo: ../../../include/ac/time.h
unbind.lo: /usr/include/sys/time.h
unbind.lo: ../../../include/ac/param.h
unbind.lo: ../../../include/ac/unistd.h
unbind.lo: /usr/include/unistd.h
unbind.lo: /usr/include/bits/posix_opt.h
unbind.lo: /usr/include/bits/environments.h
unbind.lo: /usr/include/bits/confname.h
unbind.lo: /usr/include/getopt.h
unbind.lo: ../../../include/lutil_lockf.h
unbind.lo: ../../../include/avl.h
unbind.lo: ../../../include/ldap_cdefs.h
unbind.lo: ../../../include/ldap_log.h
unbind.lo: ../../../include/ldap.h
unbind.lo: ../../../include/lber.h
unbind.lo: ../../../include/lber_types.h
unbind.lo: ../../../include/ldap_features.h
unbind.lo: ../../../include/ldap_schema.h
unbind.lo: ../../../include/lber_pvt.h
unbind.lo: ../../../include/ldap_pvt.h
unbind.lo: ../../../include/ldap_pvt_uc.h
unbind.lo: ../../../include/ac/bytes.h
unbind.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
unbind.lo: ../../../include/ldap_pvt_thread.h
unbind.lo: ../../../include/ldap_int_thread.h
unbind.lo: /usr/include/pthread.h
unbind.lo: /usr/include/sched.h
unbind.lo: /usr/include/bits/sched.h
unbind.lo: /usr/include/bits/setjmp.h
unbind.lo: ../../../include/ldap_queue.h
unbind.lo: ../proto-slap.h
unbind.lo: back-sock.h
unbind.lo: proto-sock.h
add.lo: add.c
add.lo: /usr/include/stdc-predef.h
add.lo: ../../../include/portable.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
add.lo: ../../../include/ac/fdset.h
add.lo: /usr/include/bits/types.h
add.lo: /usr/include/features.h
add.lo: /usr/include/sys/cdefs.h
add.lo: /usr/include/bits/wordsize.h
add.lo: /usr/include/gnu/stubs.h
add.lo: /usr/include/gnu/stubs-64.h
add.lo: /usr/include/bits/typesizes.h
add.lo: ../../../include/ldap_cdefs.h
add.lo: ../../../include/ldap_features.h
add.lo: ../../../include/ac/assert.h
add.lo: /usr/include/assert.h
add.lo: ../../../include/ac/localize.h
add.lo: /usr/include/stdio.h
add.lo: /usr/include/libio.h
add.lo: /usr/include/_G_config.h
add.lo: /usr/include/wchar.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
add.lo: /usr/include/bits/stdio_lim.h
add.lo: /usr/include/bits/sys_errlist.h
add.lo: ../../../include/ac/string.h
add.lo: /usr/include/string.h
add.lo: /usr/include/xlocale.h
add.lo: ../../../include/ac/socket.h
add.lo: /usr/include/sys/types.h
add.lo: /usr/include/time.h
add.lo: /usr/include/endian.h
add.lo: /usr/include/bits/endian.h
add.lo: /usr/include/bits/byteswap.h
add.lo: /usr/include/bits/byteswap-16.h
add.lo: /usr/include/sys/select.h
add.lo: /usr/include/bits/select.h
add.lo: /usr/include/bits/sigset.h
add.lo: /usr/include/bits/time.h
add.lo: /usr/include/sys/sysmacros.h
add.lo: /usr/include/bits/pthreadtypes.h
add.lo: /usr/include/poll.h
add.lo: /usr/include/sys/poll.h
add.lo: /usr/include/bits/poll.h
add.lo: /usr/include/sys/socket.h
add.lo: /usr/include/sys/uio.h
add.lo: /usr/include/bits/uio.h
add.lo: /usr/include/bits/socket.h
add.lo: /usr/include/bits/socket_type.h
add.lo: /usr/include/bits/sockaddr.h
add.lo: /usr/include/asm/socket.h
add.lo: /usr/include/asm-generic/socket.h
add.lo: /usr/include/asm/sockios.h
add.lo: /usr/include/asm-generic/sockios.h
add.lo: /usr/include/sys/un.h
add.lo: /usr/include/netinet/in.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
add.lo: /usr/include/stdint.h
add.lo: /usr/include/bits/wchar.h
add.lo: /usr/include/bits/in.h
add.lo: /usr/include/netinet/tcp.h
add.lo: /usr/include/arpa/inet.h
add.lo: /usr/include/arpa/nameser.h
add.lo: /usr/include/sys/param.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
add.lo: /usr/include/limits.h
add.lo: /usr/include/bits/posix1_lim.h
add.lo: /usr/include/bits/local_lim.h
add.lo: /usr/include/linux/limits.h
add.lo: /usr/include/bits/posix2_lim.h
add.lo: /usr/include/signal.h
add.lo: /usr/include/bits/signum.h
add.lo: /usr/include/bits/siginfo.h
add.lo: /usr/include/bits/sigaction.h
add.lo: /usr/include/bits/sigcontext.h
add.lo: /usr/include/bits/sigstack.h
add.lo: /usr/include/sys/ucontext.h
add.lo: /usr/include/bits/sigthread.h
add.lo: /usr/include/bits/param.h
add.lo: /usr/include/linux/param.h
add.lo: /usr/include/asm/param.h
add.lo: /usr/include/asm-generic/param.h
add.lo: /usr/include/sys/bitypes.h
add.lo: /usr/include/arpa/nameser_compat.h
add.lo: /usr/include/netdb.h
add.lo: /usr/include/rpc/netdb.h
add.lo: /usr/include/bits/netdb.h
add.lo: /usr/include/resolv.h
add.lo: ../slap.h
add.lo: ../../../include/ldap_defaults.h
add.lo: ../../../include/ldap_config.h
add.lo: ../../../include/ac/stdlib.h
add.lo: /usr/include/stdlib.h
add.lo: /usr/include/bits/waitflags.h
add.lo: /usr/include/bits/waitstatus.h
add.lo: /usr/include/alloca.h
add.lo: /usr/include/bits/stdlib-float.h
add.lo: ../../../include/ac/syslog.h
add.lo: /usr/include/syslog.h
add.lo: /usr/include/sys/syslog.h
add.lo: /usr/include/bits/syslog-path.h
add.lo: ../../../include/ac/regex.h
add.lo: /usr/include/regex.h
add.lo: ../../../include/ac/signal.h
add.lo: ../../../include/ac/time.h
add.lo: /usr/include/sys/time.h
add.lo: ../../../include/ac/param.h
add.lo: ../../../include/ac/unistd.h
add.lo: /usr/include/unistd.h
add.lo: /usr/include/bits/posix_opt.h
add.lo: /usr/include/bits/environments.h
add.lo: /usr/include/bits/confname.h
add.lo: /usr/include/getopt.h
add.lo: ../../../include/lutil_lockf.h
add.lo: ../../../include/avl.h
add.lo: ../../../include/ldap_cdefs.h
add.lo: ../../../include/ldap_log.h
add.lo: ../../../include/ldap.h
add.lo: ../../../include/lber.h
add.lo: ../../../include/lber_types.h
add.lo: ../../../include/ldap_features.h
add.lo: ../../../include/ldap_schema.h
add.lo: ../../../include/lber_pvt.h
add.lo: ../../../include/ldap_pvt.h
add.lo: ../../../include/ldap_pvt_uc.h
add.lo: ../../../include/ac/bytes.h
add.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
add.lo: ../../../include/ldap_pvt_thread.h
add.lo: ../../../include/ldap_int_thread.h
add.lo: /usr/include/pthread.h
add.lo: /usr/include/sched.h
add.lo: /usr/include/bits/sched.h
add.lo: /usr/include/bits/setjmp.h
add.lo: ../../../include/ldap_queue.h
add.lo: ../proto-slap.h
add.lo: back-sock.h
add.lo: proto-sock.h
delete.lo: delete.c
delete.lo: /usr/include/stdc-predef.h
delete.lo: ../../../include/portable.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
delete.lo: ../../../include/ac/fdset.h
delete.lo: /usr/include/bits/types.h
delete.lo: /usr/include/features.h
delete.lo: /usr/include/sys/cdefs.h
delete.lo: /usr/include/bits/wordsize.h
delete.lo: /usr/include/gnu/stubs.h
delete.lo: /usr/include/gnu/stubs-64.h
delete.lo: /usr/include/bits/typesizes.h
delete.lo: ../../../include/ldap_cdefs.h
delete.lo: ../../../include/ldap_features.h
delete.lo: ../../../include/ac/assert.h
delete.lo: /usr/include/assert.h
delete.lo: ../../../include/ac/localize.h
delete.lo: /usr/include/stdio.h
delete.lo: /usr/include/libio.h
delete.lo: /usr/include/_G_config.h
delete.lo: /usr/include/wchar.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
delete.lo: /usr/include/bits/stdio_lim.h
delete.lo: /usr/include/bits/sys_errlist.h
delete.lo: ../../../include/ac/string.h
delete.lo: /usr/include/string.h
delete.lo: /usr/include/xlocale.h
delete.lo: ../../../include/ac/socket.h
delete.lo: /usr/include/sys/types.h
delete.lo: /usr/include/time.h
delete.lo: /usr/include/endian.h
delete.lo: /usr/include/bits/endian.h
delete.lo: /usr/include/bits/byteswap.h
delete.lo: /usr/include/bits/byteswap-16.h
delete.lo: /usr/include/sys/select.h
delete.lo: /usr/include/bits/select.h
delete.lo: /usr/include/bits/sigset.h
delete.lo: /usr/include/bits/time.h
delete.lo: /usr/include/sys/sysmacros.h
delete.lo: /usr/include/bits/pthreadtypes.h
delete.lo: /usr/include/poll.h
delete.lo: /usr/include/sys/poll.h
delete.lo: /usr/include/bits/poll.h
delete.lo: /usr/include/sys/socket.h
delete.lo: /usr/include/sys/uio.h
delete.lo: /usr/include/bits/uio.h
delete.lo: /usr/include/bits/socket.h
delete.lo: /usr/include/bits/socket_type.h
delete.lo: /usr/include/bits/sockaddr.h
delete.lo: /usr/include/asm/socket.h
delete.lo: /usr/include/asm-generic/socket.h
delete.lo: /usr/include/asm/sockios.h
delete.lo: /usr/include/asm-generic/sockios.h
delete.lo: /usr/include/sys/un.h
delete.lo: /usr/include/netinet/in.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
delete.lo: /usr/include/stdint.h
delete.lo: /usr/include/bits/wchar.h
delete.lo: /usr/include/bits/in.h
delete.lo: /usr/include/netinet/tcp.h
delete.lo: /usr/include/arpa/inet.h
delete.lo: /usr/include/arpa/nameser.h
delete.lo: /usr/include/sys/param.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
delete.lo: /usr/include/limits.h
delete.lo: /usr/include/bits/posix1_lim.h
delete.lo: /usr/include/bits/local_lim.h
delete.lo: /usr/include/linux/limits.h
delete.lo: /usr/include/bits/posix2_lim.h
delete.lo: /usr/include/signal.h
delete.lo: /usr/include/bits/signum.h
delete.lo: /usr/include/bits/siginfo.h
delete.lo: /usr/include/bits/sigaction.h
delete.lo: /usr/include/bits/sigcontext.h
delete.lo: /usr/include/bits/sigstack.h
delete.lo: /usr/include/sys/ucontext.h
delete.lo: /usr/include/bits/sigthread.h
delete.lo: /usr/include/bits/param.h
delete.lo: /usr/include/linux/param.h
delete.lo: /usr/include/asm/param.h
delete.lo: /usr/include/asm-generic/param.h
delete.lo: /usr/include/sys/bitypes.h
delete.lo: /usr/include/arpa/nameser_compat.h
delete.lo: /usr/include/netdb.h
delete.lo: /usr/include/rpc/netdb.h
delete.lo: /usr/include/bits/netdb.h
delete.lo: /usr/include/resolv.h
delete.lo: ../slap.h
delete.lo: ../../../include/ldap_defaults.h
delete.lo: ../../../include/ldap_config.h
delete.lo: ../../../include/ac/stdlib.h
delete.lo: /usr/include/stdlib.h
delete.lo: /usr/include/bits/waitflags.h
delete.lo: /usr/include/bits/waitstatus.h
delete.lo: /usr/include/alloca.h
delete.lo: /usr/include/bits/stdlib-float.h
delete.lo: ../../../include/ac/syslog.h
delete.lo: /usr/include/syslog.h
delete.lo: /usr/include/sys/syslog.h
delete.lo: /usr/include/bits/syslog-path.h
delete.lo: ../../../include/ac/regex.h
delete.lo: /usr/include/regex.h
delete.lo: ../../../include/ac/signal.h
delete.lo: ../../../include/ac/time.h
delete.lo: /usr/include/sys/time.h
delete.lo: ../../../include/ac/param.h
delete.lo: ../../../include/ac/unistd.h
delete.lo: /usr/include/unistd.h
delete.lo: /usr/include/bits/posix_opt.h
delete.lo: /usr/include/bits/environments.h
delete.lo: /usr/include/bits/confname.h
delete.lo: /usr/include/getopt.h
delete.lo: ../../../include/lutil_lockf.h
delete.lo: ../../../include/avl.h
delete.lo: ../../../include/ldap_cdefs.h
delete.lo: ../../../include/ldap_log.h
delete.lo: ../../../include/ldap.h
delete.lo: ../../../include/lber.h
delete.lo: ../../../include/lber_types.h
delete.lo: ../../../include/ldap_features.h
delete.lo: ../../../include/ldap_schema.h
delete.lo: ../../../include/lber_pvt.h
delete.lo: ../../../include/ldap_pvt.h
delete.lo: ../../../include/ldap_pvt_uc.h
delete.lo: ../../../include/ac/bytes.h
delete.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
delete.lo: ../../../include/ldap_pvt_thread.h
delete.lo: ../../../include/ldap_int_thread.h
delete.lo: /usr/include/pthread.h
delete.lo: /usr/include/sched.h
delete.lo: /usr/include/bits/sched.h
delete.lo: /usr/include/bits/setjmp.h
delete.lo: ../../../include/ldap_queue.h
delete.lo: ../proto-slap.h
delete.lo: back-sock.h
delete.lo: proto-sock.h
modify.lo: modify.c
modify.lo: /usr/include/stdc-predef.h
modify.lo: ../../../include/portable.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
modify.lo: ../../../include/ac/fdset.h
modify.lo: /usr/include/bits/types.h
modify.lo: /usr/include/features.h
modify.lo: /usr/include/sys/cdefs.h
modify.lo: /usr/include/bits/wordsize.h
modify.lo: /usr/include/gnu/stubs.h
modify.lo: /usr/include/gnu/stubs-64.h
modify.lo: /usr/include/bits/typesizes.h
modify.lo: ../../../include/ldap_cdefs.h
modify.lo: ../../../include/ldap_features.h
modify.lo: ../../../include/ac/assert.h
modify.lo: /usr/include/assert.h
modify.lo: ../../../include/ac/localize.h
modify.lo: /usr/include/stdio.h
modify.lo: /usr/include/libio.h
modify.lo: /usr/include/_G_config.h
modify.lo: /usr/include/wchar.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
modify.lo: /usr/include/bits/stdio_lim.h
modify.lo: /usr/include/bits/sys_errlist.h
modify.lo: ../../../include/ac/string.h
modify.lo: /usr/include/string.h
modify.lo: /usr/include/xlocale.h
modify.lo: ../../../include/ac/socket.h
modify.lo: /usr/include/sys/types.h
modify.lo: /usr/include/time.h
modify.lo: /usr/include/endian.h
modify.lo: /usr/include/bits/endian.h
modify.lo: /usr/include/bits/byteswap.h
modify.lo: /usr/include/bits/byteswap-16.h
modify.lo: /usr/include/sys/select.h
modify.lo: /usr/include/bits/select.h
modify.lo: /usr/include/bits/sigset.h
modify.lo: /usr/include/bits/time.h
modify.lo: /usr/include/sys/sysmacros.h
modify.lo: /usr/include/bits/pthreadtypes.h
modify.lo: /usr/include/poll.h
modify.lo: /usr/include/sys/poll.h
modify.lo: /usr/include/bits/poll.h
modify.lo: /usr/include/sys/socket.h
modify.lo: /usr/include/sys/uio.h
modify.lo: /usr/include/bits/uio.h
modify.lo: /usr/include/bits/socket.h
modify.lo: /usr/include/bits/socket_type.h
modify.lo: /usr/include/bits/sockaddr.h
modify.lo: /usr/include/asm/socket.h
modify.lo: /usr/include/asm-generic/socket.h
modify.lo: /usr/include/asm/sockios.h
modify.lo: /usr/include/asm-generic/sockios.h
modify.lo: /usr/include/sys/un.h
modify.lo: /usr/include/netinet/in.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
modify.lo: /usr/include/stdint.h
modify.lo: /usr/include/bits/wchar.h
modify.lo: /usr/include/bits/in.h
modify.lo: /usr/include/netinet/tcp.h
modify.lo: /usr/include/arpa/inet.h
modify.lo: /usr/include/arpa/nameser.h
modify.lo: /usr/include/sys/param.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
modify.lo: /usr/include/limits.h
modify.lo: /usr/include/bits/posix1_lim.h
modify.lo: /usr/include/bits/local_lim.h
modify.lo: /usr/include/linux/limits.h
modify.lo: /usr/include/bits/posix2_lim.h
modify.lo: /usr/include/signal.h
modify.lo: /usr/include/bits/signum.h
modify.lo: /usr/include/bits/siginfo.h
modify.lo: /usr/include/bits/sigaction.h
modify.lo: /usr/include/bits/sigcontext.h
modify.lo: /usr/include/bits/sigstack.h
modify.lo: /usr/include/sys/ucontext.h
modify.lo: /usr/include/bits/sigthread.h
modify.lo: /usr/include/bits/param.h
modify.lo: /usr/include/linux/param.h
modify.lo: /usr/include/asm/param.h
modify.lo: /usr/include/asm-generic/param.h
modify.lo: /usr/include/sys/bitypes.h
modify.lo: /usr/include/arpa/nameser_compat.h
modify.lo: /usr/include/netdb.h
modify.lo: /usr/include/rpc/netdb.h
modify.lo: /usr/include/bits/netdb.h
modify.lo: /usr/include/resolv.h
modify.lo: ../slap.h
modify.lo: ../../../include/ldap_defaults.h
modify.lo: ../../../include/ldap_config.h
modify.lo: ../../../include/ac/stdlib.h
modify.lo: /usr/include/stdlib.h
modify.lo: /usr/include/bits/waitflags.h
modify.lo: /usr/include/bits/waitstatus.h
modify.lo: /usr/include/alloca.h
modify.lo: /usr/include/bits/stdlib-float.h
modify.lo: ../../../include/ac/syslog.h
modify.lo: /usr/include/syslog.h
modify.lo: /usr/include/sys/syslog.h
modify.lo: /usr/include/bits/syslog-path.h
modify.lo: ../../../include/ac/regex.h
modify.lo: /usr/include/regex.h
modify.lo: ../../../include/ac/signal.h
modify.lo: ../../../include/ac/time.h
modify.lo: /usr/include/sys/time.h
modify.lo: ../../../include/ac/param.h
modify.lo: ../../../include/ac/unistd.h
modify.lo: /usr/include/unistd.h
modify.lo: /usr/include/bits/posix_opt.h
modify.lo: /usr/include/bits/environments.h
modify.lo: /usr/include/bits/confname.h
modify.lo: /usr/include/getopt.h
modify.lo: ../../../include/lutil_lockf.h
modify.lo: ../../../include/avl.h
modify.lo: ../../../include/ldap_cdefs.h
modify.lo: ../../../include/ldap_log.h
modify.lo: ../../../include/ldap.h
modify.lo: ../../../include/lber.h
modify.lo: ../../../include/lber_types.h
modify.lo: ../../../include/ldap_features.h
modify.lo: ../../../include/ldap_schema.h
modify.lo: ../../../include/lber_pvt.h
modify.lo: ../../../include/ldap_pvt.h
modify.lo: ../../../include/ldap_pvt_uc.h
modify.lo: ../../../include/ac/bytes.h
modify.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
modify.lo: ../../../include/ldap_pvt_thread.h
modify.lo: ../../../include/ldap_int_thread.h
modify.lo: /usr/include/pthread.h
modify.lo: /usr/include/sched.h
modify.lo: /usr/include/bits/sched.h
modify.lo: /usr/include/bits/setjmp.h
modify.lo: ../../../include/ldap_queue.h
modify.lo: ../proto-slap.h
modify.lo: back-sock.h
modify.lo: proto-sock.h
modify.lo: ../../../include/ldif.h
modrdn.lo: modrdn.c
modrdn.lo: /usr/include/stdc-predef.h
modrdn.lo: ../../../include/portable.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
modrdn.lo: ../../../include/ac/fdset.h
modrdn.lo: /usr/include/bits/types.h
modrdn.lo: /usr/include/features.h
modrdn.lo: /usr/include/sys/cdefs.h
modrdn.lo: /usr/include/bits/wordsize.h
modrdn.lo: /usr/include/gnu/stubs.h
modrdn.lo: /usr/include/gnu/stubs-64.h
modrdn.lo: /usr/include/bits/typesizes.h
modrdn.lo: ../../../include/ldap_cdefs.h
modrdn.lo: ../../../include/ldap_features.h
modrdn.lo: ../../../include/ac/assert.h
modrdn.lo: /usr/include/assert.h
modrdn.lo: ../../../include/ac/localize.h
modrdn.lo: /usr/include/stdio.h
modrdn.lo: /usr/include/libio.h
modrdn.lo: /usr/include/_G_config.h
modrdn.lo: /usr/include/wchar.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
modrdn.lo: /usr/include/bits/stdio_lim.h
modrdn.lo: /usr/include/bits/sys_errlist.h
modrdn.lo: ../../../include/ac/socket.h
modrdn.lo: /usr/include/sys/types.h
modrdn.lo: /usr/include/time.h
modrdn.lo: /usr/include/endian.h
modrdn.lo: /usr/include/bits/endian.h
modrdn.lo: /usr/include/bits/byteswap.h
modrdn.lo: /usr/include/bits/byteswap-16.h
modrdn.lo: /usr/include/sys/select.h
modrdn.lo: /usr/include/bits/select.h
modrdn.lo: /usr/include/bits/sigset.h
modrdn.lo: /usr/include/bits/time.h
modrdn.lo: /usr/include/sys/sysmacros.h
modrdn.lo: /usr/include/bits/pthreadtypes.h
modrdn.lo: /usr/include/poll.h
modrdn.lo: /usr/include/sys/poll.h
modrdn.lo: /usr/include/bits/poll.h
modrdn.lo: /usr/include/sys/socket.h
modrdn.lo: /usr/include/sys/uio.h
modrdn.lo: /usr/include/bits/uio.h
modrdn.lo: /usr/include/bits/socket.h
modrdn.lo: /usr/include/bits/socket_type.h
modrdn.lo: /usr/include/bits/sockaddr.h
modrdn.lo: /usr/include/asm/socket.h
modrdn.lo: /usr/include/asm-generic/socket.h
modrdn.lo: /usr/include/asm/sockios.h
modrdn.lo: /usr/include/asm-generic/sockios.h
modrdn.lo: /usr/include/sys/un.h
modrdn.lo: /usr/include/string.h
modrdn.lo: /usr/include/xlocale.h
modrdn.lo: /usr/include/netinet/in.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
modrdn.lo: /usr/include/stdint.h
modrdn.lo: /usr/include/bits/wchar.h
modrdn.lo: /usr/include/bits/in.h
modrdn.lo: /usr/include/netinet/tcp.h
modrdn.lo: /usr/include/arpa/inet.h
modrdn.lo: /usr/include/arpa/nameser.h
modrdn.lo: /usr/include/sys/param.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
modrdn.lo: /usr/include/limits.h
modrdn.lo: /usr/include/bits/posix1_lim.h
modrdn.lo: /usr/include/bits/local_lim.h
modrdn.lo: /usr/include/linux/limits.h
modrdn.lo: /usr/include/bits/posix2_lim.h
modrdn.lo: /usr/include/signal.h
modrdn.lo: /usr/include/bits/signum.h
modrdn.lo: /usr/include/bits/siginfo.h
modrdn.lo: /usr/include/bits/sigaction.h
modrdn.lo: /usr/include/bits/sigcontext.h
modrdn.lo: /usr/include/bits/sigstack.h
modrdn.lo: /usr/include/sys/ucontext.h
modrdn.lo: /usr/include/bits/sigthread.h
modrdn.lo: /usr/include/bits/param.h
modrdn.lo: /usr/include/linux/param.h
modrdn.lo: /usr/include/asm/param.h
modrdn.lo: /usr/include/asm-generic/param.h
modrdn.lo: /usr/include/sys/bitypes.h
modrdn.lo: /usr/include/arpa/nameser_compat.h
modrdn.lo: /usr/include/netdb.h
modrdn.lo: /usr/include/rpc/netdb.h
modrdn.lo: /usr/include/bits/netdb.h
modrdn.lo: /usr/include/resolv.h
modrdn.lo: ../../../include/ac/string.h
modrdn.lo: ../slap.h
modrdn.lo: ../../../include/ldap_defaults.h
modrdn.lo: ../../../include/ldap_config.h
modrdn.lo: ../../../include/ac/stdlib.h
modrdn.lo: /usr/include/stdlib.h
modrdn.lo: /usr/include/bits/waitflags.h
modrdn.lo: /usr/include/bits/waitstatus.h
modrdn.lo: /usr/include/alloca.h
modrdn.lo: /usr/include/bits/stdlib-float.h
modrdn.lo: ../../../include/ac/syslog.h
modrdn.lo: /usr/include/syslog.h
modrdn.lo: /usr/include/sys/syslog.h
modrdn.lo: /usr/include/bits/syslog-path.h
modrdn.lo: ../../../include/ac/regex.h
modrdn.lo: /usr/include/regex.h
modrdn.lo: ../../../include/ac/signal.h
modrdn.lo: ../../../include/ac/time.h
modrdn.lo: /usr/include/sys/time.h
modrdn.lo: ../../../include/ac/param.h
modrdn.lo: ../../../include/ac/unistd.h
modrdn.lo: /usr/include/unistd.h
modrdn.lo: /usr/include/bits/posix_opt.h
modrdn.lo: /usr/include/bits/environments.h
modrdn.lo: /usr/include/bits/confname.h
modrdn.lo: /usr/include/getopt.h
modrdn.lo: ../../../include/lutil_lockf.h
modrdn.lo: ../../../include/avl.h
modrdn.lo: ../../../include/ldap_cdefs.h
modrdn.lo: ../../../include/ldap_log.h
modrdn.lo: ../../../include/ldap.h
modrdn.lo: ../../../include/lber.h
modrdn.lo: ../../../include/lber_types.h
modrdn.lo: ../../../include/ldap_features.h
modrdn.lo: ../../../include/ldap_schema.h
modrdn.lo: ../../../include/lber_pvt.h
modrdn.lo: ../../../include/ldap_pvt.h
modrdn.lo: ../../../include/ldap_pvt_uc.h
modrdn.lo: ../../../include/ac/bytes.h
modrdn.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
modrdn.lo: ../../../include/ldap_pvt_thread.h
modrdn.lo: ../../../include/ldap_int_thread.h
modrdn.lo: /usr/include/pthread.h
modrdn.lo: /usr/include/sched.h
modrdn.lo: /usr/include/bits/sched.h
modrdn.lo: /usr/include/bits/setjmp.h
modrdn.lo: ../../../include/ldap_queue.h
modrdn.lo: ../proto-slap.h
modrdn.lo: back-sock.h
modrdn.lo: proto-sock.h
compare.lo: compare.c
compare.lo: /usr/include/stdc-predef.h
compare.lo: ../../../include/portable.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
compare.lo: ../../../include/ac/fdset.h
compare.lo: /usr/include/bits/types.h
compare.lo: /usr/include/features.h
compare.lo: /usr/include/sys/cdefs.h
compare.lo: /usr/include/bits/wordsize.h
compare.lo: /usr/include/gnu/stubs.h
compare.lo: /usr/include/gnu/stubs-64.h
compare.lo: /usr/include/bits/typesizes.h
compare.lo: ../../../include/ldap_cdefs.h
compare.lo: ../../../include/ldap_features.h
compare.lo: ../../../include/ac/assert.h
compare.lo: /usr/include/assert.h
compare.lo: ../../../include/ac/localize.h
compare.lo: /usr/include/stdio.h
compare.lo: /usr/include/libio.h
compare.lo: /usr/include/_G_config.h
compare.lo: /usr/include/wchar.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
compare.lo: /usr/include/bits/stdio_lim.h
compare.lo: /usr/include/bits/sys_errlist.h
compare.lo: ../../../include/ac/string.h
compare.lo: /usr/include/string.h
compare.lo: /usr/include/xlocale.h
compare.lo: ../../../include/ac/socket.h
compare.lo: /usr/include/sys/types.h
compare.lo: /usr/include/time.h
compare.lo: /usr/include/endian.h
compare.lo: /usr/include/bits/endian.h
compare.lo: /usr/include/bits/byteswap.h
compare.lo: /usr/include/bits/byteswap-16.h
compare.lo: /usr/include/sys/select.h
compare.lo: /usr/include/bits/select.h
compare.lo: /usr/include/bits/sigset.h
compare.lo: /usr/include/bits/time.h
compare.lo: /usr/include/sys/sysmacros.h
compare.lo: /usr/include/bits/pthreadtypes.h
compare.lo: /usr/include/poll.h
compare.lo: /usr/include/sys/poll.h
compare.lo: /usr/include/bits/poll.h
compare.lo: /usr/include/sys/socket.h
compare.lo: /usr/include/sys/uio.h
compare.lo: /usr/include/bits/uio.h
compare.lo: /usr/include/bits/socket.h
compare.lo: /usr/include/bits/socket_type.h
compare.lo: /usr/include/bits/sockaddr.h
compare.lo: /usr/include/asm/socket.h
compare.lo: /usr/include/asm-generic/socket.h
compare.lo: /usr/include/asm/sockios.h
compare.lo: /usr/include/asm-generic/sockios.h
compare.lo: /usr/include/sys/un.h
compare.lo: /usr/include/netinet/in.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
compare.lo: /usr/include/stdint.h
compare.lo: /usr/include/bits/wchar.h
compare.lo: /usr/include/bits/in.h
compare.lo: /usr/include/netinet/tcp.h
compare.lo: /usr/include/arpa/inet.h
compare.lo: /usr/include/arpa/nameser.h
compare.lo: /usr/include/sys/param.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
compare.lo: /usr/include/limits.h
compare.lo: /usr/include/bits/posix1_lim.h
compare.lo: /usr/include/bits/local_lim.h
compare.lo: /usr/include/linux/limits.h
compare.lo: /usr/include/bits/posix2_lim.h
compare.lo: /usr/include/signal.h
compare.lo: /usr/include/bits/signum.h
compare.lo: /usr/include/bits/siginfo.h
compare.lo: /usr/include/bits/sigaction.h
compare.lo: /usr/include/bits/sigcontext.h
compare.lo: /usr/include/bits/sigstack.h
compare.lo: /usr/include/sys/ucontext.h
compare.lo: /usr/include/bits/sigthread.h
compare.lo: /usr/include/bits/param.h
compare.lo: /usr/include/linux/param.h
compare.lo: /usr/include/asm/param.h
compare.lo: /usr/include/asm-generic/param.h
compare.lo: /usr/include/sys/bitypes.h
compare.lo: /usr/include/arpa/nameser_compat.h
compare.lo: /usr/include/netdb.h
compare.lo: /usr/include/rpc/netdb.h
compare.lo: /usr/include/bits/netdb.h
compare.lo: /usr/include/resolv.h
compare.lo: ../slap.h
compare.lo: ../../../include/ldap_defaults.h
compare.lo: ../../../include/ldap_config.h
compare.lo: ../../../include/ac/stdlib.h
compare.lo: /usr/include/stdlib.h
compare.lo: /usr/include/bits/waitflags.h
compare.lo: /usr/include/bits/waitstatus.h
compare.lo: /usr/include/alloca.h
compare.lo: /usr/include/bits/stdlib-float.h
compare.lo: ../../../include/ac/syslog.h
compare.lo: /usr/include/syslog.h
compare.lo: /usr/include/sys/syslog.h
compare.lo: /usr/include/bits/syslog-path.h
compare.lo: ../../../include/ac/regex.h
compare.lo: /usr/include/regex.h
compare.lo: ../../../include/ac/signal.h
compare.lo: ../../../include/ac/time.h
compare.lo: /usr/include/sys/time.h
compare.lo: ../../../include/ac/param.h
compare.lo: ../../../include/ac/unistd.h
compare.lo: /usr/include/unistd.h
compare.lo: /usr/include/bits/posix_opt.h
compare.lo: /usr/include/bits/environments.h
compare.lo: /usr/include/bits/confname.h
compare.lo: /usr/include/getopt.h
compare.lo: ../../../include/lutil_lockf.h
compare.lo: ../../../include/avl.h
compare.lo: ../../../include/ldap_cdefs.h
compare.lo: ../../../include/ldap_log.h
compare.lo: ../../../include/ldap.h
compare.lo: ../../../include/lber.h
compare.lo: ../../../include/lber_types.h
compare.lo: ../../../include/ldap_features.h
compare.lo: ../../../include/ldap_schema.h
compare.lo: ../../../include/lber_pvt.h
compare.lo: ../../../include/ldap_pvt.h
compare.lo: ../../../include/ldap_pvt_uc.h
compare.lo: ../../../include/ac/bytes.h
compare.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
compare.lo: ../../../include/ldap_pvt_thread.h
compare.lo: ../../../include/ldap_int_thread.h
compare.lo: /usr/include/pthread.h
compare.lo: /usr/include/sched.h
compare.lo: /usr/include/bits/sched.h
compare.lo: /usr/include/bits/setjmp.h
compare.lo: ../../../include/ldap_queue.h
compare.lo: ../proto-slap.h
compare.lo: back-sock.h
compare.lo: proto-sock.h
compare.lo: ../../../include/ldif.h
result.lo: result.c
result.lo: /usr/include/stdc-predef.h
result.lo: ../../../include/portable.h
result.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
result.lo: ../../../include/ac/fdset.h
result.lo: /usr/include/bits/types.h
result.lo: /usr/include/features.h
result.lo: /usr/include/sys/cdefs.h
result.lo: /usr/include/bits/wordsize.h
result.lo: /usr/include/gnu/stubs.h
result.lo: /usr/include/gnu/stubs-64.h
result.lo: /usr/include/bits/typesizes.h
result.lo: ../../../include/ldap_cdefs.h
result.lo: ../../../include/ldap_features.h
result.lo: ../../../include/ac/assert.h
result.lo: /usr/include/assert.h
result.lo: ../../../include/ac/localize.h
result.lo: /usr/include/stdio.h
result.lo: /usr/include/libio.h
result.lo: /usr/include/_G_config.h
result.lo: /usr/include/wchar.h
result.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
result.lo: /usr/include/bits/stdio_lim.h
result.lo: /usr/include/bits/sys_errlist.h
result.lo: ../../../include/ac/errno.h
result.lo: /usr/include/errno.h
result.lo: /usr/include/bits/errno.h
result.lo: /usr/include/linux/errno.h
result.lo: /usr/include/asm/errno.h
result.lo: /usr/include/asm-generic/errno.h
result.lo: /usr/include/asm-generic/errno-base.h
result.lo: ../../../include/ac/string.h
result.lo: /usr/include/string.h
result.lo: /usr/include/xlocale.h
result.lo: ../../../include/ac/socket.h
result.lo: /usr/include/sys/types.h
result.lo: /usr/include/time.h
result.lo: /usr/include/endian.h
result.lo: /usr/include/bits/endian.h
result.lo: /usr/include/bits/byteswap.h
result.lo: /usr/include/bits/byteswap-16.h
result.lo: /usr/include/sys/select.h
result.lo: /usr/include/bits/select.h
result.lo: /usr/include/bits/sigset.h
result.lo: /usr/include/bits/time.h
result.lo: /usr/include/sys/sysmacros.h
result.lo: /usr/include/bits/pthreadtypes.h
result.lo: /usr/include/poll.h
result.lo: /usr/include/sys/poll.h
result.lo: /usr/include/bits/poll.h
result.lo: /usr/include/sys/socket.h
result.lo: /usr/include/sys/uio.h
result.lo: /usr/include/bits/uio.h
result.lo: /usr/include/bits/socket.h
result.lo: /usr/include/bits/socket_type.h
result.lo: /usr/include/bits/sockaddr.h
result.lo: /usr/include/asm/socket.h
result.lo: /usr/include/asm-generic/socket.h
result.lo: /usr/include/asm/sockios.h
result.lo: /usr/include/asm-generic/sockios.h
result.lo: /usr/include/sys/un.h
result.lo: /usr/include/netinet/in.h
result.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
result.lo: /usr/include/stdint.h
result.lo: /usr/include/bits/wchar.h
result.lo: /usr/include/bits/in.h
result.lo: /usr/include/netinet/tcp.h
result.lo: /usr/include/arpa/inet.h
result.lo: /usr/include/arpa/nameser.h
result.lo: /usr/include/sys/param.h
result.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
result.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
result.lo: /usr/include/limits.h
result.lo: /usr/include/bits/posix1_lim.h
result.lo: /usr/include/bits/local_lim.h
result.lo: /usr/include/linux/limits.h
result.lo: /usr/include/bits/posix2_lim.h
result.lo: /usr/include/signal.h
result.lo: /usr/include/bits/signum.h
result.lo: /usr/include/bits/siginfo.h
result.lo: /usr/include/bits/sigaction.h
result.lo: /usr/include/bits/sigcontext.h
result.lo: /usr/include/bits/sigstack.h
result.lo: /usr/include/sys/ucontext.h
result.lo: /usr/include/bits/sigthread.h
result.lo: /usr/include/bits/param.h
result.lo: /usr/include/linux/param.h
result.lo: /usr/include/asm/param.h
result.lo: /usr/include/asm-generic/param.h
result.lo: /usr/include/sys/bitypes.h
result.lo: /usr/include/arpa/nameser_compat.h
result.lo: /usr/include/netdb.h
result.lo: /usr/include/rpc/netdb.h
result.lo: /usr/include/bits/netdb.h
result.lo: /usr/include/resolv.h
result.lo: ../../../include/ac/unistd.h
result.lo: /usr/include/unistd.h
result.lo: /usr/include/bits/posix_opt.h
result.lo: /usr/include/bits/environments.h
result.lo: /usr/include/bits/confname.h
result.lo: /usr/include/getopt.h
result.lo: ../../../include/lutil_lockf.h
result.lo: ../slap.h
result.lo: ../../../include/ldap_defaults.h
result.lo: ../../../include/ldap_config.h
result.lo: ../../../include/ac/stdlib.h
result.lo: /usr/include/stdlib.h
result.lo: /usr/include/bits/waitflags.h
result.lo: /usr/include/bits/waitstatus.h
result.lo: /usr/include/alloca.h
result.lo: /usr/include/bits/stdlib-float.h
result.lo: ../../../include/ac/syslog.h
result.lo: /usr/include/syslog.h
result.lo: /usr/include/sys/syslog.h
result.lo: /usr/include/bits/syslog-path.h
result.lo: ../../../include/ac/regex.h
result.lo: /usr/include/regex.h
result.lo: ../../../include/ac/signal.h
result.lo: ../../../include/ac/time.h
result.lo: /usr/include/sys/time.h
result.lo: ../../../include/ac/param.h
result.lo: ../../../include/avl.h
result.lo: ../../../include/ldap_cdefs.h
result.lo: ../../../include/ldap_log.h
result.lo: ../../../include/ldap.h
result.lo: ../../../include/lber.h
result.lo: ../../../include/lber_types.h
result.lo: ../../../include/ldap_features.h
result.lo: ../../../include/ldap_schema.h
result.lo: ../../../include/lber_pvt.h
result.lo: ../../../include/ldap_pvt.h
result.lo: ../../../include/ldap_pvt_uc.h
result.lo: ../../../include/ac/bytes.h
result.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
result.lo: ../../../include/ldap_pvt_thread.h
result.lo: ../../../include/ldap_int_thread.h
result.lo: /usr/include/pthread.h
result.lo: /usr/include/sched.h
result.lo: /usr/include/bits/sched.h
result.lo: /usr/include/bits/setjmp.h
result.lo: ../../../include/ldap_queue.h
result.lo: ../proto-slap.h
result.lo: back-sock.h
result.lo: proto-sock.h

# IF YOU PUT ANYTHING HERE IT WILL GO AWAY
