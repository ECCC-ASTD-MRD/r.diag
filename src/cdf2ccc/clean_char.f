
      subroutine clean_char(string,chaine,nlen)

      implicit none

      integer nlen
      character*(*) string,chaine

******
*
*AUTEUR Guy Bergeron             avril 2004
*
*     Elimine le caractere special '\n' d'une chaine de caracteres 
*
*Revisions
*
*  Bernard Dugas mars 2008 : Enlever les char(0) "nul" en fin de chaine
*
******     

      integer   niin,niout,newline,ib
      character(len=1024) dummy

      data newline /10/
*-----------------------------------------------------------------------

      
      niin=len_trim(string) ; niout=len(chaine)
      call get_string(string,niin,achar(newline),dummy,nlen)
      nlen=min(nlen,niout) ; chaine=dummy(1:nlen)
      do ib=1,nlen
         if (chaine(ib:ib).eq.achar(0)) then
            nlen=ib-1
            exit
         endif
      enddo
      chaine = chaine(1:nlen)

*-----------------------------------------------------------------------
      end
            
