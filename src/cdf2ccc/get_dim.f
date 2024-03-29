
      subroutine get_dim(NCID)

      implicit none

      include 'netcdf.inc'
      include 'cdf2ccc.h'
      include 'dimmem.h'
      
      integer ncid

******
*
*AUTEUR Guy Bergeron    Juin 2003
*    
*     Affecte les valeurs au type derive dim(i) a partir du fichier netCDF.
*
******

      integer status,dimid,len
      character*80 name

*-----------------------------------------------------------------------

      do dimid=1,ndims
         status = nf_inq_dim(NCID,DIMID,name,len) ! get dimname
         call handle_err2(status,'get_dim')
         if(name .eq. 'num_values') then 
            spec=.true.
            numdid=dimid
            invj=.false.           ! pas d'inversion  pour cas spec
         endif
         dim(dimid)%name=name                     ! nom de la dimension 
         dim(dimid)%len=len                       ! longueur de la dimension
      enddo
*-----------------------------------------------------------------------
      end
      subroutine test_dim ()

      implicit none

      include 'netcdf.inc'
      include 'cdf2ccc.h'
      include 'dimmem.h'
      include 'infomem.h'
      
* AUTEUR Bernard Dugas    Juin 2008
*     
*     tenter de definir les dimensions horizontale si 
*     la routine get_coord2 n'y est pas arrive. Les
*     noms des dimensions sont alors utilises
*
* REVISIONS
*
*  B.Dugas mai '19 :
*  - Ajouter 'number' comme nom reconnu de ka coordonnee
*    en Z. Ce nom est utilise dans les donnees CERA-20C,
*    et ce, en particulier pour la variable land-sea-mask
*  B.Dugas decembre '18 :
*  - Ajouter 'xc' et 'yc' comme noms reconnus des coordonnees
*    en X et Y, respectivement. Ce sont les noms produits par une
*    conversion prealable de champs polaire-stereographiques
*  - Ajouter la coordonnee 'soil_layers_stag' utilisee dans les
*    fichiers de re-analyses ASR, Arctic System Reanalysis, tout
*    comme 'west-east' et 'south-north', deja reconnus
*  - (t,x,y,z)coord sont compares avec les valeurs originales des
*    noms des coordonnees, et non pas leurs valeurs en minuscules
*  B.Dugas novembre '17 :
*  - Ajouter 'time_counter' a la liste des coordonnees temporelles reconnues
*  B.Dugas aout '12 :
*  - Ajouter 'height' a la liste des coordonnees verticale reconnues
*  B.Dugas juillet '12 :
*  - Tenir compte de unlimdimid dans la recherche des dimensions:
*    Seul le descripteur TID peut etre associe a cette dimension
*  B.Dugas mai '12 :
*  - Reconnaitre 'plev' comme nom possible la coordonne verticale
*  B.Dugas mars '10 :
*  - Reconnaitre 't' comme nom possible la coordonne temporelle.
*  B.Dugas mai '09 :
*  - Coordonnees NetCDF "[xyzt]coord" specifiees en arguments ?
*  B.Dugas oct '08 :
*  - Supporter la coordonnee verticale ayant pour nom "lev"
*
******
      integer dimid,nlen,tdid,ncc
      character(len=128) cfield,cfield2

*-----------------------------------------------------------------------

      if (coord(xid)%dimid(1).ne.-1 .and.
     .    coord(yid)%dimid(1).ne.-1 .and.
     .    coord(zid)%dimid(1).ne.-1 .and.
     .    coord(tid)%dimid(1).ne.-1) then

!        On a tout trouve

         return

      else

         ncc = ncoord

         do dimid=1,ndims

            call clean_char( dim(dimid)%name,cfield,nlen )
            call up2low( cfield, cfield2 )

!           Chercher coordonnee T (avec caracteristique unlimdimid)

            if (coord(tid)%dimid(1).eq.-1) then

               if((cfield2  == 'time'         .or. 
     .             cfield2  == 'time_counter' .or.
     .             cfield2  == 't'            .or.
     .             cfield   ==  tcoord)       .and.
     .             dimid    ==  unlimdimid)   then

                  ncc = ncc+1
                  tid = ncc

                  coord(tid)%ndim     = 1
                  coord(tid)%nattr    =-1
                  coord(tid)%dimid(1) = dimid

                  timedid             =     dimid
                  coord(tid)%name     = dim(dimid)%name

                  cycle

               endif

            endif

