#     if defined (AUTO_DOC)
!
!
! NetCDF to/from CMC-RPN/CCCma format converter
!
! There may be several tools that do CMC-RPN to/from NetCDF
! format conversions at CMC/Dorval. The one described here is
! based on the Ouranos NetCDF to/from CCCma format converter,
! cdf2ccc. The resulting two programs, cdf2rpn and cdf2ccc,
! somewhat follow the 1.0 to 1.6 CF-Metadata conventions that
! are recommended for climate and large-scale forecast data.
! The only difference between the two programs is that each
! one will by default expect its own file format. In fact,
! the two are hard-linked and the program’s name at startup
! provides for the default behavior. For more info on the
! CF-Meta-data, please see
!
! http://cfconventions.org/documents.html
!
! Given the above, and the very "free" implementations
! often found in NetCDF files, "Your mileage will vary".
!
! At UQAM, the latest development version of the scripts that
! call the actual Linux binaries can be found under
!
! ${diag-tool}/r.diag_6.4.4-2.3.4_linux26-x86-64/bin
!
! where diag-tools=/unique/armnssm/ECssm/ssm-domains-base/tools/diag-tools
! and it is made available via the diagtools-alpha SSM bundle.

! In Dorval, the different AIX (now deprecated) and
! Linux binaries used to be found under
!
! ${ARMNLIB}/modeles/diag/bin/${BASE_ARCH}
!
! You will also need to define a UDUNITS2 environment variable, such as:
!
! export UDUNITS2_XML_PATH=/opt/udunits2/share/udunits/udunits2.xml
!
! You will also have to provide a CMC-RPN/NetCDF or CCCMA/NetCDF
! dictionary that defines all of your name and unit conversions.
!
! An example of this is
!
! ${DIAGNOSTIQUE}/man/pdoc/attribut_netcdf.dat   ** OR **
! ${DIAGNOSTIQUE}/development/src/cdf2ccc/attribut_netcdf.dat
! where ${DIAGNOSTIQUE} is the actual location of the RDIAG/CDF package
!
! Please note that the previous file itself actually holds
! some documentation as to its configuration/usage.
!
! The converter's calling sequence will usually look
! someting like this:
!
! cdf2rpn -rpn your_fst_file -cdf your_netcdf_file -attr your_attribut_netcdf_file
!
! Other important arguments include "-dir","-timdesc","-invj",
! "-cell_method" and "-dtsize". The "-dir" argument changes the
! conversion direction (default: from NetCDF), "-invj" reverses
! the order of the latitudes while converting them, "-timdesc"
! specifies time units (seconds, minutes, hours, days since ...)
! to be used in the NetCDF file; "-cell_method" overides the
! default cell_method attribut definitions, i.e."time: mean" or
! "time: point" that apply to time-mean or regular variables,
! respectively; finaly "-dtsize" defines the implicit accumulator
! or time-mean period in hours to be used to define appropriate
! time bounds in NetCDF files. 
!
! The rest of the arguments are mainly required by the CCCma file
! conversions as this type of file does not contain several of the
! metadata items needed by NetCDF. This info can generally be
! derived from the CMC-RPN internal file descriptors.
!
! The converter will automatically generate time bounds information
! from CMC-RPN files when it detects the presence of multi-sample
! representing data such as the resuluts of time averages, maximums,
! minimums, variances and standard deviations operations on a variable.
! This applies in particular to the output of the TIMAVG (TIMMAX,
! TIMMIN, ACCUMUL), TIMCOV (STDEV) and FSTMDIAG RDIAG commands.
! However, when converting from a NetCDF file, the '-dtsize'
! argument should be specified in order to reproduce the
! full CMC-RPN time-mean file information.
!
! Current limitations of the converter:
!
! - Only one set of multiple vertical levels is supported
!   per file. And all of these must be of the same type.
! - However, any number of single level variables
!   are supported in the same file.
! - Again, only one set of time-steps is
!   supported for time-varying variables.
!
! These constraints are mainly due to the use of NetCDF 3.x and its
! limited coordinate definitions; NetCDF version 4.x somewhat removes 
! these limitations. But at this time this converter is still based
! on the NetCDF3 API, even though it is now generated using a 4.x
! library version. A NetCDF4-API-compliant version of the converter
! is nevertheless planned.
!
!
! The full list of arguments and their description follows in the
! next two tables...
!
!
! (Assuming 1) "cles" is the actual argument name;
!           2) "def1" is the corresponding default argument value
!              when the argument itself is not specified;
!           3) "def2" is its secondary default value when it
!              is specified, but without a specific value;
!           4) "?" denotes no values) 
!
!  cles(1)  = 'cdf'    , def1(1)  = '?'       , def2(1)  = '?' 
!  cles(2)  = 'ccc'    , def1(2)  = '?'       , def2(2)  = '?' 
!  cles(3)  = 'dir'    , def1(3)  = 'def'     , def2(3)  = 'netcdf'
!  cles(4)  = 'leap'   , def1(4)  = 'no'      , def2(4)  = 'yes' 
!  cles(5)  = 'dateo'  , def1(5)  = '?'       , def2(5)  = '0' 
!  cles(6)  = 'dt'     , def1(6)  = '?'       , def2(6)  = '0.0' 
!  cles(7)  = 'tlbl'   , def1(7)  = 'no'      , def2(7)  = 'yes' 
!  cles(8)  = 'lev'    , def1(8)  = '?'       , def2(8)  = '?' 
!  cles(9)  = 'tm'     , def1(9)  = '220.0'   , def2(9)  = '?' 
!  cles(10) = 'ht'     , def1(10) = '?'       , def2(10) = '?' 
!  cles(11) = 'grid'   , def1(11) = '?'       , def2(11) = '?' 
!  cles(12) = 'ni'     , def1(12) = '?'       , def2(12) = '?' 
!  cles(13) = 'nj'     , def1(13) = '?'       , def2(13) = '?' 
!  cles(14) = 'pi'     , def1(14) = '?'       , def2(14) = '?' 
!  cles(15) = 'pj'     , def1(15) = '?'       , def2(15) = '?' 
!  cles(16) = 'dgrw'   , def1(16) = '?'       , def2(16) = '?' 
!  cles(17) = 'd60'    , def1(17) = '?'       , def2(17) = '?' 
!  cles(18) = '0lon'   , def1(18) = 'GLOBAL'  , def2(18) = '?' 
!  cles(19) = '0lat'   , def1(19) = '?'       , def2(19) = '?' 
!  cles(20) = 'dlon'   , def1(20) = '?'       , def2(20) = '?' 
!  cles(21) = 'dlat'   , def1(21) = '?'       , def2(21) = '?' 
!  cles(22) = 'invj'   , def1(22) = 'yes'     , def2(22) = 'no'
!  cles(23) = 'npack'  , def1(23) = '999'     , def2(23) = '?' 
!  cles(24) = 'lalo'   , def1(24) = 'no'      , def2(24) = 'yes' 
!  cles(25) = 'attr'   , def1(25) = file_attr , def2(25) = local 
!  cles(27) = 'fill_ccc',def1(27) = '?'       , def2(27) = 'ERR' 
!  cles(28) = 'cle_nhem',def1(28) = '?'       , def2(28) = '?' 
!  cles(29) = 'udunits', def1(29) = udunit_def, def2(29) = '?' 
!  cles(30) = 'rlonoff', def1(30) = '?'       , def2(30) = '?' 
!  cles(31) = 'hyb_pt' , def1(31) = '?'       , def2(31) = '?' 
!  cles(32) = 'hyb_pref',def1(32) = '?'       , def2(32) = '?' 
!  cles(33) = 'hyb_r'  , def1(33) = '?'       , def2(33) = '?' 
!  cles(34) = 'rpn'    , def1(34) = '?'       , def2(34) = '?' 
!  cles(35) = 'phis'   , def1(35) = '?'       , def2(35) = '?' 
!  cles(36) = 'timdesc', def1(36) = 'hours'   , def2(36) = '?'
!  cles(37) = 'nongeog', def1(37) = 'oui'     , def2(37) = 'non' 
!  cles(38) = 'xcoord' , def1(38) = '!@#$%^&' , def2(38) = '!@#$%^&' 
!  cles(39) = 'ycoord' , def1(39) = '!@#$%^&' , def2(39) = '!@#$%^&' 
!  cles(40) = 'zcoord' , def1(40) = '!@#$%^&' , def2(40) = '!@#$%^&' 
!  cles(41) = 'tcoord' , def1(41) = '!@#$%^&' , def2(41) = '!@#$%^&'
!  cles(42) = 'dtsize' , def1(42) = '0.0'     , def2(42) = '?'
!  cles(43) = 'calendar',def1(43) = 'gregorian',def2(43) = '?'
!  cles(44) = 'gribcode',def1(44) = '?'       , def2(44) = '?'
!  cles(45) = 'cell_method', def1(45) = '?'   , def2(45) = '?'
!  cles(46) = 'title'  , def1(46) = ' '       , def2(46) = ' '
!  cles(47) = 'typvar' , def1(47) = 'NC'      , def2(47) = ' '
!  cles(48) = 'etiket' , def1(48) = 'Netcdf2RPN'/,def2(48) = ' '
!
!  FORTRAN Data type : (C) character - (I) integer - (R) real
!
!  description(1)  = (C) Nom du fichier netCDF
!  description(2)  = (C) Nom du fichier CCCma
!  description(3)  = (C) Convertir vers ('cccma' ou 'rpncmc') ou 'netcdf'
!
!  Les arguments 4 a 10 decrivent les parametres de base
!     d'un fichier source en format CCCma
!
!  description(4)  = (C) Annee bissextile ('off'/'no'/'non'/'on'/'yes'/'oui')
!  description(5)  = (I) Date de depart de la simulation (AAAAMMJJHH)  
!  description(6)  = (R) Pas de temps (secondes)  
!  description(7)  = (C) Format temporel CCCma = AAAAMMDDHH ?
!  description(8)  = (C) Type de niveaux verticaux. Les seules valeurs reconnues
!                        sont 'Pressure Levels','Sigma Levels','Gal-Chen Levels',
!                        '10 m','2 m','Surface','Sea Level','Hybrid Levels',
!                        'Log Pressure Hybrid Levels','Arbitrary Levels',
!                        'Height','Top of Atmosphere','Soil Layers'
!                        et 'Hybrid Height'
!  description(9)  = (R) variable TMOYEN de PARAMETRES  
!  description(10) = (R) Hauteur du toit du modele en metres
!
!  description(11) = (C) Type de projection. Les seules valeurs reconnues
!                        sont 'lon/lat','gaussian','polar_stereographic',
!                        'rotated_latitude_longitude','rotated_pole' et
!                        'unknown'. Cet argument est surtout utilisé pour
!                        décrire les fichiers CCCma, mais il peut aussi
!                        l’être si le fichier source NetCDF ne contient
!                        pas toutes les informations requises.
!
!  Les arguments 12 a 17 decrivent les details d'une projection 'polar_stereographic'
!
!  description(12) = (I) Nbre de points de grille en X
!  description(13) = (I) Nbre de points de grille en Y
!  description(14) = (R) Coordonnee selon X du pole (nombre de delta-x)
!  description(15) = (R) Coordonnee selon Y du pole (nombre de delta-y)
!  description(16) = (R) Angle entre le meridien de Greenwich et l'axe X (degres ouest)
!  description(17) = (R) Longueur de la maille vraie a 60 deg (en metres)
!
!  Les arguments 18 a 21 decrivent les details d'une projection 'lon/lat'
!
!  description(18) = (R) Longitude d'origine (degres ouest)
!  description(19) = (R) Latitude d'origine (degres nord)
!  description(20) = (R) Longueur de la maille selon longitude (degres)
!  description(21) = (R) Longueur de la maille selon latitude (degres)
!
!  Les arguments 22 a 35 sont de divers types
!
!  description(22) = (C) Inverser l'ordre de l'indice 'j' dans la sortie
!  description(23) = (I) Densite de compression 0,1,2,4,-64,-32,-16
!  description(24) = (C) Ecrire les latitudes et longitudes ('off'/'no'/'non'/'on'/'yes'/'oui')
!  description(25) = (C) Nom du fichier dictionnaire. Les valeurs par
!                        defaut primaire et secondaire, respectivement, sont
!                        file_attr = /LOGICIELS/cdf2ccc/etc/attribut_netcdf.dat
!                        local     = ./attribut_netcdf.dat
!  description(27) = (R) Valeur de remplissage dans sortie ('FILL VALUE')
!  description(28) = (I) 0=Global, 1=Hem Nord, 2=Hem Sud (pour grilles PS ou Lat/Lon)
!  description(29) = (C) Chemin complet du fichier 'udunits2.xml'
!  description(30) = (R) Deplacement des longitudes d'une grille tournee
!  description(31) = (R) Pression au toit de la coordonnee hybride (Pa)
!  description(32) = (R) Pression de reference pour la coordonnee hybride
!  description(33) = (R) Exposant pour la coordonnee hybride
!  description(34) = (C) Nom du fichier CMC-RPN
!  description(35) = (C) Nom du fichier PHIS (Option Gal-Chen)
!
!  Items 36 a 43 ne concernent que les fichiers NetCDF
!
!  description(36) = (C) Unites associees a la variable temporelle. Les
!                        seules valeurs reconnues sont 'seconds','minutes',
!                        'hours','days','months' et 'years' (since ...)
!  description(37) = (C) Convertir les variables non-geographiques
!  description(38) = (C) Nom de la coordonnee en X du fichier NetCDF (voir Notes #2,3)
!  description(39) = (C) Nom de la coordonnee en Y du fichier NetCDF    "    "    "
!  description(40) = (C) Nom de la coordonnee en Z du fichier NetCDF    "    "    "
!  description(41) = (C) Nom de la coordonnee en T du fichier NetCDF    "    "    "
!  description(42) = (R) Intervalle d'accumulation temporelle en heures
!  description(43) = (C) Nom du calendrier (pour plus de détails voir Note #4)
!
!  Items 44 a 48 ne concernent que les fichiers CMC-RPN et NetCDF
!
!  description(44) = (I) Code GRIB pour une grille Lambert Conforme Conique
!  description(45) = (C) "Cell Method" utilisee dans les calculs temporels
!  description(46) = (C) Optionnel, "title" for meta-data
!  description(47) = (C) Optionnel, TYPVAR (default = "NC")
!  description(48) = (C) Optionnel, ETIKET (default = "Netcdf2RPN")
!
!
! Notes regarding the above arguments:
!
! 1) When the program fails to convert a NetCDF file, a first step is to
! look at the the content of this file using "ncdump filename.nc | more"
! where filename.nc is the actual NetCDF file name. This will display
! the file dimensions, followed the included variables headers, each
! with their particular attributes. A global atributes section should be
! displayed at the end of this section. A (very large) data section will
! be displayed after the global descriptors. Adding the -h argument to the
! ncdump command will prevent the display of this large data section.
! Normaly, each of the declared dimensions should also be extensively
! described in the variable section of a file. A data section relating
! to each of these coordinates should also be found following the header
! sections of a NetCDF file. The converter may attempt to supply default
! values when any of these conditions are not met,
!
!        ** but it more than likely that it will FAIL to do so**.
!
! 2) The -xcoord, -ycoord, -zcoord and -tcoord arguments may be used when
! the program fails to recognize any of the existing x, y, z or t dimension
! names, for example, if the unlimdimid dimension is called "lev" rather
! than "time" or "t". Furthermore, the time coordinate can be associated
! to the unlimdimid dimension.
!
! 3) Assuming the vertical coordinate is recognized but its values are
! either missing or not appropriate for conversion to a CMC-RPN file format,
! it is possible to input an alternative set of values to be written in the
! CMC-RPN file. Given a NetCDF vertical dimension name of "lev", and given
! that a file called "lev_remplacement.txt" exists in the current working
! directory, the converter will attempt to read this file with a (BN,I10)
! FORTRAN I/O format (one 10 character integer "lev" value per line).
! The values thus retreived will be assumed to be already coded and
! will be used "AS IS" when writing the CMC-RPN file. Any "lev" values
! to be found in the NetCDF files will then be ignored.
!
! 4) The recognized -calendar arguments are gregorian (or standard),
! proleptic_gregorian, 365_day (or noleap) and 360-day. The two 'gregorian'
! options only differ before 1582-10-15:  the standard one then follows the
! Julian 365.25-day year, while the proleptic extends the 365.2425-day
! year backward in time. UDUNITS2 follows the 'gregorian' calendar. This
! last argument is mainly used when converting to the NetCDF format, as
! a calendar attribute should always be found in the time coordinate
! desctiption of CF-Metadata compliant NetCDF files.
!
! 5) Again, a large number of the previous arguments exist to account
! for the very summary format description that holds with CCCma files.
! They are generally ignored when dealing with CMC-RPN files.
!
!
! Finally, as this converter shares much of its low-level I/O routines
! with the RDIAG toolbox, the following arguments are also relevant:
! 
!  cles(R1)  = 'help'   ,def1(R1)  = 'non' ,def2(R1)  = 'oui'
!  cles(R2)  = 'info'   ,def1(R2)  = 'non' ,def2(R2)  = 'oui'
!  cles(R3)  = 'ipktyp' ,def1(R3)  = ' '   ,def2(R3)  = '
!  cles(R4)  = 'opktyp' ,def1(R4)  = ' '   ,def2(R4)  = '
!  cles(R5)  = 'input.' ,def1(R5)  = '****',def2(R5)  = '****'
!  cles(R6)  = 'output.',def1(R6)  = '****',def2(R6)  = '****'
!  cles(R7)  = 'date'   ,def1(R7)  = ' '   ,def2(R7)  = '  -1'
!  cles(R8)  = 'singlz' ,def1(R8)  = ' '   ,def2(R8)  = '  -1'
!  cles(R9)  = 'seq'    ,def1(R9)  = 'rnd' ,def2(R9)  = 'seq'
!  cles(R10) = 'vers'   ,def1(R10) = 'non' ,def2(R10) = 'oui'
!  cles(R11) = 'na'     ,def1(R11) = '****',def2(R11) = '  -1'
!  cles(R12) = 'keepip2',def1(R12) = 'non' ,def2(R12) = 'oui'
!  cles(R13) = 'mvalue' ,def1(R13) = 'none',def2(R13) = '  -1'
!  cles(R14) = 'mvalue' ,def1(R14) = 'none',def2(R14) = '  -1'
!  cles(R15) = 'bisect' ,def1(R15) = 'oui' ,def2(R15) = 'non'
!
! This last set of arguments are documented at the end of
! the Diag_Config.html which can be accessed via the RPN
! utilities RDIAG web page. Note that this page usually
! resides in the same directory as the current file.
!
! Good luck.
!
! Maintained by: B.Dugas, ESCER/UQAM (Dugas.Bernard@uqam.ca)
! Latest revision: $Header: July 2019 $
!
!
#     endif
#     if !defined (NO_SOURCE)
      program cdf2ccc

      implicit none

      include 'netcdf.inc'
      include 'cdf2ccc.h'

