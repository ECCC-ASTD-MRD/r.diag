#
# make veryclean 
# make CCOMP=C_compiler FCOMP=Fortran_compiler
#  default C compiler : cc
#  default Fortran compiler : s.f90
#  if EC_ARCH not properly defined, abort
#
ifeq "$(BASE_ARCH)" "$(EC_ARCH)"
$(error FATAL: EC_ARCH is equal to BASE_ARCH, no compiler architecture is defined, ABORTING)
endif

FCOMP = s.f90
CCOMP = cc

#CCOMP = xlc_r
#CFLAGS='-q64 -qtbtable=full -DpgiFortran -g -O0'

CPPFLAGS = -DpgiFortran

all: clean
	echo Fortran compiler used : $(FCOMP) 
	echo C compiler used : $(CCOMP) 
	mkdir -p $(CURDIR)/NetcdfUdunits/$(EC_ARCH)
	[[ -d  netcdf-3.6.3 ]] || /bin/cp netcdf-3.6.3_udunits-1.12.11.tar.bz2 X.tar.bz2 ;\
		bunzip2 X.tar.bz2 ; tar xf X.tar ; /bin/rm -f X.tar
	cd udunits-1.12.11/src && ./configure --prefix=$(CURDIR)/NetcdfUdunits/$(EC_ARCH) CC=$(CCOMP) CFLAGS=-fPIC FC=$(FCOMP) F77=$(FCOMP) CPPFLAGS=$(CPPFLAGS) CFLAGS=$(CFLAGS) --enable-shared
	cd udunits-1.12.11/src && make && make test
	-cd udunits-1.12.11/src && make -k install
	cd netcdf-3.6.3 && ./configure --prefix=$(CURDIR)/NetcdfUdunits/$(EC_ARCH) CC=$(CCOMP) FC=$(FCOMP) F77=$(FCOMP) CPPFLAGS=$(CPPFLAGS) --disable-shared --disable-cxx --enable-separate-fortran
	cd netcdf-3.6.3 && make && make test && make install

clean:
	rm -rf netcdf-3.6.3 udunits-1.12.11

veryclean: clean
	rm -rf $(CURDIR)/NetcdfUdunits/$(EC_ARCH)

veryveryclean: clean
	rm -rf $(CURDIR)/NetcdfUdunits/*
