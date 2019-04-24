
# RDIAG Toolkit Makefile principal

ifeq "$(BASE_ARCH)" "$(EC_ARCH)"
$(error FATAL: EC_ARCH is equal to BASE_ARCH, no compiler architecture is defined, ABORTING)
endif

SHELL   = /bin/bash

FCOMP = s.f90
CCOMP = cc
CPP   = icpc
CXX   = cc
CXXCPP= icpc

# Location of the development versions of the src, bin/$(BASE_ARCH),
# lib/$(EC_ARCH) and share/pdoc directory trees

DIAGNOSTIQUE = $(CURDIR)
MAKEOVERRIDES += DIAGNOSTIQUE=$(DIAGNOSTIQUE)

# Destination that the current working binaries and libraries
# will be exported to, as well as where to find the EXTRAS

DESTINATION = $(DIAGNOSTIQUE)/..

# NetCDF v_3.6 and Udunits v_1.2 libraries
# UQAM:
# used to be found 
# in the EXTRAS directory. The package now can either 1) use
# the netcdff SSM package to locate all the necessary shared
# libraries including MFV's udunits2f FORTRAN wrapper as well
# as udunits2 itself or 2) use the static versions of these
# same libraries as provided by the netcdff-4.4 SSM package.
# As of May 2017, the second option is used.
#
# CMC:
# netcdf now comes with the compiler
# udunits must still be compiled with r.diag
EXTRAS  = $(DESTINATION)/extras
EXTLIB  = $(EXTRAS)/NetcdfUdunits/$(EC_ARCH)/lib

# Directories used/created by this Makefile

BINDIR  = $(DIAGNOSTIQUE)/bin/$(BASE_ARCH)
INCLUDE = $(DIAGNOSTIQUE)/include
LIBDIR  = $(DIAGNOSTIQUE)/lib/$(EC_ARCH)
MANDIR  = $(DIAGNOSTIQUE)/share/pdoc
MODDIR  = $(INCLUDE)/$(EC_ARCH)
SUBDIR  = $(DIAGNOSTIQUE)/src/lssub/sources$(STD)/$(EC_ARCH)

# Include (very) old NCAR graphics (default=no) ?

NOPLOT  = -DNOPLOT
GRAFLIB =

# Binaires pre-compiles

#FIXES   = $(PWD)/lib/$(EC_ARCH)/stubs.o

# (obsolete) WEB Host Server for the documentation

HOSTWEB = pascal
DIAGWEB = public_html

# RMN and Vgrid_Descriptor library names

RMNLIB  = rmn_016.2
VGDLIB  = descrip

# DDFUN90, NetCDF4 and UdUnits2 library names

DDFUN90  = ddfun90

DIAG_VERSION = 6.4.0
CONV_VERSION = 2.3.0

ENTETE  = 32
STD     = 98

default: allbin

allbin: initial_base initial_cdf rdiag 

all: allbin document

documentation:
	cd $(EXTRAS) ; $(MAKE) documentation

