
      subroutine vers_netcdf2 (ncid,FUNIT,PHIS_UNIT)

      implicit none

      include 'netcdf.inc'
      include 'cdf2ccc.h'
      include 'workmem.h'
      include 'dimmem.h'
      include 'infomem.h'
      include 'varmem.h'     
      include 'specmem.h'
      include 'ibufmem.h'
      include 'ztypmem.h'

      integer funit,phis_unit
      integer ncid

!*****
!
!AUTEUR Guy Bergeron         juin 2003
!
!     Traduction : CCCma -> netCDF 
!
!REVISIONS
!
!  Bernard Dugas mai 2017 : 
!  - Convertir en fichier .F90 pour traiter
!    le macro taille_entete avec s.f90
!  Bernard Dugas juillet 2012 :
!  - Enlever l'appel a GETSIZ3, non requis
!    depuis les denieres modifs a INQ_FILE
!  Bernard Dugas mai 2012 :
!  - Introduit le support de 'time_bnds'
!  Bernard Dugas novembre 2009 :
!  - Correction pour max1d > maxlen, donc
!    petites grilles et beaucoup d'echantillons
!  Bernard Dugas hiver 2007 :
!  - Enlever l'include de 'machtyp.h'.
!  - Nouvel argument phis_unit_unit passe aux routines inq_file
!    et define_netcdf, et correspondant a l'unite I/O contenant
!    le champs de montagnes. En consequence de quoi, le nom
!    de la routine devient vers_netcdf2
!  - Corrections aux calculs de maxvar, notamment pour
!    la coordonnee Gal-Chen
!  - On n'utilise plus main_memory.h
!  - Allocation de memoire avec allocate/deallocate
!  - Allouer la memoire pour les grilles tournees
!  - Initialiser ibuf a zero au depart
!  - Verifier la structure 
!  Guy Bergeron avril 2004 : introduction de machtyp.h 
!
!*****

      integer, parameter :: head = taille_entete

!*****netCDF

      integer status,id,varid,lonid,latid,lonvid,latvid

!*****CCCma

      integer i,n,itime,dumm1,dumm2,dumm3
      integer nvar,ndim,ni,nj,nk,ntime

      integer  ier,ilen,inwds,ipack,ilev,ivar

      logical conv
!-----------------------------------------------------------------------
!     Definir nvars et ndims:

      call inq_file2( funit,phis_unit, maxvar,maxdim,maxlen, &
                                       max1d,maxlev,maxtime )

      maxvar=maxvar+maxdim+1 ! + variables de coordonnee   "Global Attributs"

      if (project%name.eq.'polar_stereographic' .or.    &
          project%name.eq.'rotated_pole'        .or.    &
          project%name.eq.'rotated_latitude_longitude') &
          maxvar=maxvar+3 ! + 2 coord. auxil. + grid mapping

      if (level_desc.eq.'Gal-Chen Levels') then
         maxdim=maxdim+1        ! + dimension top
         maxvar=maxvar+3        ! + eta+tau+htoit
      end if

      if (time_bnds_L) then
         maxdim=maxdim+1        ! + bnds
         maxvar=maxvar+1        ! + time_bnds
      endif

      maxlen = max( max1d,maxlen )

!     Allocation memoire :

      allocate( dim  (maxdim) , coord(maxdim) , &
                var  (maxvar) , list (maxvar+1) )

!
      allocate ( variable   (  maxlen,maxvar ) , &
                 dcoordonne (  max1d ,maxdim ) , &
                 time_bnds  (  2     ,max1d  ) )
!
      allocate ( ibuf       (  maxpk+head ), &
                 i1val      (  maxlen ) , &
                 i2val      (  maxlen ) , &
                 ival       (  maxlen ) , &
                 dval       (  maxlen ) , &
                 rtime      (  maxlen ) , &
                 rval       (  maxlen ) )
!
      allocate ( add_offset (  maxlev*maxtime ) , &
                 scale_fact (  maxlev*maxtime ) , &
                 mean       (2*maxlev*maxtime ) )


!     Initialisation de dim(id) et coord(zid)

      call init_dim

!     Creation du fichier netCDF et mode "define":

      call define_netcdf2( ncid,funit,phis_unit,ibuf )

!     Definir la liste du fichier

      status=nf_inq(ncid,dumm1,nlist,dumm2,dumm3)
      call handle_err2(status,'vers_netcdf2')

      call define_list(ncid,nlist)   

!     Ecrir le fichier de sortie

      call wrfile(ncid,funit)

!     Relacher la memoire

      deallocate( add_offset,scale_fact,mean,            &
                  ibuf,i1val,i2val,ival,dval,rtime,rval, &
                  list,var,coord,dim )

      if (associated ( alon )) &
          deallocate( alon,alat,lonr,latr )

      return
!-----------------------------------------------------------------------

      end
