
      subroutine initialise

      implicit none

      include 'cdf2ccc.h'
      include 'infomem.h'

******
*
* AUTEUR Guy Bergeron    Juin 2003
*      
*     initialisation par defaut de certaines variables.
*
* REVISIONS
*
*  Bernard Dugas juin 2012 :
*  - infvar(:)%name = '&!@#' et infvar(:)%len(:) = 0
*  Bernard Dugas mai 2012 :
*  - Initialiser time_bnds_L a .false.
*  Bernard Dugas juillet 2007 :
*  - Enlever l'include de machtyp.h (c'est fait dans jclpnt)
*  - Initialiser infvar(i)%range(1:2) a +vlarge et -vlarge
*
******
      integer i,j,idummy

*-----------------------------------------------------------------------
      nvars=0
      ncoord=0
      ndims=0
*
      lon='lon'                    ! nom de la variable longitude
      lat='lat'                    ! nom de la variable latitude
*
*                                  ! Info sur les variables staggered
      do i=1,max_vars
         infvar(i)%name = '&!@#'   
         infvar(i)%ndim = 1        
         do j=1,max_dims           
            infvar(i)%len(j) = 0   
         enddo
         infvar(i)%range(1)=vlarge
         infvar(i)%range(2)=-vlarge
         infvar(i)%var_ok = .false.
      enddo
*
      project%name="gaussian"   
      project%len = 1
      project%nampar(project%len)='nhem'
      project%value(project%len)=float(0) ! representation globale (defaut)
*-----------------------------------------------------------------------

      end
      block data initialise_data

      include 'cdf2ccc.h'

      data spec   /.false./            
      data chklvl /.false./
      data time_bnds_L /.false./

      end block data initialise_data
