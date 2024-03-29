
      subroutine combline6( VALUE,gg,INDICE,K,NI,NJ,NK,SCALE,OFFSET,
     .                      MULT,ADD,FILL_OK,FILL_CDF,INVJJ,LASLON,
     .                      FILL_ALL,FILL_CDF_NAN, DSIZE )

      implicit none
      
      include 'cdf2ccc.h'
      
      integer indice,k,ni,nj,nk,laslon,dsize

      logical fill_ok,invjj,fill_all,fill_cdf_nan
      real*8  scale,offset,mult,add,fill_cdf
      real*8  value(ni*nj*nk)
      real*8  gg(ni*nj)

******
*
* AUTEUR Guy Bergeron   juin 2003
*
*     Effectue la combinaison lineaire suivante :
*
*                gg=(scale*val + offset)*mult + add
*
*         scale   : "scale_factor" utilises dans l'algorythme de compression
*         offset  : "add_offset" utilises dans l'algorythme de compression
*
*         mult    : facteur multiplicatif changement d'unites
*         add     : facteur additif changement d'unites
*
*         fill_ok : variable logique pour le remplacement de fill_cdf
*         fill_cdf: Valeur de remplacement dans le fichier netcdf
*
*         invjj   : inverse l'ordre de l'indice "j" dans le vecteur de sortie.
*
* REVISIONS
*
* B.Dugas mars '15 :
* - Ajouter l'argument DSIZE qui sera utilise dans le calcul de fill_cdf_toler.
*   Ce dernier depends maintenant de la valeurs de fill_cdf et de taille native
*   des donnees NEtCDF
* B.Dugas fev '14 :
* - Tenir compte du cas ou FILL_CDF est un NaN
* B.Dugas juin '13 :
* - Introduire une valeur de tolerance pour les valeurs manquantes
* - Enlever toutes references au mode missing_value et donc ...
* - Renommer a combline4 suite aux modifications de la sequence d'appel
* B. Dugas: mai 2012
* - Renommer a combline3 et ajouter les arguments MISS_ALL et
*   FILL_ALL qui indiquent respectivement au retour que le
*   champs courant a ete completer manque ou rempli
* B. Dugas: mai 2007
* - Ajouter l'argument laslon pour ajouter(+1) ou enlever (-1) une longitude
* - A cause du changement precedent on change le nom a combline2
* - Utiliser des "tolerances" pour les valeurs "miss_cdf" et "fill_cdf"
* - La fonction def_ijk est mise "inline"
* G. Bergeron: aout 2005
*       - Reorganisation des arguments d'appels
*       - Reintroduction des variables logiques en argument d'appel.
* A. Frigon: avril 2005
*     Elimine logical miss_ccc_def,fill_ccc_def car deja presents dans 
*     cdf2ccc.h
* C. Desrochers: mars 2005
*     Ajout de la possibilite de remplacer les valeurs de remplissage
* A. Frigon:  octobre 2003
*     Ajout de la possibilite de remplacer les valeurs manquantes
*
******

      real(8) fill_hold,fill_cdf_toler
      integer i,j,jmin,jmax,jstep,ijk,def_ijk,nif, fill_count

      def_ijk(i,j,k,ni,nj)=nj*ni*(k-1)+ni*(j-1)+i

      logical , external :: idnan
*-----------------------------------------------------------------------

      fill_count=0 ; fill_all=.false.

      if (fill_ok .and. .not.fill_cdf_nan) then
         fill_hold=fill_cdf
         if (fill_cdf == 0.0_8) fill_hold=1.0
         if      (dsize == -8)  then
            fill_cdf_toler=abs( fill_hold ) / 256._8      ! /2**8
         else if (dsize == -16) then
            fill_cdf_toler=abs( fill_hold ) / 65536._8    ! /2**16
         else if (dsize == -32 .or. dsize == -64) then
            fill_cdf_toler=abs( fill_hold ) / 8388608._8  ! /2**23
         else
            fill_cdf_toler=abs( fill_hold ) * 0.00001
         endif
      endif

      if (invjj) then
         jmin=nj
         jmax=1
         jstep=-1
      else
         jmin=1
         jmax=nj
         jstep=1
      end if

                        nif=ni
      if (laslon.eq.-1) nif=ni-1

      do j=jmin,jmax,jstep
         do i=1,nif

            indice=indice+1
            ijk=def_ijk(i,j,k,ni,nj)

            if (fill_ok .and. fill_cdf_nan) then

               if (idnan( value(ijk),.true. )) then
                  gg(indice)=fill_ccc
                  fill_ccc_oui=.true.
                  fill_count=fill_count+1
               else
                  gg(indice)=(scale*value(ijk)+offset)*mult + add
               endif

            else

               gg(indice)=(scale*value(ijk)+offset)*mult + add 

               if (fill_ok) then
                  fill_hold = abs( value(ijk) - fill_cdf )
                  if (fill_hold < fill_cdf_toler) then
                     gg(indice)=fill_ccc  
                     fill_ccc_oui=.true.
                     fill_count=fill_count+1
                  endif
               endif

            endif

         enddo

         if (laslon.eq.+1) then
            indice=indice+1
            gg(indice)=gg(indice-ni)
         endif

      enddo                     

      if (fill_count == nif*nj) fill_all=.true.

      return
*-----------------------------------------------------------------------

      end
