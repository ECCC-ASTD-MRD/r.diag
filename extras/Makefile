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
	[[ -d udunits-2.1.24 ]] || /bin/cp -drp src/udunits-2.1.24 .
        # Follow Bernard ...
        #  --enable-shared=no :  Le fait que ma librairie udunits2 est statique m'a permis d'y mettre le f_udunits_2.o.
	cd udunits-2.1.24 && ./configure --prefix=$(CURDIR)/NetcdfUdunits/$(EC_ARCH) CFLAGS=$(CFLAGS) CC=$(CCOMP) FC=$(FCOMP) F77=$(FCOMP) CPPFLAGS=$(CPPFLAGS) --enable-shared=no
	cd udunits-2.1.24 && cp -drp udunits2.pdf prog/udunits2prog.pdf lib/udunits2lib.pdf $(CURDIR)/NetcdfUdunits/$(EC_ARCH)/share/doc/udunits
	cd udunits-2.1.24 && make && make check && make -k install && make clean
	cd udunits-2.1.24/lib && $(FCOMP) -c f_udunits_2.f90 && \
         s.ar -r $(CURDIR)/NetcdfUdunits/$(EC_ARCH)/lib/libudunits2.a f_udunits_2.o && \
         rsync -a f_udunits_2.inc f_udunits_2.mod $(CURDIR)/NetcdfUdunits/$(EC_ARCH)/include && \
         /bin/rm -f f_udunits_2.o f_udunits_2.mod
        # ... was following Bernard

	## Do NOT make netcdf at CMC.  Use the library supplied with the compiler instead
	## cd netcdf-3.6.3 && ./configure --prefix=$(CURDIR)/NetcdfUdunits/$(EC_ARCH) CC=$(CCOMP) FC=$(FCOMP) F77=$(FCOMP) CPPFLAGS=$(CPPFLAGS) --disable-shared --disable-cxx --enable-separate-fortran
	## cd netcdf-3.6.3 && $(MAKE) && $(MAKE) test && $(MAKE) install

clean:
	rm -rf netcdf-3.6.3 udunits-1.12.11

veryclean: clean
	rm -rf $(CURDIR)/NetcdfUdunits/$(EC_ARCH)

veryveryclean: clean
	rm -rf $(CURDIR)/NetcdfUdunits/*
