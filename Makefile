OPENLDAP_ROOT := $(shell pwd)
P4_ROOT ?= $(shell cd $(OPENLDAP_ROOT)/../..; pwd)
MAKE ?= make

BUILD_PLATFORM ?= $(shell sh $(P4_ROOT)/ZimbraBuild/rpmconf/Build/get_plat_tag.sh)

ifeq ($(BUILD_PLATFORM), )
	BUILD_PLATFORM := "UNKNOWN"
endif

#MAKEARGS ?= -j2 DEFINES="-DCHECK_CSN -DSLAP_SCHEMA_EXPOSE -DMDB_DEBUG=3"
MAKEARGS ?= -j2 DEFINES="-DCHECK_CSN -DSLAP_SCHEMA_EXPOSE"
ZIMBRA_HOME ?= /opt/zimbra

PATCH	:= patch -g0 -N -p1 < ../patches/writers.patch; patch -g0 -N -p1 < ../patches/threadpool.patch; patch -g0 -N -p1 < ../patches/ITS7683.patch; patch -g0 -N -p1 < ../patches/ITS8054.patch;

ifdef BETA
	include $(OPENLDAP_ROOT)/../beta_versions.def
else
	include $(OPENLDAP_ROOT)/../versions.def
endif

ifeq (MACOSX,$(findstring MACOSX,$(BUILD_PLATFORM)))
	ENVMOD := env LIBS="-lresolv" 
	CPPFLAG := "-DOPENLDAP_FD_SETSIZE=32768"
endif

LDFLAGS	:=	LDFLAGS="-L$(OPENSSL_LIB_DIR) -L$(CYRUS_LIB_DIR) -L$(LDAP_LIB_DIR) -L$(LIBTOOL_LIB_DIR) \
		 -Wl,-rpath,$(OPENSSL_LIB_DIR) -Wl,-rpath,$(CYRUS_LIB_DIR) -Wl,-rpath,$(LDAP_LIB_DIR) -Wl,-rpath,$(LIBTOOL_LIB_DIR)"

LDAP_TGZ_TARGET := $(P4_ROOT)/ThirdPartyBuilds/$(BUILD_PLATFORM)/openldap/openldap-$(LDAP_VERSION).tgz
LDAP_LIB_TGZ_TARGET := $(P4_ROOT)/ThirdPartyBuilds/$(BUILD_PLATFORM)/openldap/openldap-libs-$(LDAP_VERSION).tgz

files	:= $(wildcard src/openldap-$(LDAP_RELEASE).tgz)

all: checksrc allclean build tar

checksrc:
	$(if $(files), @echo "", exit 1)