!AUTEUR Guy Bergeron         mai 2003
!
!     Programme qui effectue la traduction du format netCDF au format CCCma
!     ou vise versa
!
!REVISIONS
!
!  Bernard Dugas, 4 juin 2019 :
!  - Passer a la version 2.3.5 (development)
!  Bernard Dugas, 18 decembre 2018 :
!  - Mise-a-jour de la documentation automatique
!  Bernard Dugas, 29 aout 2018 :
!  - Remplacer polar-stereographic par polar_stereographic dans
!    la description de l'argument 11 (-grid) pour la doc interne
!  Bernard Dugas 16 aout 2018 :
!  - Passer a la version 2.3.4 (development)
!  Bernard Dugas 9 mai 2018 :
!  - Passer a la version 2.3.3 (development)
!  Bernard Dugas 30 janvier 2018 :
!  - Remplacer les commandes F77 GETARG et IARGC par
!    GET_COMMAND_ARGUMENT et COMMAND_ARGUMENT_COUNT,
!    respectivement
!  Bernard Dugas 29 janvier 2018 :
!  - Tenir compte du cas ou '-version' est le premier l'argument
!  Bernard Dugas 28 novembre 2017 : 
!  - Mettre a jour la documentation automatique
!  Bernard Dugas 21 novembre 2017 : 
!  - Passer a la version 2.3.2 (development)
!  Bernard Dugas 7 juin 2017 : 
!  - Passer a la version 2.3.1 (development)
!  Bernard Dugas 6 juin 2017 : 
!  - Passer a la version 2.3.0 (Release)
!  Bernard Dugas mai 2017 : 
!  - Convertir en fichier .F90 pour utiliser
!    le preprocesseur FORTRAN90
!  Bernard Dugas fevrier 2017 :
!  - Passer de udunits v1 a udunits v2 (tests avec 2.1.24)
!  Bernard Dugas octobre 2013 :
!  - Mettre a jour la documentation automatique quand a l'usage
!    du fichier lev_remplacement.txt. Voir la routine def_level.f
!    pour plus de details.
!  Bernard Dugas juillet 2013 :
!  - Verifier si un appel du programme avec argument "-mvalue VAL"
!    et definir les variables de type 'fill's en consequence
!  - Mettre a jour la documentation automatique
!  Bernard Dugas aout 2012 (2.1.3) :
!  - Premiere mise-a-jour de la documentation interne pour 2.1.3
!  - Nouvel argument -cell_method permettant de re-definir l'attribut
!    du meme nom autrement que "time: mean" ou "time: point". Ces deux
!    ptions sont les valeurs part defaut appliquees aux variables
!    moyennees dans le temps ou pas, respectivement
!  - Les variables valides sur un niveau unique ne seront plus
!    definies comme dependant d'une dimension verticale, sauf si
!    celle-ci est partagee par toutes les variables du fichier
!  - Assurer que la coordonnee RLON des grilles tournees soit
!    monotone, tout en allant de -180 a +180 avec un centre
!    a 0 degre en mode NetCDF. Etant donne que GEM utilise un
!    interval de 0 a 360 degres, avec un centre a 180, On obtient
!    le resultat attendu via une rotation de -180 de rlon et un
!    ajout de 180 degres a longpol. Ceci est le comportement par 
!    defaut et corresponds a specifier "-rlonoff 180." a l'appel
!  Bernard Dugas juillet 2012 (2.1.2) :
!  - Troisieme mise-a-jour de la documentation interne pour 2.1.2
!  - Seconde mise-a-jour de la documentation interne pour 2.1.2
!  - Premiere mise-a-jour de la documentation interne pour 2.1.2
!  - Support ameliore des cas avec time_bnds
!  - Cette version ajoute le support des termes et formules pour
!    la description des coordonnees verticales 'hybride pression'
!  - Les variables etant definies sur un seul niveau vertical,
!    ne sont plus declaree comme dependant de cette coordonnee
!  - De meme,lorsque le nombre de niveaux verticaux est 1, on ne
!    declare plus cette coordonnee
!  Bernard Dugas juin 2012 (2.1.1) :
!  - Mise-a-jour de la doc suite a la distinction qui est maintenant faite
!    entre les calendriers 'gregorian'/'standard' et 'proleptic_gregorian':
!    On ne peut utiliser les fonctions basees sur UDUNITS avec le
!    'proleptic_gregorian'.
!  Bernard Dugas mai 2012 :
!   - Activer le mode QQQDOC '-help'.
!   - Renommer cdf2ccc.ftn et ajouter la documentation automatique.
!  Bernard Dugas hiver 2007 :
!  - Enlever l'include de 'machtyp.h'.
!  - Le montagnes sont lues dans l'unite I/O phis_unit.
!  - Les appels a jclpnt, vers_netcdf sont modifies. Les unites I/O associees
!    aux latitudes et longitudes 2D sont passees dans l'appel a vers _cccma.
!  - Une nouvelle routines PROGRAM_VERSION est ajoutee
!  Bernard Dugas mai 2007 : Utiliser jclpnt pour lire les arguments et ouvrir les fichiers
!  Anne Frigon aout 2006 : Ajoute impression de version (de cdf2ccc.h) au format 6009
!  Guy Bergeron avril 2004 : introduction de machtyp.h 
!     
!*****netCDF :

      integer status
      integer ncid

