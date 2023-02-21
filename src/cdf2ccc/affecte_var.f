
      subroutine affecte_var(ID,NAME,TYPE,NDIM,DIMIDS,NATTS)

      implicit none

      include 'cdf2ccc.h'
      include 'infomem.h' 
      
      integer id,type,ndim,dimids(ndim),natts
      character*(*) name

******
*
*AUTEUR Guy Bergeron     juillet 2003
*
*     Definir la variable var(id)%
*
******

      integer i,len
      

*-----------------------------------------------------------------------

      var(id)%name=name
      var(id)%type=type
      var(id)%ndim=ndim
      do i=1,ndim
         var(id)%dimid(i)=dimids(i)
      enddo
      var(id)%nattr=natts

*-----------------------------------------------------------------------
      end
