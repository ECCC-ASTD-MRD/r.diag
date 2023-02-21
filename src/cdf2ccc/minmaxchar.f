
      subroutine minmaxchar (IN,out,NCHAR)
      
      implicit none

      integer NCHAR
      character*(*) IN,out

******
*
*AUTEUR Guy Bergeron    juin 2003
*
*     Realise la conversion minuscule majuscule ou vice versa
*
*
* REVISIONS:
*
* G. Bergeron  juin 2005
*     Generalisation a tout caracteres alphanumerique.
*
* Anne Frigon Juillet 2004 : 
*    Ajoute lettres w et W manquantes dans data lower et upper...
*
******

      integer i

*-----------------------------------------------------------------------
      do i=1,nchar

         if(ichar(in(i:i)).ge.97.and.ichar(in(i:i)).le.122) then
            out(i:i)= char(ichar(in(i:i))-32)
         elseif(ichar(in(i:i)).ge.65.and.ichar(in(i:i)).le.90) then
            out(i:i)= char(ichar(in(i:i))+32)
         else
            out(i:i)=in(i:i)
         endif

      enddo
*-----------------------------------------------------------------------
      end


