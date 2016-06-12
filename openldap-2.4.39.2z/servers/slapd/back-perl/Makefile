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

# Makefile.in for back-perl
# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 1998-2016 The OpenLDAP Foundation.
## Portions Copyright 1999 John C. Quillan.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.

SRCS	= init.c search.c close.c config.c bind.c compare.c \
		modify.c add.c modrdn.c delete.c
OBJS	= init.lo search.lo close.lo config.lo bind.lo compare.lo \
		modify.lo add.lo modrdn.lo delete.lo

LDAP_INCDIR= ../../../include       
LDAP_LIBDIR= ../../../libraries

BUILD_OPT = "--enable-perl"
BUILD_MOD = mod
PERL_CPPFLAGS =  -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64  -I/usr/lib64/perl5/CORE 

mod_DEFS = -DSLAPD_IMPORT
MOD_DEFS = $(mod_DEFS)
MOD_LIBS = -Wl,--enable-new-dtags -Wl,-rpath,/usr/lib64/perl5/CORE  -fstack-protector  -L/usr/lib64/perl5/CORE -lperl -lresolv -lnsl -ldl -lm -lcrypt -lutil -lpthread

shared_LDAP_LIBS = $(LDAP_LIBLDAP_R_LA) $(LDAP_LIBLBER_LA)
NT_LINK_LIBS = -L.. -lslapd $(shared_LDAP_LIBS)
UNIX_LINK_LIBS = $(shared_LDAP_LIBS)

LIBBASE = back_perl

XINCPATH = -I.. -I$(srcdir)/..
XDEFS = $(PERL_CPPFLAGS) $(MODULES_CPPFLAGS)

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
# files: -I../../../include -I../../../include -I.. -I./.. -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/lib64/perl5/CORE -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include init.c search.c close.c config.c bind.c compare.c modify.c add.c modrdn.c delete.c
# command: cc -M -I.  -I../../../include -I../../../include -I.. -I./.. -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/lib64/perl5/CORE -I/opt/zimbra/cyrus-sasl-2.1.26.2z/include -I/opt/zimbra/openssl-1.0.1j/include -I/opt/zimbra/libtool-2.2.6b/include init.c search.c close.c config.c bind.c compare.c modify.c add.c modrdn.c delete.c
#

