
      subroutine put_attribut(NCID,VARID,NBR)

      implicit none

      include 'netcdf.inc'
      include 'cdf2ccc.h'
      include 'workmem.h'

      integer ncid,varid,nbr

******
*
*AUTEUR Guy Bergeron         juin 2003
*
*     Ecrir les "nbr" attributs de la varibale "varid", en fonction de 
*     leur type, dans le fichier netCDF.
*
*     -------------------------------------------------------
*     |       |                      |             |        |
*     | XTYPE | netCDF/CDL Data Type | FORTRAN     |  Bits  |
*     |       |                      |             |        |
*     |-------|----------------------|-------------|--------|
*     |       |                      |             |        |
*     |   1   |  byte                | integer*1   |   8    |
*     |       |                      |             |        |
*     |   2   |  char                | character   |   8    |
*     |       |                      |             |        |
*     |   3   |  short               | integer*2   |   16   |
*     |       |                      |             |        |
*     |   4   |  int                 | integer     |   32   |
*     |       |                      |             |        |
*     |   5   |  float               | real*4      |   32   |
*     |       |                      |             |        |
*     |   6   |  double              | real*8      |   64   |
*     |       |                      |             |        |
*     -------------------------------------------------------
*
*REVISIONS
*
*     Bernard Dugas        janvier 2017
*     Ajouter le support des donnees de type nf_int
*
*     Bernard Dugas        fevrier 2009
*     Ajouter le support des donnees de type nf_byte
*
*     Bernard Dugas        mai 2008
*     Traiter le cas attr(:)%type = nf_double
*
******

      integer status,n,nlen
      character*80 dummy
*-----------------------------------------------------------------------
      
      do n=1,nbr

         if (attr(n)%type.eq.nf_char)then          ! character
                                                                        ! definir la
            call def_name(attr(n)%name,len(attr(n)%name),'',dummy,nlen) ! longueur 
                                                                        ! de name
            status=nf_put_att_text(ncid,varid,attr(n)%name(1:nlen),
     .                                       attr(n)%len,attr(n)%cvalue)

         else if (attr(n)%type.eq.nf_byte)then     ! integer*1

            status=nf_put_att_int1(ncid,varid,attr(n)%name,attr(n)%type,
     .                                      attr(n)%len,attr(n)%i1value)

         else if (attr(n)%type.eq.nf_short)then    ! integer*2

            status=nf_put_att_int2(ncid,varid,attr(n)%name,attr(n)%type,
     .                                      attr(n)%len,attr(n)%i2value)

         else if (attr(n)%type.eq.nf_int)then    ! integer*4

            status=nf_put_att_int(ncid,varid,attr(n)%name,attr(n)%type,
     .                                      attr(n)%len,attr(n)%ivalue)

         else if (attr(n)%type.eq.nf_float)then    ! real*4

            status=nf_put_att_real(ncid,varid,attr(n)%name,attr(n)%type,
     .                                       attr(n)%len,attr(n)%rvalue)

         else if (attr(n)%type.eq.nf_double)then   ! real*8

            status=nf_put_att_double(ncid,varid,attr(n)%name,
     .                                          attr(n)%type,
     .                                          attr(n)%len,
     .                                          attr(n)%dvalue)
         endif
         call handle_err2(status,'put_attribut')
         
      enddo

*-----------------------------------------------------------------------
      end
