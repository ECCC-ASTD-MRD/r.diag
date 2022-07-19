
      subroutine valide_range(id,valide,scale,offset)

      implicit none
      

      include 'netcdf.inc'
      include 'cdf2ccc.h'
      include 'infomem.h' 

      integer i,id
      integer*2 valide(max_len)

      real*8 scale,offset

******
*
*AUTEUR Guy Bergeron             avril 2004
*
*     Evalue les valeurs de valide_range a partir de unpacked_valide_range
*     et de scale (scale_factor) et offset (add_offset).
*
*REVISIONS
*
*     Bernard Dugas fevrier 2009 :
*     - Ajouter le support des donnees de type nf_byte
*
*     Bernard Dugas avril 2008 :
*     - Arguments scale,offset sont declares "real*8"
*     
******

*-----------------------------------------------------------------------

      do i=1,attr(id)%len

         if(attr(id)%type.eq.nf_double) 
     .                  valide(i)=int((attr(id)%dvalue(i)-offset)/scale)


         if(attr(id)%type.eq.nf_float) 
     .                  valide(i)=int((attr(id)%rvalue(i)-offset)/scale)


         if(attr(id)%type.eq.nf_short) 
     .                 valide(i)=int((attr(id)%i2value(i)-offset)/scale)


         if(attr(id)%type.eq.nf_byte) 
     .                 valide(i)=int((attr(id)%i1value(i)-offset)/scale)

      enddo
*-----------------------------------------------------------------------
      end