init.lo: init.c
init.lo: /usr/include/stdc-predef.h
init.lo: perl_back.h
init.lo: /usr/lib64/perl5/CORE/EXTERN.h
init.lo: /usr/lib64/perl5/CORE/perl.h
init.lo: /usr/lib64/perl5/CORE/config.h
init.lo: /usr/include/sys/types.h
init.lo: /usr/include/features.h
init.lo: /usr/include/sys/cdefs.h
init.lo: /usr/include/bits/wordsize.h
init.lo: /usr/include/gnu/stubs.h
init.lo: /usr/include/gnu/stubs-64.h
init.lo: /usr/include/bits/types.h
init.lo: /usr/include/bits/typesizes.h
init.lo: /usr/include/time.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
init.lo: /usr/include/ctype.h
init.lo: /usr/include/xlocale.h
init.lo: /usr/include/locale.h
init.lo: /usr/include/bits/locale.h
init.lo: /usr/include/setjmp.h
init.lo: /usr/include/bits/setjmp.h
init.lo: /usr/include/sys/param.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
init.lo: /usr/include/limits.h
init.lo: /usr/include/bits/posix1_lim.h
init.lo: /usr/include/bits/local_lim.h
init.lo: /usr/include/linux/limits.h
init.lo: /usr/include/bits/posix2_lim.h
init.lo: /usr/include/bits/xopen_lim.h
init.lo: /usr/include/bits/stdio_lim.h
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
init.lo: /usr/include/stdlib.h
init.lo: /usr/include/bits/waitflags.h
init.lo: /usr/include/bits/waitstatus.h
init.lo: /usr/include/alloca.h
init.lo: /usr/include/bits/stdlib-float.h
init.lo: /usr/include/unistd.h
init.lo: /usr/include/bits/posix_opt.h
init.lo: /usr/include/bits/environments.h
init.lo: /usr/include/bits/confname.h
init.lo: /usr/include/getopt.h
init.lo: /usr/include/sys/wait.h
init.lo: /usr/include/string.h
init.lo: /usr/include/netinet/in.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
init.lo: /usr/include/stdint.h
init.lo: /usr/include/bits/wchar.h
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
init.lo: /usr/include/bits/in.h
init.lo: /usr/include/arpa/inet.h
init.lo: /usr/include/sys/stat.h
init.lo: /usr/include/bits/stat.h
init.lo: /usr/include/bits/timex.h
init.lo: /usr/include/sys/time.h
init.lo: /usr/include/sys/times.h
init.lo: /usr/include/errno.h
init.lo: /usr/include/bits/errno.h
init.lo: /usr/include/linux/errno.h
init.lo: /usr/include/asm/errno.h
init.lo: /usr/include/asm-generic/errno.h
init.lo: /usr/include/asm-generic/errno-base.h
init.lo: /usr/include/netdb.h
init.lo: /usr/include/rpc/netdb.h
init.lo: /usr/include/bits/netdb.h
init.lo: /usr/include/sys/ioctl.h
init.lo: /usr/include/bits/ioctls.h
init.lo: /usr/include/asm/ioctls.h
init.lo: /usr/include/asm-generic/ioctls.h
init.lo: /usr/include/linux/ioctl.h
init.lo: /usr/include/asm/ioctl.h
init.lo: /usr/include/asm-generic/ioctl.h
init.lo: /usr/include/bits/ioctl-types.h
init.lo: /usr/include/sys/ttydefaults.h
init.lo: /usr/include/dirent.h
init.lo: /usr/include/bits/dirent.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
init.lo: /usr/lib64/perl5/CORE/handy.h
init.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
init.lo: /usr/include/inttypes.h
init.lo: /usr/lib64/perl5/CORE/unixish.h
init.lo: /usr/include/pthread.h
init.lo: /usr/include/sched.h
init.lo: /usr/include/bits/sched.h
init.lo: /usr/lib64/perl5/CORE/iperlsys.h
init.lo: /usr/lib64/perl5/CORE/perlio.h
init.lo: /usr/include/stdio.h
init.lo: /usr/include/libio.h
init.lo: /usr/include/_G_config.h
init.lo: /usr/include/wchar.h
init.lo: /usr/include/bits/sys_errlist.h
init.lo: /usr/lib64/perl5/CORE/perly.h
init.lo: /usr/lib64/perl5/CORE/sv.h
init.lo: /usr/lib64/perl5/CORE/regexp.h
init.lo: /usr/lib64/perl5/CORE/op_reg_common.h
init.lo: /usr/lib64/perl5/CORE/util.h
init.lo: /usr/lib64/perl5/CORE/form.h
init.lo: /usr/lib64/perl5/CORE/gv.h
init.lo: /usr/lib64/perl5/CORE/pad.h
init.lo: /usr/lib64/perl5/CORE/cv.h
init.lo: /usr/lib64/perl5/CORE/opnames.h
init.lo: /usr/lib64/perl5/CORE/op.h
init.lo: /usr/lib64/perl5/CORE/reentr.h
init.lo: /usr/include/pwd.h
init.lo: /usr/include/grp.h
init.lo: /usr/include/crypt.h
init.lo: /usr/include/shadow.h
init.lo: /usr/include/paths.h
init.lo: /usr/lib64/perl5/CORE/hv.h
init.lo: /usr/lib64/perl5/CORE/cop.h
init.lo: /usr/lib64/perl5/CORE/mydtrace.h
init.lo: /usr/lib64/perl5/CORE/av.h
init.lo: /usr/lib64/perl5/CORE/mg.h
init.lo: /usr/lib64/perl5/CORE/scope.h
init.lo: /usr/lib64/perl5/CORE/warnings.h
init.lo: /usr/lib64/perl5/CORE/utf8.h
init.lo: /usr/lib64/perl5/CORE/parser.h
init.lo: /usr/include/math.h
init.lo: /usr/include/bits/huge_val.h
init.lo: /usr/include/bits/huge_valf.h
init.lo: /usr/include/bits/huge_vall.h
init.lo: /usr/include/bits/inf.h
init.lo: /usr/include/bits/nan.h
init.lo: /usr/include/bits/mathdef.h
init.lo: /usr/include/bits/mathcalls.h
init.lo: /usr/lib64/perl5/CORE/patchlevel.h
init.lo: /usr/lib64/perl5/CORE/intrpvar.h
init.lo: /usr/lib64/perl5/CORE/thread.h
init.lo: /usr/lib64/perl5/CORE/pp.h
init.lo: /usr/lib64/perl5/CORE/proto.h
init.lo: /usr/lib64/perl5/CORE/opcode.h
init.lo: /usr/lib64/perl5/CORE/embedvar.h
init.lo: /usr/lib64/perl5/CORE/embed.h
init.lo: /usr/lib64/perl5/CORE/perlvars.h
init.lo: /usr/lib64/perl5/CORE/mg_vtable.h
init.lo: /usr/lib64/perl5/CORE/overload.h
init.lo: /usr/include/sys/ipc.h
init.lo: /usr/include/bits/ipctypes.h
init.lo: /usr/include/bits/ipc.h
init.lo: /usr/include/sys/sem.h
init.lo: /usr/include/bits/sem.h
init.lo: /usr/include/sys/file.h
init.lo: /usr/include/fcntl.h
init.lo: /usr/include/bits/fcntl.h
init.lo: /usr/include/bits/fcntl-linux.h
init.lo: asperl_undefs.h
init.lo: ../../../include/portable.h
init.lo: ../../../include/ac/fdset.h
init.lo: ../../../include/ldap_cdefs.h
init.lo: ../../../include/ldap_features.h
init.lo: ../../../include/ac/assert.h
init.lo: /usr/include/assert.h
init.lo: ../../../include/ac/localize.h
init.lo: ../slap.h
init.lo: ../../../include/ldap_defaults.h
init.lo: ../../../include/ldap_config.h
init.lo: ../../../include/ac/stdlib.h
init.lo: ../../../include/ac/syslog.h
init.lo: /usr/include/syslog.h
init.lo: /usr/include/sys/syslog.h
init.lo: /usr/include/bits/syslog-path.h
init.lo: ../../../include/ac/regex.h
init.lo: /usr/include/regex.h
init.lo: ../../../include/ac/signal.h
init.lo: ../../../include/ac/socket.h
init.lo: /usr/include/poll.h
init.lo: /usr/include/sys/poll.h
init.lo: /usr/include/bits/poll.h
init.lo: /usr/include/sys/un.h
init.lo: /usr/include/netinet/tcp.h
init.lo: /usr/include/arpa/nameser.h
init.lo: /usr/include/sys/bitypes.h
init.lo: /usr/include/arpa/nameser_compat.h
init.lo: /usr/include/resolv.h
init.lo: ../../../include/ac/time.h
init.lo: ../../../include/ac/param.h
init.lo: ../../../include/ac/unistd.h
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
init.lo: ../config.h
init.lo: ../../../include/ldap_queue.h
init.lo: ../proto-slap.h
init.lo: proto-perl.h
init.lo: ../../../include/ac/string.h
search.lo: search.c
search.lo: /usr/include/stdc-predef.h
search.lo: perl_back.h
search.lo: /usr/lib64/perl5/CORE/EXTERN.h
search.lo: /usr/lib64/perl5/CORE/perl.h
search.lo: /usr/lib64/perl5/CORE/config.h
search.lo: /usr/include/sys/types.h
search.lo: /usr/include/features.h
search.lo: /usr/include/sys/cdefs.h
search.lo: /usr/include/bits/wordsize.h
search.lo: /usr/include/gnu/stubs.h
search.lo: /usr/include/gnu/stubs-64.h
search.lo: /usr/include/bits/types.h
search.lo: /usr/include/bits/typesizes.h
search.lo: /usr/include/time.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
search.lo: /usr/include/ctype.h
search.lo: /usr/include/xlocale.h
search.lo: /usr/include/locale.h
search.lo: /usr/include/bits/locale.h
search.lo: /usr/include/setjmp.h
search.lo: /usr/include/bits/setjmp.h
search.lo: /usr/include/sys/param.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
search.lo: /usr/include/limits.h
search.lo: /usr/include/bits/posix1_lim.h
search.lo: /usr/include/bits/local_lim.h
search.lo: /usr/include/linux/limits.h
search.lo: /usr/include/bits/posix2_lim.h
search.lo: /usr/include/bits/xopen_lim.h
search.lo: /usr/include/bits/stdio_lim.h
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
search.lo: /usr/include/stdlib.h
search.lo: /usr/include/bits/waitflags.h
search.lo: /usr/include/bits/waitstatus.h
search.lo: /usr/include/alloca.h
search.lo: /usr/include/bits/stdlib-float.h
search.lo: /usr/include/unistd.h
search.lo: /usr/include/bits/posix_opt.h
search.lo: /usr/include/bits/environments.h
search.lo: /usr/include/bits/confname.h
search.lo: /usr/include/getopt.h
search.lo: /usr/include/sys/wait.h
search.lo: /usr/include/string.h
search.lo: /usr/include/netinet/in.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
search.lo: /usr/include/stdint.h
search.lo: /usr/include/bits/wchar.h
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
search.lo: /usr/include/bits/in.h
search.lo: /usr/include/arpa/inet.h
search.lo: /usr/include/sys/stat.h
search.lo: /usr/include/bits/stat.h
search.lo: /usr/include/bits/timex.h
search.lo: /usr/include/sys/time.h
search.lo: /usr/include/sys/times.h
search.lo: /usr/include/errno.h
search.lo: /usr/include/bits/errno.h
search.lo: /usr/include/linux/errno.h
search.lo: /usr/include/asm/errno.h
search.lo: /usr/include/asm-generic/errno.h
search.lo: /usr/include/asm-generic/errno-base.h
search.lo: /usr/include/netdb.h
search.lo: /usr/include/rpc/netdb.h
search.lo: /usr/include/bits/netdb.h
search.lo: /usr/include/sys/ioctl.h
search.lo: /usr/include/bits/ioctls.h
search.lo: /usr/include/asm/ioctls.h
search.lo: /usr/include/asm-generic/ioctls.h
search.lo: /usr/include/linux/ioctl.h
search.lo: /usr/include/asm/ioctl.h
search.lo: /usr/include/asm-generic/ioctl.h
search.lo: /usr/include/bits/ioctl-types.h
search.lo: /usr/include/sys/ttydefaults.h
search.lo: /usr/include/dirent.h
search.lo: /usr/include/bits/dirent.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
search.lo: /usr/lib64/perl5/CORE/handy.h
search.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
search.lo: /usr/include/inttypes.h
search.lo: /usr/lib64/perl5/CORE/unixish.h
search.lo: /usr/include/pthread.h
search.lo: /usr/include/sched.h
search.lo: /usr/include/bits/sched.h
search.lo: /usr/lib64/perl5/CORE/iperlsys.h
search.lo: /usr/lib64/perl5/CORE/perlio.h
search.lo: /usr/include/stdio.h
search.lo: /usr/include/libio.h
search.lo: /usr/include/_G_config.h
search.lo: /usr/include/wchar.h
search.lo: /usr/include/bits/sys_errlist.h
search.lo: /usr/lib64/perl5/CORE/perly.h
search.lo: /usr/lib64/perl5/CORE/sv.h
search.lo: /usr/lib64/perl5/CORE/regexp.h
search.lo: /usr/lib64/perl5/CORE/op_reg_common.h
search.lo: /usr/lib64/perl5/CORE/util.h
search.lo: /usr/lib64/perl5/CORE/form.h
search.lo: /usr/lib64/perl5/CORE/gv.h
search.lo: /usr/lib64/perl5/CORE/pad.h
search.lo: /usr/lib64/perl5/CORE/cv.h
search.lo: /usr/lib64/perl5/CORE/opnames.h
search.lo: /usr/lib64/perl5/CORE/op.h
search.lo: /usr/lib64/perl5/CORE/reentr.h
search.lo: /usr/include/pwd.h
search.lo: /usr/include/grp.h
search.lo: /usr/include/crypt.h
search.lo: /usr/include/shadow.h
search.lo: /usr/include/paths.h
search.lo: /usr/lib64/perl5/CORE/hv.h
search.lo: /usr/lib64/perl5/CORE/cop.h
search.lo: /usr/lib64/perl5/CORE/mydtrace.h
search.lo: /usr/lib64/perl5/CORE/av.h
search.lo: /usr/lib64/perl5/CORE/mg.h
search.lo: /usr/lib64/perl5/CORE/scope.h
search.lo: /usr/lib64/perl5/CORE/warnings.h
search.lo: /usr/lib64/perl5/CORE/utf8.h
search.lo: /usr/lib64/perl5/CORE/parser.h
search.lo: /usr/include/math.h
search.lo: /usr/include/bits/huge_val.h
search.lo: /usr/include/bits/huge_valf.h
search.lo: /usr/include/bits/huge_vall.h
search.lo: /usr/include/bits/inf.h
search.lo: /usr/include/bits/nan.h
search.lo: /usr/include/bits/mathdef.h
search.lo: /usr/include/bits/mathcalls.h
search.lo: /usr/lib64/perl5/CORE/patchlevel.h
search.lo: /usr/lib64/perl5/CORE/intrpvar.h
search.lo: /usr/lib64/perl5/CORE/thread.h
search.lo: /usr/lib64/perl5/CORE/pp.h
search.lo: /usr/lib64/perl5/CORE/proto.h
search.lo: /usr/lib64/perl5/CORE/opcode.h
search.lo: /usr/lib64/perl5/CORE/embedvar.h
search.lo: /usr/lib64/perl5/CORE/embed.h
search.lo: /usr/lib64/perl5/CORE/perlvars.h
search.lo: /usr/lib64/perl5/CORE/mg_vtable.h
search.lo: /usr/lib64/perl5/CORE/overload.h
search.lo: /usr/include/sys/ipc.h
search.lo: /usr/include/bits/ipctypes.h
search.lo: /usr/include/bits/ipc.h
search.lo: /usr/include/sys/sem.h
search.lo: /usr/include/bits/sem.h
search.lo: /usr/include/sys/file.h
search.lo: /usr/include/fcntl.h
search.lo: /usr/include/bits/fcntl.h
search.lo: /usr/include/bits/fcntl-linux.h
search.lo: asperl_undefs.h
search.lo: ../../../include/portable.h
search.lo: ../../../include/ac/fdset.h
search.lo: ../../../include/ldap_cdefs.h
search.lo: ../../../include/ldap_features.h
search.lo: ../../../include/ac/assert.h
search.lo: /usr/include/assert.h
search.lo: ../../../include/ac/localize.h
search.lo: ../slap.h
search.lo: ../../../include/ldap_defaults.h
search.lo: ../../../include/ldap_config.h
search.lo: ../../../include/ac/stdlib.h
search.lo: ../../../include/ac/syslog.h
search.lo: /usr/include/syslog.h
search.lo: /usr/include/sys/syslog.h
search.lo: /usr/include/bits/syslog-path.h
search.lo: ../../../include/ac/regex.h
search.lo: /usr/include/regex.h
search.lo: ../../../include/ac/signal.h
search.lo: ../../../include/ac/socket.h
search.lo: /usr/include/poll.h
search.lo: /usr/include/sys/poll.h
search.lo: /usr/include/bits/poll.h
search.lo: /usr/include/sys/un.h
search.lo: /usr/include/netinet/tcp.h
search.lo: /usr/include/arpa/nameser.h
search.lo: /usr/include/sys/bitypes.h
search.lo: /usr/include/arpa/nameser_compat.h
search.lo: /usr/include/resolv.h
search.lo: ../../../include/ac/time.h
search.lo: ../../../include/ac/param.h
search.lo: ../../../include/ac/unistd.h
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
search.lo: ../../../include/ldap_queue.h
search.lo: ../proto-slap.h
search.lo: proto-perl.h
close.lo: close.c
close.lo: /usr/include/stdc-predef.h
close.lo: perl_back.h
close.lo: /usr/lib64/perl5/CORE/EXTERN.h
close.lo: /usr/lib64/perl5/CORE/perl.h
close.lo: /usr/lib64/perl5/CORE/config.h
close.lo: /usr/include/sys/types.h
close.lo: /usr/include/features.h
close.lo: /usr/include/sys/cdefs.h
close.lo: /usr/include/bits/wordsize.h
close.lo: /usr/include/gnu/stubs.h
close.lo: /usr/include/gnu/stubs-64.h
close.lo: /usr/include/bits/types.h
close.lo: /usr/include/bits/typesizes.h
close.lo: /usr/include/time.h
close.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
close.lo: /usr/include/endian.h
close.lo: /usr/include/bits/endian.h
close.lo: /usr/include/bits/byteswap.h
close.lo: /usr/include/bits/byteswap-16.h
close.lo: /usr/include/sys/select.h
close.lo: /usr/include/bits/select.h
close.lo: /usr/include/bits/sigset.h
close.lo: /usr/include/bits/time.h
close.lo: /usr/include/sys/sysmacros.h
close.lo: /usr/include/bits/pthreadtypes.h
close.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
close.lo: /usr/include/ctype.h
close.lo: /usr/include/xlocale.h
close.lo: /usr/include/locale.h
close.lo: /usr/include/bits/locale.h
close.lo: /usr/include/setjmp.h
close.lo: /usr/include/bits/setjmp.h
close.lo: /usr/include/sys/param.h
close.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
close.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
close.lo: /usr/include/limits.h
close.lo: /usr/include/bits/posix1_lim.h
close.lo: /usr/include/bits/local_lim.h
close.lo: /usr/include/linux/limits.h
close.lo: /usr/include/bits/posix2_lim.h
close.lo: /usr/include/bits/xopen_lim.h
close.lo: /usr/include/bits/stdio_lim.h
close.lo: /usr/include/signal.h
close.lo: /usr/include/bits/signum.h
close.lo: /usr/include/bits/siginfo.h
close.lo: /usr/include/bits/sigaction.h
close.lo: /usr/include/bits/sigcontext.h
close.lo: /usr/include/bits/sigstack.h
close.lo: /usr/include/sys/ucontext.h
close.lo: /usr/include/bits/sigthread.h
close.lo: /usr/include/bits/param.h
close.lo: /usr/include/linux/param.h
close.lo: /usr/include/asm/param.h
close.lo: /usr/include/asm-generic/param.h
close.lo: /usr/include/stdlib.h
close.lo: /usr/include/bits/waitflags.h
close.lo: /usr/include/bits/waitstatus.h
close.lo: /usr/include/alloca.h
close.lo: /usr/include/bits/stdlib-float.h
close.lo: /usr/include/unistd.h
close.lo: /usr/include/bits/posix_opt.h
close.lo: /usr/include/bits/environments.h
close.lo: /usr/include/bits/confname.h
close.lo: /usr/include/getopt.h
close.lo: /usr/include/sys/wait.h
close.lo: /usr/include/string.h
close.lo: /usr/include/netinet/in.h
close.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
close.lo: /usr/include/stdint.h
close.lo: /usr/include/bits/wchar.h
close.lo: /usr/include/sys/socket.h
close.lo: /usr/include/sys/uio.h
close.lo: /usr/include/bits/uio.h
close.lo: /usr/include/bits/socket.h
close.lo: /usr/include/bits/socket_type.h
close.lo: /usr/include/bits/sockaddr.h
close.lo: /usr/include/asm/socket.h
close.lo: /usr/include/asm-generic/socket.h
close.lo: /usr/include/asm/sockios.h
close.lo: /usr/include/asm-generic/sockios.h
close.lo: /usr/include/bits/in.h
close.lo: /usr/include/arpa/inet.h
close.lo: /usr/include/sys/stat.h
close.lo: /usr/include/bits/stat.h
close.lo: /usr/include/bits/timex.h
close.lo: /usr/include/sys/time.h
close.lo: /usr/include/sys/times.h
close.lo: /usr/include/errno.h
close.lo: /usr/include/bits/errno.h
close.lo: /usr/include/linux/errno.h
close.lo: /usr/include/asm/errno.h
close.lo: /usr/include/asm-generic/errno.h
close.lo: /usr/include/asm-generic/errno-base.h
close.lo: /usr/include/netdb.h
close.lo: /usr/include/rpc/netdb.h
close.lo: /usr/include/bits/netdb.h
close.lo: /usr/include/sys/ioctl.h
close.lo: /usr/include/bits/ioctls.h
close.lo: /usr/include/asm/ioctls.h
close.lo: /usr/include/asm-generic/ioctls.h
close.lo: /usr/include/linux/ioctl.h
close.lo: /usr/include/asm/ioctl.h
close.lo: /usr/include/asm-generic/ioctl.h
close.lo: /usr/include/bits/ioctl-types.h
close.lo: /usr/include/sys/ttydefaults.h
close.lo: /usr/include/dirent.h
close.lo: /usr/include/bits/dirent.h
close.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
close.lo: /usr/lib64/perl5/CORE/handy.h
close.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
close.lo: /usr/include/inttypes.h
close.lo: /usr/lib64/perl5/CORE/unixish.h
close.lo: /usr/include/pthread.h
close.lo: /usr/include/sched.h
close.lo: /usr/include/bits/sched.h
close.lo: /usr/lib64/perl5/CORE/iperlsys.h
close.lo: /usr/lib64/perl5/CORE/perlio.h
close.lo: /usr/include/stdio.h
close.lo: /usr/include/libio.h
close.lo: /usr/include/_G_config.h
close.lo: /usr/include/wchar.h
close.lo: /usr/include/bits/sys_errlist.h
close.lo: /usr/lib64/perl5/CORE/perly.h
close.lo: /usr/lib64/perl5/CORE/sv.h
close.lo: /usr/lib64/perl5/CORE/regexp.h
close.lo: /usr/lib64/perl5/CORE/op_reg_common.h
close.lo: /usr/lib64/perl5/CORE/util.h
close.lo: /usr/lib64/perl5/CORE/form.h
close.lo: /usr/lib64/perl5/CORE/gv.h
close.lo: /usr/lib64/perl5/CORE/pad.h
close.lo: /usr/lib64/perl5/CORE/cv.h
close.lo: /usr/lib64/perl5/CORE/opnames.h
close.lo: /usr/lib64/perl5/CORE/op.h
close.lo: /usr/lib64/perl5/CORE/reentr.h
close.lo: /usr/include/pwd.h
close.lo: /usr/include/grp.h
close.lo: /usr/include/crypt.h
close.lo: /usr/include/shadow.h
close.lo: /usr/include/paths.h
close.lo: /usr/lib64/perl5/CORE/hv.h
close.lo: /usr/lib64/perl5/CORE/cop.h
close.lo: /usr/lib64/perl5/CORE/mydtrace.h
close.lo: /usr/lib64/perl5/CORE/av.h
close.lo: /usr/lib64/perl5/CORE/mg.h
close.lo: /usr/lib64/perl5/CORE/scope.h
close.lo: /usr/lib64/perl5/CORE/warnings.h
close.lo: /usr/lib64/perl5/CORE/utf8.h
close.lo: /usr/lib64/perl5/CORE/parser.h
close.lo: /usr/include/math.h
close.lo: /usr/include/bits/huge_val.h
close.lo: /usr/include/bits/huge_valf.h
close.lo: /usr/include/bits/huge_vall.h
close.lo: /usr/include/bits/inf.h
close.lo: /usr/include/bits/nan.h
close.lo: /usr/include/bits/mathdef.h
close.lo: /usr/include/bits/mathcalls.h
close.lo: /usr/lib64/perl5/CORE/patchlevel.h
close.lo: /usr/lib64/perl5/CORE/intrpvar.h
close.lo: /usr/lib64/perl5/CORE/thread.h
close.lo: /usr/lib64/perl5/CORE/pp.h
close.lo: /usr/lib64/perl5/CORE/proto.h
close.lo: /usr/lib64/perl5/CORE/opcode.h
close.lo: /usr/lib64/perl5/CORE/embedvar.h
close.lo: /usr/lib64/perl5/CORE/embed.h
close.lo: /usr/lib64/perl5/CORE/perlvars.h
close.lo: /usr/lib64/perl5/CORE/mg_vtable.h
close.lo: /usr/lib64/perl5/CORE/overload.h
close.lo: /usr/include/sys/ipc.h
close.lo: /usr/include/bits/ipctypes.h
close.lo: /usr/include/bits/ipc.h
close.lo: /usr/include/sys/sem.h
close.lo: /usr/include/bits/sem.h
close.lo: /usr/include/sys/file.h
close.lo: /usr/include/fcntl.h
close.lo: /usr/include/bits/fcntl.h
close.lo: /usr/include/bits/fcntl-linux.h
close.lo: asperl_undefs.h
close.lo: ../../../include/portable.h
close.lo: ../../../include/ac/fdset.h
close.lo: ../../../include/ldap_cdefs.h
close.lo: ../../../include/ldap_features.h
close.lo: ../../../include/ac/assert.h
close.lo: /usr/include/assert.h
close.lo: ../../../include/ac/localize.h
close.lo: ../slap.h
close.lo: ../../../include/ldap_defaults.h
close.lo: ../../../include/ldap_config.h
close.lo: ../../../include/ac/stdlib.h
close.lo: ../../../include/ac/syslog.h
close.lo: /usr/include/syslog.h
close.lo: /usr/include/sys/syslog.h
close.lo: /usr/include/bits/syslog-path.h
close.lo: ../../../include/ac/regex.h
close.lo: /usr/include/regex.h
close.lo: ../../../include/ac/signal.h
close.lo: ../../../include/ac/socket.h
close.lo: /usr/include/poll.h
close.lo: /usr/include/sys/poll.h
close.lo: /usr/include/bits/poll.h
close.lo: /usr/include/sys/un.h
close.lo: /usr/include/netinet/tcp.h
close.lo: /usr/include/arpa/nameser.h
close.lo: /usr/include/sys/bitypes.h
close.lo: /usr/include/arpa/nameser_compat.h
close.lo: /usr/include/resolv.h
close.lo: ../../../include/ac/time.h
close.lo: ../../../include/ac/param.h
close.lo: ../../../include/ac/unistd.h
close.lo: ../../../include/lutil_lockf.h
close.lo: ../../../include/avl.h
close.lo: ../../../include/ldap_cdefs.h
close.lo: ../../../include/ldap_log.h
close.lo: ../../../include/ldap.h
close.lo: ../../../include/lber.h
close.lo: ../../../include/lber_types.h
close.lo: ../../../include/ldap_features.h
close.lo: ../../../include/ldap_schema.h
close.lo: ../../../include/lber_pvt.h
close.lo: ../../../include/ldap_pvt.h
close.lo: ../../../include/ldap_pvt_uc.h
close.lo: ../../../include/ac/bytes.h
close.lo: ../../../include/../libraries/liblunicode/ucdata/ucdata.h
close.lo: ../../../include/ldap_pvt_thread.h
close.lo: ../../../include/ldap_int_thread.h
close.lo: ../config.h
close.lo: ../../../include/ldap_queue.h
close.lo: ../proto-slap.h
close.lo: proto-perl.h
close.lo: ../../../include/ac/string.h
config.lo: config.c
config.lo: /usr/include/stdc-predef.h
config.lo: perl_back.h
config.lo: /usr/lib64/perl5/CORE/EXTERN.h
config.lo: /usr/lib64/perl5/CORE/perl.h
config.lo: /usr/lib64/perl5/CORE/config.h
config.lo: /usr/include/sys/types.h
config.lo: /usr/include/features.h
config.lo: /usr/include/sys/cdefs.h
config.lo: /usr/include/bits/wordsize.h
config.lo: /usr/include/gnu/stubs.h
config.lo: /usr/include/gnu/stubs-64.h
config.lo: /usr/include/bits/types.h
config.lo: /usr/include/bits/typesizes.h
config.lo: /usr/include/time.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
config.lo: /usr/include/ctype.h
config.lo: /usr/include/xlocale.h
config.lo: /usr/include/locale.h
config.lo: /usr/include/bits/locale.h
config.lo: /usr/include/setjmp.h
config.lo: /usr/include/bits/setjmp.h
config.lo: /usr/include/sys/param.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
config.lo: /usr/include/limits.h
config.lo: /usr/include/bits/posix1_lim.h
config.lo: /usr/include/bits/local_lim.h
config.lo: /usr/include/linux/limits.h
config.lo: /usr/include/bits/posix2_lim.h
config.lo: /usr/include/bits/xopen_lim.h
config.lo: /usr/include/bits/stdio_lim.h
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
config.lo: /usr/include/stdlib.h
config.lo: /usr/include/bits/waitflags.h
config.lo: /usr/include/bits/waitstatus.h
config.lo: /usr/include/alloca.h
config.lo: /usr/include/bits/stdlib-float.h
config.lo: /usr/include/unistd.h
config.lo: /usr/include/bits/posix_opt.h
config.lo: /usr/include/bits/environments.h
config.lo: /usr/include/bits/confname.h
config.lo: /usr/include/getopt.h
config.lo: /usr/include/sys/wait.h
config.lo: /usr/include/string.h
config.lo: /usr/include/netinet/in.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
config.lo: /usr/include/stdint.h
config.lo: /usr/include/bits/wchar.h
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
config.lo: /usr/include/bits/in.h
config.lo: /usr/include/arpa/inet.h
config.lo: /usr/include/sys/stat.h
config.lo: /usr/include/bits/stat.h
config.lo: /usr/include/bits/timex.h
config.lo: /usr/include/sys/time.h
config.lo: /usr/include/sys/times.h
config.lo: /usr/include/errno.h
config.lo: /usr/include/bits/errno.h
config.lo: /usr/include/linux/errno.h
config.lo: /usr/include/asm/errno.h
config.lo: /usr/include/asm-generic/errno.h
config.lo: /usr/include/asm-generic/errno-base.h
config.lo: /usr/include/netdb.h
config.lo: /usr/include/rpc/netdb.h
config.lo: /usr/include/bits/netdb.h
config.lo: /usr/include/sys/ioctl.h
config.lo: /usr/include/bits/ioctls.h
config.lo: /usr/include/asm/ioctls.h
config.lo: /usr/include/asm-generic/ioctls.h
config.lo: /usr/include/linux/ioctl.h
config.lo: /usr/include/asm/ioctl.h
config.lo: /usr/include/asm-generic/ioctl.h
config.lo: /usr/include/bits/ioctl-types.h
config.lo: /usr/include/sys/ttydefaults.h
config.lo: /usr/include/dirent.h
config.lo: /usr/include/bits/dirent.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
config.lo: /usr/lib64/perl5/CORE/handy.h
config.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
config.lo: /usr/include/inttypes.h
config.lo: /usr/lib64/perl5/CORE/unixish.h
config.lo: /usr/include/pthread.h
config.lo: /usr/include/sched.h
config.lo: /usr/include/bits/sched.h
config.lo: /usr/lib64/perl5/CORE/iperlsys.h
config.lo: /usr/lib64/perl5/CORE/perlio.h
config.lo: /usr/include/stdio.h
config.lo: /usr/include/libio.h
config.lo: /usr/include/_G_config.h
config.lo: /usr/include/wchar.h
config.lo: /usr/include/bits/sys_errlist.h
config.lo: /usr/lib64/perl5/CORE/perly.h
config.lo: /usr/lib64/perl5/CORE/sv.h
config.lo: /usr/lib64/perl5/CORE/regexp.h
config.lo: /usr/lib64/perl5/CORE/op_reg_common.h
config.lo: /usr/lib64/perl5/CORE/util.h
config.lo: /usr/lib64/perl5/CORE/form.h
config.lo: /usr/lib64/perl5/CORE/gv.h
config.lo: /usr/lib64/perl5/CORE/pad.h
config.lo: /usr/lib64/perl5/CORE/cv.h
config.lo: /usr/lib64/perl5/CORE/opnames.h
config.lo: /usr/lib64/perl5/CORE/op.h
config.lo: /usr/lib64/perl5/CORE/reentr.h
config.lo: /usr/include/pwd.h
config.lo: /usr/include/grp.h
config.lo: /usr/include/crypt.h
config.lo: /usr/include/shadow.h
config.lo: /usr/include/paths.h
config.lo: /usr/lib64/perl5/CORE/hv.h
config.lo: /usr/lib64/perl5/CORE/cop.h
config.lo: /usr/lib64/perl5/CORE/mydtrace.h
config.lo: /usr/lib64/perl5/CORE/av.h
config.lo: /usr/lib64/perl5/CORE/mg.h
config.lo: /usr/lib64/perl5/CORE/scope.h
config.lo: /usr/lib64/perl5/CORE/warnings.h
config.lo: /usr/lib64/perl5/CORE/utf8.h
config.lo: /usr/lib64/perl5/CORE/parser.h
config.lo: /usr/include/math.h
config.lo: /usr/include/bits/huge_val.h
config.lo: /usr/include/bits/huge_valf.h
config.lo: /usr/include/bits/huge_vall.h
config.lo: /usr/include/bits/inf.h
config.lo: /usr/include/bits/nan.h
config.lo: /usr/include/bits/mathdef.h
config.lo: /usr/include/bits/mathcalls.h
config.lo: /usr/lib64/perl5/CORE/patchlevel.h
config.lo: /usr/lib64/perl5/CORE/intrpvar.h
config.lo: /usr/lib64/perl5/CORE/thread.h
config.lo: /usr/lib64/perl5/CORE/pp.h
config.lo: /usr/lib64/perl5/CORE/proto.h
config.lo: /usr/lib64/perl5/CORE/opcode.h
config.lo: /usr/lib64/perl5/CORE/embedvar.h
config.lo: /usr/lib64/perl5/CORE/embed.h
config.lo: /usr/lib64/perl5/CORE/perlvars.h
config.lo: /usr/lib64/perl5/CORE/mg_vtable.h
config.lo: /usr/lib64/perl5/CORE/overload.h
config.lo: /usr/include/sys/ipc.h
config.lo: /usr/include/bits/ipctypes.h
config.lo: /usr/include/bits/ipc.h
config.lo: /usr/include/sys/sem.h
config.lo: /usr/include/bits/sem.h
config.lo: /usr/include/sys/file.h
config.lo: /usr/include/fcntl.h
config.lo: /usr/include/bits/fcntl.h
config.lo: /usr/include/bits/fcntl-linux.h
config.lo: asperl_undefs.h
config.lo: ../../../include/portable.h
config.lo: ../../../include/ac/fdset.h
config.lo: ../../../include/ldap_cdefs.h
config.lo: ../../../include/ldap_features.h
config.lo: ../../../include/ac/assert.h
config.lo: /usr/include/assert.h
config.lo: ../../../include/ac/localize.h
config.lo: ../slap.h
config.lo: ../../../include/ldap_defaults.h
config.lo: ../../../include/ldap_config.h
config.lo: ../../../include/ac/stdlib.h
config.lo: ../../../include/ac/syslog.h
config.lo: /usr/include/syslog.h
config.lo: /usr/include/sys/syslog.h
config.lo: /usr/include/bits/syslog-path.h
config.lo: ../../../include/ac/regex.h
config.lo: /usr/include/regex.h
config.lo: ../../../include/ac/signal.h
config.lo: ../../../include/ac/socket.h
config.lo: /usr/include/poll.h
config.lo: /usr/include/sys/poll.h
config.lo: /usr/include/bits/poll.h
config.lo: /usr/include/sys/un.h
config.lo: /usr/include/netinet/tcp.h
config.lo: /usr/include/arpa/nameser.h
config.lo: /usr/include/sys/bitypes.h
config.lo: /usr/include/arpa/nameser_compat.h
config.lo: /usr/include/resolv.h
config.lo: ../../../include/ac/time.h
config.lo: ../../../include/ac/param.h
config.lo: ../../../include/ac/unistd.h
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
config.lo: ../config.h
config.lo: ../../../include/ldap_queue.h
config.lo: ../proto-slap.h
config.lo: proto-perl.h
config.lo: ../../../include/ac/string.h
bind.lo: bind.c
bind.lo: /usr/include/stdc-predef.h
bind.lo: perl_back.h
bind.lo: /usr/lib64/perl5/CORE/EXTERN.h
bind.lo: /usr/lib64/perl5/CORE/perl.h
bind.lo: /usr/lib64/perl5/CORE/config.h
bind.lo: /usr/include/sys/types.h
bind.lo: /usr/include/features.h
bind.lo: /usr/include/sys/cdefs.h
bind.lo: /usr/include/bits/wordsize.h
bind.lo: /usr/include/gnu/stubs.h
bind.lo: /usr/include/gnu/stubs-64.h
bind.lo: /usr/include/bits/types.h
bind.lo: /usr/include/bits/typesizes.h
bind.lo: /usr/include/time.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
bind.lo: /usr/include/ctype.h
bind.lo: /usr/include/xlocale.h
bind.lo: /usr/include/locale.h
bind.lo: /usr/include/bits/locale.h
bind.lo: /usr/include/setjmp.h
bind.lo: /usr/include/bits/setjmp.h
bind.lo: /usr/include/sys/param.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
bind.lo: /usr/include/limits.h
bind.lo: /usr/include/bits/posix1_lim.h
bind.lo: /usr/include/bits/local_lim.h
bind.lo: /usr/include/linux/limits.h
bind.lo: /usr/include/bits/posix2_lim.h
bind.lo: /usr/include/bits/xopen_lim.h
bind.lo: /usr/include/bits/stdio_lim.h
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
bind.lo: /usr/include/stdlib.h
bind.lo: /usr/include/bits/waitflags.h
bind.lo: /usr/include/bits/waitstatus.h
bind.lo: /usr/include/alloca.h
bind.lo: /usr/include/bits/stdlib-float.h
bind.lo: /usr/include/unistd.h
bind.lo: /usr/include/bits/posix_opt.h
bind.lo: /usr/include/bits/environments.h
bind.lo: /usr/include/bits/confname.h
bind.lo: /usr/include/getopt.h
bind.lo: /usr/include/sys/wait.h
bind.lo: /usr/include/string.h
bind.lo: /usr/include/netinet/in.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
bind.lo: /usr/include/stdint.h
bind.lo: /usr/include/bits/wchar.h
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
bind.lo: /usr/include/bits/in.h
bind.lo: /usr/include/arpa/inet.h
bind.lo: /usr/include/sys/stat.h
bind.lo: /usr/include/bits/stat.h
bind.lo: /usr/include/bits/timex.h
bind.lo: /usr/include/sys/time.h
bind.lo: /usr/include/sys/times.h
bind.lo: /usr/include/errno.h
bind.lo: /usr/include/bits/errno.h
bind.lo: /usr/include/linux/errno.h
bind.lo: /usr/include/asm/errno.h
bind.lo: /usr/include/asm-generic/errno.h
bind.lo: /usr/include/asm-generic/errno-base.h
bind.lo: /usr/include/netdb.h
bind.lo: /usr/include/rpc/netdb.h
bind.lo: /usr/include/bits/netdb.h
bind.lo: /usr/include/sys/ioctl.h
bind.lo: /usr/include/bits/ioctls.h
bind.lo: /usr/include/asm/ioctls.h
bind.lo: /usr/include/asm-generic/ioctls.h
bind.lo: /usr/include/linux/ioctl.h
bind.lo: /usr/include/asm/ioctl.h
bind.lo: /usr/include/asm-generic/ioctl.h
bind.lo: /usr/include/bits/ioctl-types.h
bind.lo: /usr/include/sys/ttydefaults.h
bind.lo: /usr/include/dirent.h
bind.lo: /usr/include/bits/dirent.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
bind.lo: /usr/lib64/perl5/CORE/handy.h
bind.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
bind.lo: /usr/include/inttypes.h
bind.lo: /usr/lib64/perl5/CORE/unixish.h
bind.lo: /usr/include/pthread.h
bind.lo: /usr/include/sched.h
bind.lo: /usr/include/bits/sched.h
bind.lo: /usr/lib64/perl5/CORE/iperlsys.h
bind.lo: /usr/lib64/perl5/CORE/perlio.h
bind.lo: /usr/include/stdio.h
bind.lo: /usr/include/libio.h
bind.lo: /usr/include/_G_config.h
bind.lo: /usr/include/wchar.h
bind.lo: /usr/include/bits/sys_errlist.h
bind.lo: /usr/lib64/perl5/CORE/perly.h
bind.lo: /usr/lib64/perl5/CORE/sv.h
bind.lo: /usr/lib64/perl5/CORE/regexp.h
bind.lo: /usr/lib64/perl5/CORE/op_reg_common.h
bind.lo: /usr/lib64/perl5/CORE/util.h
bind.lo: /usr/lib64/perl5/CORE/form.h
bind.lo: /usr/lib64/perl5/CORE/gv.h
bind.lo: /usr/lib64/perl5/CORE/pad.h
bind.lo: /usr/lib64/perl5/CORE/cv.h
bind.lo: /usr/lib64/perl5/CORE/opnames.h
bind.lo: /usr/lib64/perl5/CORE/op.h
bind.lo: /usr/lib64/perl5/CORE/reentr.h
bind.lo: /usr/include/pwd.h
bind.lo: /usr/include/grp.h
bind.lo: /usr/include/crypt.h
bind.lo: /usr/include/shadow.h
bind.lo: /usr/include/paths.h
bind.lo: /usr/lib64/perl5/CORE/hv.h
bind.lo: /usr/lib64/perl5/CORE/cop.h
bind.lo: /usr/lib64/perl5/CORE/mydtrace.h
bind.lo: /usr/lib64/perl5/CORE/av.h
bind.lo: /usr/lib64/perl5/CORE/mg.h
bind.lo: /usr/lib64/perl5/CORE/scope.h
bind.lo: /usr/lib64/perl5/CORE/warnings.h
bind.lo: /usr/lib64/perl5/CORE/utf8.h
bind.lo: /usr/lib64/perl5/CORE/parser.h
bind.lo: /usr/include/math.h
bind.lo: /usr/include/bits/huge_val.h
bind.lo: /usr/include/bits/huge_valf.h
bind.lo: /usr/include/bits/huge_vall.h
bind.lo: /usr/include/bits/inf.h
bind.lo: /usr/include/bits/nan.h
bind.lo: /usr/include/bits/mathdef.h
bind.lo: /usr/include/bits/mathcalls.h
bind.lo: /usr/lib64/perl5/CORE/patchlevel.h
bind.lo: /usr/lib64/perl5/CORE/intrpvar.h
bind.lo: /usr/lib64/perl5/CORE/thread.h
bind.lo: /usr/lib64/perl5/CORE/pp.h
bind.lo: /usr/lib64/perl5/CORE/proto.h
bind.lo: /usr/lib64/perl5/CORE/opcode.h
bind.lo: /usr/lib64/perl5/CORE/embedvar.h
bind.lo: /usr/lib64/perl5/CORE/embed.h
bind.lo: /usr/lib64/perl5/CORE/perlvars.h
bind.lo: /usr/lib64/perl5/CORE/mg_vtable.h
bind.lo: /usr/lib64/perl5/CORE/overload.h
bind.lo: /usr/include/sys/ipc.h
bind.lo: /usr/include/bits/ipctypes.h
bind.lo: /usr/include/bits/ipc.h
bind.lo: /usr/include/sys/sem.h
bind.lo: /usr/include/bits/sem.h
bind.lo: /usr/include/sys/file.h
bind.lo: /usr/include/fcntl.h
bind.lo: /usr/include/bits/fcntl.h
bind.lo: /usr/include/bits/fcntl-linux.h
bind.lo: asperl_undefs.h
bind.lo: ../../../include/portable.h
bind.lo: ../../../include/ac/fdset.h
bind.lo: ../../../include/ldap_cdefs.h
bind.lo: ../../../include/ldap_features.h
bind.lo: ../../../include/ac/assert.h
bind.lo: /usr/include/assert.h
bind.lo: ../../../include/ac/localize.h
bind.lo: ../slap.h
bind.lo: ../../../include/ldap_defaults.h
bind.lo: ../../../include/ldap_config.h
bind.lo: ../../../include/ac/stdlib.h
bind.lo: ../../../include/ac/syslog.h
bind.lo: /usr/include/syslog.h
bind.lo: /usr/include/sys/syslog.h
bind.lo: /usr/include/bits/syslog-path.h
bind.lo: ../../../include/ac/regex.h
bind.lo: /usr/include/regex.h
bind.lo: ../../../include/ac/signal.h
bind.lo: ../../../include/ac/socket.h
bind.lo: /usr/include/poll.h
bind.lo: /usr/include/sys/poll.h
bind.lo: /usr/include/bits/poll.h
bind.lo: /usr/include/sys/un.h
bind.lo: /usr/include/netinet/tcp.h
bind.lo: /usr/include/arpa/nameser.h
bind.lo: /usr/include/sys/bitypes.h
bind.lo: /usr/include/arpa/nameser_compat.h
bind.lo: /usr/include/resolv.h
bind.lo: ../../../include/ac/time.h
bind.lo: ../../../include/ac/param.h
bind.lo: ../../../include/ac/unistd.h
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
bind.lo: ../../../include/ldap_queue.h
bind.lo: ../proto-slap.h
bind.lo: proto-perl.h
compare.lo: compare.c
compare.lo: /usr/include/stdc-predef.h
compare.lo: perl_back.h
compare.lo: /usr/lib64/perl5/CORE/EXTERN.h
compare.lo: /usr/lib64/perl5/CORE/perl.h
compare.lo: /usr/lib64/perl5/CORE/config.h
compare.lo: /usr/include/sys/types.h
compare.lo: /usr/include/features.h
compare.lo: /usr/include/sys/cdefs.h
compare.lo: /usr/include/bits/wordsize.h
compare.lo: /usr/include/gnu/stubs.h
compare.lo: /usr/include/gnu/stubs-64.h
compare.lo: /usr/include/bits/types.h
compare.lo: /usr/include/bits/typesizes.h
compare.lo: /usr/include/time.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
compare.lo: /usr/include/ctype.h
compare.lo: /usr/include/xlocale.h
compare.lo: /usr/include/locale.h
compare.lo: /usr/include/bits/locale.h
compare.lo: /usr/include/setjmp.h
compare.lo: /usr/include/bits/setjmp.h
compare.lo: /usr/include/sys/param.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
compare.lo: /usr/include/limits.h
compare.lo: /usr/include/bits/posix1_lim.h
compare.lo: /usr/include/bits/local_lim.h
compare.lo: /usr/include/linux/limits.h
compare.lo: /usr/include/bits/posix2_lim.h
compare.lo: /usr/include/bits/xopen_lim.h
compare.lo: /usr/include/bits/stdio_lim.h
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
compare.lo: /usr/include/stdlib.h
compare.lo: /usr/include/bits/waitflags.h
compare.lo: /usr/include/bits/waitstatus.h
compare.lo: /usr/include/alloca.h
compare.lo: /usr/include/bits/stdlib-float.h
compare.lo: /usr/include/unistd.h
compare.lo: /usr/include/bits/posix_opt.h
compare.lo: /usr/include/bits/environments.h
compare.lo: /usr/include/bits/confname.h
compare.lo: /usr/include/getopt.h
compare.lo: /usr/include/sys/wait.h
compare.lo: /usr/include/string.h
compare.lo: /usr/include/netinet/in.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
compare.lo: /usr/include/stdint.h
compare.lo: /usr/include/bits/wchar.h
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
compare.lo: /usr/include/bits/in.h
compare.lo: /usr/include/arpa/inet.h
compare.lo: /usr/include/sys/stat.h
compare.lo: /usr/include/bits/stat.h
compare.lo: /usr/include/bits/timex.h
compare.lo: /usr/include/sys/time.h
compare.lo: /usr/include/sys/times.h
compare.lo: /usr/include/errno.h
compare.lo: /usr/include/bits/errno.h
compare.lo: /usr/include/linux/errno.h
compare.lo: /usr/include/asm/errno.h
compare.lo: /usr/include/asm-generic/errno.h
compare.lo: /usr/include/asm-generic/errno-base.h
compare.lo: /usr/include/netdb.h
compare.lo: /usr/include/rpc/netdb.h
compare.lo: /usr/include/bits/netdb.h
compare.lo: /usr/include/sys/ioctl.h
compare.lo: /usr/include/bits/ioctls.h
compare.lo: /usr/include/asm/ioctls.h
compare.lo: /usr/include/asm-generic/ioctls.h
compare.lo: /usr/include/linux/ioctl.h
compare.lo: /usr/include/asm/ioctl.h
compare.lo: /usr/include/asm-generic/ioctl.h
compare.lo: /usr/include/bits/ioctl-types.h
compare.lo: /usr/include/sys/ttydefaults.h
compare.lo: /usr/include/dirent.h
compare.lo: /usr/include/bits/dirent.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
compare.lo: /usr/lib64/perl5/CORE/handy.h
compare.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
compare.lo: /usr/include/inttypes.h
compare.lo: /usr/lib64/perl5/CORE/unixish.h
compare.lo: /usr/include/pthread.h
compare.lo: /usr/include/sched.h
compare.lo: /usr/include/bits/sched.h
compare.lo: /usr/lib64/perl5/CORE/iperlsys.h
compare.lo: /usr/lib64/perl5/CORE/perlio.h
compare.lo: /usr/include/stdio.h
compare.lo: /usr/include/libio.h
compare.lo: /usr/include/_G_config.h
compare.lo: /usr/include/wchar.h
compare.lo: /usr/include/bits/sys_errlist.h
compare.lo: /usr/lib64/perl5/CORE/perly.h
compare.lo: /usr/lib64/perl5/CORE/sv.h
compare.lo: /usr/lib64/perl5/CORE/regexp.h
compare.lo: /usr/lib64/perl5/CORE/op_reg_common.h
compare.lo: /usr/lib64/perl5/CORE/util.h
compare.lo: /usr/lib64/perl5/CORE/form.h
compare.lo: /usr/lib64/perl5/CORE/gv.h
compare.lo: /usr/lib64/perl5/CORE/pad.h
compare.lo: /usr/lib64/perl5/CORE/cv.h
compare.lo: /usr/lib64/perl5/CORE/opnames.h
compare.lo: /usr/lib64/perl5/CORE/op.h
compare.lo: /usr/lib64/perl5/CORE/reentr.h
compare.lo: /usr/include/pwd.h
compare.lo: /usr/include/grp.h
compare.lo: /usr/include/crypt.h
compare.lo: /usr/include/shadow.h
compare.lo: /usr/include/paths.h
compare.lo: /usr/lib64/perl5/CORE/hv.h
compare.lo: /usr/lib64/perl5/CORE/cop.h
compare.lo: /usr/lib64/perl5/CORE/mydtrace.h
compare.lo: /usr/lib64/perl5/CORE/av.h
compare.lo: /usr/lib64/perl5/CORE/mg.h
compare.lo: /usr/lib64/perl5/CORE/scope.h
compare.lo: /usr/lib64/perl5/CORE/warnings.h
compare.lo: /usr/lib64/perl5/CORE/utf8.h
compare.lo: /usr/lib64/perl5/CORE/parser.h
compare.lo: /usr/include/math.h
compare.lo: /usr/include/bits/huge_val.h
compare.lo: /usr/include/bits/huge_valf.h
compare.lo: /usr/include/bits/huge_vall.h
compare.lo: /usr/include/bits/inf.h
compare.lo: /usr/include/bits/nan.h
compare.lo: /usr/include/bits/mathdef.h
compare.lo: /usr/include/bits/mathcalls.h
compare.lo: /usr/lib64/perl5/CORE/patchlevel.h
compare.lo: /usr/lib64/perl5/CORE/intrpvar.h
compare.lo: /usr/lib64/perl5/CORE/thread.h
compare.lo: /usr/lib64/perl5/CORE/pp.h
compare.lo: /usr/lib64/perl5/CORE/proto.h
compare.lo: /usr/lib64/perl5/CORE/opcode.h
compare.lo: /usr/lib64/perl5/CORE/embedvar.h
compare.lo: /usr/lib64/perl5/CORE/embed.h
compare.lo: /usr/lib64/perl5/CORE/perlvars.h
compare.lo: /usr/lib64/perl5/CORE/mg_vtable.h
compare.lo: /usr/lib64/perl5/CORE/overload.h
compare.lo: /usr/include/sys/ipc.h
compare.lo: /usr/include/bits/ipctypes.h
compare.lo: /usr/include/bits/ipc.h
compare.lo: /usr/include/sys/sem.h
compare.lo: /usr/include/bits/sem.h
compare.lo: /usr/include/sys/file.h
compare.lo: /usr/include/fcntl.h
compare.lo: /usr/include/bits/fcntl.h
compare.lo: /usr/include/bits/fcntl-linux.h
compare.lo: asperl_undefs.h
compare.lo: ../../../include/portable.h
compare.lo: ../../../include/ac/fdset.h
compare.lo: ../../../include/ldap_cdefs.h
compare.lo: ../../../include/ldap_features.h
compare.lo: ../../../include/ac/assert.h
compare.lo: /usr/include/assert.h
compare.lo: ../../../include/ac/localize.h
compare.lo: ../slap.h
compare.lo: ../../../include/ldap_defaults.h
compare.lo: ../../../include/ldap_config.h
compare.lo: ../../../include/ac/stdlib.h
compare.lo: ../../../include/ac/syslog.h
compare.lo: /usr/include/syslog.h
compare.lo: /usr/include/sys/syslog.h
compare.lo: /usr/include/bits/syslog-path.h
compare.lo: ../../../include/ac/regex.h
compare.lo: /usr/include/regex.h
compare.lo: ../../../include/ac/signal.h
compare.lo: ../../../include/ac/socket.h
compare.lo: /usr/include/poll.h
compare.lo: /usr/include/sys/poll.h
compare.lo: /usr/include/bits/poll.h
compare.lo: /usr/include/sys/un.h
compare.lo: /usr/include/netinet/tcp.h
compare.lo: /usr/include/arpa/nameser.h
compare.lo: /usr/include/sys/bitypes.h
compare.lo: /usr/include/arpa/nameser_compat.h
compare.lo: /usr/include/resolv.h
compare.lo: ../../../include/ac/time.h
compare.lo: ../../../include/ac/param.h
compare.lo: ../../../include/ac/unistd.h
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
compare.lo: ../../../include/ldap_queue.h
compare.lo: ../proto-slap.h
compare.lo: proto-perl.h
compare.lo: ../../../include/lutil.h
modify.lo: modify.c
modify.lo: /usr/include/stdc-predef.h
modify.lo: perl_back.h
modify.lo: /usr/lib64/perl5/CORE/EXTERN.h
modify.lo: /usr/lib64/perl5/CORE/perl.h
modify.lo: /usr/lib64/perl5/CORE/config.h
modify.lo: /usr/include/sys/types.h
modify.lo: /usr/include/features.h
modify.lo: /usr/include/sys/cdefs.h
modify.lo: /usr/include/bits/wordsize.h
modify.lo: /usr/include/gnu/stubs.h
modify.lo: /usr/include/gnu/stubs-64.h
modify.lo: /usr/include/bits/types.h
modify.lo: /usr/include/bits/typesizes.h
modify.lo: /usr/include/time.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
modify.lo: /usr/include/ctype.h
modify.lo: /usr/include/xlocale.h
modify.lo: /usr/include/locale.h
modify.lo: /usr/include/bits/locale.h
modify.lo: /usr/include/setjmp.h
modify.lo: /usr/include/bits/setjmp.h
modify.lo: /usr/include/sys/param.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
modify.lo: /usr/include/limits.h
modify.lo: /usr/include/bits/posix1_lim.h
modify.lo: /usr/include/bits/local_lim.h
modify.lo: /usr/include/linux/limits.h
modify.lo: /usr/include/bits/posix2_lim.h
modify.lo: /usr/include/bits/xopen_lim.h
modify.lo: /usr/include/bits/stdio_lim.h
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
modify.lo: /usr/include/stdlib.h
modify.lo: /usr/include/bits/waitflags.h
modify.lo: /usr/include/bits/waitstatus.h
modify.lo: /usr/include/alloca.h
modify.lo: /usr/include/bits/stdlib-float.h
modify.lo: /usr/include/unistd.h
modify.lo: /usr/include/bits/posix_opt.h
modify.lo: /usr/include/bits/environments.h
modify.lo: /usr/include/bits/confname.h
modify.lo: /usr/include/getopt.h
modify.lo: /usr/include/sys/wait.h
modify.lo: /usr/include/string.h
modify.lo: /usr/include/netinet/in.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
modify.lo: /usr/include/stdint.h
modify.lo: /usr/include/bits/wchar.h
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
modify.lo: /usr/include/bits/in.h
modify.lo: /usr/include/arpa/inet.h
modify.lo: /usr/include/sys/stat.h
modify.lo: /usr/include/bits/stat.h
modify.lo: /usr/include/bits/timex.h
modify.lo: /usr/include/sys/time.h
modify.lo: /usr/include/sys/times.h
modify.lo: /usr/include/errno.h
modify.lo: /usr/include/bits/errno.h
modify.lo: /usr/include/linux/errno.h
modify.lo: /usr/include/asm/errno.h
modify.lo: /usr/include/asm-generic/errno.h
modify.lo: /usr/include/asm-generic/errno-base.h
modify.lo: /usr/include/netdb.h
modify.lo: /usr/include/rpc/netdb.h
modify.lo: /usr/include/bits/netdb.h
modify.lo: /usr/include/sys/ioctl.h
modify.lo: /usr/include/bits/ioctls.h
modify.lo: /usr/include/asm/ioctls.h
modify.lo: /usr/include/asm-generic/ioctls.h
modify.lo: /usr/include/linux/ioctl.h
modify.lo: /usr/include/asm/ioctl.h
modify.lo: /usr/include/asm-generic/ioctl.h
modify.lo: /usr/include/bits/ioctl-types.h
modify.lo: /usr/include/sys/ttydefaults.h
modify.lo: /usr/include/dirent.h
modify.lo: /usr/include/bits/dirent.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
modify.lo: /usr/lib64/perl5/CORE/handy.h
modify.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
modify.lo: /usr/include/inttypes.h
modify.lo: /usr/lib64/perl5/CORE/unixish.h
modify.lo: /usr/include/pthread.h
modify.lo: /usr/include/sched.h
modify.lo: /usr/include/bits/sched.h
modify.lo: /usr/lib64/perl5/CORE/iperlsys.h
modify.lo: /usr/lib64/perl5/CORE/perlio.h
modify.lo: /usr/include/stdio.h
modify.lo: /usr/include/libio.h
modify.lo: /usr/include/_G_config.h
modify.lo: /usr/include/wchar.h
modify.lo: /usr/include/bits/sys_errlist.h
modify.lo: /usr/lib64/perl5/CORE/perly.h
modify.lo: /usr/lib64/perl5/CORE/sv.h
modify.lo: /usr/lib64/perl5/CORE/regexp.h
modify.lo: /usr/lib64/perl5/CORE/op_reg_common.h
modify.lo: /usr/lib64/perl5/CORE/util.h
modify.lo: /usr/lib64/perl5/CORE/form.h
modify.lo: /usr/lib64/perl5/CORE/gv.h
modify.lo: /usr/lib64/perl5/CORE/pad.h
modify.lo: /usr/lib64/perl5/CORE/cv.h
modify.lo: /usr/lib64/perl5/CORE/opnames.h
modify.lo: /usr/lib64/perl5/CORE/op.h
modify.lo: /usr/lib64/perl5/CORE/reentr.h
modify.lo: /usr/include/pwd.h
modify.lo: /usr/include/grp.h
modify.lo: /usr/include/crypt.h
modify.lo: /usr/include/shadow.h
modify.lo: /usr/include/paths.h
modify.lo: /usr/lib64/perl5/CORE/hv.h
modify.lo: /usr/lib64/perl5/CORE/cop.h
modify.lo: /usr/lib64/perl5/CORE/mydtrace.h
modify.lo: /usr/lib64/perl5/CORE/av.h
modify.lo: /usr/lib64/perl5/CORE/mg.h
modify.lo: /usr/lib64/perl5/CORE/scope.h
modify.lo: /usr/lib64/perl5/CORE/warnings.h
modify.lo: /usr/lib64/perl5/CORE/utf8.h
modify.lo: /usr/lib64/perl5/CORE/parser.h
modify.lo: /usr/include/math.h
modify.lo: /usr/include/bits/huge_val.h
modify.lo: /usr/include/bits/huge_valf.h
modify.lo: /usr/include/bits/huge_vall.h
modify.lo: /usr/include/bits/inf.h
modify.lo: /usr/include/bits/nan.h
modify.lo: /usr/include/bits/mathdef.h
modify.lo: /usr/include/bits/mathcalls.h
modify.lo: /usr/lib64/perl5/CORE/patchlevel.h
modify.lo: /usr/lib64/perl5/CORE/intrpvar.h
modify.lo: /usr/lib64/perl5/CORE/thread.h
modify.lo: /usr/lib64/perl5/CORE/pp.h
modify.lo: /usr/lib64/perl5/CORE/proto.h
modify.lo: /usr/lib64/perl5/CORE/opcode.h
modify.lo: /usr/lib64/perl5/CORE/embedvar.h
modify.lo: /usr/lib64/perl5/CORE/embed.h
modify.lo: /usr/lib64/perl5/CORE/perlvars.h
modify.lo: /usr/lib64/perl5/CORE/mg_vtable.h
modify.lo: /usr/lib64/perl5/CORE/overload.h
modify.lo: /usr/include/sys/ipc.h
modify.lo: /usr/include/bits/ipctypes.h
modify.lo: /usr/include/bits/ipc.h
modify.lo: /usr/include/sys/sem.h
modify.lo: /usr/include/bits/sem.h
modify.lo: /usr/include/sys/file.h
modify.lo: /usr/include/fcntl.h
modify.lo: /usr/include/bits/fcntl.h
modify.lo: /usr/include/bits/fcntl-linux.h
modify.lo: asperl_undefs.h
modify.lo: ../../../include/portable.h
modify.lo: ../../../include/ac/fdset.h
modify.lo: ../../../include/ldap_cdefs.h
modify.lo: ../../../include/ldap_features.h
modify.lo: ../../../include/ac/assert.h
modify.lo: /usr/include/assert.h
modify.lo: ../../../include/ac/localize.h
modify.lo: ../slap.h
modify.lo: ../../../include/ldap_defaults.h
modify.lo: ../../../include/ldap_config.h
modify.lo: ../../../include/ac/stdlib.h
modify.lo: ../../../include/ac/syslog.h
modify.lo: /usr/include/syslog.h
modify.lo: /usr/include/sys/syslog.h
modify.lo: /usr/include/bits/syslog-path.h
modify.lo: ../../../include/ac/regex.h
modify.lo: /usr/include/regex.h
modify.lo: ../../../include/ac/signal.h
modify.lo: ../../../include/ac/socket.h
modify.lo: /usr/include/poll.h
modify.lo: /usr/include/sys/poll.h
modify.lo: /usr/include/bits/poll.h
modify.lo: /usr/include/sys/un.h
modify.lo: /usr/include/netinet/tcp.h
modify.lo: /usr/include/arpa/nameser.h
modify.lo: /usr/include/sys/bitypes.h
modify.lo: /usr/include/arpa/nameser_compat.h
modify.lo: /usr/include/resolv.h
modify.lo: ../../../include/ac/time.h
modify.lo: ../../../include/ac/param.h
modify.lo: ../../../include/ac/unistd.h
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
modify.lo: ../../../include/ldap_queue.h
modify.lo: ../proto-slap.h
modify.lo: proto-perl.h
modify.lo: ../../../include/ac/string.h
add.lo: add.c
add.lo: /usr/include/stdc-predef.h
add.lo: perl_back.h
add.lo: /usr/lib64/perl5/CORE/EXTERN.h
add.lo: /usr/lib64/perl5/CORE/perl.h
add.lo: /usr/lib64/perl5/CORE/config.h
add.lo: /usr/include/sys/types.h
add.lo: /usr/include/features.h
add.lo: /usr/include/sys/cdefs.h
add.lo: /usr/include/bits/wordsize.h
add.lo: /usr/include/gnu/stubs.h
add.lo: /usr/include/gnu/stubs-64.h
add.lo: /usr/include/bits/types.h
add.lo: /usr/include/bits/typesizes.h
add.lo: /usr/include/time.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
add.lo: /usr/include/ctype.h
add.lo: /usr/include/xlocale.h
add.lo: /usr/include/locale.h
add.lo: /usr/include/bits/locale.h
add.lo: /usr/include/setjmp.h
add.lo: /usr/include/bits/setjmp.h
add.lo: /usr/include/sys/param.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
add.lo: /usr/include/limits.h
add.lo: /usr/include/bits/posix1_lim.h
add.lo: /usr/include/bits/local_lim.h
add.lo: /usr/include/linux/limits.h
add.lo: /usr/include/bits/posix2_lim.h
add.lo: /usr/include/bits/xopen_lim.h
add.lo: /usr/include/bits/stdio_lim.h
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
add.lo: /usr/include/stdlib.h
add.lo: /usr/include/bits/waitflags.h
add.lo: /usr/include/bits/waitstatus.h
add.lo: /usr/include/alloca.h
add.lo: /usr/include/bits/stdlib-float.h
add.lo: /usr/include/unistd.h
add.lo: /usr/include/bits/posix_opt.h
add.lo: /usr/include/bits/environments.h
add.lo: /usr/include/bits/confname.h
add.lo: /usr/include/getopt.h
add.lo: /usr/include/sys/wait.h
add.lo: /usr/include/string.h
add.lo: /usr/include/netinet/in.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
add.lo: /usr/include/stdint.h
add.lo: /usr/include/bits/wchar.h
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
add.lo: /usr/include/bits/in.h
add.lo: /usr/include/arpa/inet.h
add.lo: /usr/include/sys/stat.h
add.lo: /usr/include/bits/stat.h
add.lo: /usr/include/bits/timex.h
add.lo: /usr/include/sys/time.h
add.lo: /usr/include/sys/times.h
add.lo: /usr/include/errno.h
add.lo: /usr/include/bits/errno.h
add.lo: /usr/include/linux/errno.h
add.lo: /usr/include/asm/errno.h
add.lo: /usr/include/asm-generic/errno.h
add.lo: /usr/include/asm-generic/errno-base.h
add.lo: /usr/include/netdb.h
add.lo: /usr/include/rpc/netdb.h
add.lo: /usr/include/bits/netdb.h
add.lo: /usr/include/sys/ioctl.h
add.lo: /usr/include/bits/ioctls.h
add.lo: /usr/include/asm/ioctls.h
add.lo: /usr/include/asm-generic/ioctls.h
add.lo: /usr/include/linux/ioctl.h
add.lo: /usr/include/asm/ioctl.h
add.lo: /usr/include/asm-generic/ioctl.h
add.lo: /usr/include/bits/ioctl-types.h
add.lo: /usr/include/sys/ttydefaults.h
add.lo: /usr/include/dirent.h
add.lo: /usr/include/bits/dirent.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
add.lo: /usr/lib64/perl5/CORE/handy.h
add.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
add.lo: /usr/include/inttypes.h
add.lo: /usr/lib64/perl5/CORE/unixish.h
add.lo: /usr/include/pthread.h
add.lo: /usr/include/sched.h
add.lo: /usr/include/bits/sched.h
add.lo: /usr/lib64/perl5/CORE/iperlsys.h
add.lo: /usr/lib64/perl5/CORE/perlio.h
add.lo: /usr/include/stdio.h
add.lo: /usr/include/libio.h
add.lo: /usr/include/_G_config.h
add.lo: /usr/include/wchar.h
add.lo: /usr/include/bits/sys_errlist.h
add.lo: /usr/lib64/perl5/CORE/perly.h
add.lo: /usr/lib64/perl5/CORE/sv.h
add.lo: /usr/lib64/perl5/CORE/regexp.h
add.lo: /usr/lib64/perl5/CORE/op_reg_common.h
add.lo: /usr/lib64/perl5/CORE/util.h
add.lo: /usr/lib64/perl5/CORE/form.h
add.lo: /usr/lib64/perl5/CORE/gv.h
add.lo: /usr/lib64/perl5/CORE/pad.h
add.lo: /usr/lib64/perl5/CORE/cv.h
add.lo: /usr/lib64/perl5/CORE/opnames.h
add.lo: /usr/lib64/perl5/CORE/op.h
add.lo: /usr/lib64/perl5/CORE/reentr.h
add.lo: /usr/include/pwd.h
add.lo: /usr/include/grp.h
add.lo: /usr/include/crypt.h
add.lo: /usr/include/shadow.h
add.lo: /usr/include/paths.h
add.lo: /usr/lib64/perl5/CORE/hv.h
add.lo: /usr/lib64/perl5/CORE/cop.h
add.lo: /usr/lib64/perl5/CORE/mydtrace.h
add.lo: /usr/lib64/perl5/CORE/av.h
add.lo: /usr/lib64/perl5/CORE/mg.h
add.lo: /usr/lib64/perl5/CORE/scope.h
add.lo: /usr/lib64/perl5/CORE/warnings.h
add.lo: /usr/lib64/perl5/CORE/utf8.h
add.lo: /usr/lib64/perl5/CORE/parser.h
add.lo: /usr/include/math.h
add.lo: /usr/include/bits/huge_val.h
add.lo: /usr/include/bits/huge_valf.h
add.lo: /usr/include/bits/huge_vall.h
add.lo: /usr/include/bits/inf.h
add.lo: /usr/include/bits/nan.h
add.lo: /usr/include/bits/mathdef.h
add.lo: /usr/include/bits/mathcalls.h
add.lo: /usr/lib64/perl5/CORE/patchlevel.h
add.lo: /usr/lib64/perl5/CORE/intrpvar.h
add.lo: /usr/lib64/perl5/CORE/thread.h
add.lo: /usr/lib64/perl5/CORE/pp.h
add.lo: /usr/lib64/perl5/CORE/proto.h
add.lo: /usr/lib64/perl5/CORE/opcode.h
add.lo: /usr/lib64/perl5/CORE/embedvar.h
add.lo: /usr/lib64/perl5/CORE/embed.h
add.lo: /usr/lib64/perl5/CORE/perlvars.h
add.lo: /usr/lib64/perl5/CORE/mg_vtable.h
add.lo: /usr/lib64/perl5/CORE/overload.h
add.lo: /usr/include/sys/ipc.h
add.lo: /usr/include/bits/ipctypes.h
add.lo: /usr/include/bits/ipc.h
add.lo: /usr/include/sys/sem.h
add.lo: /usr/include/bits/sem.h
add.lo: /usr/include/sys/file.h
add.lo: /usr/include/fcntl.h
add.lo: /usr/include/bits/fcntl.h
add.lo: /usr/include/bits/fcntl-linux.h
add.lo: asperl_undefs.h
add.lo: ../../../include/portable.h
add.lo: ../../../include/ac/fdset.h
add.lo: ../../../include/ldap_cdefs.h
add.lo: ../../../include/ldap_features.h
add.lo: ../../../include/ac/assert.h
add.lo: /usr/include/assert.h
add.lo: ../../../include/ac/localize.h
add.lo: ../slap.h
add.lo: ../../../include/ldap_defaults.h
add.lo: ../../../include/ldap_config.h
add.lo: ../../../include/ac/stdlib.h
add.lo: ../../../include/ac/syslog.h
add.lo: /usr/include/syslog.h
add.lo: /usr/include/sys/syslog.h
add.lo: /usr/include/bits/syslog-path.h
add.lo: ../../../include/ac/regex.h
add.lo: /usr/include/regex.h
add.lo: ../../../include/ac/signal.h
add.lo: ../../../include/ac/socket.h
add.lo: /usr/include/poll.h
add.lo: /usr/include/sys/poll.h
add.lo: /usr/include/bits/poll.h
add.lo: /usr/include/sys/un.h
add.lo: /usr/include/netinet/tcp.h
add.lo: /usr/include/arpa/nameser.h
add.lo: /usr/include/sys/bitypes.h
add.lo: /usr/include/arpa/nameser_compat.h
add.lo: /usr/include/resolv.h
add.lo: ../../../include/ac/time.h
add.lo: ../../../include/ac/param.h
add.lo: ../../../include/ac/unistd.h
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
add.lo: ../../../include/ldap_queue.h
add.lo: ../proto-slap.h
add.lo: proto-perl.h
modrdn.lo: modrdn.c
modrdn.lo: /usr/include/stdc-predef.h
modrdn.lo: perl_back.h
modrdn.lo: /usr/lib64/perl5/CORE/EXTERN.h
modrdn.lo: /usr/lib64/perl5/CORE/perl.h
modrdn.lo: /usr/lib64/perl5/CORE/config.h
modrdn.lo: /usr/include/sys/types.h
modrdn.lo: /usr/include/features.h
modrdn.lo: /usr/include/sys/cdefs.h
modrdn.lo: /usr/include/bits/wordsize.h
modrdn.lo: /usr/include/gnu/stubs.h
modrdn.lo: /usr/include/gnu/stubs-64.h
modrdn.lo: /usr/include/bits/types.h
modrdn.lo: /usr/include/bits/typesizes.h
modrdn.lo: /usr/include/time.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
modrdn.lo: /usr/include/ctype.h
modrdn.lo: /usr/include/xlocale.h
modrdn.lo: /usr/include/locale.h
modrdn.lo: /usr/include/bits/locale.h
modrdn.lo: /usr/include/setjmp.h
modrdn.lo: /usr/include/bits/setjmp.h
modrdn.lo: /usr/include/sys/param.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
modrdn.lo: /usr/include/limits.h
modrdn.lo: /usr/include/bits/posix1_lim.h
modrdn.lo: /usr/include/bits/local_lim.h
modrdn.lo: /usr/include/linux/limits.h
modrdn.lo: /usr/include/bits/posix2_lim.h
modrdn.lo: /usr/include/bits/xopen_lim.h
modrdn.lo: /usr/include/bits/stdio_lim.h
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
modrdn.lo: /usr/include/stdlib.h
modrdn.lo: /usr/include/bits/waitflags.h
modrdn.lo: /usr/include/bits/waitstatus.h
modrdn.lo: /usr/include/alloca.h
modrdn.lo: /usr/include/bits/stdlib-float.h
modrdn.lo: /usr/include/unistd.h
modrdn.lo: /usr/include/bits/posix_opt.h
modrdn.lo: /usr/include/bits/environments.h
modrdn.lo: /usr/include/bits/confname.h
modrdn.lo: /usr/include/getopt.h
modrdn.lo: /usr/include/sys/wait.h
modrdn.lo: /usr/include/string.h
modrdn.lo: /usr/include/netinet/in.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
modrdn.lo: /usr/include/stdint.h
modrdn.lo: /usr/include/bits/wchar.h
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
modrdn.lo: /usr/include/bits/in.h
modrdn.lo: /usr/include/arpa/inet.h
modrdn.lo: /usr/include/sys/stat.h
modrdn.lo: /usr/include/bits/stat.h
modrdn.lo: /usr/include/bits/timex.h
modrdn.lo: /usr/include/sys/time.h
modrdn.lo: /usr/include/sys/times.h
modrdn.lo: /usr/include/errno.h
modrdn.lo: /usr/include/bits/errno.h
modrdn.lo: /usr/include/linux/errno.h
modrdn.lo: /usr/include/asm/errno.h
modrdn.lo: /usr/include/asm-generic/errno.h
modrdn.lo: /usr/include/asm-generic/errno-base.h
modrdn.lo: /usr/include/netdb.h
modrdn.lo: /usr/include/rpc/netdb.h
modrdn.lo: /usr/include/bits/netdb.h
modrdn.lo: /usr/include/sys/ioctl.h
modrdn.lo: /usr/include/bits/ioctls.h
modrdn.lo: /usr/include/asm/ioctls.h
modrdn.lo: /usr/include/asm-generic/ioctls.h
modrdn.lo: /usr/include/linux/ioctl.h
modrdn.lo: /usr/include/asm/ioctl.h
modrdn.lo: /usr/include/asm-generic/ioctl.h
modrdn.lo: /usr/include/bits/ioctl-types.h
modrdn.lo: /usr/include/sys/ttydefaults.h
modrdn.lo: /usr/include/dirent.h
modrdn.lo: /usr/include/bits/dirent.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
modrdn.lo: /usr/lib64/perl5/CORE/handy.h
modrdn.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
modrdn.lo: /usr/include/inttypes.h
modrdn.lo: /usr/lib64/perl5/CORE/unixish.h
modrdn.lo: /usr/include/pthread.h
modrdn.lo: /usr/include/sched.h
modrdn.lo: /usr/include/bits/sched.h
modrdn.lo: /usr/lib64/perl5/CORE/iperlsys.h
modrdn.lo: /usr/lib64/perl5/CORE/perlio.h
modrdn.lo: /usr/include/stdio.h
modrdn.lo: /usr/include/libio.h
modrdn.lo: /usr/include/_G_config.h
modrdn.lo: /usr/include/wchar.h
modrdn.lo: /usr/include/bits/sys_errlist.h
modrdn.lo: /usr/lib64/perl5/CORE/perly.h
modrdn.lo: /usr/lib64/perl5/CORE/sv.h
modrdn.lo: /usr/lib64/perl5/CORE/regexp.h
modrdn.lo: /usr/lib64/perl5/CORE/op_reg_common.h
modrdn.lo: /usr/lib64/perl5/CORE/util.h
modrdn.lo: /usr/lib64/perl5/CORE/form.h
modrdn.lo: /usr/lib64/perl5/CORE/gv.h
modrdn.lo: /usr/lib64/perl5/CORE/pad.h
modrdn.lo: /usr/lib64/perl5/CORE/cv.h
modrdn.lo: /usr/lib64/perl5/CORE/opnames.h
modrdn.lo: /usr/lib64/perl5/CORE/op.h
modrdn.lo: /usr/lib64/perl5/CORE/reentr.h
modrdn.lo: /usr/include/pwd.h
modrdn.lo: /usr/include/grp.h
modrdn.lo: /usr/include/crypt.h
modrdn.lo: /usr/include/shadow.h
modrdn.lo: /usr/include/paths.h
modrdn.lo: /usr/lib64/perl5/CORE/hv.h
modrdn.lo: /usr/lib64/perl5/CORE/cop.h
modrdn.lo: /usr/lib64/perl5/CORE/mydtrace.h
modrdn.lo: /usr/lib64/perl5/CORE/av.h
modrdn.lo: /usr/lib64/perl5/CORE/mg.h
modrdn.lo: /usr/lib64/perl5/CORE/scope.h
modrdn.lo: /usr/lib64/perl5/CORE/warnings.h
modrdn.lo: /usr/lib64/perl5/CORE/utf8.h
modrdn.lo: /usr/lib64/perl5/CORE/parser.h
modrdn.lo: /usr/include/math.h
modrdn.lo: /usr/include/bits/huge_val.h
modrdn.lo: /usr/include/bits/huge_valf.h
modrdn.lo: /usr/include/bits/huge_vall.h
modrdn.lo: /usr/include/bits/inf.h
modrdn.lo: /usr/include/bits/nan.h
modrdn.lo: /usr/include/bits/mathdef.h
modrdn.lo: /usr/include/bits/mathcalls.h
modrdn.lo: /usr/lib64/perl5/CORE/patchlevel.h
modrdn.lo: /usr/lib64/perl5/CORE/intrpvar.h
modrdn.lo: /usr/lib64/perl5/CORE/thread.h
modrdn.lo: /usr/lib64/perl5/CORE/pp.h
modrdn.lo: /usr/lib64/perl5/CORE/proto.h
modrdn.lo: /usr/lib64/perl5/CORE/opcode.h
modrdn.lo: /usr/lib64/perl5/CORE/embedvar.h
modrdn.lo: /usr/lib64/perl5/CORE/embed.h
modrdn.lo: /usr/lib64/perl5/CORE/perlvars.h
modrdn.lo: /usr/lib64/perl5/CORE/mg_vtable.h
modrdn.lo: /usr/lib64/perl5/CORE/overload.h
modrdn.lo: /usr/include/sys/ipc.h
modrdn.lo: /usr/include/bits/ipctypes.h
modrdn.lo: /usr/include/bits/ipc.h
modrdn.lo: /usr/include/sys/sem.h
modrdn.lo: /usr/include/bits/sem.h
modrdn.lo: /usr/include/sys/file.h
modrdn.lo: /usr/include/fcntl.h
modrdn.lo: /usr/include/bits/fcntl.h
modrdn.lo: /usr/include/bits/fcntl-linux.h
modrdn.lo: asperl_undefs.h
modrdn.lo: ../../../include/portable.h
modrdn.lo: ../../../include/ac/fdset.h
modrdn.lo: ../../../include/ldap_cdefs.h
modrdn.lo: ../../../include/ldap_features.h
modrdn.lo: ../../../include/ac/assert.h
modrdn.lo: /usr/include/assert.h
modrdn.lo: ../../../include/ac/localize.h
modrdn.lo: ../slap.h
modrdn.lo: ../../../include/ldap_defaults.h
modrdn.lo: ../../../include/ldap_config.h
modrdn.lo: ../../../include/ac/stdlib.h
modrdn.lo: ../../../include/ac/syslog.h
modrdn.lo: /usr/include/syslog.h
modrdn.lo: /usr/include/sys/syslog.h
modrdn.lo: /usr/include/bits/syslog-path.h
modrdn.lo: ../../../include/ac/regex.h
modrdn.lo: /usr/include/regex.h
modrdn.lo: ../../../include/ac/signal.h
modrdn.lo: ../../../include/ac/socket.h
modrdn.lo: /usr/include/poll.h
modrdn.lo: /usr/include/sys/poll.h
modrdn.lo: /usr/include/bits/poll.h
modrdn.lo: /usr/include/sys/un.h
modrdn.lo: /usr/include/netinet/tcp.h
modrdn.lo: /usr/include/arpa/nameser.h
modrdn.lo: /usr/include/sys/bitypes.h
modrdn.lo: /usr/include/arpa/nameser_compat.h
modrdn.lo: /usr/include/resolv.h
modrdn.lo: ../../../include/ac/time.h
modrdn.lo: ../../../include/ac/param.h
modrdn.lo: ../../../include/ac/unistd.h
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
modrdn.lo: ../../../include/ldap_queue.h
modrdn.lo: ../proto-slap.h
modrdn.lo: proto-perl.h
delete.lo: delete.c
delete.lo: /usr/include/stdc-predef.h
delete.lo: perl_back.h
delete.lo: /usr/lib64/perl5/CORE/EXTERN.h
delete.lo: /usr/lib64/perl5/CORE/perl.h
delete.lo: /usr/lib64/perl5/CORE/config.h
delete.lo: /usr/include/sys/types.h
delete.lo: /usr/include/features.h
delete.lo: /usr/include/sys/cdefs.h
delete.lo: /usr/include/bits/wordsize.h
delete.lo: /usr/include/gnu/stubs.h
delete.lo: /usr/include/gnu/stubs-64.h
delete.lo: /usr/include/bits/types.h
delete.lo: /usr/include/bits/typesizes.h
delete.lo: /usr/include/time.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h
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
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h
delete.lo: /usr/include/ctype.h
delete.lo: /usr/include/xlocale.h
delete.lo: /usr/include/locale.h
delete.lo: /usr/include/bits/locale.h
delete.lo: /usr/include/setjmp.h
delete.lo: /usr/include/bits/setjmp.h
delete.lo: /usr/include/sys/param.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h
delete.lo: /usr/include/limits.h
delete.lo: /usr/include/bits/posix1_lim.h
delete.lo: /usr/include/bits/local_lim.h
delete.lo: /usr/include/linux/limits.h
delete.lo: /usr/include/bits/posix2_lim.h
delete.lo: /usr/include/bits/xopen_lim.h
delete.lo: /usr/include/bits/stdio_lim.h
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
delete.lo: /usr/include/stdlib.h
delete.lo: /usr/include/bits/waitflags.h
delete.lo: /usr/include/bits/waitstatus.h
delete.lo: /usr/include/alloca.h
delete.lo: /usr/include/bits/stdlib-float.h
delete.lo: /usr/include/unistd.h
delete.lo: /usr/include/bits/posix_opt.h
delete.lo: /usr/include/bits/environments.h
delete.lo: /usr/include/bits/confname.h
delete.lo: /usr/include/getopt.h
delete.lo: /usr/include/sys/wait.h
delete.lo: /usr/include/string.h
delete.lo: /usr/include/netinet/in.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h
delete.lo: /usr/include/stdint.h
delete.lo: /usr/include/bits/wchar.h
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
delete.lo: /usr/include/bits/in.h
delete.lo: /usr/include/arpa/inet.h
delete.lo: /usr/include/sys/stat.h
delete.lo: /usr/include/bits/stat.h
delete.lo: /usr/include/bits/timex.h
delete.lo: /usr/include/sys/time.h
delete.lo: /usr/include/sys/times.h
delete.lo: /usr/include/errno.h
delete.lo: /usr/include/bits/errno.h
delete.lo: /usr/include/linux/errno.h
delete.lo: /usr/include/asm/errno.h
delete.lo: /usr/include/asm-generic/errno.h
delete.lo: /usr/include/asm-generic/errno-base.h
delete.lo: /usr/include/netdb.h
delete.lo: /usr/include/rpc/netdb.h
delete.lo: /usr/include/bits/netdb.h
delete.lo: /usr/include/sys/ioctl.h
delete.lo: /usr/include/bits/ioctls.h
delete.lo: /usr/include/asm/ioctls.h
delete.lo: /usr/include/asm-generic/ioctls.h
delete.lo: /usr/include/linux/ioctl.h
delete.lo: /usr/include/asm/ioctl.h
delete.lo: /usr/include/asm-generic/ioctl.h
delete.lo: /usr/include/bits/ioctl-types.h
delete.lo: /usr/include/sys/ttydefaults.h
delete.lo: /usr/include/dirent.h
delete.lo: /usr/include/bits/dirent.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/float.h
delete.lo: /usr/lib64/perl5/CORE/handy.h
delete.lo: /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h
delete.lo: /usr/include/inttypes.h
delete.lo: /usr/lib64/perl5/CORE/unixish.h
delete.lo: /usr/include/pthread.h
delete.lo: /usr/include/sched.h
delete.lo: /usr/include/bits/sched.h
delete.lo: /usr/lib64/perl5/CORE/iperlsys.h
delete.lo: /usr/lib64/perl5/CORE/perlio.h
delete.lo: /usr/include/stdio.h
delete.lo: /usr/include/libio.h
delete.lo: /usr/include/_G_config.h
delete.lo: /usr/include/wchar.h
delete.lo: /usr/include/bits/sys_errlist.h
delete.lo: /usr/lib64/perl5/CORE/perly.h
delete.lo: /usr/lib64/perl5/CORE/sv.h
delete.lo: /usr/lib64/perl5/CORE/regexp.h
delete.lo: /usr/lib64/perl5/CORE/op_reg_common.h
delete.lo: /usr/lib64/perl5/CORE/util.h
delete.lo: /usr/lib64/perl5/CORE/form.h
delete.lo: /usr/lib64/perl5/CORE/gv.h
delete.lo: /usr/lib64/perl5/CORE/pad.h
delete.lo: /usr/lib64/perl5/CORE/cv.h
delete.lo: /usr/lib64/perl5/CORE/opnames.h
delete.lo: /usr/lib64/perl5/CORE/op.h
delete.lo: /usr/lib64/perl5/CORE/reentr.h
delete.lo: /usr/include/pwd.h
delete.lo: /usr/include/grp.h
delete.lo: /usr/include/crypt.h
delete.lo: /usr/include/shadow.h
delete.lo: /usr/include/paths.h
delete.lo: /usr/lib64/perl5/CORE/hv.h
delete.lo: /usr/lib64/perl5/CORE/cop.h
delete.lo: /usr/lib64/perl5/CORE/mydtrace.h
delete.lo: /usr/lib64/perl5/CORE/av.h
delete.lo: /usr/lib64/perl5/CORE/mg.h
delete.lo: /usr/lib64/perl5/CORE/scope.h
delete.lo: /usr/lib64/perl5/CORE/warnings.h
delete.lo: /usr/lib64/perl5/CORE/utf8.h
delete.lo: /usr/lib64/perl5/CORE/parser.h
delete.lo: /usr/include/math.h
delete.lo: /usr/include/bits/huge_val.h
delete.lo: /usr/include/bits/huge_valf.h
delete.lo: /usr/include/bits/huge_vall.h
delete.lo: /usr/include/bits/inf.h
delete.lo: /usr/include/bits/nan.h
delete.lo: /usr/include/bits/mathdef.h
delete.lo: /usr/include/bits/mathcalls.h
delete.lo: /usr/lib64/perl5/CORE/patchlevel.h
delete.lo: /usr/lib64/perl5/CORE/intrpvar.h
delete.lo: /usr/lib64/perl5/CORE/thread.h
delete.lo: /usr/lib64/perl5/CORE/pp.h
delete.lo: /usr/lib64/perl5/CORE/proto.h
delete.lo: /usr/lib64/perl5/CORE/opcode.h
delete.lo: /usr/lib64/perl5/CORE/embedvar.h
delete.lo: /usr/lib64/perl5/CORE/embed.h
delete.lo: /usr/lib64/perl5/CORE/perlvars.h
delete.lo: /usr/lib64/perl5/CORE/mg_vtable.h
delete.lo: /usr/lib64/perl5/CORE/overload.h
delete.lo: /usr/include/sys/ipc.h
delete.lo: /usr/include/bits/ipctypes.h
delete.lo: /usr/include/bits/ipc.h
delete.lo: /usr/include/sys/sem.h
delete.lo: /usr/include/bits/sem.h
delete.lo: /usr/include/sys/file.h
delete.lo: /usr/include/fcntl.h
delete.lo: /usr/include/bits/fcntl.h
delete.lo: /usr/include/bits/fcntl-linux.h
delete.lo: asperl_undefs.h
delete.lo: ../../../include/portable.h
delete.lo: ../../../include/ac/fdset.h
delete.lo: ../../../include/ldap_cdefs.h
delete.lo: ../../../include/ldap_features.h
delete.lo: ../../../include/ac/assert.h
delete.lo: /usr/include/assert.h
delete.lo: ../../../include/ac/localize.h
delete.lo: ../slap.h
delete.lo: ../../../include/ldap_defaults.h
delete.lo: ../../../include/ldap_config.h
delete.lo: ../../../include/ac/stdlib.h
delete.lo: ../../../include/ac/syslog.h
delete.lo: /usr/include/syslog.h
delete.lo: /usr/include/sys/syslog.h
delete.lo: /usr/include/bits/syslog-path.h
delete.lo: ../../../include/ac/regex.h
delete.lo: /usr/include/regex.h
delete.lo: ../../../include/ac/signal.h
delete.lo: ../../../include/ac/socket.h
delete.lo: /usr/include/poll.h
delete.lo: /usr/include/sys/poll.h
delete.lo: /usr/include/bits/poll.h
delete.lo: /usr/include/sys/un.h
delete.lo: /usr/include/netinet/tcp.h
delete.lo: /usr/include/arpa/nameser.h
delete.lo: /usr/include/sys/bitypes.h
delete.lo: /usr/include/arpa/nameser_compat.h
delete.lo: /usr/include/resolv.h
delete.lo: ../../../include/ac/time.h
delete.lo: ../../../include/ac/param.h
delete.lo: ../../../include/ac/unistd.h
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
delete.lo: ../../../include/ldap_queue.h
delete.lo: ../proto-slap.h
delete.lo: proto-perl.h

# IF YOU PUT ANYTHING HERE IT WILL GO AWAY