!*****CCCma :

      integer funit,phis_unit,lat_unit,lon_unit, nf
      data    funit,phis_unit,lat_unit,lon_unit /87,88,89,90/

      logical OK
      integer nargs
      character(8) argument
      real(8) RVALUE,REPSIL

      CHARACTER NOMPRG*256
      COMMON   /PROGNAM/ NOMPRG

      logical,      EXTERNAL :: SETIO64
      character(4), EXTERNAL :: GETYP

!-----------------------------------------------------------------------
      NOMPRG='cdf2ccc.F90' ! Pour QQQDOC (-help)

!**   Verifier la presence de "-version" comme premier argument

      argument = ' ' ; nargs = command_argument_count()

      if (nargs > 0) then
         Call get_command_argument( 1,argument )
         if (argument /= ' ') then
            call low2up( argument,argument )
            if (argument == '-VERSION') then
               if (nargs > 1) then
                  CALL get_command_argument( 2,argument )
                  CALL LOW2UP( argument,argument )
                  if (argument == 'ALL' &
                 .or. argument == 'DAT' &
                 .or. argument == 'REV') then
                     call program_version( argument )
                  endif
               else
                  call PROGRAM_VERSION('ALL')
               endif
               call qqexit( 0 )
            endif
         endif
      endif

      call initialise

      attunit = 91

