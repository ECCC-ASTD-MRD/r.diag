
      subroutine define_list(NCID,nvar)

      implicit none

      include 'netcdf.inc'
      include 'cdf2ccc.h'
      include 'infomem.h'

      integer ncid,nvar

******
*
*AUTEUR: Guy Bergeron         juin 2003
*
*     Definir la liste des variables contenuent dans le fichier netCDF ncid.
*
******

******netCDF

      integer status,id

*-----------------------------------------------------------------------

      nlist=nvar

      do id=1,nlist
         status = nf_inq_var(NCID,ID,list(id)%name,list(id)%type,   
     .                                             list(id)%ndim,   
     .                                             list(id)%dimid,  
     .                                             list(id)%nattr)  
         call handle_err2(status,'define_list')
         list(id)%var_ok=.true.
      enddo
*-----------------------------------------------------------------------
      end
