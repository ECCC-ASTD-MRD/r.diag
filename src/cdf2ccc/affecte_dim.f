
      subroutine affecte_dim(nd,dimid,LEN,NAME)

      implicit none

      include 'cdf2ccc.h'
      include 'dimmem.h'

      integer nd,dimid,len
      character*(*) name

******
*
*AUTEUR Guy Bergeron    juin 2003
*
*     Affecte les valeurs au type derive dim(id)
*
******
*-----------------------------------------------------------------------
      nd=nd+1   
      dimid=nd
      dim(dimid)%name=name
      dim(dimid)%len = len
*-----------------------------------------------------------------------
      end
