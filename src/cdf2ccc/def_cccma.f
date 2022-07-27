
      subroutine def_cccma(NAME,mult,add,cccname,bad)

      implicit none

      include 'cdf2ccc.h'
 
      character*80 name
      character*4 string,cccname
      real*8      mult,add
      real        bad

******
*
*AUTEUR Guy Bergeron    juin 2003
*
*
*     Definir le nom CCCma (cccname) et les facteurs de conversion des unites 
*     (mult et add)a partir du fichier attr_file.
*     
*     NCEP reanalyses-1 utilisent exactement 9.8 comme valeur de gravite
*     REF http:dss.ucar.edu/pub/reanalysis/FAQ.html
*
*REVISIONS
*
*     Bernard Dugas fevrier 2009 :
*     - Utiliser les formats 1002/1003 pour le mode cdf2rpn
*     Bernard Dugas avril 2008 :
*     - Arguments mult,add sont declares "real*8"
*     Bernard Dugas mai 2007 :
*     - La variable cccname est maintenant declaree comme etant une chaine de caracteres
*     - Rembobinner attunit une fois et re-essayer si on ne trouve pas ce qu'on cherche
*     Anne Frigon Mars 2005 : Elimine assignation miss_ccc maintenant dans vers_cccma.f
*     Anne Frigon Oct 2003 : Ajoute impressions a l'ecran pour conversions
*
******

      integer nt,nlen,nblen,nbr
      character*80 dummy
      logical ok(2)
*-----------------------------------------------------------------------

      nbr=0
      bad=-99.0

      rewind( attunit )

*     Prendre l'information pertinante dans attr_file

 100  call get_name(attunit,name,dummy,string,mult,add,ok)

      if (.not.ok(1)) call minmaxchar(NAME,string,4)   !defaut netCDF name est utilise

      call justifie_droite(string)
      cccname = string

      if (spec) then             !Ne pas toucher aux coeff. spectaux
         mult=1.0
         add=0.0
      endif

      if (.not.ok(1)) then
         if (nbr.eq.0) then
            rewind attunit
            nbr=1
            goto 100
         endif
         if (cdf2_mode.eq.'cdf2rpn') then
            write(6,1002)trim(name),trim(attr_file),cccname,mult,add
         else
            write(6,1000)trim(name),trim(attr_file),cccname,mult,add
         endif
      else
         if (cdf2_mode.eq.'cdf2rpn') then
            write(6,1003)trim(name),trim(attr_file),cccname,mult,add
         else
            write(6,1001)trim(name),trim(attr_file),cccname,mult,add
         endif
      endif
*-----------------------------------------------------------------------
 1000 format(/,/,' WARNING ************',/,
     .         " CONVERSION D'UNITES PAR DEFAUT POUR : NAME = ",a,/,
     .         " CAR NON TROUVE DANS FICHIER D'ATTRIBUTS : ",a,/,
     .         '       cccname= --',a,'--',/,
     .         '        mult= ',1pe12.5,/,'         add= ',1pe12.5,/,
     .         ' WARNING ************',/)
 1001 format(/,/," CONVERSION D'UNITES POUR : NAME = ",a,/,
     .         " TROUVEE DANS FICHIER D'ATTRIBUTS : ",a,/,
     .         '       cccname= --',a,'--',/,
     .         '        mult= ',1pe12.5,/,'         add= ',1pe12.5,/)
 1002 format(/,/,' WARNING ************',/,
     .         " CONVERSION D'UNITES PAR DEFAUT POUR : NAME = ",a,/,
     .         " CAR NON TROUVE DANS FICHIER D'ATTRIBUTS : ",a,/,
     .         '       rpnname= --',a,'--',/,
     .         '        mult= ',1pe12.5,/,'         add= ',1pe12.5,/,
     .         ' WARNING ************',/)
 1003 format(/,/," CONVERSION D'UNITES POUR : NAME = ",a,/,
     .         " TROUVEE DANS FICHIER D'ATTRIBUTS : ",a,/,
     .         '       rpnname= --',a,'--',/,
     .         '        mult= ',1pe12.5,/,'         add= ',1pe12.5,/)
 9999 format(a4)
*-----------------------------------------------------------------------
      end


