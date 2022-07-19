
      subroutine init_dim

      implicit none

      include 'cdf2ccc.h'
      include 'dimmem.h'
      include 'infomem.h'

******
*
* AUTEUR Guy Bergeron    Juin 2003
*      
*     initialisation par defaut de certaines variables.
*
* REVISIONS
*
*  Bernard Dugas Aout 2018 :
*   Ne plus initialiser les variables project%nampar(project%len) et
*   project%value(project%len) que si project%name = 'unknown'     
*
*  Bernard Dugas Octobre 2007 :
*   Initialiser coord(xid)%dimid(1)et coord(yid)%dimid(1) a -1
*
******

      integer i,tdid
*-----------------------------------------------------------------------
*
      do i=1,maxdim
         dim(i)%name='xxx'              ! noms de la dimension 
         dim(i)%len=0                   ! longueur de la dimension
         dim(i)%duplic=0                ! repetition en bout de ligne
      enddo

      tid=maxdim-3
      xid=maxdim-2
      yid=maxdim-1
      zid=maxdim                        

      coord(tid)%dimid(1)= -1
      coord(zid)%dimid(1)= -1
      coord(xid)%dimid(1)= -1
      coord(yid)%dimid(1)= -1

      if (project%name == 'unknown') then
         project%nampar(project%len)='nhem'
         project%value(project%len)=float(0) ! representation globale (defaut)
      endif

*-----------------------------------------------------------------------
      end
