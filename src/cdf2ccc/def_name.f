
      subroutine def_name (string,ni,delim,name,nlen)

******
*
* AUTEUR Guy Bergeron   juin 2003
*
*     Extrait la chaine de caractere precedant le delimiteur "delim"
*     et determine sa longueur. Nous eliminons tout les blancs contenuent
*     dans la chaine sauf si celle-ci commence par des appostrophes ou
*     des guillemets
*            
* REVISIONS
*
*     B. Dugas, ete 2007 :
*     - Ajouter le point d'entree def_name2 afin de
*       tenir compte des guillemets simples et doubles
*
******

      integer       nlen,long,iga
      character*(*) name,string,delim
      character     ga

*-----------------------------------------------------------------------
      name=''
      nlen=0

      do i=1,ni
         if (string(i:i) .ne. ' ') then
            if (string(i:i) .ne. delim) then
               nlen=nlen+1
               name(nlen:nlen)=string(i:i)
            else
               return
            endif
         endif
      enddo

      return
*-----------------------------------------------------------------------

      entry def_name2 (string,ni,name,nlen)

                              ga=" "
      if (string(1:1).eq.'"') ga='"'
      if (string(1:1).eq."'") ga="'"

      long=len_trim( string )

      if (ga.ne.' ') then

         iga=index( string(2:long),ga )

         if (iga.eq.long-1) then
            name=string(2:long-1)
            nlen=long-2
         else
            call xit('def_name',-1 )
         endif

      else

         name=string(1:long)
         nlen=long

      endif

      return

*-----------------------------------------------------------------------
      end



