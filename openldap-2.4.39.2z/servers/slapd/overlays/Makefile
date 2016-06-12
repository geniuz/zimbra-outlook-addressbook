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

# Makefile.in for overlays
# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 2003-2016 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.

SRCS = overlays.c \
	accesslog.c \
	auditlog.c \
	constraint.c \
	dds.c \
	deref.c \
	dyngroup.c \
	dynlist.c \
	memberof.c \
	pcache.c \
	collect.c \
	ppolicy.c \
	refint.c \
	retcode.c \
	rwm.c rwmconf.c rwmdn.c rwmmap.c \
	seqmod.c \
	sssvlv.c \
	syncprov.c \
	translucent.c \
	unique.c \
	valsort.c
OBJS = statover.o \
	 sssvlv.o \
	overlays.o

# Add here the objs that are needed by overlays, but do not make it
# into SLAPD_STATIC_OVERLAYS...
OBJDEP=rwm.o rwmconf.o rwmdn.o rwmmap.o

LTONLY_MOD = $(LTONLY_mod)
LDAP_INCDIR= ../../../include       
LDAP_LIBDIR= ../../../libraries

MOD_DEFS = -DSLAPD_IMPORT

shared_LDAP_LIBS = $(LDAP_LIBLDAP_R_LA) $(LDAP_LIBLBER_LA)
NT_LINK_LIBS = -L.. -lslapd $(shared_LDAP_LIBS)
UNIX_LINK_LIBS = $(shared_LDAP_LIBS)

LIBRARY = ../liboverlays.a
PROGRAMS =  accesslog.la auditlog.la collect.la constraint.la dds.la deref.la dyngroup.la dynlist.la memberof.la ppolicy.la pcache.la refint.la retcode.la rwm.la seqmod.la syncprov.la translucent.la unique.la valsort.la

XINCPATH = -I.. -I$(srcdir)/..
XDEFS = $(MODULES_CPPFLAGS)

static:	$(LIBRARY)

dynamic: $(PROGRAMS)

accesslog.la : accesslog.lo
	$(LTLINK_MOD) -module -o $@ accesslog.lo version.lo $(LINK_LIBS)

auditlog.la : auditlog.lo
	$(LTLINK_MOD) -module -o $@ auditlog.lo version.lo $(LINK_LIBS)

constraint.la : constraint.lo
	$(LTLINK_MOD) -module -o $@ constraint.lo version.lo $(LINK_LIBS)

dds.la : dds.lo
	$(LTLINK_MOD) -module -o $@ dds.lo version.lo $(LINK_LIBS)

deref.la : deref.lo
	$(LTLINK_MOD) -module -o $@ deref.lo version.lo $(LINK_LIBS)

dyngroup.la : dyngroup.lo
	$(LTLINK_MOD) -module -o $@ dyngroup.lo version.lo $(LINK_LIBS)

dynlist.la : dynlist.lo
	$(LTLINK_MOD) -module -o $@ dynlist.lo version.lo $(LINK_LIBS)

memberof.la : memberof.lo
	$(LTLINK_MOD) -module -o $@ memberof.lo version.lo $(LINK_LIBS)

pcache.la : pcache.lo
	$(LTLINK_MOD) -module -o $@ pcache.lo version.lo $(LINK_LIBS)

collect.la : collect.lo
	$(LTLINK_MOD) -module -o $@ collect.lo version.lo $(LINK_LIBS)

ppolicy.la : ppolicy.lo
	$(LTLINK_MOD) -module -o $@ ppolicy.lo version.lo $(LINK_LIBS) $(MODULES_LIBS)

refint.la : refint.lo
	$(LTLINK_MOD) -module -o $@ refint.lo version.lo $(LINK_LIBS)

retcode.la : retcode.lo
	$(LTLINK_MOD) -module -o $@ retcode.lo version.lo $(LINK_LIBS)

rwm_x.o: rwm.o rwmconf.o rwmdn.o rwmmap.o
	$(LD) -r -o $@ rwm.o rwmconf.o rwmdn.o rwmmap.o

rwm.la : rwm.lo rwmconf.lo rwmdn.lo rwmmap.lo
	$(LTLINK_MOD) -module -o $@ rwm.lo rwmconf.lo rwmdn.lo rwmmap.lo version.lo $(LINK_LIBS)

seqmod.la : seqmod.lo
	$(LTLINK_MOD) -module -o $@ seqmod.lo version.lo $(LINK_LIBS)

sssvlv.la : sssvlv.lo
	$(LTLINK_MOD) -module -o $@ sssvlv.lo version.lo $(LINK_LIBS)

syncprov.la : syncprov.lo
	$(LTLINK_MOD) -module -o $@ syncprov.lo version.lo $(LINK_LIBS)

translucent.la : translucent.lo
	$(LTLINK_MOD) -module -o $@ translucent.lo version.lo $(LINK_LIBS)

unique.la : unique.lo
	$(LTLINK_MOD) -module -o $@ unique.lo version.lo $(LINK_LIBS)

valsort.la : valsort.lo
	$(LTLINK_MOD) -module -o $@ valsort.lo version.lo $(LINK_LIBS)

install-local:	$(PROGRAMS)
	@if test -n "$?" ; then \
		$(MKDIR) $(DESTDIR)$(moduledir); \
		$(LTINSTALL) $(INSTALLFLAGS) -m 755 $? $(DESTDIR)$(moduledir);\
	fi

MKDEPFLAG = -l

.SUFFIXES: .c .o .lo

.c.lo:
	$(LTCOMPILE_MOD) $<

statover.o: statover.c $(srcdir)/../slap.h

$(LIBRARY): $(OBJS) version.lo
	$(AR) rs $@ $(OBJS)

# Must fixup depends for non-libtool objects
depend-local: depend-common
	@if test -n "$(OBJS)"; then \
	OBJ2=`echo $(OBJS) $(OBJDEP) | $(SED) -e 's/\.o//g'`; \
	SCR=''; for i in $$OBJ2; do SCR="$$SCR -e s/^$$i.lo:/$$i.o:/"; done; \
	mv Makefile Makefile.bak; $(SED) $$SCR Makefile.bak > Makefile && \
	$(RM) Makefile.bak; fi

veryclean-local:
	$(RM) statover.c

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
# Makefile Template for Libraries
#

all-common: $(LIBRARY) $(PROGRAMS)

version.c: Makefile
	$(RM) $@
	$(MKVERSION) $(LIBRARY) > $@

version.o version.lo: version.c $(OBJS)

install-common: FORCE

lint: lint-local FORCE
	$(LINT) $(DEFS) $(DEFINES) $(SRCS)

lint5: lint5-local FORCE
	$(5LINT) $(DEFS) $(DEFINES) $(SRCS)

