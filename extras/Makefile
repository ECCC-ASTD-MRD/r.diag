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
	## Do NOT make netcdf at CMC.  Use the library supplied with the compiler instead
	## [[ -d netcdf-3.6.3 ]] || /bin/cp -drp src/netcdf-3.6.3 .
	[[ -d udunits-1.12.11 ]] || /bin/cp -drp src/udunits-1.12.11 .
	cd udunits-1.12.11/src && ./configure --prefix=$(CURDIR)/NetcdfUdunits/$(EC_ARCH) CC=$(CCOMP) CFLAGS=-fPIC FC=$(FCOMP) F77=$(FCOMP) CPPFLAGS=$(CPPFLAGS) --enable-shared
	# N.B.:  Because GIT does not retain file dates, Make attempts to recreate
	#        utscan.c from utscan.l.  This is not necessary unless we change
	#        utscan.l.  What's more, Make's attempt will fail because our
	#        revision of yacc / bison behaves a little differently than that
	#        of Unidata.  A Unidata-endorsed solution is to
	#        touch utscan.c and utscan.h, and delete utscan.o
	touch ./udunits-1.12.11/src/lib/utscan.c  ./udunits-1.12.11/src/lib/utscan.h
	rm -f ./udunits-1.12.11/src/lib/utscan.o
	cd udunits-1.12.11/src && make && make test
	-cd udunits-1.12.11/src && make -k install
	## Do NOT make netcdf at CMC.  Use the library supplied with the compiler instead
	## cd netcdf-3.6.3 && ./configure --prefix=$(CURDIR)/NetcdfUdunits/$(EC_ARCH) CC=$(CCOMP) FC=$(FCOMP) F77=$(FCOMP) CPPFLAGS=$(CPPFLAGS) --disable-shared --disable-cxx --enable-separate-fortran
	## cd netcdf-3.6.3 && make && make test && make install

clean:
	rm -rf netcdf-3.6.3 udunits-1.12.11

veryclean: clean
	rm -rf $(CURDIR)/NetcdfUdunits/$(EC_ARCH)

veryveryclean: clean
	rm -rf $(CURDIR)/NetcdfUdunits/*