!           Chercher coordonnee X

            if (coord(xid)%dimid(1).eq.-1) then

               if((cfield2 == 'x'          .or.
     .             cfield2 == 'xc'         .or.
     .             cfield2 == 'x_2'        .or.
     .             cfield2 == 'lon'        .or.
     .             cfield2 == 'rlon'       .or.
     .             cfield2 == 'longitude'  .or. 
     .             cfield2 == 'west_east'  .or. 
     .             cfield  ==  xcoord    ) .and.
     .             dimid   /=  unlimdimid) then

                  ncc = ncc+1
                  xid = ncc

                  coord(xid)%ndim     = 1
                  coord(xid)%type     = nf_float
                  coord(xid)%nattr    =-1
                  coord(xid)%mult     = 1.0
                  coord(xid)%add      = 0.0
                  coord(xid)%dimid(1) = dimid

                  coord(xid)%name     = dim(dimid)%name
                  lon                 = cfield

                  cycle

               endif

            endif

!           Chercher coordonnee Y

            if (coord(yid)%dimid(1).eq.-1) then

               if((cfield2 == 'y'            .or.
     .             cfield2 == 'yc'           .or.
     .             cfield2 == 'y_2'          .or.
     .             cfield2 == 'lat'          .or.
     .             cfield2 == 'rlat'         .or.
     .             cfield2 == 'latitude'     .or. 
     .             cfield2 == 'south_north'  .or. 
     .             cfield  ==  ycoord      ) .and.
     .             dimid   /=  unlimdimid  ) then

                  ncc = ncc+1
                  yid = ncc

                  coord(yid)%ndim     = 1
                  coord(yid)%type     = nf_float
                  coord(yid)%nattr    =-1
                  coord(yid)%mult     = 1.0
                  coord(yid)%add      = 0.0
                  coord(yid)%dimid(1) = dimid

                  coord(yid)%name     = dim(dimid)%name
                  lat                 = cfield

                  cycle

               endif

            endif

!           Chercher coordonnee Z

            if (coord(zid)%dimid(1).eq.-1) then

               if((cfield2 == 'p'                .or.
     .             cfield2 == 'lev'              .or.
     .             cfield2 == 'plev'             .or.
     .             cfield2 == 'level'            .or.
     .             cfield2 == 'ht'               .or.
     .             cfield2 == 'height'           .or.
     .             cfield2 == 'sigma'            .or.
     .             cfield2 == 'hybrid'           .or.
     .             cfield2 == 'levelist'         .or.
     .             cfield2 == 'nlevels'          .or.
     .             cfield2 == 'number'           .or.
     .             cfield2 == 'bottom_top'       .or.
     .             cfield2 == 'soil_layers_stag' .or.
     .             cfield  ==  zcoord     )      .and.
     .             dimid   /=  unlimdimid ) then

                  ncc = ncc+1
                  zid = ncc

                  coord(zid)%ndim     = 1
                  coord(zid)%type     = nf_float
                  coord(zid)%nattr    =-1            
                  coord(zid)%mult     = 1.0
                  coord(zid)%add      = 0.0
                  coord(zid)%dimid(1) = dimid

                  zdid                =     dimid
                  coord(zid)%name     = dim(dimid)%name

                  cycle

               endif

            endif

         enddo

         if (coord(zid)%dimid(1) == -1) then

            ! initialisation pour cas a 1 niveau
            
            zdid=maxdim

            dim(zdid)%name='lev'
            dim(zdid)%len=1
            dim(zdid)%duplic=0

            coord(zid)%name    = dim(zdid)%name
            coord(zid)%type    = nf_float
            coord(zid)%nattr   = 0            
            coord(zid)%ndim    = 1
            coord(zid)%mult    = 1.0
            coord(zid)%add     = 0.0
            coord(zid)%dimid(1)= zdid

         end if

         if (coord(tid)%dimid(1) == -1) then

            ! initialisation pour cas intemporel

            tdid=maxdim-3
            timedid=tdid

            dim(tdid)%name='time'
            dim(tdid)%len=1
            dim(tdid)%duplic=0

            coord(tid)%name    = dim(tdid)%name
            coord(tid)%type    = nf_float
            coord(tid)%nattr   = 0            
            coord(tid)%ndim    = 1
            coord(tid)%mult    = 1.0
            coord(tid)%add     = 0.0
            coord(tid)%dimid(1)= tdid

         endif

      endif

      return
      end