!101  Lire les parametres d'entrees :
!102  Ouverture du fichier CCCma et definition de machine et intsize :

      nf = 5
      call jclpnt( nf, funit,phis_unit,-attunit,lat_unit,lon_unit )

      rewind(attunit)

      ccc_pktyp = GETYP( funit )

      
!**    setup for 64-bit I/O

      ok = setio64(.true.)

!     Valeurs manquantes definies avec "-mvalue" ?

      if (.not.(miss_ccc_def .or. fill_ccc_def)) then
         call MISPAR( ok,RVALUE,REPSIL )
         if (ok) then
            fill_ccc_def = .true.
            fill_ccc     = RVALUE
            fill_toler   = ABS( RVALUE*REPSIL )
         endif
      endif

!200  Le traitement :     

      if (direction .eq. 'netcdf') then         ! traduction vers netCDF

         write(6,6002)trim(direction),trim(cccma_file),trim(netcdf_file)
         call vers_netcdf2( ncid,funit,phis_unit ) 

      else if (direction .eq. 'cccma'    .or. &
               direction .eq. 'rpncmc' ) then     ! traduction de netCDF

         write(6,6002)trim(direction),trim(netcdf_file),trim(cccma_file)
         call vers_cccma2( ncid,funit,lat_unit,lon_unit ) 

      else
         write(6,6001) trim( direction )
      endif

