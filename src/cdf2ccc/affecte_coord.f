
      subroutine affecte_coord(nd,id,TYPE,NDIM,DIMIDS,NAME)

      implicit none

      include 'cdf2ccc.h'
      include 'infomem.h'

      integer nd,id,type,ndim,dimids(ndim)
      character*(*) name

******
*
*AUTEUR Guy Bergeron    juin 2003
*
*     Affecte les informations relatives au type derive coord(i)
*
******

      integer i
*-----------------------------------------------------------------------
      nd=nd+1   
      id=nd
      coord(id)%name = name
      coord(id)%type = type
      coord(id)%ndim = ndim
      do i=1,ndim
         coord(id)%dimid(i)= dimids(i)
      enddo
*-----------------------------------------------------------------------
      end
