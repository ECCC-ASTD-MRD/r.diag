
      subroutine get_string (string,ni,delim,name,nlen)

      implicit none

      integer  ni,nlen
      character*(*) name,string,delim

******
*
*AUTEUR Guy Bergeron   juin 2003
*
*     Extrait la chaine de caractere precedant le delimiteur "delim"
*     et determine ca longueur. Nous eliminons les blanc au debut de 
*     la chaine.
*
******
      
      integer i,niout
      character*1 check

*-----------------------------------------------------------------------
      name= '' ; niout=len(name) ; check =' '

      nlen=0

      do i=1,min(ni,niout)
         if (string(i:i) .ne. delim) then
            if (check.ne.string(i:i)) then
               check=delim
               nlen=nlen+1
               name(nlen:nlen)=string(i:i)
            end if
         else
            return
         endif
      enddo
*-----------------------------------------------------------------------
      end