!300  Fermeture de fichiers netCDF et CCCma :

      status = nf_close(ncid)        
      call handle_err2(status,cdf2_mode)

      call xit( cdf2_mode, 0 )

      stop
!-----------------------------------------------------------------------
 6001 format(/' PROBLEME : mauvaise valeur pour direction = ',a/) 
 6002 format(/' TRADUCTION VERS : ',a//x,a,' -> ',a)
!-----------------------------------------------------------------------
      end program cdf2ccc

      SUBROUTINE PROGRAM_VERSION ( mode )

#include "r.diag_build_info.h"

      IMPLICIT      none

      CHARACTER*(*) mode

!**    Auteur: B.Dugas - RPN, le 27 avril 2007

!**    Objet: Imprimer de l'information sur la version courante.

      include 'cdf2ccc.h'

      CHARACTER(len=3)  AMODE
      character(len=80) RVERSION

      EXTERNAL          RMNLIB_version
!---------------------------------------------------------------------

!     Identification de la version

      version = CDF_VERSION
      vdate   = BUILD_TIMESTAMP

      AMODE = mode
      CALL LOW2UP( AMODE,AMODE )

      CALL RMNLIB_version( RVERSION, .false.)

      IF (AMODE.EQ.'REV')                                      THEN

          write(6,'(A)') version
          stop

      ELSE IF (AMODE.EQ.'DAT')                                 THEN

          write(6,'(A)') 'Date '// vdate
          stop

      ELSE IF (AMODE.EQ.'ALL' .OR.AMODE.EQ.'OUI')              THEN

          write(6,6000) cdf2_mode, &
                        trim( version ) // ' ' // trim( vdate ), &
                        trim( RVERSION )

      END IF

      RETURN

!---------------------------------------------------------------------
 6000 format(/' The current ',A,' version is : ',A/ &
              ' And it is linked with ',A/)

      END SUBROUTINE PROGRAM_VERSION
#     endif
