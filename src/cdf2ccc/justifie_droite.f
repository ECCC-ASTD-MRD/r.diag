
      subroutine justifie_droite(cccname)

      implicit none

      character*(*) cccname

******
*
*AUTEUR Guy Bergeron         Juin 2005
*    
*     Justifie a droite une chaine de caractere cccname.
*
******

      integer i,nt,nlen,nblen,len
      
      character*128 xname
*-----------------------------------------------------------------------
      xname=cccname

      nt=len(cccname)        ! longueur totale de cccname
      nlen=nblen(xname)      ! nombre de caracteres dans xname

      do i=1,nt
         cccname(i:i)=' '
      enddo

      i=nt-nlen+1 
      cccname(i:nt)= xname(1:nlen)
*-----------------------------------------------------------------------
      return
      end
