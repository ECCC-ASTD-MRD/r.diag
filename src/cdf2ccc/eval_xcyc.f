
      subroutine eval_xcyc(NI,NJ)

      implicit none

      include 'cdf2ccc.h'
      include 'infomem.h'
      include 'varmem.h'

      integer ni,nj

******
*
* AUTEUR Guy Bergeron   juin 2003
*
*     Evalue les valeurs des coordonnees x(ni) et y(nj) de la projection 
*     definie par project%name (grid_desc) et les descripteurs de grille.
*
* REVISIONS
*
* A. Frigon juin 2006 : 
*   Corrige commentaire d60 "vrais a 60N" par "vrais a 60 deg de l'hemisphere nhem"
*   car vers netcdf tout est general pour PS nord/sud 
*   selon IBUF(7) lu et assigne a nhem
*   dans def_dim_coord.f
*
******

      integer i
      real    is,js       !staggered

      real    d60  ! valeur de dx vrais a 60 deg de l'hemisphere nhem
      integer nis  ! nbre de points en X grille de type f
      integer njs  ! nbre de points en Y grille de type f
*
*-----------------------------------------------------------------------
      do i=1,project%len
         if(project%nampar(i).eq.'nis' )nis =project%value(i)
         if(project%nampar(i).eq.'njs' )njs =project%value(i)
         if(project%nampar(i).eq.'d60' )d60 =project%value(i)
      enddo
*
      is=(nis-ni)*0.5
      js=(njs-nj)*0.5

      do  i=1,ni
         dcoordonne(i,xid)=(i-1+is)*d60
      end do
*     
      do i=1,nj
         dcoordonne(nj-i+1,yid)=(i-1+js)*d60    !inversion des y!!!
c         dcoordonne(i,yid)=(i-1+js)*d60
      end do

*-----------------------------------------------------------------------
      end
