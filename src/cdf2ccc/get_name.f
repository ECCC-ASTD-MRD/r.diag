
      subroutine get_name(attunit,LENAME,vname,cccname,mult,add,ok)

      implicit none
      
      integer       attunit
      character*(*) LENAME,vname,cccname
      real*8        mult,add
      logical       ok(2)

******
*
*AUTEUR Guy Bergeron   juin 2003
*
*     Extrait vname, cccname et mult d'une chaine de caractere debutant 
*     par "def_attribut".
*     
* NOTA: La variable ok:
*
*     ok(1) : .true.  si "lename" a ete trouvee, .false. si non
*     ok(2) : .false. si il y a un "]" sur la ligne (i.e. fin de l'info)
*
*
*REVISIONS
*
*     Bernard Dugas,  avril 2008 :
*     Les arguments mult,add sont maintenant declares en format "real*8"
*
******

      integer  i,n,ncdf,nccc,ni,nt,nlen,mlen
      character*128 string, dummy
      character*80  cname
      character*1   delim

*-----------------------------------------------------------------------
      mult=1.0
      add=0.0

      do i=1,2
         ok(i)=.false.
      enddo
    
 100  read(attunit,1002,end=901)string

      nt=len(string)
      delim='['
      call def_name (string,nt,delim,dummy,nlen)
      mlen=index(string,delim)
      ni=nt-mlen
      mlen=mlen+1

      if (dummy(1:nlen).eq.'def_attribut') then

         delim=';'
         call def_name(string(mlen:nt),ni,delim,vname,ncdf)

         mlen=index(string,delim)
         ni=nt-mlen
         mlen=mlen+1

         call def_name(string(mlen:nt),ni,delim,cname,nccc)


         if (vname.eq.lename.or.lename.eq.cname) then

            cccname=cname
            call justifie_droite(cccname)
            
            string=string(mlen:nt)      
            mlen=index(string,delim)
            ni=nt-mlen
            mlen=mlen+1
            call def_name(string(mlen:nt),ni,delim,dummy,nlen)
            if(nlen.ne.0 .and. dummy(1:nlen).ne.']') then
               dummy=dummy(1:nlen)
               read (dummy,1005)mult
            endif

            string=string(mlen:nt)      
            mlen=index(string,delim)
            ni=nt-mlen
            mlen=mlen+1
            call def_name(string(mlen:nt),ni,delim,dummy,nlen)
            if(nlen.ne.0 .and. dummy(1:nlen).ne.']') then
               dummy=dummy(1:nlen)
               read (dummy,1005)add
            endif

            ok(1)=.true.                        ! J'ai trouve
            if (index(string,']').eq.0) then
               ok(2)=.true.                     ! Il y a encore de l'info.
            else
               rewind(attunit)
            endif
            return

         endif

      endif

      goto 100
 901  continue
*-----------------------------------------------------------------------
 1002 format(a)
 1005 format(e12.5)
*-----------------------------------------------------------------------
      end
*******