build:
	(tar xzf src/openldap-$(LDAP_RELEASE).tgz; \
	mv openldap-$(LDAP_RELEASE) openldap-$(LDAP_VERSION); \
	cd openldap-$(LDAP_VERSION); \
	patch -g0 -N -p1 < ../patches/ITS5037.patch; \
	$(PATCH) \
	patch -g0 -N -p1 < ../patches/leopard.fix; \
	$(LDFLAGS) \
	LD_LIBRARY_PATH=$(OPENSSL_LIB_DIR):$(CYRUS_LIB_DIR):$(LIBTOOL_LIB_DIR) \
	CPPFLAGS="-I$(ZIMBRA_HOME)/cyrus-sasl-$(CYRUS_VERSION)/include \
		  -I$(ZIMBRA_HOME)/openssl-$(OPENSSL_VERSION)/include -I$(ZIMBRA_HOME)/libtool-$(LIBTOOL_VERSION)/include $(CPPFLAG)" \
	CFLAGS="-g -O0" \
	$(ENVMOD) ./configure --prefix=$(ZIMBRA_HOME)/openldap-$(LDAP_VERSION) --libexecdir=$(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/sbin \
	--with-cyrus-sasl \
	--with-tls=openssl \
	--enable-dynamic \
	--enable-slapd \
		--enable-modules \
		--enable-sssvlv \
	--enable-backends=mod \
		--disable-shell \
		--disable-sql \
		--disable-bdb \
		--disable-hdb \
		--disable-ndb \
	--enable-overlays=mod \
	--enable-debug \
	--enable-spasswd \
	--localstatedir=/opt/zimbra/data/ldap/state \
	--enable-crypt; \
	LD_RUN_PATH=$(OPENSSL_LIB_DIR):$(CYRUS_LIB_DIR):$(LIBTOOL_LIB_DIR) $(MAKE) depend; \
	LD_RUN_PATH=$(OPENSSL_LIB_DIR):$(CYRUS_LIB_DIR):$(LIBTOOL_LIB_DIR) $(MAKE) $(MAKEARGS); \
	LD_RUN_PATH=$(OPENSSL_LIB_DIR):$(CYRUS_LIB_DIR):$(LIBTOOL_LIB_DIR) $(MAKE) install STRIP="")
	(cd openldap-$(LDAP_VERSION)/libraries/liblmdb; make; \
	cp mdb_stat $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/bin; \
	cp mdb_stat.1 $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/share/man/man1; \
	cp mdb_copy $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/bin; \
	cp lmdb.h $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/include; \
	cp liblmdb.a $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/lib; \
	cp liblmdb.so $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/lib;)
	(cd openldap-$(LDAP_VERSION)/contrib/slapd-modules/noopsrch; \
	LD_RUN_PATH=$(LDAP_LIB_DIR):$(OPENSSL_LIB_DIR):$(CYRUS_LIB_DIR):$(LIBTOOL_LIB_DIR) $(MAKE) prefix=$(ZIMBRA_HOME)/openldap-$(LDAP_VERSION) libexecdir=$(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/sbin LIBS="-L$(LDAP_LIB_DIR) -lldap_r -llber" install STRIP=""; \
	rm -f $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/sbin/openldap/noopsrch.a; \
	chmod 755 $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/sbin/openldap/noopsrch.la;)
	(cd openldap-$(LDAP_VERSION)/contrib/slapd-modules/passwd/sha2; \
	LD_RUN_PATH=$(LDAP_LIB_DIR):$(OPENSSL_LIB_DIR):$(CYRUS_LIB_DIR):$(LIBTOOL_LIB_DIR) $(MAKE) prefix=$(ZIMBRA_HOME)/openldap-$(LDAP_VERSION) libexecdir=$(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/sbin LIBS="-L$(LDAP_LIB_DIR) -lldap_r -llber" install STRIP=""; \
	rm -f $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/sbin/openldap/pw-sha2.a; \
	chmod 755 $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/sbin/openldap/pw-sha2.la;)
	(cd $(ZIMBRA_HOME); ln -s openldap-$(LDAP_VERSION) openldap)
	#rm -rf $(ZIMBRA_HOME)/data; rm -f $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)/etc/openldap/DB_CONFIG.example

tar:
	mkdir -p $(P4_ROOT)/ThirdPartyBuilds/$(BUILD_PLATFORM)/openldap
	(cd $(ZIMBRA_HOME); tar czf $(LDAP_LIB_TGZ_TARGET) openldap-$(LDAP_VERSION)/lib)
	(cd $(ZIMBRA_HOME); tar czf $(LDAP_TGZ_TARGET) openldap-$(LDAP_VERSION)/bin openldap-$(LDAP_VERSION)/etc openldap-$(LDAP_VERSION)/include openldap-$(LDAP_VERSION)/sbin openldap-$(LDAP_VERSION)/share)

p4edit: $(LDAP_TGZ_TARGET)
	p4 add $(LDAP_TGZ_TARGET)
	p4 edit $(LDAP_TGZ_TARGET)
	p4 add $(LDAP_LIB_TGZ_TARGET)
	p4 edit $(LDAP_LIB_TGZ_TARGET)

clean:
	/bin/rm -rf openldap-$(LDAP_VERSION)

allclean: clean
	/bin/rm -rf $(ZIMBRA_HOME)/openldap-$(LDAP_VERSION)
	/bin/rm -rf $(ZIMBRA_HOME)/openldap
	rm -f $(LDAP_TGZ_TARGET)
	rm -f $(LDAP_LIB_TGZ_TARGET)
