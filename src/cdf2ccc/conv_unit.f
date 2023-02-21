
*-----------------------------------------------------------------------
      subroutine conv_unit(dvalue,mult,add,ni)

      implicit none
      

      include 'netcdf.inc'
      include 'cdf2ccc.h'
      include 'infomem.h' 

      integer i,ni
      real*8 mult,add
      real*8 dvalue(ni)

******
*
*AUTEUR Guy Bergeron             avril 2004
*
*     Effectue la conversion d'unite cccma->netcdf d'une variable.
* 
*REVISIONS
*
*     Bernard Dugas, avril 2008 : On travaille maintenant en "real*8".
*     
******

*-----------------------------------------------------------------------

      do i=1,ni
         dvalue(i)=(dvalue(i)-add)/mult
      enddo

*-----------------------------------------------------------------------
      end