#
# In the mingw/cygwin environment, the so and dll files must be
# deleted separately, instead of using the {.so*,*.dll} construct
# that was previously used. It just didn't work.
#
clean-common: 	FORCE
	$(RM) $(LIBRARY) ../$(LIBRARY) $(XLIBRARY) \
		$(PROGRAMS) $(XPROGRAMS) $(XSRCS) $(XXSRCS) \
		*.o *.lo a.out *.exe core version.c .libs/*

depend-common: FORCE
	$(MKDEP) $(DEFS) $(DEFINES) $(SRCS) $(XXSRCS)

lint-local: FORCE
lint5-local: FORCE

Makefile: $(top_srcdir)/build/lib.mk

# DO NOT DELETE THIS LINE -- mkdep uses it.
# DO NOT PUT ANYTHING AFTER THIS LINE, IT WILL GO AWAY.


#
# files: -I../../../include -I../../../include -I.. -I./.. -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include overlays.c accesslog.c auditlog.c constraint.c dds.c deref.c dyngroup.c dynlist.c memberof.c pcache.c collect.c ppolicy.c refint.c retcode.c rwm.c rwmconf.c rwmdn.c rwmmap.c seqmod.c sssvlv.c syncprov.c translucent.c unique.c valsort.c
# command: cc -M -I.  -I../../../include -I../../../include -I.. -I./.. -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include overlays.c accesslog.c auditlog.c constraint.c dds.c deref.c dyngroup.c dynlist.c memberof.c pcache.c collect.c ppolicy.c refint.c retcode.c rwm.c rwmconf.c rwmdn.c rwmmap.c seqmod.c sssvlv.c syncprov.c translucent.c unique.c valsort.c
#

overlays.o: overlays.c
overlays.o: /usr/include/stdc-predef.h
overlays.o: ../../../include/portable.h
overlays.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
overlays.o: ../../../include/ac/fdset.h
overlays.o: /usr/include/bits/types.h
overlays.o: /usr/include/features.h
overlays.o: /usr/include/sys/cdefs.h
overlays.o: /usr/include/bits/wordsize.h
overlays.o: /usr/include/gnu/stubs.h
overlays.o: /usr/include/gnu/stubs-64.h
overlays.o: /usr/include/bits/typesizes.h
overlays.o: ../../../include/ldap_cdefs.h
overlays.o: ../../../include/ldap_features.h
overlays.o: ../../../include/ac/assert.h
overlays.o: /usr/include/assert.h
overlays.o: ../../../include/ac/localize.h
overlays.o: ../slap.h
overlays.o: ../../../include/ldap_defaults.h
overlays.o: ../../../include/ldap_config.h
overlays.o: /usr/include/stdio.h
overlays.o: /usr/include/libio.h
overlays.o: /usr/include/_G_config.h
overlays.o: /usr/include/wchar.h
overlays.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
overlays.o: /usr/include/bits/stdio_lim.h
overlays.o: /usr/include/bits/sys_errlist.h
overlays.o: ../../../include/ac/stdlib.h
overlays.o: /usr/include/stdlib.h
overlays.o: /usr/include/bits/waitflags.h
overlays.o: /usr/include/bits/waitstatus.h
overlays.o: /usr/include/endian.h
overlays.o: /usr/include/bits/endian.h
overlays.o: /usr/include/bits/byteswap.h
overlays.o: /usr/include/bits/byteswap-16.h
overlays.o: /usr/include/sys/types.h
overlays.o: /usr/include/time.h
overlays.o: /usr/include/sys/select.h
overlays.o: /usr/include/bits/select.h
overlays.o: /usr/include/bits/sigset.h
overlays.o: /usr/include/bits/time.h
overlays.o: /usr/include/sys/sysmacros.h
overlays.o: /usr/include/bits/pthreadtypes.h
overlays.o: /usr/include/alloca.h
overlays.o: /usr/include/bits/stdlib-float.h
overlays.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
overlays.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
overlays.o: /usr/include/limits.h
overlays.o: /usr/include/bits/posix1_lim.h
overlays.o: /usr/include/bits/local_lim.h
overlays.o: /usr/include/linux/limits.h
overlays.o: /usr/include/bits/posix2_lim.h
overlays.o: ../../../include/ac/syslog.h
overlays.o: /usr/include/syslog.h
overlays.o: /usr/include/sys/syslog.h
overlays.o: /usr/include/bits/syslog-path.h
overlays.o: ../../../include/ac/regex.h
overlays.o: /usr/include/regex.h
overlays.o: ../../../include/ac/signal.h
overlays.o: /usr/include/signal.h
overlays.o: /usr/include/bits/signum.h
overlays.o: /usr/include/bits/siginfo.h
overlays.o: /usr/include/bits/sigaction.h
overlays.o: /usr/include/bits/sigcontext.h
overlays.o: /usr/include/bits/sigstack.h
overlays.o: /usr/include/sys/ucontext.h
overlays.o: /usr/include/bits/sigthread.h
overlays.o: ../../../include/ac/socket.h
overlays.o: /usr/include/poll.h
overlays.o: /usr/include/sys/poll.h
overlays.o: /usr/include/bits/poll.h
overlays.o: /usr/include/sys/socket.h
overlays.o: /usr/include/sys/uio.h
overlays.o: /usr/include/bits/uio.h
overlays.o: /usr/include/bits/socket.h
overlays.o: /usr/include/bits/socket_type.h
overlays.o: /usr/include/bits/sockaddr.h
overlays.o: /usr/include/asm/socket.h
overlays.o: /usr/include/asm-generic/socket.h
overlays.o: /usr/include/asm/sockios.h
overlays.o: /usr/include/asm-generic/sockios.h
overlays.o: /usr/include/sys/un.h
overlays.o: /usr/include/string.h
overlays.o: /usr/include/xlocale.h
overlays.o: /usr/include/netinet/in.h
overlays.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
overlays.o: /usr/include/stdint.h
overlays.o: /usr/include/bits/wchar.h
overlays.o: /usr/include/bits/in.h
overlays.o: /usr/include/netinet/tcp.h
overlays.o: /usr/include/arpa/inet.h
overlays.o: /usr/include/arpa/nameser.h
overlays.o: /usr/include/sys/param.h
overlays.o: /usr/include/bits/param.h
overlays.o: /usr/include/linux/param.h
overlays.o: /usr/include/asm/param.h
overlays.o: /usr/include/asm-generic/param.h
overlays.o: /usr/include/sys/bitypes.h
overlays.o: /usr/include/arpa/nameser_compat.h
overlays.o: /usr/include/netdb.h
overlays.o: /usr/include/rpc/netdb.h
overlays.o: /usr/include/bits/netdb.h
overlays.o: /usr/include/resolv.h
overlays.o: ../../../include/ac/time.h
overlays.o: /usr/include/sys/time.h
overlays.o: ../../../include/ac/param.h
overlays.o: ../../../include/ac/unistd.h
overlays.o: /usr/include/unistd.h
overlays.o: /usr/include/bits/posix_opt.h
overlays.o: /usr/include/bits/environments.h
overlays.o: /usr/include/bits/confname.h
overlays.o: /usr/include/getopt.h
overlays.o: ../../../include/lutil_lockf.h
overlays.o: ../../../include/avl.h
overlays.o: ../../../include/ldap_cdefs.h
overlays.o: ../../../include/ldap_log.h
overlays.o: ../../../include/ldap.h
overlays.o: ../../../include/lber.h
overlays.o: ../../../include/lber_types.h
overlays.o: ../../../include/ldap_features.h
overlays.o: ../../../include/ldap_schema.h
overlays.o: ../../../include/lber_pvt.h
overlays.o: ../../../include/ldap_pvt.h
overlays.o: ../../../include/ldap_pvt_uc.h
overlays.o: ../../../include/ac/bytes.h
overlays.o: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
overlays.o: ../../../include/ldap_pvt_thread.h
overlays.o: ../../../include/ldap_int_thread.h
overlays.o: /usr/include/pthread.h
overlays.o: /usr/include/sched.h
overlays.o: /usr/include/bits/sched.h
overlays.o: /usr/include/bits/setjmp.h
overlays.o: ../../../include/ldap_queue.h
overlays.o: ../proto-slap.h
accesslog.lo: accesslog.c
accesslog.lo: /usr/include/stdc-predef.h
accesslog.lo: ../../../include/portable.h
accesslog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
accesslog.lo: ../../../include/ac/fdset.h
accesslog.lo: /usr/include/bits/types.h
accesslog.lo: /usr/include/features.h
accesslog.lo: /usr/include/sys/cdefs.h
accesslog.lo: /usr/include/bits/wordsize.h
accesslog.lo: /usr/include/gnu/stubs.h
accesslog.lo: /usr/include/gnu/stubs-64.h
accesslog.lo: /usr/include/bits/typesizes.h
accesslog.lo: ../../../include/ldap_cdefs.h
accesslog.lo: ../../../include/ldap_features.h
accesslog.lo: ../../../include/ac/assert.h
accesslog.lo: /usr/include/assert.h
accesslog.lo: ../../../include/ac/localize.h
accesslog.lo: /usr/include/stdio.h
accesslog.lo: /usr/include/libio.h
accesslog.lo: /usr/include/_G_config.h
accesslog.lo: /usr/include/wchar.h
accesslog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
accesslog.lo: /usr/include/bits/stdio_lim.h
accesslog.lo: /usr/include/bits/sys_errlist.h
accesslog.lo: ../../../include/ac/string.h
accesslog.lo: /usr/include/string.h
accesslog.lo: /usr/include/xlocale.h
accesslog.lo: ../../../include/ac/ctype.h
accesslog.lo: /usr/include/ctype.h
accesslog.lo: /usr/include/endian.h
accesslog.lo: /usr/include/bits/endian.h
accesslog.lo: /usr/include/bits/byteswap.h
accesslog.lo: /usr/include/bits/byteswap-16.h
accesslog.lo: ../slap.h
accesslog.lo: ../../../include/ldap_defaults.h
accesslog.lo: ../../../include/ldap_config.h
accesslog.lo: ../../../include/ac/stdlib.h
accesslog.lo: /usr/include/stdlib.h
accesslog.lo: /usr/include/bits/waitflags.h
accesslog.lo: /usr/include/bits/waitstatus.h
accesslog.lo: /usr/include/sys/types.h
accesslog.lo: /usr/include/time.h
accesslog.lo: /usr/include/sys/select.h
accesslog.lo: /usr/include/bits/select.h
accesslog.lo: /usr/include/bits/sigset.h
accesslog.lo: /usr/include/bits/time.h
accesslog.lo: /usr/include/sys/sysmacros.h
accesslog.lo: /usr/include/bits/pthreadtypes.h
accesslog.lo: /usr/include/alloca.h
accesslog.lo: /usr/include/bits/stdlib-float.h
accesslog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
accesslog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
accesslog.lo: /usr/include/limits.h
accesslog.lo: /usr/include/bits/posix1_lim.h
accesslog.lo: /usr/include/bits/local_lim.h
accesslog.lo: /usr/include/linux/limits.h
accesslog.lo: /usr/include/bits/posix2_lim.h
accesslog.lo: ../../../include/ac/syslog.h
accesslog.lo: /usr/include/syslog.h
accesslog.lo: /usr/include/sys/syslog.h
accesslog.lo: /usr/include/bits/syslog-path.h
accesslog.lo: ../../../include/ac/regex.h
accesslog.lo: /usr/include/regex.h
accesslog.lo: ../../../include/ac/signal.h
accesslog.lo: /usr/include/signal.h
accesslog.lo: /usr/include/bits/signum.h
accesslog.lo: /usr/include/bits/siginfo.h
accesslog.lo: /usr/include/bits/sigaction.h
accesslog.lo: /usr/include/bits/sigcontext.h
accesslog.lo: /usr/include/bits/sigstack.h
accesslog.lo: /usr/include/sys/ucontext.h
accesslog.lo: /usr/include/bits/sigthread.h
accesslog.lo: ../../../include/ac/socket.h
accesslog.lo: /usr/include/poll.h
accesslog.lo: /usr/include/sys/poll.h
accesslog.lo: /usr/include/bits/poll.h
accesslog.lo: /usr/include/sys/socket.h
accesslog.lo: /usr/include/sys/uio.h
accesslog.lo: /usr/include/bits/uio.h
accesslog.lo: /usr/include/bits/socket.h
accesslog.lo: /usr/include/bits/socket_type.h
accesslog.lo: /usr/include/bits/sockaddr.h
accesslog.lo: /usr/include/asm/socket.h
accesslog.lo: /usr/include/asm-generic/socket.h
accesslog.lo: /usr/include/asm/sockios.h
accesslog.lo: /usr/include/asm-generic/sockios.h
accesslog.lo: /usr/include/sys/un.h
accesslog.lo: /usr/include/netinet/in.h
accesslog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
accesslog.lo: /usr/include/stdint.h
accesslog.lo: /usr/include/bits/wchar.h
accesslog.lo: /usr/include/bits/in.h
accesslog.lo: /usr/include/netinet/tcp.h
accesslog.lo: /usr/include/arpa/inet.h
accesslog.lo: /usr/include/arpa/nameser.h
accesslog.lo: /usr/include/sys/param.h
accesslog.lo: /usr/include/bits/param.h
accesslog.lo: /usr/include/linux/param.h
accesslog.lo: /usr/include/asm/param.h
accesslog.lo: /usr/include/asm-generic/param.h
accesslog.lo: /usr/include/sys/bitypes.h
accesslog.lo: /usr/include/arpa/nameser_compat.h
accesslog.lo: /usr/include/netdb.h
accesslog.lo: /usr/include/rpc/netdb.h
accesslog.lo: /usr/include/bits/netdb.h
accesslog.lo: /usr/include/resolv.h
accesslog.lo: ../../../include/ac/time.h
accesslog.lo: /usr/include/sys/time.h
accesslog.lo: ../../../include/ac/param.h
accesslog.lo: ../../../include/ac/unistd.h
accesslog.lo: /usr/include/unistd.h
accesslog.lo: /usr/include/bits/posix_opt.h
accesslog.lo: /usr/include/bits/environments.h
accesslog.lo: /usr/include/bits/confname.h
accesslog.lo: /usr/include/getopt.h
accesslog.lo: ../../../include/lutil_lockf.h
accesslog.lo: ../../../include/avl.h
accesslog.lo: ../../../include/ldap_cdefs.h
accesslog.lo: ../../../include/ldap_log.h
accesslog.lo: ../../../include/ldap.h
accesslog.lo: ../../../include/lber.h
accesslog.lo: ../../../include/lber_types.h
accesslog.lo: ../../../include/ldap_features.h
accesslog.lo: ../../../include/ldap_schema.h
accesslog.lo: ../../../include/lber_pvt.h
accesslog.lo: ../../../include/ldap_pvt.h
accesslog.lo: ../../../include/ldap_pvt_uc.h
accesslog.lo: ../../../include/ac/bytes.h
accesslog.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
accesslog.lo: ../../../include/ldap_pvt_thread.h
accesslog.lo: ../../../include/ldap_int_thread.h
accesslog.lo: /usr/include/pthread.h
accesslog.lo: /usr/include/sched.h
accesslog.lo: /usr/include/bits/sched.h
accesslog.lo: /usr/include/bits/setjmp.h
accesslog.lo: ../../../include/ldap_queue.h
accesslog.lo: ../proto-slap.h
accesslog.lo: ../config.h
accesslog.lo: ../../../include/lutil.h
accesslog.lo: ../../../include/ldap_rq.h
auditlog.lo: auditlog.c
auditlog.lo: /usr/include/stdc-predef.h
auditlog.lo: ../../../include/portable.h
auditlog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
auditlog.lo: ../../../include/ac/fdset.h
auditlog.lo: /usr/include/bits/types.h
auditlog.lo: /usr/include/features.h
auditlog.lo: /usr/include/sys/cdefs.h
auditlog.lo: /usr/include/bits/wordsize.h
auditlog.lo: /usr/include/gnu/stubs.h
auditlog.lo: /usr/include/gnu/stubs-64.h
auditlog.lo: /usr/include/bits/typesizes.h
auditlog.lo: ../../../include/ldap_cdefs.h
auditlog.lo: ../../../include/ldap_features.h
auditlog.lo: ../../../include/ac/assert.h
auditlog.lo: /usr/include/assert.h
auditlog.lo: ../../../include/ac/localize.h
auditlog.lo: /usr/include/stdio.h
auditlog.lo: /usr/include/libio.h
auditlog.lo: /usr/include/_G_config.h
auditlog.lo: /usr/include/wchar.h
auditlog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
auditlog.lo: /usr/include/bits/stdio_lim.h
auditlog.lo: /usr/include/bits/sys_errlist.h
auditlog.lo: ../../../include/ac/string.h
auditlog.lo: /usr/include/string.h
auditlog.lo: /usr/include/xlocale.h
auditlog.lo: ../../../include/ac/ctype.h
auditlog.lo: /usr/include/ctype.h
auditlog.lo: /usr/include/endian.h
auditlog.lo: /usr/include/bits/endian.h
auditlog.lo: /usr/include/bits/byteswap.h
auditlog.lo: /usr/include/bits/byteswap-16.h
auditlog.lo: ../slap.h
auditlog.lo: ../../../include/ldap_defaults.h
auditlog.lo: ../../../include/ldap_config.h
auditlog.lo: ../../../include/ac/stdlib.h
auditlog.lo: /usr/include/stdlib.h
auditlog.lo: /usr/include/bits/waitflags.h
auditlog.lo: /usr/include/bits/waitstatus.h
auditlog.lo: /usr/include/sys/types.h
auditlog.lo: /usr/include/time.h
auditlog.lo: /usr/include/sys/select.h
auditlog.lo: /usr/include/bits/select.h
auditlog.lo: /usr/include/bits/sigset.h
auditlog.lo: /usr/include/bits/time.h
auditlog.lo: /usr/include/sys/sysmacros.h
auditlog.lo: /usr/include/bits/pthreadtypes.h
auditlog.lo: /usr/include/alloca.h
auditlog.lo: /usr/include/bits/stdlib-float.h
auditlog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
auditlog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
auditlog.lo: /usr/include/limits.h
auditlog.lo: /usr/include/bits/posix1_lim.h
auditlog.lo: /usr/include/bits/local_lim.h
auditlog.lo: /usr/include/linux/limits.h
auditlog.lo: /usr/include/bits/posix2_lim.h
auditlog.lo: ../../../include/ac/syslog.h
auditlog.lo: /usr/include/syslog.h
auditlog.lo: /usr/include/sys/syslog.h
auditlog.lo: /usr/include/bits/syslog-path.h
auditlog.lo: ../../../include/ac/regex.h
auditlog.lo: /usr/include/regex.h
auditlog.lo: ../../../include/ac/signal.h
auditlog.lo: /usr/include/signal.h
auditlog.lo: /usr/include/bits/signum.h
auditlog.lo: /usr/include/bits/siginfo.h
auditlog.lo: /usr/include/bits/sigaction.h
auditlog.lo: /usr/include/bits/sigcontext.h
auditlog.lo: /usr/include/bits/sigstack.h
auditlog.lo: /usr/include/sys/ucontext.h
auditlog.lo: /usr/include/bits/sigthread.h
auditlog.lo: ../../../include/ac/socket.h
auditlog.lo: /usr/include/poll.h
auditlog.lo: /usr/include/sys/poll.h
auditlog.lo: /usr/include/bits/poll.h
auditlog.lo: /usr/include/sys/socket.h
auditlog.lo: /usr/include/sys/uio.h
auditlog.lo: /usr/include/bits/uio.h
auditlog.lo: /usr/include/bits/socket.h
auditlog.lo: /usr/include/bits/socket_type.h
auditlog.lo: /usr/include/bits/sockaddr.h
auditlog.lo: /usr/include/asm/socket.h
auditlog.lo: /usr/include/asm-generic/socket.h
auditlog.lo: /usr/include/asm/sockios.h
auditlog.lo: /usr/include/asm-generic/sockios.h
auditlog.lo: /usr/include/sys/un.h
auditlog.lo: /usr/include/netinet/in.h
auditlog.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
auditlog.lo: /usr/include/stdint.h
auditlog.lo: /usr/include/bits/wchar.h
auditlog.lo: /usr/include/bits/in.h
auditlog.lo: /usr/include/netinet/tcp.h
auditlog.lo: /usr/include/arpa/inet.h
auditlog.lo: /usr/include/arpa/nameser.h
auditlog.lo: /usr/include/sys/param.h
auditlog.lo: /usr/include/bits/param.h
auditlog.lo: /usr/include/linux/param.h
auditlog.lo: /usr/include/asm/param.h
auditlog.lo: /usr/include/asm-generic/param.h
auditlog.lo: /usr/include/sys/bitypes.h
auditlog.lo: /usr/include/arpa/nameser_compat.h
auditlog.lo: /usr/include/netdb.h
auditlog.lo: /usr/include/rpc/netdb.h
auditlog.lo: /usr/include/bits/netdb.h
auditlog.lo: /usr/include/resolv.h
auditlog.lo: ../../../include/ac/time.h
auditlog.lo: /usr/include/sys/time.h
auditlog.lo: ../../../include/ac/param.h
auditlog.lo: ../../../include/ac/unistd.h
auditlog.lo: /usr/include/unistd.h
auditlog.lo: /usr/include/bits/posix_opt.h
auditlog.lo: /usr/include/bits/environments.h
auditlog.lo: /usr/include/bits/confname.h
auditlog.lo: /usr/include/getopt.h
auditlog.lo: ../../../include/lutil_lockf.h
auditlog.lo: ../../../include/avl.h
auditlog.lo: ../../../include/ldap_cdefs.h
auditlog.lo: ../../../include/ldap_log.h
auditlog.lo: ../../../include/ldap.h
auditlog.lo: ../../../include/lber.h
auditlog.lo: ../../../include/lber_types.h
auditlog.lo: ../../../include/ldap_features.h
auditlog.lo: ../../../include/ldap_schema.h
auditlog.lo: ../../../include/lber_pvt.h
auditlog.lo: ../../../include/ldap_pvt.h
auditlog.lo: ../../../include/ldap_pvt_uc.h
auditlog.lo: ../../../include/ac/bytes.h
auditlog.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
auditlog.lo: ../../../include/ldap_pvt_thread.h
auditlog.lo: ../../../include/ldap_int_thread.h
auditlog.lo: /usr/include/pthread.h
auditlog.lo: /usr/include/sched.h
auditlog.lo: /usr/include/bits/sched.h
auditlog.lo: /usr/include/bits/setjmp.h
auditlog.lo: ../../../include/ldap_queue.h
auditlog.lo: ../proto-slap.h
auditlog.lo: ../config.h
auditlog.lo: ../../../include/ldif.h
constraint.lo: constraint.c
constraint.lo: /usr/include/stdc-predef.h
constraint.lo: ../../../include/portable.h
constraint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
constraint.lo: ../../../include/ac/fdset.h
constraint.lo: /usr/include/bits/types.h
constraint.lo: /usr/include/features.h
constraint.lo: /usr/include/sys/cdefs.h
constraint.lo: /usr/include/bits/wordsize.h
constraint.lo: /usr/include/gnu/stubs.h
constraint.lo: /usr/include/gnu/stubs-64.h
constraint.lo: /usr/include/bits/typesizes.h
constraint.lo: ../../../include/ldap_cdefs.h
constraint.lo: ../../../include/ldap_features.h
constraint.lo: ../../../include/ac/assert.h
constraint.lo: /usr/include/assert.h
constraint.lo: ../../../include/ac/localize.h
constraint.lo: /usr/include/stdio.h
constraint.lo: /usr/include/libio.h
constraint.lo: /usr/include/_G_config.h
constraint.lo: /usr/include/wchar.h
constraint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
constraint.lo: /usr/include/bits/stdio_lim.h
constraint.lo: /usr/include/bits/sys_errlist.h
constraint.lo: ../../../include/ac/string.h
constraint.lo: /usr/include/string.h
constraint.lo: /usr/include/xlocale.h
constraint.lo: ../../../include/ac/socket.h
constraint.lo: /usr/include/sys/types.h
constraint.lo: /usr/include/time.h
constraint.lo: /usr/include/endian.h
constraint.lo: /usr/include/bits/endian.h
constraint.lo: /usr/include/bits/byteswap.h
constraint.lo: /usr/include/bits/byteswap-16.h
constraint.lo: /usr/include/sys/select.h
constraint.lo: /usr/include/bits/select.h
constraint.lo: /usr/include/bits/sigset.h
constraint.lo: /usr/include/bits/time.h
constraint.lo: /usr/include/sys/sysmacros.h
constraint.lo: /usr/include/bits/pthreadtypes.h
constraint.lo: /usr/include/poll.h
constraint.lo: /usr/include/sys/poll.h
constraint.lo: /usr/include/bits/poll.h
constraint.lo: /usr/include/sys/socket.h
constraint.lo: /usr/include/sys/uio.h
constraint.lo: /usr/include/bits/uio.h
constraint.lo: /usr/include/bits/socket.h
constraint.lo: /usr/include/bits/socket_type.h
constraint.lo: /usr/include/bits/sockaddr.h
constraint.lo: /usr/include/asm/socket.h
constraint.lo: /usr/include/asm-generic/socket.h
constraint.lo: /usr/include/asm/sockios.h
constraint.lo: /usr/include/asm-generic/sockios.h
constraint.lo: /usr/include/sys/un.h
constraint.lo: /usr/include/netinet/in.h
constraint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
constraint.lo: /usr/include/stdint.h
constraint.lo: /usr/include/bits/wchar.h
constraint.lo: /usr/include/bits/in.h
constraint.lo: /usr/include/netinet/tcp.h
constraint.lo: /usr/include/arpa/inet.h
constraint.lo: /usr/include/arpa/nameser.h
constraint.lo: /usr/include/sys/param.h
constraint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
constraint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
constraint.lo: /usr/include/limits.h
constraint.lo: /usr/include/bits/posix1_lim.h
constraint.lo: /usr/include/bits/local_lim.h
constraint.lo: /usr/include/linux/limits.h
constraint.lo: /usr/include/bits/posix2_lim.h
constraint.lo: /usr/include/signal.h
constraint.lo: /usr/include/bits/signum.h
constraint.lo: /usr/include/bits/siginfo.h
constraint.lo: /usr/include/bits/sigaction.h
constraint.lo: /usr/include/bits/sigcontext.h
constraint.lo: /usr/include/bits/sigstack.h
constraint.lo: /usr/include/sys/ucontext.h
constraint.lo: /usr/include/bits/sigthread.h
constraint.lo: /usr/include/bits/param.h
constraint.lo: /usr/include/linux/param.h
constraint.lo: /usr/include/asm/param.h
constraint.lo: /usr/include/asm-generic/param.h
constraint.lo: /usr/include/sys/bitypes.h
constraint.lo: /usr/include/arpa/nameser_compat.h
constraint.lo: /usr/include/netdb.h
constraint.lo: /usr/include/rpc/netdb.h
constraint.lo: /usr/include/bits/netdb.h
constraint.lo: /usr/include/resolv.h
constraint.lo: ../../../include/ac/regex.h
constraint.lo: /usr/include/regex.h
constraint.lo: ../../../include/lutil.h
constraint.lo: ../../../include/ldap_cdefs.h
constraint.lo: ../../../include/lber_types.h
constraint.lo: ../slap.h
constraint.lo: ../../../include/ldap_defaults.h
constraint.lo: ../../../include/ldap_config.h
constraint.lo: ../../../include/ac/stdlib.h
constraint.lo: /usr/include/stdlib.h
constraint.lo: /usr/include/bits/waitflags.h
constraint.lo: /usr/include/bits/waitstatus.h
constraint.lo: /usr/include/alloca.h
constraint.lo: /usr/include/bits/stdlib-float.h
constraint.lo: ../../../include/ac/syslog.h
constraint.lo: /usr/include/syslog.h
constraint.lo: /usr/include/sys/syslog.h
constraint.lo: /usr/include/bits/syslog-path.h
constraint.lo: ../../../include/ac/signal.h
constraint.lo: ../../../include/ac/time.h
constraint.lo: /usr/include/sys/time.h
constraint.lo: ../../../include/ac/param.h
constraint.lo: ../../../include/ac/unistd.h
constraint.lo: /usr/include/unistd.h
constraint.lo: /usr/include/bits/posix_opt.h
constraint.lo: /usr/include/bits/environments.h
constraint.lo: /usr/include/bits/confname.h
constraint.lo: /usr/include/getopt.h
constraint.lo: ../../../include/lutil_lockf.h
constraint.lo: ../../../include/avl.h
constraint.lo: ../../../include/ldap_log.h
constraint.lo: ../../../include/ldap.h
constraint.lo: ../../../include/lber.h
constraint.lo: ../../../include/ldap_features.h
constraint.lo: ../../../include/ldap_schema.h
constraint.lo: ../../../include/lber_pvt.h
constraint.lo: ../../../include/ldap_pvt.h
constraint.lo: ../../../include/ldap_pvt_uc.h
constraint.lo: ../../../include/ac/bytes.h
constraint.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
constraint.lo: ../../../include/ldap_pvt_thread.h
constraint.lo: ../../../include/ldap_int_thread.h
constraint.lo: /usr/include/pthread.h
constraint.lo: /usr/include/sched.h
constraint.lo: /usr/include/bits/sched.h
constraint.lo: /usr/include/bits/setjmp.h
constraint.lo: ../../../include/ldap_queue.h
constraint.lo: ../proto-slap.h
constraint.lo: ../config.h
dds.lo: dds.c
dds.lo: /usr/include/stdc-predef.h
dds.lo: ../../../include/portable.h
dds.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
dds.lo: ../../../include/ac/fdset.h
dds.lo: /usr/include/bits/types.h
dds.lo: /usr/include/features.h
dds.lo: /usr/include/sys/cdefs.h
dds.lo: /usr/include/bits/wordsize.h
dds.lo: /usr/include/gnu/stubs.h
dds.lo: /usr/include/gnu/stubs-64.h
dds.lo: /usr/include/bits/typesizes.h
dds.lo: ../../../include/ldap_cdefs.h
dds.lo: ../../../include/ldap_features.h
dds.lo: ../../../include/ac/assert.h
dds.lo: /usr/include/assert.h
dds.lo: ../../../include/ac/localize.h
dds.lo: /usr/include/stdio.h
dds.lo: /usr/include/libio.h
dds.lo: /usr/include/_G_config.h
dds.lo: /usr/include/wchar.h
dds.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
dds.lo: /usr/include/bits/stdio_lim.h
dds.lo: /usr/include/bits/sys_errlist.h
dds.lo: ../../../include/ac/string.h
dds.lo: /usr/include/string.h
dds.lo: /usr/include/xlocale.h
dds.lo: ../../../include/ac/time.h
dds.lo: /usr/include/sys/time.h
dds.lo: /usr/include/time.h
dds.lo: /usr/include/bits/time.h
dds.lo: /usr/include/sys/select.h
dds.lo: /usr/include/bits/select.h
dds.lo: /usr/include/bits/sigset.h
dds.lo: ../slap.h
dds.lo: ../../../include/ldap_defaults.h
dds.lo: ../../../include/ldap_config.h
dds.lo: ../../../include/ac/stdlib.h
dds.lo: /usr/include/stdlib.h
dds.lo: /usr/include/bits/waitflags.h
dds.lo: /usr/include/bits/waitstatus.h
dds.lo: /usr/include/endian.h
dds.lo: /usr/include/bits/endian.h
dds.lo: /usr/include/bits/byteswap.h
dds.lo: /usr/include/bits/byteswap-16.h
dds.lo: /usr/include/sys/types.h
dds.lo: /usr/include/sys/sysmacros.h
dds.lo: /usr/include/bits/pthreadtypes.h
dds.lo: /usr/include/alloca.h
dds.lo: /usr/include/bits/stdlib-float.h
dds.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
dds.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
dds.lo: /usr/include/limits.h
dds.lo: /usr/include/bits/posix1_lim.h
dds.lo: /usr/include/bits/local_lim.h
dds.lo: /usr/include/linux/limits.h
dds.lo: /usr/include/bits/posix2_lim.h
dds.lo: ../../../include/ac/syslog.h
dds.lo: /usr/include/syslog.h
dds.lo: /usr/include/sys/syslog.h
dds.lo: /usr/include/bits/syslog-path.h
dds.lo: ../../../include/ac/regex.h
dds.lo: /usr/include/regex.h
dds.lo: ../../../include/ac/signal.h
dds.lo: /usr/include/signal.h
dds.lo: /usr/include/bits/signum.h
dds.lo: /usr/include/bits/siginfo.h
dds.lo: /usr/include/bits/sigaction.h
dds.lo: /usr/include/bits/sigcontext.h
dds.lo: /usr/include/bits/sigstack.h
dds.lo: /usr/include/sys/ucontext.h
dds.lo: /usr/include/bits/sigthread.h
dds.lo: ../../../include/ac/socket.h
dds.lo: /usr/include/poll.h
dds.lo: /usr/include/sys/poll.h
dds.lo: /usr/include/bits/poll.h
dds.lo: /usr/include/sys/socket.h
dds.lo: /usr/include/sys/uio.h
dds.lo: /usr/include/bits/uio.h
dds.lo: /usr/include/bits/socket.h
dds.lo: /usr/include/bits/socket_type.h
dds.lo: /usr/include/bits/sockaddr.h
dds.lo: /usr/include/asm/socket.h
dds.lo: /usr/include/asm-generic/socket.h
dds.lo: /usr/include/asm/sockios.h
dds.lo: /usr/include/asm-generic/sockios.h
dds.lo: /usr/include/sys/un.h
dds.lo: /usr/include/netinet/in.h
dds.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
dds.lo: /usr/include/stdint.h
dds.lo: /usr/include/bits/wchar.h
dds.lo: /usr/include/bits/in.h
dds.lo: /usr/include/netinet/tcp.h
dds.lo: /usr/include/arpa/inet.h
dds.lo: /usr/include/arpa/nameser.h
dds.lo: /usr/include/sys/param.h
dds.lo: /usr/include/bits/param.h
dds.lo: /usr/include/linux/param.h
dds.lo: /usr/include/asm/param.h
dds.lo: /usr/include/asm-generic/param.h
dds.lo: /usr/include/sys/bitypes.h
dds.lo: /usr/include/arpa/nameser_compat.h
dds.lo: /usr/include/netdb.h
dds.lo: /usr/include/rpc/netdb.h
dds.lo: /usr/include/bits/netdb.h
dds.lo: /usr/include/resolv.h
dds.lo: ../../../include/ac/param.h
dds.lo: ../../../include/ac/unistd.h
dds.lo: /usr/include/unistd.h
dds.lo: /usr/include/bits/posix_opt.h
dds.lo: /usr/include/bits/environments.h
dds.lo: /usr/include/bits/confname.h
dds.lo: /usr/include/getopt.h
dds.lo: ../../../include/lutil_lockf.h
dds.lo: ../../../include/avl.h
dds.lo: ../../../include/ldap_cdefs.h
dds.lo: ../../../include/ldap_log.h
dds.lo: ../../../include/ldap.h
dds.lo: ../../../include/lber.h
dds.lo: ../../../include/lber_types.h
dds.lo: ../../../include/ldap_features.h
dds.lo: ../../../include/ldap_schema.h
dds.lo: ../../../include/lber_pvt.h
dds.lo: ../../../include/ldap_pvt.h
dds.lo: ../../../include/ldap_pvt_uc.h
dds.lo: ../../../include/ac/bytes.h
dds.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
dds.lo: ../../../include/ldap_pvt_thread.h
dds.lo: ../../../include/ldap_int_thread.h
dds.lo: /usr/include/pthread.h
dds.lo: /usr/include/sched.h
dds.lo: /usr/include/bits/sched.h
dds.lo: /usr/include/bits/setjmp.h
dds.lo: ../../../include/ldap_queue.h
dds.lo: ../proto-slap.h
dds.lo: ../../../include/lutil.h
dds.lo: ../../../include/ldap_rq.h
dds.lo: ../config.h
deref.lo: deref.c
deref.lo: /usr/include/stdc-predef.h
deref.lo: ../../../include/portable.h
deref.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
deref.lo: ../../../include/ac/fdset.h
deref.lo: /usr/include/bits/types.h
deref.lo: /usr/include/features.h
deref.lo: /usr/include/sys/cdefs.h
deref.lo: /usr/include/bits/wordsize.h
deref.lo: /usr/include/gnu/stubs.h
deref.lo: /usr/include/gnu/stubs-64.h
deref.lo: /usr/include/bits/typesizes.h
deref.lo: ../../../include/ldap_cdefs.h
deref.lo: ../../../include/ldap_features.h
deref.lo: ../../../include/ac/assert.h
deref.lo: /usr/include/assert.h
deref.lo: ../../../include/ac/localize.h
deref.lo: /usr/include/stdio.h
deref.lo: /usr/include/libio.h
deref.lo: /usr/include/_G_config.h
deref.lo: /usr/include/wchar.h
deref.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
deref.lo: /usr/include/bits/stdio_lim.h
deref.lo: /usr/include/bits/sys_errlist.h
deref.lo: ../../../include/ac/string.h
deref.lo: /usr/include/string.h
deref.lo: /usr/include/xlocale.h
deref.lo: ../../../include/ac/socket.h
deref.lo: /usr/include/sys/types.h
deref.lo: /usr/include/time.h
deref.lo: /usr/include/endian.h
deref.lo: /usr/include/bits/endian.h
deref.lo: /usr/include/bits/byteswap.h
deref.lo: /usr/include/bits/byteswap-16.h
deref.lo: /usr/include/sys/select.h
deref.lo: /usr/include/bits/select.h
deref.lo: /usr/include/bits/sigset.h
deref.lo: /usr/include/bits/time.h
deref.lo: /usr/include/sys/sysmacros.h
deref.lo: /usr/include/bits/pthreadtypes.h
deref.lo: /usr/include/poll.h
deref.lo: /usr/include/sys/poll.h
deref.lo: /usr/include/bits/poll.h
deref.lo: /usr/include/sys/socket.h
deref.lo: /usr/include/sys/uio.h
deref.lo: /usr/include/bits/uio.h
deref.lo: /usr/include/bits/socket.h
deref.lo: /usr/include/bits/socket_type.h
deref.lo: /usr/include/bits/sockaddr.h
deref.lo: /usr/include/asm/socket.h
deref.lo: /usr/include/asm-generic/socket.h
deref.lo: /usr/include/asm/sockios.h
deref.lo: /usr/include/asm-generic/sockios.h
deref.lo: /usr/include/sys/un.h
deref.lo: /usr/include/netinet/in.h
deref.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
deref.lo: /usr/include/stdint.h
deref.lo: /usr/include/bits/wchar.h
deref.lo: /usr/include/bits/in.h
deref.lo: /usr/include/netinet/tcp.h
deref.lo: /usr/include/arpa/inet.h
deref.lo: /usr/include/arpa/nameser.h
deref.lo: /usr/include/sys/param.h
deref.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
deref.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
deref.lo: /usr/include/limits.h
deref.lo: /usr/include/bits/posix1_lim.h
deref.lo: /usr/include/bits/local_lim.h
deref.lo: /usr/include/linux/limits.h
deref.lo: /usr/include/bits/posix2_lim.h
deref.lo: /usr/include/signal.h
deref.lo: /usr/include/bits/signum.h
deref.lo: /usr/include/bits/siginfo.h
deref.lo: /usr/include/bits/sigaction.h
deref.lo: /usr/include/bits/sigcontext.h
deref.lo: /usr/include/bits/sigstack.h
deref.lo: /usr/include/sys/ucontext.h
deref.lo: /usr/include/bits/sigthread.h
deref.lo: /usr/include/bits/param.h
deref.lo: /usr/include/linux/param.h
deref.lo: /usr/include/asm/param.h
deref.lo: /usr/include/asm-generic/param.h
deref.lo: /usr/include/sys/bitypes.h
deref.lo: /usr/include/arpa/nameser_compat.h
deref.lo: /usr/include/netdb.h
deref.lo: /usr/include/rpc/netdb.h
deref.lo: /usr/include/bits/netdb.h
deref.lo: /usr/include/resolv.h
deref.lo: ../slap.h
deref.lo: ../../../include/ldap_defaults.h
deref.lo: ../../../include/ldap_config.h
deref.lo: ../../../include/ac/stdlib.h
deref.lo: /usr/include/stdlib.h
deref.lo: /usr/include/bits/waitflags.h
deref.lo: /usr/include/bits/waitstatus.h
deref.lo: /usr/include/alloca.h
deref.lo: /usr/include/bits/stdlib-float.h
deref.lo: ../../../include/ac/syslog.h
deref.lo: /usr/include/syslog.h
deref.lo: /usr/include/sys/syslog.h
deref.lo: /usr/include/bits/syslog-path.h
deref.lo: ../../../include/ac/regex.h
deref.lo: /usr/include/regex.h
deref.lo: ../../../include/ac/signal.h
deref.lo: ../../../include/ac/time.h
deref.lo: /usr/include/sys/time.h
deref.lo: ../../../include/ac/param.h
deref.lo: ../../../include/ac/unistd.h
deref.lo: /usr/include/unistd.h
deref.lo: /usr/include/bits/posix_opt.h
deref.lo: /usr/include/bits/environments.h
deref.lo: /usr/include/bits/confname.h
deref.lo: /usr/include/getopt.h
deref.lo: ../../../include/lutil_lockf.h
deref.lo: ../../../include/avl.h
deref.lo: ../../../include/ldap_cdefs.h
deref.lo: ../../../include/ldap_log.h
deref.lo: ../../../include/ldap.h
deref.lo: ../../../include/lber.h
deref.lo: ../../../include/lber_types.h
deref.lo: ../../../include/ldap_features.h
deref.lo: ../../../include/ldap_schema.h
deref.lo: ../../../include/lber_pvt.h
deref.lo: ../../../include/ldap_pvt.h
deref.lo: ../../../include/ldap_pvt_uc.h
deref.lo: ../../../include/ac/bytes.h
deref.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
deref.lo: ../../../include/ldap_pvt_thread.h
deref.lo: ../../../include/ldap_int_thread.h
deref.lo: /usr/include/pthread.h
deref.lo: /usr/include/sched.h
deref.lo: /usr/include/bits/sched.h
deref.lo: /usr/include/bits/setjmp.h
deref.lo: ../../../include/ldap_queue.h
deref.lo: ../proto-slap.h
deref.lo: ../config.h
deref.lo: ../../../include/lutil.h
dyngroup.lo: dyngroup.c
dyngroup.lo: /usr/include/stdc-predef.h
dyngroup.lo: ../../../include/portable.h
dyngroup.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
dyngroup.lo: ../../../include/ac/fdset.h
dyngroup.lo: /usr/include/bits/types.h
dyngroup.lo: /usr/include/features.h
dyngroup.lo: /usr/include/sys/cdefs.h
dyngroup.lo: /usr/include/bits/wordsize.h
dyngroup.lo: /usr/include/gnu/stubs.h
dyngroup.lo: /usr/include/gnu/stubs-64.h
dyngroup.lo: /usr/include/bits/typesizes.h
dyngroup.lo: ../../../include/ldap_cdefs.h
dyngroup.lo: ../../../include/ldap_features.h
dyngroup.lo: ../../../include/ac/assert.h
dyngroup.lo: /usr/include/assert.h
dyngroup.lo: ../../../include/ac/localize.h
dyngroup.lo: /usr/include/stdio.h
dyngroup.lo: /usr/include/libio.h
dyngroup.lo: /usr/include/_G_config.h
dyngroup.lo: /usr/include/wchar.h
dyngroup.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
dyngroup.lo: /usr/include/bits/stdio_lim.h
dyngroup.lo: /usr/include/bits/sys_errlist.h
dyngroup.lo: ../../../include/ac/string.h
dyngroup.lo: /usr/include/string.h
dyngroup.lo: /usr/include/xlocale.h
dyngroup.lo: ../../../include/ac/socket.h
dyngroup.lo: /usr/include/sys/types.h
dyngroup.lo: /usr/include/time.h
dyngroup.lo: /usr/include/endian.h
dyngroup.lo: /usr/include/bits/endian.h
dyngroup.lo: /usr/include/bits/byteswap.h
dyngroup.lo: /usr/include/bits/byteswap-16.h
dyngroup.lo: /usr/include/sys/select.h
dyngroup.lo: /usr/include/bits/select.h
dyngroup.lo: /usr/include/bits/sigset.h
dyngroup.lo: /usr/include/bits/time.h
dyngroup.lo: /usr/include/sys/sysmacros.h
dyngroup.lo: /usr/include/bits/pthreadtypes.h
dyngroup.lo: /usr/include/poll.h
dyngroup.lo: /usr/include/sys/poll.h
dyngroup.lo: /usr/include/bits/poll.h
dyngroup.lo: /usr/include/sys/socket.h
dyngroup.lo: /usr/include/sys/uio.h
dyngroup.lo: /usr/include/bits/uio.h
dyngroup.lo: /usr/include/bits/socket.h
dyngroup.lo: /usr/include/bits/socket_type.h
dyngroup.lo: /usr/include/bits/sockaddr.h
dyngroup.lo: /usr/include/asm/socket.h
dyngroup.lo: /usr/include/asm-generic/socket.h
dyngroup.lo: /usr/include/asm/sockios.h
dyngroup.lo: /usr/include/asm-generic/sockios.h
dyngroup.lo: /usr/include/sys/un.h
dyngroup.lo: /usr/include/netinet/in.h
dyngroup.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
dyngroup.lo: /usr/include/stdint.h
dyngroup.lo: /usr/include/bits/wchar.h
dyngroup.lo: /usr/include/bits/in.h
dyngroup.lo: /usr/include/netinet/tcp.h
dyngroup.lo: /usr/include/arpa/inet.h
dyngroup.lo: /usr/include/arpa/nameser.h
dyngroup.lo: /usr/include/sys/param.h
dyngroup.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
dyngroup.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
dyngroup.lo: /usr/include/limits.h
dyngroup.lo: /usr/include/bits/posix1_lim.h
dyngroup.lo: /usr/include/bits/local_lim.h
dyngroup.lo: /usr/include/linux/limits.h
dyngroup.lo: /usr/include/bits/posix2_lim.h
dyngroup.lo: /usr/include/signal.h
dyngroup.lo: /usr/include/bits/signum.h
dyngroup.lo: /usr/include/bits/siginfo.h
dyngroup.lo: /usr/include/bits/sigaction.h
dyngroup.lo: /usr/include/bits/sigcontext.h
dyngroup.lo: /usr/include/bits/sigstack.h
dyngroup.lo: /usr/include/sys/ucontext.h
dyngroup.lo: /usr/include/bits/sigthread.h
dyngroup.lo: /usr/include/bits/param.h
dyngroup.lo: /usr/include/linux/param.h
dyngroup.lo: /usr/include/asm/param.h
dyngroup.lo: /usr/include/asm-generic/param.h
dyngroup.lo: /usr/include/sys/bitypes.h
dyngroup.lo: /usr/include/arpa/nameser_compat.h
dyngroup.lo: /usr/include/netdb.h
dyngroup.lo: /usr/include/rpc/netdb.h
dyngroup.lo: /usr/include/bits/netdb.h
dyngroup.lo: /usr/include/resolv.h
dyngroup.lo: ../../../include/lutil.h
dyngroup.lo: ../../../include/ldap_cdefs.h
dyngroup.lo: ../../../include/lber_types.h
dyngroup.lo: ../slap.h
dyngroup.lo: ../../../include/ldap_defaults.h
dyngroup.lo: ../../../include/ldap_config.h
dyngroup.lo: ../../../include/ac/stdlib.h
dyngroup.lo: /usr/include/stdlib.h
dyngroup.lo: /usr/include/bits/waitflags.h
dyngroup.lo: /usr/include/bits/waitstatus.h
dyngroup.lo: /usr/include/alloca.h
dyngroup.lo: /usr/include/bits/stdlib-float.h
dyngroup.lo: ../../../include/ac/syslog.h
dyngroup.lo: /usr/include/syslog.h
dyngroup.lo: /usr/include/sys/syslog.h
dyngroup.lo: /usr/include/bits/syslog-path.h
dyngroup.lo: ../../../include/ac/regex.h
dyngroup.lo: /usr/include/regex.h
dyngroup.lo: ../../../include/ac/signal.h
dyngroup.lo: ../../../include/ac/time.h
dyngroup.lo: /usr/include/sys/time.h
dyngroup.lo: ../../../include/ac/param.h
dyngroup.lo: ../../../include/ac/unistd.h
dyngroup.lo: /usr/include/unistd.h
dyngroup.lo: /usr/include/bits/posix_opt.h
dyngroup.lo: /usr/include/bits/environments.h
dyngroup.lo: /usr/include/bits/confname.h
dyngroup.lo: /usr/include/getopt.h
dyngroup.lo: ../../../include/lutil_lockf.h
dyngroup.lo: ../../../include/avl.h
dyngroup.lo: ../../../include/ldap_log.h
dyngroup.lo: ../../../include/ldap.h
dyngroup.lo: ../../../include/lber.h
dyngroup.lo: ../../../include/ldap_features.h
dyngroup.lo: ../../../include/ldap_schema.h
dyngroup.lo: ../../../include/lber_pvt.h
dyngroup.lo: ../../../include/ldap_pvt.h
dyngroup.lo: ../../../include/ldap_pvt_uc.h
dyngroup.lo: ../../../include/ac/bytes.h
dyngroup.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
dyngroup.lo: ../../../include/ldap_pvt_thread.h
dyngroup.lo: ../../../include/ldap_int_thread.h
dyngroup.lo: /usr/include/pthread.h
dyngroup.lo: /usr/include/sched.h
dyngroup.lo: /usr/include/bits/sched.h
dyngroup.lo: /usr/include/bits/setjmp.h
dyngroup.lo: ../../../include/ldap_queue.h
dyngroup.lo: ../proto-slap.h
dyngroup.lo: ../config.h
dynlist.lo: dynlist.c
dynlist.lo: /usr/include/stdc-predef.h
dynlist.lo: ../../../include/portable.h
dynlist.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
dynlist.lo: ../../../include/ac/fdset.h
dynlist.lo: /usr/include/bits/types.h
dynlist.lo: /usr/include/features.h
dynlist.lo: /usr/include/sys/cdefs.h
dynlist.lo: /usr/include/bits/wordsize.h
dynlist.lo: /usr/include/gnu/stubs.h
dynlist.lo: /usr/include/gnu/stubs-64.h
dynlist.lo: /usr/include/bits/typesizes.h
dynlist.lo: ../../../include/ldap_cdefs.h
dynlist.lo: ../../../include/ldap_features.h
dynlist.lo: ../../../include/ac/assert.h
dynlist.lo: /usr/include/assert.h
dynlist.lo: ../../../include/ac/localize.h
dynlist.lo: /usr/include/stdio.h
dynlist.lo: /usr/include/libio.h
dynlist.lo: /usr/include/_G_config.h
dynlist.lo: /usr/include/wchar.h
dynlist.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
dynlist.lo: /usr/include/bits/stdio_lim.h
dynlist.lo: /usr/include/bits/sys_errlist.h
dynlist.lo: ../../../include/ac/string.h
dynlist.lo: /usr/include/string.h
dynlist.lo: /usr/include/xlocale.h
dynlist.lo: ../slap.h
dynlist.lo: ../../../include/ldap_defaults.h
dynlist.lo: ../../../include/ldap_config.h
dynlist.lo: ../../../include/ac/stdlib.h
dynlist.lo: /usr/include/stdlib.h
dynlist.lo: /usr/include/bits/waitflags.h
dynlist.lo: /usr/include/bits/waitstatus.h
dynlist.lo: /usr/include/endian.h
dynlist.lo: /usr/include/bits/endian.h
dynlist.lo: /usr/include/bits/byteswap.h
dynlist.lo: /usr/include/bits/byteswap-16.h
dynlist.lo: /usr/include/sys/types.h
dynlist.lo: /usr/include/time.h
dynlist.lo: /usr/include/sys/select.h
dynlist.lo: /usr/include/bits/select.h
dynlist.lo: /usr/include/bits/sigset.h
dynlist.lo: /usr/include/bits/time.h
dynlist.lo: /usr/include/sys/sysmacros.h
dynlist.lo: /usr/include/bits/pthreadtypes.h
dynlist.lo: /usr/include/alloca.h
dynlist.lo: /usr/include/bits/stdlib-float.h
dynlist.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
dynlist.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
dynlist.lo: /usr/include/limits.h
dynlist.lo: /usr/include/bits/posix1_lim.h
dynlist.lo: /usr/include/bits/local_lim.h
dynlist.lo: /usr/include/linux/limits.h
dynlist.lo: /usr/include/bits/posix2_lim.h
dynlist.lo: ../../../include/ac/syslog.h
dynlist.lo: /usr/include/syslog.h
dynlist.lo: /usr/include/sys/syslog.h
dynlist.lo: /usr/include/bits/syslog-path.h
dynlist.lo: ../../../include/ac/regex.h
dynlist.lo: /usr/include/regex.h
dynlist.lo: ../../../include/ac/signal.h
dynlist.lo: /usr/include/signal.h
dynlist.lo: /usr/include/bits/signum.h
dynlist.lo: /usr/include/bits/siginfo.h
dynlist.lo: /usr/include/bits/sigaction.h
dynlist.lo: /usr/include/bits/sigcontext.h
dynlist.lo: /usr/include/bits/sigstack.h
dynlist.lo: /usr/include/sys/ucontext.h
dynlist.lo: /usr/include/bits/sigthread.h
dynlist.lo: ../../../include/ac/socket.h
dynlist.lo: /usr/include/poll.h
dynlist.lo: /usr/include/sys/poll.h
dynlist.lo: /usr/include/bits/poll.h
dynlist.lo: /usr/include/sys/socket.h
dynlist.lo: /usr/include/sys/uio.h
dynlist.lo: /usr/include/bits/uio.h
dynlist.lo: /usr/include/bits/socket.h
dynlist.lo: /usr/include/bits/socket_type.h
dynlist.lo: /usr/include/bits/sockaddr.h
dynlist.lo: /usr/include/asm/socket.h
dynlist.lo: /usr/include/asm-generic/socket.h
dynlist.lo: /usr/include/asm/sockios.h
dynlist.lo: /usr/include/asm-generic/sockios.h
dynlist.lo: /usr/include/sys/un.h
dynlist.lo: /usr/include/netinet/in.h
dynlist.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
dynlist.lo: /usr/include/stdint.h
dynlist.lo: /usr/include/bits/wchar.h
dynlist.lo: /usr/include/bits/in.h
dynlist.lo: /usr/include/netinet/tcp.h
dynlist.lo: /usr/include/arpa/inet.h
dynlist.lo: /usr/include/arpa/nameser.h
dynlist.lo: /usr/include/sys/param.h
dynlist.lo: /usr/include/bits/param.h
dynlist.lo: /usr/include/linux/param.h
dynlist.lo: /usr/include/asm/param.h
dynlist.lo: /usr/include/asm-generic/param.h
dynlist.lo: /usr/include/sys/bitypes.h
dynlist.lo: /usr/include/arpa/nameser_compat.h
dynlist.lo: /usr/include/netdb.h
dynlist.lo: /usr/include/rpc/netdb.h
dynlist.lo: /usr/include/bits/netdb.h
dynlist.lo: /usr/include/resolv.h
dynlist.lo: ../../../include/ac/time.h
dynlist.lo: /usr/include/sys/time.h
dynlist.lo: ../../../include/ac/param.h
dynlist.lo: ../../../include/ac/unistd.h
dynlist.lo: /usr/include/unistd.h
dynlist.lo: /usr/include/bits/posix_opt.h
dynlist.lo: /usr/include/bits/environments.h
dynlist.lo: /usr/include/bits/confname.h
dynlist.lo: /usr/include/getopt.h
dynlist.lo: ../../../include/lutil_lockf.h
dynlist.lo: ../../../include/avl.h
dynlist.lo: ../../../include/ldap_cdefs.h
dynlist.lo: ../../../include/ldap_log.h
dynlist.lo: ../../../include/ldap.h
dynlist.lo: ../../../include/lber.h
dynlist.lo: ../../../include/lber_types.h
dynlist.lo: ../../../include/ldap_features.h
dynlist.lo: ../../../include/ldap_schema.h
dynlist.lo: ../../../include/lber_pvt.h
dynlist.lo: ../../../include/ldap_pvt.h
dynlist.lo: ../../../include/ldap_pvt_uc.h
dynlist.lo: ../../../include/ac/bytes.h
dynlist.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
dynlist.lo: ../../../include/ldap_pvt_thread.h
dynlist.lo: ../../../include/ldap_int_thread.h
dynlist.lo: /usr/include/pthread.h
dynlist.lo: /usr/include/sched.h
dynlist.lo: /usr/include/bits/sched.h
dynlist.lo: /usr/include/bits/setjmp.h
dynlist.lo: ../../../include/ldap_queue.h
dynlist.lo: ../proto-slap.h
dynlist.lo: ../config.h
dynlist.lo: ../../../include/lutil.h
memberof.lo: memberof.c
memberof.lo: /usr/include/stdc-predef.h
memberof.lo: ../../../include/portable.h
memberof.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
memberof.lo: ../../../include/ac/fdset.h
memberof.lo: /usr/include/bits/types.h
memberof.lo: /usr/include/features.h
memberof.lo: /usr/include/sys/cdefs.h
memberof.lo: /usr/include/bits/wordsize.h
memberof.lo: /usr/include/gnu/stubs.h
memberof.lo: /usr/include/gnu/stubs-64.h
memberof.lo: /usr/include/bits/typesizes.h
memberof.lo: ../../../include/ldap_cdefs.h
memberof.lo: ../../../include/ldap_features.h
memberof.lo: ../../../include/ac/assert.h
memberof.lo: /usr/include/assert.h
memberof.lo: ../../../include/ac/localize.h
memberof.lo: /usr/include/stdio.h
memberof.lo: /usr/include/libio.h
memberof.lo: /usr/include/_G_config.h
memberof.lo: /usr/include/wchar.h
memberof.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
memberof.lo: /usr/include/bits/stdio_lim.h
memberof.lo: /usr/include/bits/sys_errlist.h
memberof.lo: ../../../include/ac/string.h
memberof.lo: /usr/include/string.h
memberof.lo: /usr/include/xlocale.h
memberof.lo: ../../../include/ac/socket.h
memberof.lo: /usr/include/sys/types.h
memberof.lo: /usr/include/time.h
memberof.lo: /usr/include/endian.h
memberof.lo: /usr/include/bits/endian.h
memberof.lo: /usr/include/bits/byteswap.h
memberof.lo: /usr/include/bits/byteswap-16.h
memberof.lo: /usr/include/sys/select.h
memberof.lo: /usr/include/bits/select.h
memberof.lo: /usr/include/bits/sigset.h
memberof.lo: /usr/include/bits/time.h
memberof.lo: /usr/include/sys/sysmacros.h
memberof.lo: /usr/include/bits/pthreadtypes.h
memberof.lo: /usr/include/poll.h
memberof.lo: /usr/include/sys/poll.h
memberof.lo: /usr/include/bits/poll.h
memberof.lo: /usr/include/sys/socket.h
memberof.lo: /usr/include/sys/uio.h
memberof.lo: /usr/include/bits/uio.h
memberof.lo: /usr/include/bits/socket.h
memberof.lo: /usr/include/bits/socket_type.h
memberof.lo: /usr/include/bits/sockaddr.h
memberof.lo: /usr/include/asm/socket.h
memberof.lo: /usr/include/asm-generic/socket.h
memberof.lo: /usr/include/asm/sockios.h
memberof.lo: /usr/include/asm-generic/sockios.h
memberof.lo: /usr/include/sys/un.h
memberof.lo: /usr/include/netinet/in.h
memberof.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
memberof.lo: /usr/include/stdint.h
memberof.lo: /usr/include/bits/wchar.h
memberof.lo: /usr/include/bits/in.h
memberof.lo: /usr/include/netinet/tcp.h
memberof.lo: /usr/include/arpa/inet.h
memberof.lo: /usr/include/arpa/nameser.h
memberof.lo: /usr/include/sys/param.h
memberof.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
memberof.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
memberof.lo: /usr/include/limits.h
memberof.lo: /usr/include/bits/posix1_lim.h
memberof.lo: /usr/include/bits/local_lim.h
memberof.lo: /usr/include/linux/limits.h
memberof.lo: /usr/include/bits/posix2_lim.h
memberof.lo: /usr/include/signal.h
memberof.lo: /usr/include/bits/signum.h
memberof.lo: /usr/include/bits/siginfo.h
memberof.lo: /usr/include/bits/sigaction.h
memberof.lo: /usr/include/bits/sigcontext.h
memberof.lo: /usr/include/bits/sigstack.h
memberof.lo: /usr/include/sys/ucontext.h
memberof.lo: /usr/include/bits/sigthread.h
memberof.lo: /usr/include/bits/param.h
memberof.lo: /usr/include/linux/param.h
memberof.lo: /usr/include/asm/param.h
memberof.lo: /usr/include/asm-generic/param.h
memberof.lo: /usr/include/sys/bitypes.h
memberof.lo: /usr/include/arpa/nameser_compat.h
memberof.lo: /usr/include/netdb.h
memberof.lo: /usr/include/rpc/netdb.h
memberof.lo: /usr/include/bits/netdb.h
memberof.lo: /usr/include/resolv.h
memberof.lo: ../slap.h
memberof.lo: ../../../include/ldap_defaults.h
memberof.lo: ../../../include/ldap_config.h
memberof.lo: ../../../include/ac/stdlib.h
memberof.lo: /usr/include/stdlib.h
memberof.lo: /usr/include/bits/waitflags.h
memberof.lo: /usr/include/bits/waitstatus.h
memberof.lo: /usr/include/alloca.h
memberof.lo: /usr/include/bits/stdlib-float.h
memberof.lo: ../../../include/ac/syslog.h
memberof.lo: /usr/include/syslog.h
memberof.lo: /usr/include/sys/syslog.h
memberof.lo: /usr/include/bits/syslog-path.h
memberof.lo: ../../../include/ac/regex.h
memberof.lo: /usr/include/regex.h
memberof.lo: ../../../include/ac/signal.h
memberof.lo: ../../../include/ac/time.h
memberof.lo: /usr/include/sys/time.h
memberof.lo: ../../../include/ac/param.h
memberof.lo: ../../../include/ac/unistd.h
memberof.lo: /usr/include/unistd.h
memberof.lo: /usr/include/bits/posix_opt.h
memberof.lo: /usr/include/bits/environments.h
memberof.lo: /usr/include/bits/confname.h
memberof.lo: /usr/include/getopt.h
memberof.lo: ../../../include/lutil_lockf.h
memberof.lo: ../../../include/avl.h
memberof.lo: ../../../include/ldap_cdefs.h
memberof.lo: ../../../include/ldap_log.h
memberof.lo: ../../../include/ldap.h
memberof.lo: ../../../include/lber.h
memberof.lo: ../../../include/lber_types.h
memberof.lo: ../../../include/ldap_features.h
memberof.lo: ../../../include/ldap_schema.h
memberof.lo: ../../../include/lber_pvt.h
memberof.lo: ../../../include/ldap_pvt.h
memberof.lo: ../../../include/ldap_pvt_uc.h
memberof.lo: ../../../include/ac/bytes.h
memberof.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
memberof.lo: ../../../include/ldap_pvt_thread.h
memberof.lo: ../../../include/ldap_int_thread.h
memberof.lo: /usr/include/pthread.h
memberof.lo: /usr/include/sched.h
memberof.lo: /usr/include/bits/sched.h
memberof.lo: /usr/include/bits/setjmp.h
memberof.lo: ../../../include/ldap_queue.h
memberof.lo: ../proto-slap.h
memberof.lo: ../config.h
memberof.lo: ../../../include/lutil.h
pcache.lo: pcache.c
pcache.lo: /usr/include/stdc-predef.h
pcache.lo: ../../../include/portable.h
pcache.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
pcache.lo: ../../../include/ac/fdset.h
pcache.lo: /usr/include/bits/types.h
pcache.lo: /usr/include/features.h
pcache.lo: /usr/include/sys/cdefs.h
pcache.lo: /usr/include/bits/wordsize.h
pcache.lo: /usr/include/gnu/stubs.h
pcache.lo: /usr/include/gnu/stubs-64.h
pcache.lo: /usr/include/bits/typesizes.h
pcache.lo: ../../../include/ldap_cdefs.h
pcache.lo: ../../../include/ldap_features.h
pcache.lo: ../../../include/ac/assert.h
pcache.lo: /usr/include/assert.h
pcache.lo: ../../../include/ac/localize.h
pcache.lo: /usr/include/stdio.h
pcache.lo: /usr/include/libio.h
pcache.lo: /usr/include/_G_config.h
pcache.lo: /usr/include/wchar.h
pcache.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
pcache.lo: /usr/include/bits/stdio_lim.h
pcache.lo: /usr/include/bits/sys_errlist.h
pcache.lo: ../../../include/ac/string.h
pcache.lo: /usr/include/string.h
pcache.lo: /usr/include/xlocale.h
pcache.lo: ../../../include/ac/time.h
pcache.lo: /usr/include/sys/time.h
pcache.lo: /usr/include/time.h
pcache.lo: /usr/include/bits/time.h
pcache.lo: /usr/include/sys/select.h
pcache.lo: /usr/include/bits/select.h
pcache.lo: /usr/include/bits/sigset.h
pcache.lo: ../slap.h
pcache.lo: ../../../include/ldap_defaults.h
pcache.lo: ../../../include/ldap_config.h
pcache.lo: ../../../include/ac/stdlib.h
pcache.lo: /usr/include/stdlib.h
pcache.lo: /usr/include/bits/waitflags.h
pcache.lo: /usr/include/bits/waitstatus.h
pcache.lo: /usr/include/endian.h
pcache.lo: /usr/include/bits/endian.h
pcache.lo: /usr/include/bits/byteswap.h
pcache.lo: /usr/include/bits/byteswap-16.h
pcache.lo: /usr/include/sys/types.h
pcache.lo: /usr/include/sys/sysmacros.h
pcache.lo: /usr/include/bits/pthreadtypes.h
pcache.lo: /usr/include/alloca.h
pcache.lo: /usr/include/bits/stdlib-float.h
pcache.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
pcache.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
pcache.lo: /usr/include/limits.h
pcache.lo: /usr/include/bits/posix1_lim.h
pcache.lo: /usr/include/bits/local_lim.h
pcache.lo: /usr/include/linux/limits.h
pcache.lo: /usr/include/bits/posix2_lim.h
pcache.lo: ../../../include/ac/syslog.h
pcache.lo: /usr/include/syslog.h
pcache.lo: /usr/include/sys/syslog.h
pcache.lo: /usr/include/bits/syslog-path.h
pcache.lo: ../../../include/ac/regex.h
pcache.lo: /usr/include/regex.h
pcache.lo: ../../../include/ac/signal.h
pcache.lo: /usr/include/signal.h
pcache.lo: /usr/include/bits/signum.h
pcache.lo: /usr/include/bits/siginfo.h
pcache.lo: /usr/include/bits/sigaction.h
pcache.lo: /usr/include/bits/sigcontext.h
pcache.lo: /usr/include/bits/sigstack.h
pcache.lo: /usr/include/sys/ucontext.h
pcache.lo: /usr/include/bits/sigthread.h
pcache.lo: ../../../include/ac/socket.h
pcache.lo: /usr/include/poll.h
pcache.lo: /usr/include/sys/poll.h
pcache.lo: /usr/include/bits/poll.h
pcache.lo: /usr/include/sys/socket.h
pcache.lo: /usr/include/sys/uio.h
pcache.lo: /usr/include/bits/uio.h
pcache.lo: /usr/include/bits/socket.h
pcache.lo: /usr/include/bits/socket_type.h
pcache.lo: /usr/include/bits/sockaddr.h
pcache.lo: /usr/include/asm/socket.h
pcache.lo: /usr/include/asm-generic/socket.h
pcache.lo: /usr/include/asm/sockios.h
pcache.lo: /usr/include/asm-generic/sockios.h
pcache.lo: /usr/include/sys/un.h
pcache.lo: /usr/include/netinet/in.h
pcache.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
pcache.lo: /usr/include/stdint.h
pcache.lo: /usr/include/bits/wchar.h
pcache.lo: /usr/include/bits/in.h
pcache.lo: /usr/include/netinet/tcp.h
pcache.lo: /usr/include/arpa/inet.h
pcache.lo: /usr/include/arpa/nameser.h
pcache.lo: /usr/include/sys/param.h
pcache.lo: /usr/include/bits/param.h
pcache.lo: /usr/include/linux/param.h
pcache.lo: /usr/include/asm/param.h
pcache.lo: /usr/include/asm-generic/param.h
pcache.lo: /usr/include/sys/bitypes.h
pcache.lo: /usr/include/arpa/nameser_compat.h
pcache.lo: /usr/include/netdb.h
pcache.lo: /usr/include/rpc/netdb.h
pcache.lo: /usr/include/bits/netdb.h
pcache.lo: /usr/include/resolv.h
pcache.lo: ../../../include/ac/param.h
pcache.lo: ../../../include/ac/unistd.h
pcache.lo: /usr/include/unistd.h
pcache.lo: /usr/include/bits/posix_opt.h
pcache.lo: /usr/include/bits/environments.h
pcache.lo: /usr/include/bits/confname.h
pcache.lo: /usr/include/getopt.h
pcache.lo: ../../../include/lutil_lockf.h
pcache.lo: ../../../include/avl.h
pcache.lo: ../../../include/ldap_cdefs.h
pcache.lo: ../../../include/ldap_log.h
pcache.lo: ../../../include/ldap.h
pcache.lo: ../../../include/lber.h
pcache.lo: ../../../include/lber_types.h
pcache.lo: ../../../include/ldap_features.h
pcache.lo: ../../../include/ldap_schema.h
pcache.lo: ../../../include/lber_pvt.h
pcache.lo: ../../../include/ldap_pvt.h
pcache.lo: ../../../include/ldap_pvt_uc.h
pcache.lo: ../../../include/ac/bytes.h
pcache.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
pcache.lo: ../../../include/ldap_pvt_thread.h
pcache.lo: ../../../include/ldap_int_thread.h
pcache.lo: /usr/include/pthread.h
pcache.lo: /usr/include/sched.h
pcache.lo: /usr/include/bits/sched.h
pcache.lo: /usr/include/bits/setjmp.h
pcache.lo: ../../../include/ldap_queue.h
pcache.lo: ../proto-slap.h
pcache.lo: ../../../include/lutil.h
pcache.lo: ../../../include/ldap_rq.h
pcache.lo: ../back-monitor/back-monitor.h
pcache.lo: ../back-monitor/proto-back-monitor.h
pcache.lo: ../config.h
collect.lo: collect.c
collect.lo: /usr/include/stdc-predef.h
collect.lo: ../../../include/portable.h
collect.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
collect.lo: ../../../include/ac/fdset.h
collect.lo: /usr/include/bits/types.h
collect.lo: /usr/include/features.h
collect.lo: /usr/include/sys/cdefs.h
collect.lo: /usr/include/bits/wordsize.h
collect.lo: /usr/include/gnu/stubs.h
collect.lo: /usr/include/gnu/stubs-64.h
collect.lo: /usr/include/bits/typesizes.h
collect.lo: ../../../include/ldap_cdefs.h
collect.lo: ../../../include/ldap_features.h
collect.lo: ../../../include/ac/assert.h
collect.lo: /usr/include/assert.h
collect.lo: ../../../include/ac/localize.h
collect.lo: /usr/include/stdio.h
collect.lo: /usr/include/libio.h
collect.lo: /usr/include/_G_config.h
collect.lo: /usr/include/wchar.h
collect.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
collect.lo: /usr/include/bits/stdio_lim.h
collect.lo: /usr/include/bits/sys_errlist.h
collect.lo: ../../../include/ac/string.h
collect.lo: /usr/include/string.h
collect.lo: /usr/include/xlocale.h
collect.lo: ../../../include/ac/socket.h
collect.lo: /usr/include/sys/types.h
collect.lo: /usr/include/time.h
collect.lo: /usr/include/endian.h
collect.lo: /usr/include/bits/endian.h
collect.lo: /usr/include/bits/byteswap.h
collect.lo: /usr/include/bits/byteswap-16.h
collect.lo: /usr/include/sys/select.h
collect.lo: /usr/include/bits/select.h
collect.lo: /usr/include/bits/sigset.h
collect.lo: /usr/include/bits/time.h
collect.lo: /usr/include/sys/sysmacros.h
collect.lo: /usr/include/bits/pthreadtypes.h
collect.lo: /usr/include/poll.h
collect.lo: /usr/include/sys/poll.h
collect.lo: /usr/include/bits/poll.h
collect.lo: /usr/include/sys/socket.h
collect.lo: /usr/include/sys/uio.h
collect.lo: /usr/include/bits/uio.h
collect.lo: /usr/include/bits/socket.h
collect.lo: /usr/include/bits/socket_type.h
collect.lo: /usr/include/bits/sockaddr.h
collect.lo: /usr/include/asm/socket.h
collect.lo: /usr/include/asm-generic/socket.h
collect.lo: /usr/include/asm/sockios.h
collect.lo: /usr/include/asm-generic/sockios.h
collect.lo: /usr/include/sys/un.h
collect.lo: /usr/include/netinet/in.h
collect.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
collect.lo: /usr/include/stdint.h
collect.lo: /usr/include/bits/wchar.h
collect.lo: /usr/include/bits/in.h
collect.lo: /usr/include/netinet/tcp.h
collect.lo: /usr/include/arpa/inet.h
collect.lo: /usr/include/arpa/nameser.h
collect.lo: /usr/include/sys/param.h
collect.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
collect.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
collect.lo: /usr/include/limits.h
collect.lo: /usr/include/bits/posix1_lim.h
collect.lo: /usr/include/bits/local_lim.h
collect.lo: /usr/include/linux/limits.h
collect.lo: /usr/include/bits/posix2_lim.h
collect.lo: /usr/include/signal.h
collect.lo: /usr/include/bits/signum.h
collect.lo: /usr/include/bits/siginfo.h
collect.lo: /usr/include/bits/sigaction.h
collect.lo: /usr/include/bits/sigcontext.h
collect.lo: /usr/include/bits/sigstack.h
collect.lo: /usr/include/sys/ucontext.h
collect.lo: /usr/include/bits/sigthread.h
collect.lo: /usr/include/bits/param.h
collect.lo: /usr/include/linux/param.h
collect.lo: /usr/include/asm/param.h
collect.lo: /usr/include/asm-generic/param.h
collect.lo: /usr/include/sys/bitypes.h
collect.lo: /usr/include/arpa/nameser_compat.h
collect.lo: /usr/include/netdb.h
collect.lo: /usr/include/rpc/netdb.h
collect.lo: /usr/include/bits/netdb.h
collect.lo: /usr/include/resolv.h
collect.lo: ../slap.h
collect.lo: ../../../include/ldap_defaults.h
collect.lo: ../../../include/ldap_config.h
collect.lo: ../../../include/ac/stdlib.h
collect.lo: /usr/include/stdlib.h
collect.lo: /usr/include/bits/waitflags.h
collect.lo: /usr/include/bits/waitstatus.h
collect.lo: /usr/include/alloca.h
collect.lo: /usr/include/bits/stdlib-float.h
collect.lo: ../../../include/ac/syslog.h
collect.lo: /usr/include/syslog.h
collect.lo: /usr/include/sys/syslog.h
collect.lo: /usr/include/bits/syslog-path.h
collect.lo: ../../../include/ac/regex.h
collect.lo: /usr/include/regex.h
collect.lo: ../../../include/ac/signal.h
collect.lo: ../../../include/ac/time.h
collect.lo: /usr/include/sys/time.h
collect.lo: ../../../include/ac/param.h
collect.lo: ../../../include/ac/unistd.h
collect.lo: /usr/include/unistd.h
collect.lo: /usr/include/bits/posix_opt.h
collect.lo: /usr/include/bits/environments.h
collect.lo: /usr/include/bits/confname.h
collect.lo: /usr/include/getopt.h
collect.lo: ../../../include/lutil_lockf.h
collect.lo: ../../../include/avl.h
collect.lo: ../../../include/ldap_cdefs.h
collect.lo: ../../../include/ldap_log.h
collect.lo: ../../../include/ldap.h
collect.lo: ../../../include/lber.h
collect.lo: ../../../include/lber_types.h
collect.lo: ../../../include/ldap_features.h
collect.lo: ../../../include/ldap_schema.h
collect.lo: ../../../include/lber_pvt.h
collect.lo: ../../../include/ldap_pvt.h
collect.lo: ../../../include/ldap_pvt_uc.h
collect.lo: ../../../include/ac/bytes.h
collect.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
collect.lo: ../../../include/ldap_pvt_thread.h
collect.lo: ../../../include/ldap_int_thread.h
collect.lo: /usr/include/pthread.h
collect.lo: /usr/include/sched.h
collect.lo: /usr/include/bits/sched.h
collect.lo: /usr/include/bits/setjmp.h
collect.lo: ../../../include/ldap_queue.h
collect.lo: ../proto-slap.h
collect.lo: ../config.h
collect.lo: ../../../include/lutil.h
ppolicy.lo: ppolicy.c
ppolicy.lo: /usr/include/stdc-predef.h
ppolicy.lo: ../../../include/portable.h
ppolicy.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
ppolicy.lo: ../../../include/ac/fdset.h
ppolicy.lo: /usr/include/bits/types.h
ppolicy.lo: /usr/include/features.h
ppolicy.lo: /usr/include/sys/cdefs.h
ppolicy.lo: /usr/include/bits/wordsize.h
ppolicy.lo: /usr/include/gnu/stubs.h
ppolicy.lo: /usr/include/gnu/stubs-64.h
ppolicy.lo: /usr/include/bits/typesizes.h
ppolicy.lo: ../../../include/ldap_cdefs.h
ppolicy.lo: ../../../include/ldap_features.h
ppolicy.lo: ../../../include/ac/assert.h
ppolicy.lo: /usr/include/assert.h
ppolicy.lo: ../../../include/ac/localize.h
ppolicy.lo: ../../../include/ldap.h
ppolicy.lo: ../../../include/lber.h
ppolicy.lo: ../../../include/lber_types.h
ppolicy.lo: ../../../include/ldap_cdefs.h
ppolicy.lo: /usr/include/string.h
ppolicy.lo: /usr/include/xlocale.h
ppolicy.lo: ../../../include/ldap_features.h
ppolicy.lo: ../../../include/lutil.h
ppolicy.lo: ../slap.h
ppolicy.lo: ../../../include/ldap_defaults.h
ppolicy.lo: ../../../include/ldap_config.h
ppolicy.lo: /usr/include/stdio.h
ppolicy.lo: /usr/include/libio.h
ppolicy.lo: /usr/include/_G_config.h
ppolicy.lo: /usr/include/wchar.h
ppolicy.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
ppolicy.lo: /usr/include/bits/stdio_lim.h
ppolicy.lo: /usr/include/bits/sys_errlist.h
ppolicy.lo: ../../../include/ac/stdlib.h
ppolicy.lo: /usr/include/stdlib.h
ppolicy.lo: /usr/include/bits/waitflags.h
ppolicy.lo: /usr/include/bits/waitstatus.h
ppolicy.lo: /usr/include/endian.h
ppolicy.lo: /usr/include/bits/endian.h
ppolicy.lo: /usr/include/bits/byteswap.h
ppolicy.lo: /usr/include/bits/byteswap-16.h
ppolicy.lo: /usr/include/sys/types.h
ppolicy.lo: /usr/include/time.h
ppolicy.lo: /usr/include/sys/select.h
ppolicy.lo: /usr/include/bits/select.h
ppolicy.lo: /usr/include/bits/sigset.h
ppolicy.lo: /usr/include/bits/time.h
ppolicy.lo: /usr/include/sys/sysmacros.h
ppolicy.lo: /usr/include/bits/pthreadtypes.h
ppolicy.lo: /usr/include/alloca.h
ppolicy.lo: /usr/include/bits/stdlib-float.h
ppolicy.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
ppolicy.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
ppolicy.lo: /usr/include/limits.h
ppolicy.lo: /usr/include/bits/posix1_lim.h
ppolicy.lo: /usr/include/bits/local_lim.h
ppolicy.lo: /usr/include/linux/limits.h
ppolicy.lo: /usr/include/bits/posix2_lim.h
ppolicy.lo: ../../../include/ac/syslog.h
ppolicy.lo: /usr/include/syslog.h
ppolicy.lo: /usr/include/sys/syslog.h
ppolicy.lo: /usr/include/bits/syslog-path.h
ppolicy.lo: ../../../include/ac/regex.h
ppolicy.lo: /usr/include/regex.h
ppolicy.lo: ../../../include/ac/signal.h
ppolicy.lo: /usr/include/signal.h
ppolicy.lo: /usr/include/bits/signum.h
ppolicy.lo: /usr/include/bits/siginfo.h
ppolicy.lo: /usr/include/bits/sigaction.h
ppolicy.lo: /usr/include/bits/sigcontext.h
ppolicy.lo: /usr/include/bits/sigstack.h
ppolicy.lo: /usr/include/sys/ucontext.h
ppolicy.lo: /usr/include/bits/sigthread.h
ppolicy.lo: ../../../include/ac/socket.h
ppolicy.lo: /usr/include/poll.h
ppolicy.lo: /usr/include/sys/poll.h
ppolicy.lo: /usr/include/bits/poll.h
ppolicy.lo: /usr/include/sys/socket.h
ppolicy.lo: /usr/include/sys/uio.h
ppolicy.lo: /usr/include/bits/uio.h
ppolicy.lo: /usr/include/bits/socket.h
ppolicy.lo: /usr/include/bits/socket_type.h
ppolicy.lo: /usr/include/bits/sockaddr.h
ppolicy.lo: /usr/include/asm/socket.h
ppolicy.lo: /usr/include/asm-generic/socket.h
ppolicy.lo: /usr/include/asm/sockios.h
ppolicy.lo: /usr/include/asm-generic/sockios.h
ppolicy.lo: /usr/include/sys/un.h
ppolicy.lo: /usr/include/netinet/in.h
ppolicy.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
ppolicy.lo: /usr/include/stdint.h
ppolicy.lo: /usr/include/bits/wchar.h
ppolicy.lo: /usr/include/bits/in.h
ppolicy.lo: /usr/include/netinet/tcp.h
ppolicy.lo: /usr/include/arpa/inet.h
ppolicy.lo: /usr/include/arpa/nameser.h
ppolicy.lo: /usr/include/sys/param.h
ppolicy.lo: /usr/include/bits/param.h
ppolicy.lo: /usr/include/linux/param.h
ppolicy.lo: /usr/include/asm/param.h
ppolicy.lo: /usr/include/asm-generic/param.h
ppolicy.lo: /usr/include/sys/bitypes.h
ppolicy.lo: /usr/include/arpa/nameser_compat.h
ppolicy.lo: /usr/include/netdb.h
ppolicy.lo: /usr/include/rpc/netdb.h
ppolicy.lo: /usr/include/bits/netdb.h
ppolicy.lo: /usr/include/resolv.h
ppolicy.lo: ../../../include/ac/time.h
ppolicy.lo: /usr/include/sys/time.h
ppolicy.lo: ../../../include/ac/param.h
ppolicy.lo: ../../../include/ac/unistd.h
ppolicy.lo: /usr/include/unistd.h
ppolicy.lo: /usr/include/bits/posix_opt.h
ppolicy.lo: /usr/include/bits/environments.h
ppolicy.lo: /usr/include/bits/confname.h
ppolicy.lo: /usr/include/getopt.h
ppolicy.lo: ../../../include/lutil_lockf.h
ppolicy.lo: ../../../include/avl.h
ppolicy.lo: ../../../include/ldap_log.h
ppolicy.lo: ../../../include/ldap_schema.h
ppolicy.lo: ../../../include/lber_pvt.h
ppolicy.lo: ../../../include/ldap_pvt.h
ppolicy.lo: ../../../include/ldap_pvt_uc.h
ppolicy.lo: ../../../include/ac/bytes.h
ppolicy.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
ppolicy.lo: ../../../include/ldap_pvt_thread.h
ppolicy.lo: ../../../include/ldap_int_thread.h
ppolicy.lo: /usr/include/pthread.h
ppolicy.lo: /usr/include/sched.h
ppolicy.lo: /usr/include/bits/sched.h
ppolicy.lo: /usr/include/bits/setjmp.h
ppolicy.lo: ../../../include/ldap_queue.h
ppolicy.lo: ../proto-slap.h
ppolicy.lo: /opt/zimbra/libtool-2.2.6b/include/ltdl.h
ppolicy.lo: /opt/zimbra/libtool-2.2.6b/include/libltdl/lt_system.h
ppolicy.lo: /opt/zimbra/libtool-2.2.6b/include/libltdl/lt_error.h
ppolicy.lo: /opt/zimbra/libtool-2.2.6b/include/libltdl/lt_dlloader.h
ppolicy.lo: ../../../include/ac/errno.h
ppolicy.lo: /usr/include/errno.h
ppolicy.lo: /usr/include/bits/errno.h
ppolicy.lo: /usr/include/linux/errno.h
ppolicy.lo: /usr/include/asm/errno.h
ppolicy.lo: /usr/include/asm-generic/errno.h
ppolicy.lo: /usr/include/asm-generic/errno-base.h
ppolicy.lo: ../../../include/ac/string.h
ppolicy.lo: ../../../include/ac/ctype.h
ppolicy.lo: /usr/include/ctype.h
ppolicy.lo: ../config.h
refint.lo: refint.c
refint.lo: /usr/include/stdc-predef.h
refint.lo: ../../../include/portable.h
refint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
refint.lo: ../../../include/ac/fdset.h
refint.lo: /usr/include/bits/types.h
refint.lo: /usr/include/features.h
refint.lo: /usr/include/sys/cdefs.h
refint.lo: /usr/include/bits/wordsize.h
refint.lo: /usr/include/gnu/stubs.h
refint.lo: /usr/include/gnu/stubs-64.h
refint.lo: /usr/include/bits/typesizes.h
refint.lo: ../../../include/ldap_cdefs.h
refint.lo: ../../../include/ldap_features.h
refint.lo: ../../../include/ac/assert.h
refint.lo: /usr/include/assert.h
refint.lo: ../../../include/ac/localize.h
refint.lo: /usr/include/stdio.h
refint.lo: /usr/include/libio.h
refint.lo: /usr/include/_G_config.h
refint.lo: /usr/include/wchar.h
refint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
refint.lo: /usr/include/bits/stdio_lim.h
refint.lo: /usr/include/bits/sys_errlist.h
refint.lo: ../../../include/ac/string.h
refint.lo: /usr/include/string.h
refint.lo: /usr/include/xlocale.h
refint.lo: ../../../include/ac/socket.h
refint.lo: /usr/include/sys/types.h
refint.lo: /usr/include/time.h
refint.lo: /usr/include/endian.h
refint.lo: /usr/include/bits/endian.h
refint.lo: /usr/include/bits/byteswap.h
refint.lo: /usr/include/bits/byteswap-16.h
refint.lo: /usr/include/sys/select.h
refint.lo: /usr/include/bits/select.h
refint.lo: /usr/include/bits/sigset.h
refint.lo: /usr/include/bits/time.h
refint.lo: /usr/include/sys/sysmacros.h
refint.lo: /usr/include/bits/pthreadtypes.h
refint.lo: /usr/include/poll.h
refint.lo: /usr/include/sys/poll.h
refint.lo: /usr/include/bits/poll.h
refint.lo: /usr/include/sys/socket.h
refint.lo: /usr/include/sys/uio.h
refint.lo: /usr/include/bits/uio.h
refint.lo: /usr/include/bits/socket.h
refint.lo: /usr/include/bits/socket_type.h
refint.lo: /usr/include/bits/sockaddr.h
refint.lo: /usr/include/asm/socket.h
refint.lo: /usr/include/asm-generic/socket.h
refint.lo: /usr/include/asm/sockios.h
refint.lo: /usr/include/asm-generic/sockios.h
refint.lo: /usr/include/sys/un.h
refint.lo: /usr/include/netinet/in.h
refint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
refint.lo: /usr/include/stdint.h
refint.lo: /usr/include/bits/wchar.h
refint.lo: /usr/include/bits/in.h
refint.lo: /usr/include/netinet/tcp.h
refint.lo: /usr/include/arpa/inet.h
refint.lo: /usr/include/arpa/nameser.h
refint.lo: /usr/include/sys/param.h
refint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
refint.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
refint.lo: /usr/include/limits.h
refint.lo: /usr/include/bits/posix1_lim.h
refint.lo: /usr/include/bits/local_lim.h
refint.lo: /usr/include/linux/limits.h
refint.lo: /usr/include/bits/posix2_lim.h
refint.lo: /usr/include/signal.h
refint.lo: /usr/include/bits/signum.h
refint.lo: /usr/include/bits/siginfo.h
refint.lo: /usr/include/bits/sigaction.h
refint.lo: /usr/include/bits/sigcontext.h
refint.lo: /usr/include/bits/sigstack.h
refint.lo: /usr/include/sys/ucontext.h
refint.lo: /usr/include/bits/sigthread.h
refint.lo: /usr/include/bits/param.h
refint.lo: /usr/include/linux/param.h
refint.lo: /usr/include/asm/param.h
refint.lo: /usr/include/asm-generic/param.h
refint.lo: /usr/include/sys/bitypes.h
refint.lo: /usr/include/arpa/nameser_compat.h
refint.lo: /usr/include/netdb.h
refint.lo: /usr/include/rpc/netdb.h
refint.lo: /usr/include/bits/netdb.h
refint.lo: /usr/include/resolv.h
refint.lo: ../slap.h
refint.lo: ../../../include/ldap_defaults.h
refint.lo: ../../../include/ldap_config.h
refint.lo: ../../../include/ac/stdlib.h
refint.lo: /usr/include/stdlib.h
refint.lo: /usr/include/bits/waitflags.h
refint.lo: /usr/include/bits/waitstatus.h
refint.lo: /usr/include/alloca.h
refint.lo: /usr/include/bits/stdlib-float.h
refint.lo: ../../../include/ac/syslog.h
refint.lo: /usr/include/syslog.h
refint.lo: /usr/include/sys/syslog.h
refint.lo: /usr/include/bits/syslog-path.h
refint.lo: ../../../include/ac/regex.h
refint.lo: /usr/include/regex.h
refint.lo: ../../../include/ac/signal.h
refint.lo: ../../../include/ac/time.h
refint.lo: /usr/include/sys/time.h
refint.lo: ../../../include/ac/param.h
refint.lo: ../../../include/ac/unistd.h
refint.lo: /usr/include/unistd.h
refint.lo: /usr/include/bits/posix_opt.h
refint.lo: /usr/include/bits/environments.h
refint.lo: /usr/include/bits/confname.h
refint.lo: /usr/include/getopt.h
refint.lo: ../../../include/lutil_lockf.h
refint.lo: ../../../include/avl.h
refint.lo: ../../../include/ldap_cdefs.h
refint.lo: ../../../include/ldap_log.h
refint.lo: ../../../include/ldap.h
refint.lo: ../../../include/lber.h
refint.lo: ../../../include/lber_types.h
refint.lo: ../../../include/ldap_features.h
refint.lo: ../../../include/ldap_schema.h
refint.lo: ../../../include/lber_pvt.h
refint.lo: ../../../include/ldap_pvt.h
refint.lo: ../../../include/ldap_pvt_uc.h
refint.lo: ../../../include/ac/bytes.h
refint.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
refint.lo: ../../../include/ldap_pvt_thread.h
refint.lo: ../../../include/ldap_int_thread.h
refint.lo: /usr/include/pthread.h
refint.lo: /usr/include/sched.h
refint.lo: /usr/include/bits/sched.h
refint.lo: /usr/include/bits/setjmp.h
refint.lo: ../../../include/ldap_queue.h
refint.lo: ../proto-slap.h
refint.lo: ../config.h
refint.lo: ../../../include/ldap_rq.h
retcode.lo: retcode.c
retcode.lo: /usr/include/stdc-predef.h
retcode.lo: ../../../include/portable.h
retcode.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
retcode.lo: ../../../include/ac/fdset.h
retcode.lo: /usr/include/bits/types.h
retcode.lo: /usr/include/features.h
retcode.lo: /usr/include/sys/cdefs.h
retcode.lo: /usr/include/bits/wordsize.h
retcode.lo: /usr/include/gnu/stubs.h
retcode.lo: /usr/include/gnu/stubs-64.h
retcode.lo: /usr/include/bits/typesizes.h
retcode.lo: ../../../include/ldap_cdefs.h
retcode.lo: ../../../include/ldap_features.h
retcode.lo: ../../../include/ac/assert.h
retcode.lo: /usr/include/assert.h
retcode.lo: ../../../include/ac/localize.h
retcode.lo: /usr/include/stdio.h
retcode.lo: /usr/include/libio.h
retcode.lo: /usr/include/_G_config.h
retcode.lo: /usr/include/wchar.h
retcode.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
retcode.lo: /usr/include/bits/stdio_lim.h
retcode.lo: /usr/include/bits/sys_errlist.h
retcode.lo: ../../../include/ac/unistd.h
retcode.lo: /usr/include/sys/types.h
retcode.lo: /usr/include/time.h
retcode.lo: /usr/include/endian.h
retcode.lo: /usr/include/bits/endian.h
retcode.lo: /usr/include/bits/byteswap.h
retcode.lo: /usr/include/bits/byteswap-16.h
retcode.lo: /usr/include/sys/select.h
retcode.lo: /usr/include/bits/select.h
retcode.lo: /usr/include/bits/sigset.h
retcode.lo: /usr/include/bits/time.h
retcode.lo: /usr/include/sys/sysmacros.h
retcode.lo: /usr/include/bits/pthreadtypes.h
retcode.lo: /usr/include/unistd.h
retcode.lo: /usr/include/bits/posix_opt.h
retcode.lo: /usr/include/bits/environments.h
retcode.lo: /usr/include/bits/confname.h
retcode.lo: /usr/include/getopt.h
retcode.lo: ../../../include/lutil_lockf.h
retcode.lo: ../../../include/ac/string.h
retcode.lo: /usr/include/string.h
retcode.lo: /usr/include/xlocale.h
retcode.lo: ../../../include/ac/ctype.h
retcode.lo: /usr/include/ctype.h
retcode.lo: ../../../include/ac/socket.h
retcode.lo: /usr/include/poll.h
retcode.lo: /usr/include/sys/poll.h
retcode.lo: /usr/include/bits/poll.h
retcode.lo: /usr/include/sys/socket.h
retcode.lo: /usr/include/sys/uio.h
retcode.lo: /usr/include/bits/uio.h
retcode.lo: /usr/include/bits/socket.h
retcode.lo: /usr/include/bits/socket_type.h
retcode.lo: /usr/include/bits/sockaddr.h
retcode.lo: /usr/include/asm/socket.h
retcode.lo: /usr/include/asm-generic/socket.h
retcode.lo: /usr/include/asm/sockios.h
retcode.lo: /usr/include/asm-generic/sockios.h
retcode.lo: /usr/include/sys/un.h
retcode.lo: /usr/include/netinet/in.h
retcode.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
retcode.lo: /usr/include/stdint.h
retcode.lo: /usr/include/bits/wchar.h
retcode.lo: /usr/include/bits/in.h
retcode.lo: /usr/include/netinet/tcp.h
retcode.lo: /usr/include/arpa/inet.h
retcode.lo: /usr/include/arpa/nameser.h
retcode.lo: /usr/include/sys/param.h
retcode.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
retcode.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
retcode.lo: /usr/include/limits.h
retcode.lo: /usr/include/bits/posix1_lim.h
retcode.lo: /usr/include/bits/local_lim.h
retcode.lo: /usr/include/linux/limits.h
retcode.lo: /usr/include/bits/posix2_lim.h
retcode.lo: /usr/include/signal.h
retcode.lo: /usr/include/bits/signum.h
retcode.lo: /usr/include/bits/siginfo.h
retcode.lo: /usr/include/bits/sigaction.h
retcode.lo: /usr/include/bits/sigcontext.h
retcode.lo: /usr/include/bits/sigstack.h
retcode.lo: /usr/include/sys/ucontext.h
retcode.lo: /usr/include/bits/sigthread.h
retcode.lo: /usr/include/bits/param.h
retcode.lo: /usr/include/linux/param.h
retcode.lo: /usr/include/asm/param.h
retcode.lo: /usr/include/asm-generic/param.h
retcode.lo: /usr/include/sys/bitypes.h
retcode.lo: /usr/include/arpa/nameser_compat.h
retcode.lo: /usr/include/netdb.h
retcode.lo: /usr/include/rpc/netdb.h
retcode.lo: /usr/include/bits/netdb.h
retcode.lo: /usr/include/resolv.h
retcode.lo: ../slap.h
retcode.lo: ../../../include/ldap_defaults.h
retcode.lo: ../../../include/ldap_config.h
retcode.lo: ../../../include/ac/stdlib.h
retcode.lo: /usr/include/stdlib.h
retcode.lo: /usr/include/bits/waitflags.h
retcode.lo: /usr/include/bits/waitstatus.h
retcode.lo: /usr/include/alloca.h
retcode.lo: /usr/include/bits/stdlib-float.h
retcode.lo: ../../../include/ac/syslog.h
retcode.lo: /usr/include/syslog.h
retcode.lo: /usr/include/sys/syslog.h
retcode.lo: /usr/include/bits/syslog-path.h
retcode.lo: ../../../include/ac/regex.h
retcode.lo: /usr/include/regex.h
retcode.lo: ../../../include/ac/signal.h
retcode.lo: ../../../include/ac/time.h
retcode.lo: /usr/include/sys/time.h
retcode.lo: ../../../include/ac/param.h
retcode.lo: ../../../include/avl.h
retcode.lo: ../../../include/ldap_cdefs.h
retcode.lo: ../../../include/ldap_log.h
retcode.lo: ../../../include/ldap.h
retcode.lo: ../../../include/lber.h
retcode.lo: ../../../include/lber_types.h
retcode.lo: ../../../include/ldap_features.h
retcode.lo: ../../../include/ldap_schema.h
retcode.lo: ../../../include/lber_pvt.h
retcode.lo: ../../../include/ldap_pvt.h
retcode.lo: ../../../include/ldap_pvt_uc.h
retcode.lo: ../../../include/ac/bytes.h
retcode.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
retcode.lo: ../../../include/ldap_pvt_thread.h
retcode.lo: ../../../include/ldap_int_thread.h
retcode.lo: /usr/include/pthread.h
retcode.lo: /usr/include/sched.h
retcode.lo: /usr/include/bits/sched.h
retcode.lo: /usr/include/bits/setjmp.h
retcode.lo: ../../../include/ldap_queue.h
retcode.lo: ../proto-slap.h
retcode.lo: ../config.h
retcode.lo: ../../../include/lutil.h
retcode.lo: ../../../include/ldif.h
rwm.o: rwm.c
rwm.o: /usr/include/stdc-predef.h
rwm.o: ../../../include/portable.h
rwm.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
rwm.o: ../../../include/ac/fdset.h
rwm.o: /usr/include/bits/types.h
rwm.o: /usr/include/features.h
rwm.o: /usr/include/sys/cdefs.h
rwm.o: /usr/include/bits/wordsize.h
rwm.o: /usr/include/gnu/stubs.h
rwm.o: /usr/include/gnu/stubs-64.h
rwm.o: /usr/include/bits/typesizes.h
rwm.o: ../../../include/ldap_cdefs.h
rwm.o: ../../../include/ldap_features.h
rwm.o: ../../../include/ac/assert.h
rwm.o: /usr/include/assert.h
rwm.o: ../../../include/ac/localize.h
rwm.o: /usr/include/stdio.h
rwm.o: /usr/include/libio.h
rwm.o: /usr/include/_G_config.h
rwm.o: /usr/include/wchar.h
rwm.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
rwm.o: /usr/include/bits/stdio_lim.h
rwm.o: /usr/include/bits/sys_errlist.h
rwm.o: ../../../include/ac/string.h
rwm.o: /usr/include/string.h
rwm.o: /usr/include/xlocale.h
rwm.o: ../slap.h
rwm.o: ../../../include/ldap_defaults.h
rwm.o: ../../../include/ldap_config.h
rwm.o: ../../../include/ac/stdlib.h
rwm.o: /usr/include/stdlib.h
rwm.o: /usr/include/bits/waitflags.h
rwm.o: /usr/include/bits/waitstatus.h
rwm.o: /usr/include/endian.h
rwm.o: /usr/include/bits/endian.h
rwm.o: /usr/include/bits/byteswap.h
rwm.o: /usr/include/bits/byteswap-16.h
rwm.o: /usr/include/sys/types.h
rwm.o: /usr/include/time.h
rwm.o: /usr/include/sys/select.h
rwm.o: /usr/include/bits/select.h
rwm.o: /usr/include/bits/sigset.h
rwm.o: /usr/include/bits/time.h
rwm.o: /usr/include/sys/sysmacros.h
rwm.o: /usr/include/bits/pthreadtypes.h
rwm.o: /usr/include/alloca.h
rwm.o: /usr/include/bits/stdlib-float.h
rwm.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
rwm.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
rwm.o: /usr/include/limits.h
rwm.o: /usr/include/bits/posix1_lim.h
rwm.o: /usr/include/bits/local_lim.h
rwm.o: /usr/include/linux/limits.h
rwm.o: /usr/include/bits/posix2_lim.h
rwm.o: ../../../include/ac/syslog.h
rwm.o: /usr/include/syslog.h
rwm.o: /usr/include/sys/syslog.h
rwm.o: /usr/include/bits/syslog-path.h
rwm.o: ../../../include/ac/regex.h
rwm.o: /usr/include/regex.h
rwm.o: ../../../include/ac/signal.h
rwm.o: /usr/include/signal.h
rwm.o: /usr/include/bits/signum.h
rwm.o: /usr/include/bits/siginfo.h
rwm.o: /usr/include/bits/sigaction.h
rwm.o: /usr/include/bits/sigcontext.h
rwm.o: /usr/include/bits/sigstack.h
rwm.o: /usr/include/sys/ucontext.h
rwm.o: /usr/include/bits/sigthread.h
rwm.o: ../../../include/ac/socket.h
rwm.o: /usr/include/poll.h
rwm.o: /usr/include/sys/poll.h
rwm.o: /usr/include/bits/poll.h
rwm.o: /usr/include/sys/socket.h
rwm.o: /usr/include/sys/uio.h
rwm.o: /usr/include/bits/uio.h
rwm.o: /usr/include/bits/socket.h
rwm.o: /usr/include/bits/socket_type.h
rwm.o: /usr/include/bits/sockaddr.h
rwm.o: /usr/include/asm/socket.h
rwm.o: /usr/include/asm-generic/socket.h
rwm.o: /usr/include/asm/sockios.h
rwm.o: /usr/include/asm-generic/sockios.h
rwm.o: /usr/include/sys/un.h
rwm.o: /usr/include/netinet/in.h
rwm.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
rwm.o: /usr/include/stdint.h
rwm.o: /usr/include/bits/wchar.h
rwm.o: /usr/include/bits/in.h
rwm.o: /usr/include/netinet/tcp.h
rwm.o: /usr/include/arpa/inet.h
rwm.o: /usr/include/arpa/nameser.h
rwm.o: /usr/include/sys/param.h
rwm.o: /usr/include/bits/param.h
rwm.o: /usr/include/linux/param.h
rwm.o: /usr/include/asm/param.h
rwm.o: /usr/include/asm-generic/param.h
rwm.o: /usr/include/sys/bitypes.h
rwm.o: /usr/include/arpa/nameser_compat.h
rwm.o: /usr/include/netdb.h
rwm.o: /usr/include/rpc/netdb.h
rwm.o: /usr/include/bits/netdb.h
rwm.o: /usr/include/resolv.h
rwm.o: ../../../include/ac/time.h
rwm.o: /usr/include/sys/time.h
rwm.o: ../../../include/ac/param.h
rwm.o: ../../../include/ac/unistd.h
rwm.o: /usr/include/unistd.h
rwm.o: /usr/include/bits/posix_opt.h
rwm.o: /usr/include/bits/environments.h
rwm.o: /usr/include/bits/confname.h
rwm.o: /usr/include/getopt.h
rwm.o: ../../../include/lutil_lockf.h
rwm.o: ../../../include/avl.h
rwm.o: ../../../include/ldap_cdefs.h
rwm.o: ../../../include/ldap_log.h
rwm.o: ../../../include/ldap.h
rwm.o: ../../../include/lber.h
rwm.o: ../../../include/lber_types.h
rwm.o: ../../../include/ldap_features.h
rwm.o: ../../../include/ldap_schema.h
rwm.o: ../../../include/lber_pvt.h
rwm.o: ../../../include/ldap_pvt.h
rwm.o: ../../../include/ldap_pvt_uc.h
rwm.o: ../../../include/ac/bytes.h
rwm.o: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
rwm.o: ../../../include/ldap_pvt_thread.h
rwm.o: ../../../include/ldap_int_thread.h
rwm.o: /usr/include/pthread.h
rwm.o: /usr/include/sched.h
rwm.o: /usr/include/bits/sched.h
rwm.o: /usr/include/bits/setjmp.h
rwm.o: ../../../include/ldap_queue.h
rwm.o: ../proto-slap.h
rwm.o: ../../../include/rewrite.h
rwm.o: ../config.h
rwm.o: ../../../include/lutil.h
rwm.o: rwm.h
rwmconf.o: rwmconf.c
rwmconf.o: /usr/include/stdc-predef.h
rwmconf.o: ../../../include/portable.h
rwmconf.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
rwmconf.o: ../../../include/ac/fdset.h
rwmconf.o: /usr/include/bits/types.h
rwmconf.o: /usr/include/features.h
rwmconf.o: /usr/include/sys/cdefs.h
rwmconf.o: /usr/include/bits/wordsize.h
rwmconf.o: /usr/include/gnu/stubs.h
rwmconf.o: /usr/include/gnu/stubs-64.h
rwmconf.o: /usr/include/bits/typesizes.h
rwmconf.o: ../../../include/ldap_cdefs.h
rwmconf.o: ../../../include/ldap_features.h
rwmconf.o: ../../../include/ac/assert.h
rwmconf.o: /usr/include/assert.h
rwmconf.o: ../../../include/ac/localize.h
rwmconf.o: /usr/include/stdio.h
rwmconf.o: /usr/include/libio.h
rwmconf.o: /usr/include/_G_config.h
rwmconf.o: /usr/include/wchar.h
rwmconf.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
rwmconf.o: /usr/include/bits/stdio_lim.h
rwmconf.o: /usr/include/bits/sys_errlist.h
rwmconf.o: ../../../include/ac/string.h
rwmconf.o: /usr/include/string.h
rwmconf.o: /usr/include/xlocale.h
rwmconf.o: ../../../include/ac/socket.h
rwmconf.o: /usr/include/sys/types.h
rwmconf.o: /usr/include/time.h
rwmconf.o: /usr/include/endian.h
rwmconf.o: /usr/include/bits/endian.h
rwmconf.o: /usr/include/bits/byteswap.h
rwmconf.o: /usr/include/bits/byteswap-16.h
rwmconf.o: /usr/include/sys/select.h
rwmconf.o: /usr/include/bits/select.h
rwmconf.o: /usr/include/bits/sigset.h
rwmconf.o: /usr/include/bits/time.h
rwmconf.o: /usr/include/sys/sysmacros.h
rwmconf.o: /usr/include/bits/pthreadtypes.h
rwmconf.o: /usr/include/poll.h
rwmconf.o: /usr/include/sys/poll.h
rwmconf.o: /usr/include/bits/poll.h
rwmconf.o: /usr/include/sys/socket.h
rwmconf.o: /usr/include/sys/uio.h
rwmconf.o: /usr/include/bits/uio.h
rwmconf.o: /usr/include/bits/socket.h
rwmconf.o: /usr/include/bits/socket_type.h
rwmconf.o: /usr/include/bits/sockaddr.h
rwmconf.o: /usr/include/asm/socket.h
rwmconf.o: /usr/include/asm-generic/socket.h
rwmconf.o: /usr/include/asm/sockios.h
rwmconf.o: /usr/include/asm-generic/sockios.h
rwmconf.o: /usr/include/sys/un.h
rwmconf.o: /usr/include/netinet/in.h
rwmconf.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
rwmconf.o: /usr/include/stdint.h
rwmconf.o: /usr/include/bits/wchar.h
rwmconf.o: /usr/include/bits/in.h
rwmconf.o: /usr/include/netinet/tcp.h
rwmconf.o: /usr/include/arpa/inet.h
rwmconf.o: /usr/include/arpa/nameser.h
rwmconf.o: /usr/include/sys/param.h
rwmconf.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
rwmconf.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
rwmconf.o: /usr/include/limits.h
rwmconf.o: /usr/include/bits/posix1_lim.h
rwmconf.o: /usr/include/bits/local_lim.h
rwmconf.o: /usr/include/linux/limits.h
rwmconf.o: /usr/include/bits/posix2_lim.h
rwmconf.o: /usr/include/signal.h
rwmconf.o: /usr/include/bits/signum.h
rwmconf.o: /usr/include/bits/siginfo.h
rwmconf.o: /usr/include/bits/sigaction.h
rwmconf.o: /usr/include/bits/sigcontext.h
rwmconf.o: /usr/include/bits/sigstack.h
rwmconf.o: /usr/include/sys/ucontext.h
rwmconf.o: /usr/include/bits/sigthread.h
rwmconf.o: /usr/include/bits/param.h
rwmconf.o: /usr/include/linux/param.h
rwmconf.o: /usr/include/asm/param.h
rwmconf.o: /usr/include/asm-generic/param.h
rwmconf.o: /usr/include/sys/bitypes.h
rwmconf.o: /usr/include/arpa/nameser_compat.h
rwmconf.o: /usr/include/netdb.h
rwmconf.o: /usr/include/rpc/netdb.h
rwmconf.o: /usr/include/bits/netdb.h
rwmconf.o: /usr/include/resolv.h
rwmconf.o: ../slap.h
rwmconf.o: ../../../include/ldap_defaults.h
rwmconf.o: ../../../include/ldap_config.h
rwmconf.o: ../../../include/ac/stdlib.h
rwmconf.o: /usr/include/stdlib.h
rwmconf.o: /usr/include/bits/waitflags.h
rwmconf.o: /usr/include/bits/waitstatus.h
rwmconf.o: /usr/include/alloca.h
rwmconf.o: /usr/include/bits/stdlib-float.h
rwmconf.o: ../../../include/ac/syslog.h
rwmconf.o: /usr/include/syslog.h
rwmconf.o: /usr/include/sys/syslog.h
rwmconf.o: /usr/include/bits/syslog-path.h
rwmconf.o: ../../../include/ac/regex.h
rwmconf.o: /usr/include/regex.h
rwmconf.o: ../../../include/ac/signal.h
rwmconf.o: ../../../include/ac/time.h
rwmconf.o: /usr/include/sys/time.h
rwmconf.o: ../../../include/ac/param.h
rwmconf.o: ../../../include/ac/unistd.h
rwmconf.o: /usr/include/unistd.h
rwmconf.o: /usr/include/bits/posix_opt.h
rwmconf.o: /usr/include/bits/environments.h
rwmconf.o: /usr/include/bits/confname.h
rwmconf.o: /usr/include/getopt.h
rwmconf.o: ../../../include/lutil_lockf.h
rwmconf.o: ../../../include/avl.h
rwmconf.o: ../../../include/ldap_cdefs.h
rwmconf.o: ../../../include/ldap_log.h
rwmconf.o: ../../../include/ldap.h
rwmconf.o: ../../../include/lber.h
rwmconf.o: ../../../include/lber_types.h
rwmconf.o: ../../../include/ldap_features.h
rwmconf.o: ../../../include/ldap_schema.h
rwmconf.o: ../../../include/lber_pvt.h
rwmconf.o: ../../../include/ldap_pvt.h
rwmconf.o: ../../../include/ldap_pvt_uc.h
rwmconf.o: ../../../include/ac/bytes.h
rwmconf.o: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
rwmconf.o: ../../../include/ldap_pvt_thread.h
rwmconf.o: ../../../include/ldap_int_thread.h
rwmconf.o: /usr/include/pthread.h
rwmconf.o: /usr/include/sched.h
rwmconf.o: /usr/include/bits/sched.h
rwmconf.o: /usr/include/bits/setjmp.h
rwmconf.o: ../../../include/ldap_queue.h
rwmconf.o: ../proto-slap.h
rwmconf.o: rwm.h
rwmconf.o: ../../../include/rewrite.h
rwmconf.o: ../../../include/lutil.h
rwmdn.o: rwmdn.c
rwmdn.o: /usr/include/stdc-predef.h
rwmdn.o: ../../../include/portable.h
rwmdn.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
rwmdn.o: ../../../include/ac/fdset.h
rwmdn.o: /usr/include/bits/types.h
rwmdn.o: /usr/include/features.h
rwmdn.o: /usr/include/sys/cdefs.h
rwmdn.o: /usr/include/bits/wordsize.h
rwmdn.o: /usr/include/gnu/stubs.h
rwmdn.o: /usr/include/gnu/stubs-64.h
rwmdn.o: /usr/include/bits/typesizes.h
rwmdn.o: ../../../include/ldap_cdefs.h
rwmdn.o: ../../../include/ldap_features.h
rwmdn.o: ../../../include/ac/assert.h
rwmdn.o: /usr/include/assert.h
rwmdn.o: ../../../include/ac/localize.h
rwmdn.o: /usr/include/stdio.h
rwmdn.o: /usr/include/libio.h
rwmdn.o: /usr/include/_G_config.h
rwmdn.o: /usr/include/wchar.h
rwmdn.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
rwmdn.o: /usr/include/bits/stdio_lim.h
rwmdn.o: /usr/include/bits/sys_errlist.h
rwmdn.o: ../../../include/ac/string.h
rwmdn.o: /usr/include/string.h
rwmdn.o: /usr/include/xlocale.h
rwmdn.o: ../../../include/ac/socket.h
rwmdn.o: /usr/include/sys/types.h
rwmdn.o: /usr/include/time.h
rwmdn.o: /usr/include/endian.h
rwmdn.o: /usr/include/bits/endian.h
rwmdn.o: /usr/include/bits/byteswap.h
rwmdn.o: /usr/include/bits/byteswap-16.h
rwmdn.o: /usr/include/sys/select.h
rwmdn.o: /usr/include/bits/select.h
rwmdn.o: /usr/include/bits/sigset.h
rwmdn.o: /usr/include/bits/time.h
rwmdn.o: /usr/include/sys/sysmacros.h
rwmdn.o: /usr/include/bits/pthreadtypes.h
rwmdn.o: /usr/include/poll.h
rwmdn.o: /usr/include/sys/poll.h
rwmdn.o: /usr/include/bits/poll.h
rwmdn.o: /usr/include/sys/socket.h
rwmdn.o: /usr/include/sys/uio.h
rwmdn.o: /usr/include/bits/uio.h
rwmdn.o: /usr/include/bits/socket.h
rwmdn.o: /usr/include/bits/socket_type.h
rwmdn.o: /usr/include/bits/sockaddr.h
rwmdn.o: /usr/include/asm/socket.h
rwmdn.o: /usr/include/asm-generic/socket.h
rwmdn.o: /usr/include/asm/sockios.h
rwmdn.o: /usr/include/asm-generic/sockios.h
rwmdn.o: /usr/include/sys/un.h
rwmdn.o: /usr/include/netinet/in.h
rwmdn.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
rwmdn.o: /usr/include/stdint.h
rwmdn.o: /usr/include/bits/wchar.h
rwmdn.o: /usr/include/bits/in.h
rwmdn.o: /usr/include/netinet/tcp.h
rwmdn.o: /usr/include/arpa/inet.h
rwmdn.o: /usr/include/arpa/nameser.h
rwmdn.o: /usr/include/sys/param.h
rwmdn.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
rwmdn.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
rwmdn.o: /usr/include/limits.h
rwmdn.o: /usr/include/bits/posix1_lim.h
rwmdn.o: /usr/include/bits/local_lim.h
rwmdn.o: /usr/include/linux/limits.h
rwmdn.o: /usr/include/bits/posix2_lim.h
rwmdn.o: /usr/include/signal.h
rwmdn.o: /usr/include/bits/signum.h
rwmdn.o: /usr/include/bits/siginfo.h
rwmdn.o: /usr/include/bits/sigaction.h
rwmdn.o: /usr/include/bits/sigcontext.h
rwmdn.o: /usr/include/bits/sigstack.h
rwmdn.o: /usr/include/sys/ucontext.h
rwmdn.o: /usr/include/bits/sigthread.h
rwmdn.o: /usr/include/bits/param.h
rwmdn.o: /usr/include/linux/param.h
rwmdn.o: /usr/include/asm/param.h
rwmdn.o: /usr/include/asm-generic/param.h
rwmdn.o: /usr/include/sys/bitypes.h
rwmdn.o: /usr/include/arpa/nameser_compat.h
rwmdn.o: /usr/include/netdb.h
rwmdn.o: /usr/include/rpc/netdb.h
rwmdn.o: /usr/include/bits/netdb.h
rwmdn.o: /usr/include/resolv.h
rwmdn.o: ../slap.h
rwmdn.o: ../../../include/ldap_defaults.h
rwmdn.o: ../../../include/ldap_config.h
rwmdn.o: ../../../include/ac/stdlib.h
rwmdn.o: /usr/include/stdlib.h
rwmdn.o: /usr/include/bits/waitflags.h
rwmdn.o: /usr/include/bits/waitstatus.h
rwmdn.o: /usr/include/alloca.h
rwmdn.o: /usr/include/bits/stdlib-float.h
rwmdn.o: ../../../include/ac/syslog.h
rwmdn.o: /usr/include/syslog.h
rwmdn.o: /usr/include/sys/syslog.h
rwmdn.o: /usr/include/bits/syslog-path.h
rwmdn.o: ../../../include/ac/regex.h
rwmdn.o: /usr/include/regex.h
rwmdn.o: ../../../include/ac/signal.h
rwmdn.o: ../../../include/ac/time.h
rwmdn.o: /usr/include/sys/time.h
rwmdn.o: ../../../include/ac/param.h
rwmdn.o: ../../../include/ac/unistd.h
rwmdn.o: /usr/include/unistd.h
rwmdn.o: /usr/include/bits/posix_opt.h
rwmdn.o: /usr/include/bits/environments.h
rwmdn.o: /usr/include/bits/confname.h
rwmdn.o: /usr/include/getopt.h
rwmdn.o: ../../../include/lutil_lockf.h
rwmdn.o: ../../../include/avl.h
rwmdn.o: ../../../include/ldap_cdefs.h
rwmdn.o: ../../../include/ldap_log.h
rwmdn.o: ../../../include/ldap.h
rwmdn.o: ../../../include/lber.h
rwmdn.o: ../../../include/lber_types.h
rwmdn.o: ../../../include/ldap_features.h
rwmdn.o: ../../../include/ldap_schema.h
rwmdn.o: ../../../include/lber_pvt.h
rwmdn.o: ../../../include/ldap_pvt.h
rwmdn.o: ../../../include/ldap_pvt_uc.h
rwmdn.o: ../../../include/ac/bytes.h
rwmdn.o: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
rwmdn.o: ../../../include/ldap_pvt_thread.h
rwmdn.o: ../../../include/ldap_int_thread.h
rwmdn.o: /usr/include/pthread.h
rwmdn.o: /usr/include/sched.h
rwmdn.o: /usr/include/bits/sched.h
rwmdn.o: /usr/include/bits/setjmp.h
rwmdn.o: ../../../include/ldap_queue.h
rwmdn.o: ../proto-slap.h
rwmdn.o: rwm.h
rwmdn.o: ../../../include/rewrite.h
rwmmap.o: rwmmap.c
rwmmap.o: /usr/include/stdc-predef.h
rwmmap.o: ../../../include/portable.h
rwmmap.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
rwmmap.o: ../../../include/ac/fdset.h
rwmmap.o: /usr/include/bits/types.h
rwmmap.o: /usr/include/features.h
rwmmap.o: /usr/include/sys/cdefs.h
rwmmap.o: /usr/include/bits/wordsize.h
rwmmap.o: /usr/include/gnu/stubs.h
rwmmap.o: /usr/include/gnu/stubs-64.h
rwmmap.o: /usr/include/bits/typesizes.h
rwmmap.o: ../../../include/ldap_cdefs.h
rwmmap.o: ../../../include/ldap_features.h
rwmmap.o: ../../../include/ac/assert.h
rwmmap.o: /usr/include/assert.h
rwmmap.o: ../../../include/ac/localize.h
rwmmap.o: /usr/include/stdio.h
rwmmap.o: /usr/include/libio.h
rwmmap.o: /usr/include/_G_config.h
rwmmap.o: /usr/include/wchar.h
rwmmap.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
rwmmap.o: /usr/include/bits/stdio_lim.h
rwmmap.o: /usr/include/bits/sys_errlist.h
rwmmap.o: ../../../include/ac/string.h
rwmmap.o: /usr/include/string.h
rwmmap.o: /usr/include/xlocale.h
rwmmap.o: ../../../include/ac/socket.h
rwmmap.o: /usr/include/sys/types.h
rwmmap.o: /usr/include/time.h
rwmmap.o: /usr/include/endian.h
rwmmap.o: /usr/include/bits/endian.h
rwmmap.o: /usr/include/bits/byteswap.h
rwmmap.o: /usr/include/bits/byteswap-16.h
rwmmap.o: /usr/include/sys/select.h
rwmmap.o: /usr/include/bits/select.h
rwmmap.o: /usr/include/bits/sigset.h
rwmmap.o: /usr/include/bits/time.h
rwmmap.o: /usr/include/sys/sysmacros.h
rwmmap.o: /usr/include/bits/pthreadtypes.h
rwmmap.o: /usr/include/poll.h
rwmmap.o: /usr/include/sys/poll.h
rwmmap.o: /usr/include/bits/poll.h
rwmmap.o: /usr/include/sys/socket.h
rwmmap.o: /usr/include/sys/uio.h
rwmmap.o: /usr/include/bits/uio.h
rwmmap.o: /usr/include/bits/socket.h
rwmmap.o: /usr/include/bits/socket_type.h
rwmmap.o: /usr/include/bits/sockaddr.h
rwmmap.o: /usr/include/asm/socket.h
rwmmap.o: /usr/include/asm-generic/socket.h
rwmmap.o: /usr/include/asm/sockios.h
rwmmap.o: /usr/include/asm-generic/sockios.h
rwmmap.o: /usr/include/sys/un.h
rwmmap.o: /usr/include/netinet/in.h
rwmmap.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
rwmmap.o: /usr/include/stdint.h
rwmmap.o: /usr/include/bits/wchar.h
rwmmap.o: /usr/include/bits/in.h
rwmmap.o: /usr/include/netinet/tcp.h
rwmmap.o: /usr/include/arpa/inet.h
rwmmap.o: /usr/include/arpa/nameser.h
rwmmap.o: /usr/include/sys/param.h
rwmmap.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
rwmmap.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
rwmmap.o: /usr/include/limits.h
rwmmap.o: /usr/include/bits/posix1_lim.h
rwmmap.o: /usr/include/bits/local_lim.h
rwmmap.o: /usr/include/linux/limits.h
rwmmap.o: /usr/include/bits/posix2_lim.h
rwmmap.o: /usr/include/signal.h
rwmmap.o: /usr/include/bits/signum.h
rwmmap.o: /usr/include/bits/siginfo.h
rwmmap.o: /usr/include/bits/sigaction.h
rwmmap.o: /usr/include/bits/sigcontext.h
rwmmap.o: /usr/include/bits/sigstack.h
rwmmap.o: /usr/include/sys/ucontext.h
rwmmap.o: /usr/include/bits/sigthread.h
rwmmap.o: /usr/include/bits/param.h
rwmmap.o: /usr/include/linux/param.h
rwmmap.o: /usr/include/asm/param.h
rwmmap.o: /usr/include/asm-generic/param.h
rwmmap.o: /usr/include/sys/bitypes.h
rwmmap.o: /usr/include/arpa/nameser_compat.h
rwmmap.o: /usr/include/netdb.h
rwmmap.o: /usr/include/rpc/netdb.h
rwmmap.o: /usr/include/bits/netdb.h
rwmmap.o: /usr/include/resolv.h
rwmmap.o: ../slap.h
rwmmap.o: ../../../include/ldap_defaults.h
rwmmap.o: ../../../include/ldap_config.h
rwmmap.o: ../../../include/ac/stdlib.h
rwmmap.o: /usr/include/stdlib.h
rwmmap.o: /usr/include/bits/waitflags.h
rwmmap.o: /usr/include/bits/waitstatus.h
rwmmap.o: /usr/include/alloca.h
rwmmap.o: /usr/include/bits/stdlib-float.h
rwmmap.o: ../../../include/ac/syslog.h
rwmmap.o: /usr/include/syslog.h
rwmmap.o: /usr/include/sys/syslog.h
rwmmap.o: /usr/include/bits/syslog-path.h
rwmmap.o: ../../../include/ac/regex.h
rwmmap.o: /usr/include/regex.h
rwmmap.o: ../../../include/ac/signal.h
rwmmap.o: ../../../include/ac/time.h
rwmmap.o: /usr/include/sys/time.h
rwmmap.o: ../../../include/ac/param.h
rwmmap.o: ../../../include/ac/unistd.h
rwmmap.o: /usr/include/unistd.h
rwmmap.o: /usr/include/bits/posix_opt.h
rwmmap.o: /usr/include/bits/environments.h
rwmmap.o: /usr/include/bits/confname.h
rwmmap.o: /usr/include/getopt.h
rwmmap.o: ../../../include/lutil_lockf.h
rwmmap.o: ../../../include/avl.h
rwmmap.o: ../../../include/ldap_cdefs.h
rwmmap.o: ../../../include/ldap_log.h
rwmmap.o: ../../../include/ldap.h
rwmmap.o: ../../../include/lber.h
rwmmap.o: ../../../include/lber_types.h
rwmmap.o: ../../../include/ldap_features.h
rwmmap.o: ../../../include/ldap_schema.h
rwmmap.o: ../../../include/lber_pvt.h
rwmmap.o: ../../../include/ldap_pvt.h
rwmmap.o: ../../../include/ldap_pvt_uc.h
rwmmap.o: ../../../include/ac/bytes.h
rwmmap.o: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
rwmmap.o: ../../../include/ldap_pvt_thread.h
rwmmap.o: ../../../include/ldap_int_thread.h
rwmmap.o: /usr/include/pthread.h
rwmmap.o: /usr/include/sched.h
rwmmap.o: /usr/include/bits/sched.h
rwmmap.o: /usr/include/bits/setjmp.h
rwmmap.o: ../../../include/ldap_queue.h
rwmmap.o: ../proto-slap.h
rwmmap.o: rwm.h
rwmmap.o: ../../../include/rewrite.h
rwmmap.o: ../../../libraries/libldap/ldap-int.h
rwmmap.o: ../../../libraries/libldap/../liblber/lber-int.h
rwmmap.o: ../../../include/lutil.h
rwmmap.o: /opt/zimbra/cyrus-sasl-2.1.26.2z/include/sasl/sasl.h
rwmmap.o: /opt/zimbra/cyrus-sasl-2.1.26.2z/include/sasl/prop.h
seqmod.lo: seqmod.c
seqmod.lo: /usr/include/stdc-predef.h
seqmod.lo: ../../../include/portable.h
seqmod.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
seqmod.lo: ../../../include/ac/fdset.h
seqmod.lo: /usr/include/bits/types.h
seqmod.lo: /usr/include/features.h
seqmod.lo: /usr/include/sys/cdefs.h
seqmod.lo: /usr/include/bits/wordsize.h
seqmod.lo: /usr/include/gnu/stubs.h
seqmod.lo: /usr/include/gnu/stubs-64.h
seqmod.lo: /usr/include/bits/typesizes.h
seqmod.lo: ../../../include/ldap_cdefs.h
seqmod.lo: ../../../include/ldap_features.h
seqmod.lo: ../../../include/ac/assert.h
seqmod.lo: /usr/include/assert.h
seqmod.lo: ../../../include/ac/localize.h
seqmod.lo: ../slap.h
seqmod.lo: ../../../include/ldap_defaults.h
seqmod.lo: ../../../include/ldap_config.h
seqmod.lo: /usr/include/stdio.h
seqmod.lo: /usr/include/libio.h
seqmod.lo: /usr/include/_G_config.h
seqmod.lo: /usr/include/wchar.h
seqmod.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
seqmod.lo: /usr/include/bits/stdio_lim.h
seqmod.lo: /usr/include/bits/sys_errlist.h
seqmod.lo: ../../../include/ac/stdlib.h
seqmod.lo: /usr/include/stdlib.h
seqmod.lo: /usr/include/bits/waitflags.h
seqmod.lo: /usr/include/bits/waitstatus.h
seqmod.lo: /usr/include/endian.h
seqmod.lo: /usr/include/bits/endian.h
seqmod.lo: /usr/include/bits/byteswap.h
seqmod.lo: /usr/include/bits/byteswap-16.h
seqmod.lo: /usr/include/sys/types.h
seqmod.lo: /usr/include/time.h
seqmod.lo: /usr/include/sys/select.h
seqmod.lo: /usr/include/bits/select.h
seqmod.lo: /usr/include/bits/sigset.h
seqmod.lo: /usr/include/bits/time.h
seqmod.lo: /usr/include/sys/sysmacros.h
seqmod.lo: /usr/include/bits/pthreadtypes.h
seqmod.lo: /usr/include/alloca.h
seqmod.lo: /usr/include/bits/stdlib-float.h
seqmod.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
seqmod.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
seqmod.lo: /usr/include/limits.h
seqmod.lo: /usr/include/bits/posix1_lim.h
seqmod.lo: /usr/include/bits/local_lim.h
seqmod.lo: /usr/include/linux/limits.h
seqmod.lo: /usr/include/bits/posix2_lim.h
seqmod.lo: ../../../include/ac/syslog.h
seqmod.lo: /usr/include/syslog.h
seqmod.lo: /usr/include/sys/syslog.h
seqmod.lo: /usr/include/bits/syslog-path.h
seqmod.lo: ../../../include/ac/regex.h
seqmod.lo: /usr/include/regex.h
seqmod.lo: ../../../include/ac/signal.h
seqmod.lo: /usr/include/signal.h
seqmod.lo: /usr/include/bits/signum.h
seqmod.lo: /usr/include/bits/siginfo.h
seqmod.lo: /usr/include/bits/sigaction.h
seqmod.lo: /usr/include/bits/sigcontext.h
seqmod.lo: /usr/include/bits/sigstack.h
seqmod.lo: /usr/include/sys/ucontext.h
seqmod.lo: /usr/include/bits/sigthread.h
seqmod.lo: ../../../include/ac/socket.h
seqmod.lo: /usr/include/poll.h
seqmod.lo: /usr/include/sys/poll.h
seqmod.lo: /usr/include/bits/poll.h
seqmod.lo: /usr/include/sys/socket.h
seqmod.lo: /usr/include/sys/uio.h
seqmod.lo: /usr/include/bits/uio.h
seqmod.lo: /usr/include/bits/socket.h
seqmod.lo: /usr/include/bits/socket_type.h
seqmod.lo: /usr/include/bits/sockaddr.h
seqmod.lo: /usr/include/asm/socket.h
seqmod.lo: /usr/include/asm-generic/socket.h
seqmod.lo: /usr/include/asm/sockios.h
seqmod.lo: /usr/include/asm-generic/sockios.h
seqmod.lo: /usr/include/sys/un.h
seqmod.lo: /usr/include/string.h
seqmod.lo: /usr/include/xlocale.h
seqmod.lo: /usr/include/netinet/in.h
seqmod.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
seqmod.lo: /usr/include/stdint.h
seqmod.lo: /usr/include/bits/wchar.h
seqmod.lo: /usr/include/bits/in.h
seqmod.lo: /usr/include/netinet/tcp.h
seqmod.lo: /usr/include/arpa/inet.h
seqmod.lo: /usr/include/arpa/nameser.h
seqmod.lo: /usr/include/sys/param.h
seqmod.lo: /usr/include/bits/param.h
seqmod.lo: /usr/include/linux/param.h
seqmod.lo: /usr/include/asm/param.h
seqmod.lo: /usr/include/asm-generic/param.h
seqmod.lo: /usr/include/sys/bitypes.h
seqmod.lo: /usr/include/arpa/nameser_compat.h
seqmod.lo: /usr/include/netdb.h
seqmod.lo: /usr/include/rpc/netdb.h
seqmod.lo: /usr/include/bits/netdb.h
seqmod.lo: /usr/include/resolv.h
seqmod.lo: ../../../include/ac/time.h
seqmod.lo: /usr/include/sys/time.h
seqmod.lo: ../../../include/ac/param.h
seqmod.lo: ../../../include/ac/unistd.h
seqmod.lo: /usr/include/unistd.h
seqmod.lo: /usr/include/bits/posix_opt.h
seqmod.lo: /usr/include/bits/environments.h
seqmod.lo: /usr/include/bits/confname.h
seqmod.lo: /usr/include/getopt.h
seqmod.lo: ../../../include/lutil_lockf.h
seqmod.lo: ../../../include/avl.h
seqmod.lo: ../../../include/ldap_cdefs.h
seqmod.lo: ../../../include/ldap_log.h
seqmod.lo: ../../../include/ldap.h
seqmod.lo: ../../../include/lber.h
seqmod.lo: ../../../include/lber_types.h
seqmod.lo: ../../../include/ldap_features.h
seqmod.lo: ../../../include/ldap_schema.h
seqmod.lo: ../../../include/lber_pvt.h
seqmod.lo: ../../../include/ldap_pvt.h
seqmod.lo: ../../../include/ldap_pvt_uc.h
seqmod.lo: ../../../include/ac/bytes.h
seqmod.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
seqmod.lo: ../../../include/ldap_pvt_thread.h
seqmod.lo: ../../../include/ldap_int_thread.h
seqmod.lo: /usr/include/pthread.h
seqmod.lo: /usr/include/sched.h
seqmod.lo: /usr/include/bits/sched.h
seqmod.lo: /usr/include/bits/setjmp.h
seqmod.lo: ../../../include/ldap_queue.h
seqmod.lo: ../proto-slap.h
seqmod.lo: ../config.h
seqmod.lo: ../../../include/ac/string.h
sssvlv.o: sssvlv.c
sssvlv.o: /usr/include/stdc-predef.h
sssvlv.o: ../../../include/portable.h
sssvlv.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
sssvlv.o: ../../../include/ac/fdset.h
sssvlv.o: /usr/include/bits/types.h
sssvlv.o: /usr/include/features.h
sssvlv.o: /usr/include/sys/cdefs.h
sssvlv.o: /usr/include/bits/wordsize.h
sssvlv.o: /usr/include/gnu/stubs.h
sssvlv.o: /usr/include/gnu/stubs-64.h
sssvlv.o: /usr/include/bits/typesizes.h
sssvlv.o: ../../../include/ldap_cdefs.h
sssvlv.o: ../../../include/ldap_features.h
sssvlv.o: ../../../include/ac/assert.h
sssvlv.o: /usr/include/assert.h
sssvlv.o: ../../../include/ac/localize.h
sssvlv.o: /usr/include/stdio.h
sssvlv.o: /usr/include/libio.h
sssvlv.o: /usr/include/_G_config.h
sssvlv.o: /usr/include/wchar.h
sssvlv.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
sssvlv.o: /usr/include/bits/stdio_lim.h
sssvlv.o: /usr/include/bits/sys_errlist.h
sssvlv.o: ../../../include/ac/string.h
sssvlv.o: /usr/include/string.h
sssvlv.o: /usr/include/xlocale.h
sssvlv.o: ../../../include/ac/ctype.h
sssvlv.o: /usr/include/ctype.h
sssvlv.o: /usr/include/endian.h
sssvlv.o: /usr/include/bits/endian.h
sssvlv.o: /usr/include/bits/byteswap.h
sssvlv.o: /usr/include/bits/byteswap-16.h
sssvlv.o: ../../../include/avl.h
sssvlv.o: ../../../include/ldap_cdefs.h
sssvlv.o: ../slap.h
sssvlv.o: ../../../include/ldap_defaults.h
sssvlv.o: ../../../include/ldap_config.h
sssvlv.o: ../../../include/ac/stdlib.h
sssvlv.o: /usr/include/stdlib.h
sssvlv.o: /usr/include/bits/waitflags.h
sssvlv.o: /usr/include/bits/waitstatus.h
sssvlv.o: /usr/include/sys/types.h
sssvlv.o: /usr/include/time.h
sssvlv.o: /usr/include/sys/select.h
sssvlv.o: /usr/include/bits/select.h
sssvlv.o: /usr/include/bits/sigset.h
sssvlv.o: /usr/include/bits/time.h
sssvlv.o: /usr/include/sys/sysmacros.h
sssvlv.o: /usr/include/bits/pthreadtypes.h
sssvlv.o: /usr/include/alloca.h
sssvlv.o: /usr/include/bits/stdlib-float.h
sssvlv.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
sssvlv.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
sssvlv.o: /usr/include/limits.h
sssvlv.o: /usr/include/bits/posix1_lim.h
sssvlv.o: /usr/include/bits/local_lim.h
sssvlv.o: /usr/include/linux/limits.h
sssvlv.o: /usr/include/bits/posix2_lim.h
sssvlv.o: ../../../include/ac/syslog.h
sssvlv.o: /usr/include/syslog.h
sssvlv.o: /usr/include/sys/syslog.h
sssvlv.o: /usr/include/bits/syslog-path.h
sssvlv.o: ../../../include/ac/regex.h
sssvlv.o: /usr/include/regex.h
sssvlv.o: ../../../include/ac/signal.h
sssvlv.o: /usr/include/signal.h
sssvlv.o: /usr/include/bits/signum.h
sssvlv.o: /usr/include/bits/siginfo.h
sssvlv.o: /usr/include/bits/sigaction.h
sssvlv.o: /usr/include/bits/sigcontext.h
sssvlv.o: /usr/include/bits/sigstack.h
sssvlv.o: /usr/include/sys/ucontext.h
sssvlv.o: /usr/include/bits/sigthread.h
sssvlv.o: ../../../include/ac/socket.h
sssvlv.o: /usr/include/poll.h
sssvlv.o: /usr/include/sys/poll.h
sssvlv.o: /usr/include/bits/poll.h
sssvlv.o: /usr/include/sys/socket.h
sssvlv.o: /usr/include/sys/uio.h
sssvlv.o: /usr/include/bits/uio.h
sssvlv.o: /usr/include/bits/socket.h
sssvlv.o: /usr/include/bits/socket_type.h
sssvlv.o: /usr/include/bits/sockaddr.h
sssvlv.o: /usr/include/asm/socket.h
sssvlv.o: /usr/include/asm-generic/socket.h
sssvlv.o: /usr/include/asm/sockios.h
sssvlv.o: /usr/include/asm-generic/sockios.h
sssvlv.o: /usr/include/sys/un.h
sssvlv.o: /usr/include/netinet/in.h
sssvlv.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
sssvlv.o: /usr/include/stdint.h
sssvlv.o: /usr/include/bits/wchar.h
sssvlv.o: /usr/include/bits/in.h
sssvlv.o: /usr/include/netinet/tcp.h
sssvlv.o: /usr/include/arpa/inet.h
sssvlv.o: /usr/include/arpa/nameser.h
sssvlv.o: /usr/include/sys/param.h
sssvlv.o: /usr/include/bits/param.h
sssvlv.o: /usr/include/linux/param.h
sssvlv.o: /usr/include/asm/param.h
sssvlv.o: /usr/include/asm-generic/param.h
sssvlv.o: /usr/include/sys/bitypes.h
sssvlv.o: /usr/include/arpa/nameser_compat.h
sssvlv.o: /usr/include/netdb.h
sssvlv.o: /usr/include/rpc/netdb.h
sssvlv.o: /usr/include/bits/netdb.h
sssvlv.o: /usr/include/resolv.h
sssvlv.o: ../../../include/ac/time.h
sssvlv.o: /usr/include/sys/time.h
sssvlv.o: ../../../include/ac/param.h
sssvlv.o: ../../../include/ac/unistd.h
sssvlv.o: /usr/include/unistd.h
sssvlv.o: /usr/include/bits/posix_opt.h
sssvlv.o: /usr/include/bits/environments.h
sssvlv.o: /usr/include/bits/confname.h
sssvlv.o: /usr/include/getopt.h
sssvlv.o: ../../../include/lutil_lockf.h
sssvlv.o: ../../../include/ldap_log.h
sssvlv.o: ../../../include/ldap.h
sssvlv.o: ../../../include/lber.h
sssvlv.o: ../../../include/lber_types.h
sssvlv.o: ../../../include/ldap_features.h
sssvlv.o: ../../../include/ldap_schema.h
sssvlv.o: ../../../include/lber_pvt.h
sssvlv.o: ../../../include/ldap_pvt.h
sssvlv.o: ../../../include/ldap_pvt_uc.h
sssvlv.o: ../../../include/ac/bytes.h
sssvlv.o: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
sssvlv.o: ../../../include/ldap_pvt_thread.h
sssvlv.o: ../../../include/ldap_int_thread.h
sssvlv.o: /usr/include/pthread.h
sssvlv.o: /usr/include/sched.h
sssvlv.o: /usr/include/bits/sched.h
sssvlv.o: /usr/include/bits/setjmp.h
sssvlv.o: ../../../include/ldap_queue.h
sssvlv.o: ../proto-slap.h
sssvlv.o: ../../../include/lutil.h
sssvlv.o: ../config.h
sssvlv.o: ../../../libraries/liblber/lber-int.h
syncprov.lo: syncprov.c
syncprov.lo: /usr/include/stdc-predef.h
syncprov.lo: ../../../include/portable.h
syncprov.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
syncprov.lo: ../../../include/ac/fdset.h
syncprov.lo: /usr/include/bits/types.h
syncprov.lo: /usr/include/features.h
syncprov.lo: /usr/include/sys/cdefs.h
syncprov.lo: /usr/include/bits/wordsize.h
syncprov.lo: /usr/include/gnu/stubs.h
syncprov.lo: /usr/include/gnu/stubs-64.h
syncprov.lo: /usr/include/bits/typesizes.h
syncprov.lo: ../../../include/ldap_cdefs.h
syncprov.lo: ../../../include/ldap_features.h
syncprov.lo: ../../../include/ac/assert.h
syncprov.lo: /usr/include/assert.h
syncprov.lo: ../../../include/ac/localize.h
syncprov.lo: ../../../include/ac/string.h
syncprov.lo: /usr/include/string.h
syncprov.lo: /usr/include/xlocale.h
syncprov.lo: ../../../include/lutil.h
syncprov.lo: ../../../include/ldap_cdefs.h
syncprov.lo: ../../../include/lber_types.h
syncprov.lo: ../slap.h
syncprov.lo: ../../../include/ldap_defaults.h
syncprov.lo: ../../../include/ldap_config.h
syncprov.lo: /usr/include/stdio.h
syncprov.lo: /usr/include/libio.h
syncprov.lo: /usr/include/_G_config.h
syncprov.lo: /usr/include/wchar.h
syncprov.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
syncprov.lo: /usr/include/bits/stdio_lim.h
syncprov.lo: /usr/include/bits/sys_errlist.h
syncprov.lo: ../../../include/ac/stdlib.h
syncprov.lo: /usr/include/stdlib.h
syncprov.lo: /usr/include/bits/waitflags.h
syncprov.lo: /usr/include/bits/waitstatus.h
syncprov.lo: /usr/include/endian.h
syncprov.lo: /usr/include/bits/endian.h
syncprov.lo: /usr/include/bits/byteswap.h
syncprov.lo: /usr/include/bits/byteswap-16.h
syncprov.lo: /usr/include/sys/types.h
syncprov.lo: /usr/include/time.h
syncprov.lo: /usr/include/sys/select.h
syncprov.lo: /usr/include/bits/select.h
syncprov.lo: /usr/include/bits/sigset.h
syncprov.lo: /usr/include/bits/time.h
syncprov.lo: /usr/include/sys/sysmacros.h
syncprov.lo: /usr/include/bits/pthreadtypes.h
syncprov.lo: /usr/include/alloca.h
syncprov.lo: /usr/include/bits/stdlib-float.h
syncprov.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
syncprov.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
syncprov.lo: /usr/include/limits.h
syncprov.lo: /usr/include/bits/posix1_lim.h
syncprov.lo: /usr/include/bits/local_lim.h
syncprov.lo: /usr/include/linux/limits.h
syncprov.lo: /usr/include/bits/posix2_lim.h
syncprov.lo: ../../../include/ac/syslog.h
syncprov.lo: /usr/include/syslog.h
syncprov.lo: /usr/include/sys/syslog.h
syncprov.lo: /usr/include/bits/syslog-path.h
syncprov.lo: ../../../include/ac/regex.h
syncprov.lo: /usr/include/regex.h
syncprov.lo: ../../../include/ac/signal.h
syncprov.lo: /usr/include/signal.h
syncprov.lo: /usr/include/bits/signum.h
syncprov.lo: /usr/include/bits/siginfo.h
syncprov.lo: /usr/include/bits/sigaction.h
syncprov.lo: /usr/include/bits/sigcontext.h
syncprov.lo: /usr/include/bits/sigstack.h
syncprov.lo: /usr/include/sys/ucontext.h
syncprov.lo: /usr/include/bits/sigthread.h
syncprov.lo: ../../../include/ac/socket.h
syncprov.lo: /usr/include/poll.h
syncprov.lo: /usr/include/sys/poll.h
syncprov.lo: /usr/include/bits/poll.h
syncprov.lo: /usr/include/sys/socket.h
syncprov.lo: /usr/include/sys/uio.h
syncprov.lo: /usr/include/bits/uio.h
syncprov.lo: /usr/include/bits/socket.h
syncprov.lo: /usr/include/bits/socket_type.h
syncprov.lo: /usr/include/bits/sockaddr.h
syncprov.lo: /usr/include/asm/socket.h
syncprov.lo: /usr/include/asm-generic/socket.h
syncprov.lo: /usr/include/asm/sockios.h
syncprov.lo: /usr/include/asm-generic/sockios.h
syncprov.lo: /usr/include/sys/un.h
syncprov.lo: /usr/include/netinet/in.h
syncprov.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
syncprov.lo: /usr/include/stdint.h
syncprov.lo: /usr/include/bits/wchar.h
syncprov.lo: /usr/include/bits/in.h
syncprov.lo: /usr/include/netinet/tcp.h
syncprov.lo: /usr/include/arpa/inet.h
syncprov.lo: /usr/include/arpa/nameser.h
syncprov.lo: /usr/include/sys/param.h
syncprov.lo: /usr/include/bits/param.h
syncprov.lo: /usr/include/linux/param.h
syncprov.lo: /usr/include/asm/param.h
syncprov.lo: /usr/include/asm-generic/param.h
syncprov.lo: /usr/include/sys/bitypes.h
syncprov.lo: /usr/include/arpa/nameser_compat.h
syncprov.lo: /usr/include/netdb.h
syncprov.lo: /usr/include/rpc/netdb.h
syncprov.lo: /usr/include/bits/netdb.h
syncprov.lo: /usr/include/resolv.h
syncprov.lo: ../../../include/ac/time.h
syncprov.lo: /usr/include/sys/time.h
syncprov.lo: ../../../include/ac/param.h
syncprov.lo: ../../../include/ac/unistd.h
syncprov.lo: /usr/include/unistd.h
syncprov.lo: /usr/include/bits/posix_opt.h
syncprov.lo: /usr/include/bits/environments.h
syncprov.lo: /usr/include/bits/confname.h
syncprov.lo: /usr/include/getopt.h
syncprov.lo: ../../../include/lutil_lockf.h
syncprov.lo: ../../../include/avl.h
syncprov.lo: ../../../include/ldap_log.h
syncprov.lo: ../../../include/ldap.h
syncprov.lo: ../../../include/lber.h
syncprov.lo: ../../../include/ldap_features.h
syncprov.lo: ../../../include/ldap_schema.h
syncprov.lo: ../../../include/lber_pvt.h
syncprov.lo: ../../../include/ldap_pvt.h
syncprov.lo: ../../../include/ldap_pvt_uc.h
syncprov.lo: ../../../include/ac/bytes.h
syncprov.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
syncprov.lo: ../../../include/ldap_pvt_thread.h
syncprov.lo: ../../../include/ldap_int_thread.h
syncprov.lo: /usr/include/pthread.h
syncprov.lo: /usr/include/sched.h
syncprov.lo: /usr/include/bits/sched.h
syncprov.lo: /usr/include/bits/setjmp.h
syncprov.lo: ../../../include/ldap_queue.h
syncprov.lo: ../proto-slap.h
syncprov.lo: ../config.h
syncprov.lo: ../../../include/ldap_rq.h
translucent.lo: translucent.c
translucent.lo: /usr/include/stdc-predef.h
translucent.lo: ../../../include/portable.h
translucent.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
translucent.lo: ../../../include/ac/fdset.h
translucent.lo: /usr/include/bits/types.h
translucent.lo: /usr/include/features.h
translucent.lo: /usr/include/sys/cdefs.h
translucent.lo: /usr/include/bits/wordsize.h
translucent.lo: /usr/include/gnu/stubs.h
translucent.lo: /usr/include/gnu/stubs-64.h
translucent.lo: /usr/include/bits/typesizes.h
translucent.lo: ../../../include/ldap_cdefs.h
translucent.lo: ../../../include/ldap_features.h
translucent.lo: ../../../include/ac/assert.h
translucent.lo: /usr/include/assert.h
translucent.lo: ../../../include/ac/localize.h
translucent.lo: /usr/include/stdio.h
translucent.lo: /usr/include/libio.h
translucent.lo: /usr/include/_G_config.h
translucent.lo: /usr/include/wchar.h
translucent.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
translucent.lo: /usr/include/bits/stdio_lim.h
translucent.lo: /usr/include/bits/sys_errlist.h
translucent.lo: ../../../include/ac/string.h
translucent.lo: /usr/include/string.h
translucent.lo: /usr/include/xlocale.h
translucent.lo: ../../../include/ac/socket.h
translucent.lo: /usr/include/sys/types.h
translucent.lo: /usr/include/time.h
translucent.lo: /usr/include/endian.h
translucent.lo: /usr/include/bits/endian.h
translucent.lo: /usr/include/bits/byteswap.h
translucent.lo: /usr/include/bits/byteswap-16.h
translucent.lo: /usr/include/sys/select.h
translucent.lo: /usr/include/bits/select.h
translucent.lo: /usr/include/bits/sigset.h
translucent.lo: /usr/include/bits/time.h
translucent.lo: /usr/include/sys/sysmacros.h
translucent.lo: /usr/include/bits/pthreadtypes.h
translucent.lo: /usr/include/poll.h
translucent.lo: /usr/include/sys/poll.h
translucent.lo: /usr/include/bits/poll.h
translucent.lo: /usr/include/sys/socket.h
translucent.lo: /usr/include/sys/uio.h
translucent.lo: /usr/include/bits/uio.h
translucent.lo: /usr/include/bits/socket.h
translucent.lo: /usr/include/bits/socket_type.h
translucent.lo: /usr/include/bits/sockaddr.h
translucent.lo: /usr/include/asm/socket.h
translucent.lo: /usr/include/asm-generic/socket.h
translucent.lo: /usr/include/asm/sockios.h
translucent.lo: /usr/include/asm-generic/sockios.h
translucent.lo: /usr/include/sys/un.h
translucent.lo: /usr/include/netinet/in.h
translucent.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
translucent.lo: /usr/include/stdint.h
translucent.lo: /usr/include/bits/wchar.h
translucent.lo: /usr/include/bits/in.h
translucent.lo: /usr/include/netinet/tcp.h
translucent.lo: /usr/include/arpa/inet.h
translucent.lo: /usr/include/arpa/nameser.h
translucent.lo: /usr/include/sys/param.h
translucent.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
translucent.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
translucent.lo: /usr/include/limits.h
translucent.lo: /usr/include/bits/posix1_lim.h
translucent.lo: /usr/include/bits/local_lim.h
translucent.lo: /usr/include/linux/limits.h
translucent.lo: /usr/include/bits/posix2_lim.h
translucent.lo: /usr/include/signal.h
translucent.lo: /usr/include/bits/signum.h
translucent.lo: /usr/include/bits/siginfo.h
translucent.lo: /usr/include/bits/sigaction.h
translucent.lo: /usr/include/bits/sigcontext.h
translucent.lo: /usr/include/bits/sigstack.h
translucent.lo: /usr/include/sys/ucontext.h
translucent.lo: /usr/include/bits/sigthread.h
translucent.lo: /usr/include/bits/param.h
translucent.lo: /usr/include/linux/param.h
translucent.lo: /usr/include/asm/param.h
translucent.lo: /usr/include/asm-generic/param.h
translucent.lo: /usr/include/sys/bitypes.h
translucent.lo: /usr/include/arpa/nameser_compat.h
translucent.lo: /usr/include/netdb.h
translucent.lo: /usr/include/rpc/netdb.h
translucent.lo: /usr/include/bits/netdb.h
translucent.lo: /usr/include/resolv.h
translucent.lo: ../slap.h
translucent.lo: ../../../include/ldap_defaults.h
translucent.lo: ../../../include/ldap_config.h
translucent.lo: ../../../include/ac/stdlib.h
translucent.lo: /usr/include/stdlib.h
translucent.lo: /usr/include/bits/waitflags.h
translucent.lo: /usr/include/bits/waitstatus.h
translucent.lo: /usr/include/alloca.h
translucent.lo: /usr/include/bits/stdlib-float.h
translucent.lo: ../../../include/ac/syslog.h
translucent.lo: /usr/include/syslog.h
translucent.lo: /usr/include/sys/syslog.h
translucent.lo: /usr/include/bits/syslog-path.h
translucent.lo: ../../../include/ac/regex.h
translucent.lo: /usr/include/regex.h
translucent.lo: ../../../include/ac/signal.h
translucent.lo: ../../../include/ac/time.h
translucent.lo: /usr/include/sys/time.h
translucent.lo: ../../../include/ac/param.h
translucent.lo: ../../../include/ac/unistd.h
translucent.lo: /usr/include/unistd.h
translucent.lo: /usr/include/bits/posix_opt.h
translucent.lo: /usr/include/bits/environments.h
translucent.lo: /usr/include/bits/confname.h
translucent.lo: /usr/include/getopt.h
translucent.lo: ../../../include/lutil_lockf.h
translucent.lo: ../../../include/avl.h
translucent.lo: ../../../include/ldap_cdefs.h
translucent.lo: ../../../include/ldap_log.h
translucent.lo: ../../../include/ldap.h
translucent.lo: ../../../include/lber.h
translucent.lo: ../../../include/lber_types.h
translucent.lo: ../../../include/ldap_features.h
translucent.lo: ../../../include/ldap_schema.h
translucent.lo: ../../../include/lber_pvt.h
translucent.lo: ../../../include/ldap_pvt.h
translucent.lo: ../../../include/ldap_pvt_uc.h
translucent.lo: ../../../include/ac/bytes.h
translucent.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
translucent.lo: ../../../include/ldap_pvt_thread.h
translucent.lo: ../../../include/ldap_int_thread.h
translucent.lo: /usr/include/pthread.h
translucent.lo: /usr/include/sched.h
translucent.lo: /usr/include/bits/sched.h
translucent.lo: /usr/include/bits/setjmp.h
translucent.lo: ../../../include/ldap_queue.h
translucent.lo: ../proto-slap.h
translucent.lo: ../../../include/lutil.h
translucent.lo: ../config.h
unique.lo: unique.c
unique.lo: /usr/include/stdc-predef.h
unique.lo: ../../../include/portable.h
unique.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
unique.lo: ../../../include/ac/fdset.h
unique.lo: /usr/include/bits/types.h
unique.lo: /usr/include/features.h
unique.lo: /usr/include/sys/cdefs.h
unique.lo: /usr/include/bits/wordsize.h
unique.lo: /usr/include/gnu/stubs.h
unique.lo: /usr/include/gnu/stubs-64.h
unique.lo: /usr/include/bits/typesizes.h
unique.lo: ../../../include/ldap_cdefs.h
unique.lo: ../../../include/ldap_features.h
unique.lo: ../../../include/ac/assert.h
unique.lo: /usr/include/assert.h
unique.lo: ../../../include/ac/localize.h
unique.lo: /usr/include/stdio.h
unique.lo: /usr/include/libio.h
unique.lo: /usr/include/_G_config.h
unique.lo: /usr/include/wchar.h
unique.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
unique.lo: /usr/include/bits/stdio_lim.h
unique.lo: /usr/include/bits/sys_errlist.h
unique.lo: ../../../include/ac/string.h
unique.lo: /usr/include/string.h
unique.lo: /usr/include/xlocale.h
unique.lo: ../../../include/ac/socket.h
unique.lo: /usr/include/sys/types.h
unique.lo: /usr/include/time.h
unique.lo: /usr/include/endian.h
unique.lo: /usr/include/bits/endian.h
unique.lo: /usr/include/bits/byteswap.h
unique.lo: /usr/include/bits/byteswap-16.h
unique.lo: /usr/include/sys/select.h
unique.lo: /usr/include/bits/select.h
unique.lo: /usr/include/bits/sigset.h
unique.lo: /usr/include/bits/time.h
unique.lo: /usr/include/sys/sysmacros.h
unique.lo: /usr/include/bits/pthreadtypes.h
unique.lo: /usr/include/poll.h
unique.lo: /usr/include/sys/poll.h
unique.lo: /usr/include/bits/poll.h
unique.lo: /usr/include/sys/socket.h
unique.lo: /usr/include/sys/uio.h
unique.lo: /usr/include/bits/uio.h
unique.lo: /usr/include/bits/socket.h
unique.lo: /usr/include/bits/socket_type.h
unique.lo: /usr/include/bits/sockaddr.h
unique.lo: /usr/include/asm/socket.h
unique.lo: /usr/include/asm-generic/socket.h
unique.lo: /usr/include/asm/sockios.h
unique.lo: /usr/include/asm-generic/sockios.h
unique.lo: /usr/include/sys/un.h
unique.lo: /usr/include/netinet/in.h
unique.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
unique.lo: /usr/include/stdint.h
unique.lo: /usr/include/bits/wchar.h
unique.lo: /usr/include/bits/in.h
unique.lo: /usr/include/netinet/tcp.h
unique.lo: /usr/include/arpa/inet.h
unique.lo: /usr/include/arpa/nameser.h
unique.lo: /usr/include/sys/param.h
unique.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
unique.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
unique.lo: /usr/include/limits.h
unique.lo: /usr/include/bits/posix1_lim.h
unique.lo: /usr/include/bits/local_lim.h
unique.lo: /usr/include/linux/limits.h
unique.lo: /usr/include/bits/posix2_lim.h
unique.lo: /usr/include/signal.h
unique.lo: /usr/include/bits/signum.h
unique.lo: /usr/include/bits/siginfo.h
unique.lo: /usr/include/bits/sigaction.h
unique.lo: /usr/include/bits/sigcontext.h
unique.lo: /usr/include/bits/sigstack.h
unique.lo: /usr/include/sys/ucontext.h
unique.lo: /usr/include/bits/sigthread.h
unique.lo: /usr/include/bits/param.h
unique.lo: /usr/include/linux/param.h
unique.lo: /usr/include/asm/param.h
unique.lo: /usr/include/asm-generic/param.h
unique.lo: /usr/include/sys/bitypes.h
unique.lo: /usr/include/arpa/nameser_compat.h
unique.lo: /usr/include/netdb.h
unique.lo: /usr/include/rpc/netdb.h
unique.lo: /usr/include/bits/netdb.h
unique.lo: /usr/include/resolv.h
unique.lo: ../slap.h
unique.lo: ../../../include/ldap_defaults.h
unique.lo: ../../../include/ldap_config.h
unique.lo: ../../../include/ac/stdlib.h
unique.lo: /usr/include/stdlib.h
unique.lo: /usr/include/bits/waitflags.h
unique.lo: /usr/include/bits/waitstatus.h
unique.lo: /usr/include/alloca.h
unique.lo: /usr/include/bits/stdlib-float.h
unique.lo: ../../../include/ac/syslog.h
unique.lo: /usr/include/syslog.h
unique.lo: /usr/include/sys/syslog.h
unique.lo: /usr/include/bits/syslog-path.h
unique.lo: ../../../include/ac/regex.h
unique.lo: /usr/include/regex.h
unique.lo: ../../../include/ac/signal.h
unique.lo: ../../../include/ac/time.h
unique.lo: /usr/include/sys/time.h
unique.lo: ../../../include/ac/param.h
unique.lo: ../../../include/ac/unistd.h
unique.lo: /usr/include/unistd.h
unique.lo: /usr/include/bits/posix_opt.h
unique.lo: /usr/include/bits/environments.h
unique.lo: /usr/include/bits/confname.h
unique.lo: /usr/include/getopt.h
unique.lo: ../../../include/lutil_lockf.h
unique.lo: ../../../include/avl.h
unique.lo: ../../../include/ldap_cdefs.h
unique.lo: ../../../include/ldap_log.h
unique.lo: ../../../include/ldap.h
unique.lo: ../../../include/lber.h
unique.lo: ../../../include/lber_types.h
unique.lo: ../../../include/ldap_features.h
unique.lo: ../../../include/ldap_schema.h
unique.lo: ../../../include/lber_pvt.h
unique.lo: ../../../include/ldap_pvt.h
unique.lo: ../../../include/ldap_pvt_uc.h
unique.lo: ../../../include/ac/bytes.h
unique.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
unique.lo: ../../../include/ldap_pvt_thread.h
unique.lo: ../../../include/ldap_int_thread.h
unique.lo: /usr/include/pthread.h
unique.lo: /usr/include/sched.h
unique.lo: /usr/include/bits/sched.h
unique.lo: /usr/include/bits/setjmp.h
unique.lo: ../../../include/ldap_queue.h
unique.lo: ../proto-slap.h
unique.lo: ../config.h
valsort.lo: valsort.c
valsort.lo: /usr/include/stdc-predef.h
valsort.lo: ../../../include/portable.h
valsort.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
valsort.lo: ../../../include/ac/fdset.h
valsort.lo: /usr/include/bits/types.h
valsort.lo: /usr/include/features.h
valsort.lo: /usr/include/sys/cdefs.h
valsort.lo: /usr/include/bits/wordsize.h
valsort.lo: /usr/include/gnu/stubs.h
valsort.lo: /usr/include/gnu/stubs-64.h
valsort.lo: /usr/include/bits/typesizes.h
valsort.lo: ../../../include/ldap_cdefs.h
valsort.lo: ../../../include/ldap_features.h
valsort.lo: ../../../include/ac/assert.h
valsort.lo: /usr/include/assert.h
valsort.lo: ../../../include/ac/localize.h
valsort.lo: /usr/include/stdio.h
valsort.lo: /usr/include/libio.h
valsort.lo: /usr/include/_G_config.h
valsort.lo: /usr/include/wchar.h
valsort.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
valsort.lo: /usr/include/bits/stdio_lim.h
valsort.lo: /usr/include/bits/sys_errlist.h
valsort.lo: ../../../include/ac/string.h
valsort.lo: /usr/include/string.h
valsort.lo: /usr/include/xlocale.h
valsort.lo: ../../../include/ac/ctype.h
valsort.lo: /usr/include/ctype.h
valsort.lo: /usr/include/endian.h
valsort.lo: /usr/include/bits/endian.h
valsort.lo: /usr/include/bits/byteswap.h
valsort.lo: /usr/include/bits/byteswap-16.h
valsort.lo: ../slap.h
valsort.lo: ../../../include/ldap_defaults.h
valsort.lo: ../../../include/ldap_config.h
valsort.lo: ../../../include/ac/stdlib.h
valsort.lo: /usr/include/stdlib.h
valsort.lo: /usr/include/bits/waitflags.h
valsort.lo: /usr/include/bits/waitstatus.h
valsort.lo: /usr/include/sys/types.h
valsort.lo: /usr/include/time.h
valsort.lo: /usr/include/sys/select.h
valsort.lo: /usr/include/bits/select.h
valsort.lo: /usr/include/bits/sigset.h
valsort.lo: /usr/include/bits/time.h
valsort.lo: /usr/include/sys/sysmacros.h
valsort.lo: /usr/include/bits/pthreadtypes.h
valsort.lo: /usr/include/alloca.h
valsort.lo: /usr/include/bits/stdlib-float.h
valsort.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
valsort.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
valsort.lo: /usr/include/limits.h
valsort.lo: /usr/include/bits/posix1_lim.h
valsort.lo: /usr/include/bits/local_lim.h
valsort.lo: /usr/include/linux/limits.h
valsort.lo: /usr/include/bits/posix2_lim.h
valsort.lo: ../../../include/ac/syslog.h
valsort.lo: /usr/include/syslog.h
valsort.lo: /usr/include/sys/syslog.h
valsort.lo: /usr/include/bits/syslog-path.h
valsort.lo: ../../../include/ac/regex.h
valsort.lo: /usr/include/regex.h
valsort.lo: ../../../include/ac/signal.h
valsort.lo: /usr/include/signal.h
valsort.lo: /usr/include/bits/signum.h
valsort.lo: /usr/include/bits/siginfo.h
valsort.lo: /usr/include/bits/sigaction.h
valsort.lo: /usr/include/bits/sigcontext.h
valsort.lo: /usr/include/bits/sigstack.h
valsort.lo: /usr/include/sys/ucontext.h
valsort.lo: /usr/include/bits/sigthread.h
valsort.lo: ../../../include/ac/socket.h
valsort.lo: /usr/include/poll.h
valsort.lo: /usr/include/sys/poll.h
valsort.lo: /usr/include/bits/poll.h
valsort.lo: /usr/include/sys/socket.h
valsort.lo: /usr/include/sys/uio.h
valsort.lo: /usr/include/bits/uio.h
valsort.lo: /usr/include/bits/socket.h
valsort.lo: /usr/include/bits/socket_type.h
valsort.lo: /usr/include/bits/sockaddr.h
valsort.lo: /usr/include/asm/socket.h
valsort.lo: /usr/include/asm-generic/socket.h
valsort.lo: /usr/include/asm/sockios.h
valsort.lo: /usr/include/asm-generic/sockios.h
valsort.lo: /usr/include/sys/un.h
valsort.lo: /usr/include/netinet/in.h
valsort.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
valsort.lo: /usr/include/stdint.h
valsort.lo: /usr/include/bits/wchar.h
valsort.lo: /usr/include/bits/in.h
valsort.lo: /usr/include/netinet/tcp.h
valsort.lo: /usr/include/arpa/inet.h
valsort.lo: /usr/include/arpa/nameser.h
valsort.lo: /usr/include/sys/param.h
valsort.lo: /usr/include/bits/param.h
valsort.lo: /usr/include/linux/param.h
valsort.lo: /usr/include/asm/param.h
valsort.lo: /usr/include/asm-generic/param.h
valsort.lo: /usr/include/sys/bitypes.h
valsort.lo: /usr/include/arpa/nameser_compat.h
valsort.lo: /usr/include/netdb.h
valsort.lo: /usr/include/rpc/netdb.h
valsort.lo: /usr/include/bits/netdb.h
valsort.lo: /usr/include/resolv.h
valsort.lo: ../../../include/ac/time.h
valsort.lo: /usr/include/sys/time.h
valsort.lo: ../../../include/ac/param.h
valsort.lo: ../../../include/ac/unistd.h
valsort.lo: /usr/include/unistd.h
valsort.lo: /usr/include/bits/posix_opt.h
valsort.lo: /usr/include/bits/environments.h
valsort.lo: /usr/include/bits/confname.h
valsort.lo: /usr/include/getopt.h
valsort.lo: ../../../include/lutil_lockf.h
valsort.lo: ../../../include/avl.h
valsort.lo: ../../../include/ldap_cdefs.h
valsort.lo: ../../../include/ldap_log.h
valsort.lo: ../../../include/ldap.h
valsort.lo: ../../../include/lber.h
valsort.lo: ../../../include/lber_types.h
valsort.lo: ../../../include/ldap_features.h
valsort.lo: ../../../include/ldap_schema.h
valsort.lo: ../../../include/lber_pvt.h
valsort.lo: ../../../include/ldap_pvt.h
valsort.lo: ../../../include/ldap_pvt_uc.h
valsort.lo: ../../../include/ac/bytes.h
valsort.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
valsort.lo: ../../../include/ldap_pvt_thread.h
valsort.lo: ../../../include/ldap_int_thread.h
valsort.lo: /usr/include/pthread.h
valsort.lo: /usr/include/sched.h
valsort.lo: /usr/include/bits/sched.h
valsort.lo: /usr/include/bits/setjmp.h
valsort.lo: ../../../include/ldap_queue.h
valsort.lo: ../proto-slap.h
valsort.lo: ../config.h
valsort.lo: ../../../include/lutil.h

# IF YOU PUT ANYTHING HERE IT WILL GO AWAY
