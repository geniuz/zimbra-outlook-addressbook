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

# Makefile.in for back-dnssrv
# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 1998-2016 The OpenLDAP Foundation.
## Portions Copyright 1998-2003 Kurt D. Zeilenga.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.
#
# ACKNOWLEDGEMENTS:
#  The DNSSRV backend was written by Kurt D. Zeilenga.
#

SRCS	= init.c bind.c search.c config.c referral.c
OBJS	= init.lo bind.lo search.lo config.lo referral.lo

LDAP_INCDIR= ../../../include       
LDAP_LIBDIR= ../../../libraries

BUILD_OPT = "--enable-dnssrv"
BUILD_MOD = mod

mod_DEFS = -DSLAPD_IMPORT
MOD_DEFS = $(mod_DEFS)

shared_LDAP_LIBS = $(LDAP_LIBLDAP_R_LA) $(LDAP_LIBLBER_LA)
NT_LINK_LIBS = -L.. -lslapd $(shared_LDAP_LIBS)
UNIX_LINK_LIBS = $(shared_LDAP_LIBS)

LIBBASE = back_dnssrv

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
# files: -I../../../include -I../../../include -I.. -I./.. -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include init.c bind.c search.c config.c referral.c
# command: cc -M -I.  -I../../../include -I../../../include -I.. -I./.. -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include init.c bind.c search.c config.c referral.c
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
init.lo: ../../../include/ac/param.h
init.lo: ../../../include/ac/unistd.h
init.lo: /usr/include/unistd.h
init.lo: /usr/include/bits/posix_opt.h
init.lo: /usr/include/bits/environments.h
init.lo: /usr/include/bits/confname.h
init.lo: /usr/include/getopt.h
init.lo: ../../../include/lutil_lockf.h
init.lo: ../../../include/ac/string.h
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
init.lo: ../config.h
init.lo: proto-dnssrv.h
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
bind.lo: proto-dnssrv.h
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
search.lo: ../../../include/ac/time.h
search.lo: /usr/include/sys/time.h
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
search.lo: proto-dnssrv.h
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
config.lo: proto-dnssrv.h
referral.lo: referral.c
referral.lo: /usr/include/stdc-predef.h
referral.lo: ../../../include/portable.h
referral.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
referral.lo: ../../../include/ac/fdset.h
referral.lo: /usr/include/bits/types.h
referral.lo: /usr/include/features.h
referral.lo: /usr/include/sys/cdefs.h
referral.lo: /usr/include/bits/wordsize.h
referral.lo: /usr/include/gnu/stubs.h
referral.lo: /usr/include/gnu/stubs-64.h
referral.lo: /usr/include/bits/typesizes.h
referral.lo: ../../../include/ldap_cdefs.h
referral.lo: ../../../include/ldap_features.h
referral.lo: ../../../include/ac/assert.h
referral.lo: /usr/include/assert.h
referral.lo: ../../../include/ac/localize.h
referral.lo: /usr/include/stdio.h
referral.lo: /usr/include/libio.h
referral.lo: /usr/include/_G_config.h
referral.lo: /usr/include/wchar.h
referral.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
referral.lo: /usr/include/bits/stdio_lim.h
referral.lo: /usr/include/bits/sys_errlist.h
referral.lo: ../../../include/ac/string.h
referral.lo: /usr/include/string.h
referral.lo: /usr/include/xlocale.h
referral.lo: ../../../include/ac/socket.h
referral.lo: /usr/include/sys/types.h
referral.lo: /usr/include/time.h
referral.lo: /usr/include/endian.h
referral.lo: /usr/include/bits/endian.h
referral.lo: /usr/include/bits/byteswap.h
referral.lo: /usr/include/bits/byteswap-16.h
referral.lo: /usr/include/sys/select.h
referral.lo: /usr/include/bits/select.h
referral.lo: /usr/include/bits/sigset.h
referral.lo: /usr/include/bits/time.h
referral.lo: /usr/include/sys/sysmacros.h
referral.lo: /usr/include/bits/pthreadtypes.h
referral.lo: /usr/include/poll.h
referral.lo: /usr/include/sys/poll.h
referral.lo: /usr/include/bits/poll.h
referral.lo: /usr/include/sys/socket.h
referral.lo: /usr/include/sys/uio.h
referral.lo: /usr/include/bits/uio.h
referral.lo: /usr/include/bits/socket.h
referral.lo: /usr/include/bits/socket_type.h
referral.lo: /usr/include/bits/sockaddr.h
referral.lo: /usr/include/asm/socket.h
referral.lo: /usr/include/asm-generic/socket.h
referral.lo: /usr/include/asm/sockios.h
referral.lo: /usr/include/asm-generic/sockios.h
referral.lo: /usr/include/sys/un.h
referral.lo: /usr/include/netinet/in.h
referral.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
referral.lo: /usr/include/stdint.h
referral.lo: /usr/include/bits/wchar.h
referral.lo: /usr/include/bits/in.h
referral.lo: /usr/include/netinet/tcp.h
referral.lo: /usr/include/arpa/inet.h
referral.lo: /usr/include/arpa/nameser.h
referral.lo: /usr/include/sys/param.h
referral.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
referral.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
referral.lo: /usr/include/limits.h
referral.lo: /usr/include/bits/posix1_lim.h
referral.lo: /usr/include/bits/local_lim.h
referral.lo: /usr/include/linux/limits.h
referral.lo: /usr/include/bits/posix2_lim.h
referral.lo: /usr/include/signal.h
referral.lo: /usr/include/bits/signum.h
referral.lo: /usr/include/bits/siginfo.h
referral.lo: /usr/include/bits/sigaction.h
referral.lo: /usr/include/bits/sigcontext.h
referral.lo: /usr/include/bits/sigstack.h
referral.lo: /usr/include/sys/ucontext.h
referral.lo: /usr/include/bits/sigthread.h
referral.lo: /usr/include/bits/param.h
referral.lo: /usr/include/linux/param.h
referral.lo: /usr/include/asm/param.h
referral.lo: /usr/include/asm-generic/param.h
referral.lo: /usr/include/sys/bitypes.h
referral.lo: /usr/include/arpa/nameser_compat.h
referral.lo: /usr/include/netdb.h
referral.lo: /usr/include/rpc/netdb.h
referral.lo: /usr/include/bits/netdb.h
referral.lo: /usr/include/resolv.h
referral.lo: ../slap.h
referral.lo: ../../../include/ldap_defaults.h
referral.lo: ../../../include/ldap_config.h
referral.lo: ../../../include/ac/stdlib.h
referral.lo: /usr/include/stdlib.h
referral.lo: /usr/include/bits/waitflags.h
referral.lo: /usr/include/bits/waitstatus.h
referral.lo: /usr/include/alloca.h
referral.lo: /usr/include/bits/stdlib-float.h
referral.lo: ../../../include/ac/syslog.h
referral.lo: /usr/include/syslog.h
referral.lo: /usr/include/sys/syslog.h
referral.lo: /usr/include/bits/syslog-path.h
referral.lo: ../../../include/ac/regex.h
referral.lo: /usr/include/regex.h
referral.lo: ../../../include/ac/signal.h
referral.lo: ../../../include/ac/time.h
referral.lo: /usr/include/sys/time.h
referral.lo: ../../../include/ac/param.h
referral.lo: ../../../include/ac/unistd.h
referral.lo: /usr/include/unistd.h
referral.lo: /usr/include/bits/posix_opt.h
referral.lo: /usr/include/bits/environments.h
referral.lo: /usr/include/bits/confname.h
referral.lo: /usr/include/getopt.h
referral.lo: ../../../include/lutil_lockf.h
referral.lo: ../../../include/avl.h
referral.lo: ../../../include/ldap_cdefs.h
referral.lo: ../../../include/ldap_log.h
referral.lo: ../../../include/ldap.h
referral.lo: ../../../include/lber.h
referral.lo: ../../../include/lber_types.h
referral.lo: ../../../include/ldap_features.h
referral.lo: ../../../include/ldap_schema.h
referral.lo: ../../../include/lber_pvt.h
referral.lo: ../../../include/ldap_pvt.h
referral.lo: ../../../include/ldap_pvt_uc.h
referral.lo: ../../../include/ac/bytes.h
referral.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
referral.lo: ../../../include/ldap_pvt_thread.h
referral.lo: ../../../include/ldap_int_thread.h
referral.lo: /usr/include/pthread.h
referral.lo: /usr/include/sched.h
referral.lo: /usr/include/bits/sched.h
referral.lo: /usr/include/bits/setjmp.h
referral.lo: ../../../include/ldap_queue.h
referral.lo: ../proto-slap.h
referral.lo: proto-dnssrv.h

# IF YOU PUT ANYTHING HERE IT WILL GO AWAY
