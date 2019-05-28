
 R.DIAG - A GEM model and analysis Diagnostics Toolkit
 ======

 An extensive toolkit available to users wanting to manipulate 2D
 and 3D meteorological data, as produced either by the *Environment
 and Climate Change Canada (ECCC)* GEM forecast model or the *ECCC*
 CCCma General Circulation Model (GCM). The CMC/RPN GEM file formats
 and two flavors of the GCM's binary sequential format are supported.
 This toolkit was originally derived from an early 1990's unix port
 of the then CRAY version of the CCCma diagnostic toolkit. Additional
 code produced at UQAM for diagnostics of regional climate data in
 the late 1990's is also included in the toolkit.

 The GEM toolkit is built in the R.DIAG executable binary. The
 toolkit commands can be grouped under several themes or section.

 The available sections are :

 - a) Display operations
 - b) File/label/record manipulations 
 - c) General computations
 - d) Manipulations on gridded data
 - e) Manipulations on Fourrier or Spherical harmonics data
 - f) Time-series manipulations

 Once installed, a documentation .txt file for each R.DIAG command and
 a few .html files can be found in the `man/pdoc` directory. Each R.DIAG
 command is thus documented. In particular, the `man/pdoc/index.html`
 file holds another description of the package but also of the basic
 arguments and environment variables that it responds to. The `.txt`
 files are only available in English while the `.html` file are in
 French at this time. The list of R.DIAG commands can be retreived
 via the `r.diag lspgm` command. To figure out what a particular
 command does, simply execute the `r.diag command_name` command.

 In addition to the toolkit, a conversion tool for either the CCCma
 or CMC/RPN file formats to/from the NetCDF v3 file format is included.
 Input NetCDF files should closely conform to the CF v1.4 Metadata
 convention. The converter will otherwise (at best) choke on them.
 Depending on this executable's name, which should be either `cdf2ccc`
 or `cdf2rpn`, the default ECCC file format read/written by the executable
 will be either the CCCma or CMC/RPN formats. These two executable
 are in general automatically generated as hard-links. The first
 version of the converter was created by the *Ouranos Consortium*
 from 2003 to 2006. Note that `.txt` and `.pdf` documentation files
 for the converter are also available in the `man/pdoc` directory.

 The default Makefile target (`allbin`) attempts to generate the
 libraries and executables, after checking that the initial setup
 has been done. The `all` target includes the `allbin` and `document`
 targets. The `document` target extracts the documentation headers
 from the different sources files to the `man/pdoc` sub-directory.
 The `export` target copies the final products to the parent directory.
 The `web-document` target pushes the documentation to `$HOSTWEB:$DIAGWEB`.
 The git working directory that holds the package is assumed to be just
 that, somewhere users may not be too comfortable. The package
 implicitely assumes that `make=gmake`.

 To generate the toolkit executable, the RPN/CMC development environment
 has to be installed and active (see mfvalin/rmnlib on github.com). As
 well, a VgridDescriptors package compatible with the current GEM v4+
 model version has to be available. Furthermore, to generate the two
 cdf2xxx executables, the NetCDF (v3 or v4) and UdUnits v2 library
 packages also have to be available. These in turn require the `hdf5`, `dl`,
 and `z` libraries (if NetCDF v4 is used) and the `expat` library (for
 UdUnits v2). The current configuration assumes that the the NetCDF
 v4 package is used and that the FORTRAN interface netcdff library
 is provided via a SSM bundle that also points to the UdUnits2
 necessary components.

 Most of the code available here is written in FORTRAN (and a lot
 of it is still in F77). As a consequnce of this, the conversion tool
 requires a FORTRAN to C wrapper for the UdUnits v2 C routines. This
 is again available on github.com (look for `mfvalin/wrapper-code/udunits`
 on that site). However, a version of this package is also included
 here for convenience.

 Some versions of the toolkit may also use the DDFUN90 package as
 produced by *David H. Bailey of the NERSC, Lawrence Berkeley Lab*.
 The 2005-03-11 version of this package is included here. This is
 the case for the PGI versions as these compilers (at least as of
 their version 14xx) do not provide for quad-precision real arithmetic.
 On the other hand, since the Intel/ifort, AIX/xlf and GFORTRAN
 compilers do support this, toolkit versions generated with them
 will not require the DDFUN90 package. To account for this, the
 `src/lssub/gaussg.F90` source file may need to be modified
 according to your environment's specifications.
 
 R.DIAG is copyrighted (C) 1990-2010 by the *Division de Recherche
 en Prevision Numerique* of *ECCC*. This code is free software; you can
 redistribute it and/or modify it under the terms of the GNU Lesser
 General Public License as published by the *Free Software
 Foundation*, version 2.1 of the License.
 
 For more information please contact : Dugas.Bernard@uqam.ca
 
 Last revision : May 2019