export:
	/bin/mkdir -p $(DESTINATION)/lib/$(EC_ARCH) ;\
	rsync -av $(DIAGNOSTIQUE)/lib/$(EC_ARCH) $(DESTINATION)/lib/$(EC_ARCH)/.. ;\
	rsync -avH $(DIAGNOSTIQUE)/bin $(DESTINATION)/ ;\
	rsync -lptgoDv $(DIAGNOSTIQUE)/bin/* $(DESTINATION)/bin ;\
	rsync -av $(DIAGNOSTIQUE)/include $(DESTINATION)/ ;\
	[ -d $(DIAGNOSTIQUE)/share ] && rsync -av $(DIAGNOSTIQUE)/share $(DESTINATION)/ ;\
	rsync -av $(DIAGNOSTIQUE)/man/pdoc/*.html $(DESTINATION)/share/pdoc/ ;\
	rsync -av $(DIAGNOSTIQUE)/man/pdoc/udunits $(DESTINATION)/share/pdoc || true

# Ensure initial setup is done

# At CMC, do not load the netcdff library.  It comes with the compiler.
initial_base:
	/bin/mkdir -p $(BINDIR) $(LIBDIR) $(MANDIR) $(MODDIR) $(SUBDIR)
	s.locate --lib $(VGDLIB) 1> /dev/null || { echo -e "\nPLS execute \". s.ssmuse.dot vgriddesc\"\n" ; false ; }
#	s.locate --lib netcdff_s 1> /dev/null || { echo -e "\nPLS execute \". s.ssmuse.dot netcdff-4.4\"\n" ; false ; }
#	if [[ ! -f $(EXTLIB)/libnetcdf.a ]]; then cd $(EXTRAS) ; make all ; fi
	if [[ ! -f $(EXTLIB)/libudunits.a ]]; then cd $(EXTRAS) ; $(MAKE) all ; fi
	if [[ ! -f $(LIBDIR)/libddfun90.a || -z "$(DDFUN90)" ]]; then \
	cd $(DIAGNOSTIQUE)/src/extras/ddfun90 ; $(MAKE) RMNLIB=$(RMNLIB) ; fi
	if [[ ! -x $(BINDIR)/r.echo ]]; then cd $(DIAGNOSTIQUE)/src/extras/tools ; $(MAKE) ; fi
	if [[ ! -f $(LIBDIR)/program_version.o ]]; then cd $(LIBDIR) ;\
	s.f77 -g -c ../../program_version.f ; fi
#	if [[ ! -f $(LIBDIR)/crc32.o ]]; then cd $(LIBDIR) ;\
#	s.cc -g -c ../../crc32.c ; fi

# At CMC, do not load the netcdff library.  It comes with the compiler.
initial_cdf:
#	if [[ ! -f $(EXTLIB)/libnetcdf.a ]]; then cd $(EXTRAS) ; make all ; fi
#	s.locate --lib netcdff_s 1> /dev/null || { echo -e "\nPLS execute \". s.ssmuse.dot netcdff-4.4\"\n" ; false ; }

# RDIAG Diagnostic toolkit recipe

rdiag: initial_base
	echo "*** Making libdiag_sq98.a and libdiag_sq98_g.a ***" ;\
	cd $(DIAGNOSTIQUE)/src/lssub ; $(MAKE) VGDLIB=$(VGDLIB) ENTETE=$(ENTETE)
	echo "Making libprog_sq98.a" ;\
	cd $(DIAGNOSTIQUE)/src/lspgm ; $(MAKE)
	echo "*** Making executable r.diag ***" ;\
	cd $(DIAGNOSTIQUE)/src/lspgm ; $(MAKE) $(BASE_ARCH) OBJ="$(FIXES)" \
	NOPLOT=$(NOPLOT) GRAFLIB=$(GRAFLIB) DDFUN90=$(DDFUN90) VGDLIB=$(VGDLIB) \
	DIAG_VERSION=$(DIAG_VERSION) RMNLIB=$(RMNLIB) ENTETE=$(ENTETE)

# NetCDF to/from ( CCCma or CMC/RPN) file format converter recipe

cdf2conv: initial_base initial_cdf
	echo "*** Making libcdf2ccc.a ***" ;\
	cd $(DIAGNOSTIQUE)/src/cdf2ccc ; $(MAKE)
	echo "*** Making executable cdf2ccc ***" ;\
	cd $(DIAGNOSTIQUE)/src/cdf2ccc ;\
	$(MAKE) cdf2rpn CONV_VERSION=$(CONV_VERSION) \
	RMNLIB=$(RMNLIB) VGDLIB=$(VGDLIB) OBJ="$(FIXES)" \
	DDFUN90=$(DDFUN90) ENTETE=$(ENTETE) \
	EXTRAS=$(EXTRAS)/NetcdfUdunits/$(EC_ARCH)

# Only generate the LSSUB, LSPM and CDF2CCC libraries

libs: initial_base initial_cdf
	echo "*** Making libdiag_sq98.a and libdiag_sq98_g.a ***" ;\
	cd $(DIAGNOSTIQUE)/src/lssub ; $(MAKE) VGDLIB=$(VGDLIB)
	echo "Making libprog_sq98.a" ;\
	cd $(DIAGNOSTIQUE)/src/lspgm ; $(MAKE) ;\
	echo "*** Making libcdf2ccc.a ***" ;\
	cd $(DIAGNOSTIQUE)/src/cdf2ccc ; $(MAKE)

# Online documentation (which was originaly found in $ARMNLIB/man/pdoc) recipe

document:
	cd $(DIAGNOSTIQUE)/man/pdoc ; $(MAKE) $@

web_document:
	cd $(DIAGNOSTIQUE)/share/pdoc ; $(MAKE) $@ \
	HOSTWEB=$(HOSTWEB) DIAGWEB=$(DIAGWEB)

# Clean

clean:
	cd $(DIAGNOSTIQUE)/src/lspgm   ; $(MAKE) $@ ;\
	cd $(DIAGNOSTIQUE)/src/lssub   ; $(MAKE) $@
