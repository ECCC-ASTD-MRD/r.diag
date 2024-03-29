
      subroutine define_possibilite()

      implicit none

      include 'cdf2ccc.h'

******
*
*AUTEUR Guy Bergeron    aout  2003
*     
*     Definir la liste des cas possible pour level_desc et grid_desc
*
*REVISIONS
*
* B Dugas aout '18 :
* - Remplacer 'polar-stereographic' par 'polar_stereographic'
* B.Dugas sept '12 :
* - Ajouter le support des grilles inconnues ('unknown')
* B.Dugas juin '12 :
* - Ajouter le support de 'Log Pressure Hybrid Levels' (VKIND=5002)
* B. Dugas dec 2011 :
* - Ajouter possibilite%levels 'Hybrid Height'
* B. Dugas oct 2008 :
* - Ajouter possibilite%levels 'Top of Atmosphere' et 'Soil Layers'
* B. Dugas mai 2008 :
* - Ajouter possibilite%time(ntun) (unites temporelles)
* B. Dugas ete/automne/hiver 2007 :
* - Ajouter les possibilites de niveaux 'Hybrid Levels',
*                                       'Arbitrary Levels' et
*                                       'Height'
* - Ajouter les possibilites de grilles 'rotated_latitude_longitude' et
*                                       'rotated_pole'
*
******

*-----------------------------------------------------------------------
*     liste des level_desc possibles:

      possible%level( 1)='Pressure Levels'
      possible%level( 2)='Sigma Levels'
      possible%level( 3)='Gal-Chen Levels'
      possible%level( 4)='10 m'
      possible%level( 5)='2 m'
      possible%level( 6)='Surface'
      possible%level( 7)='Sea Level'
      possible%level( 8)='Hybrid Levels'
      possible%level( 9)='Log Pressure Hybrid Levels'
      possible%level(10)='Arbitrary Levels'
      possible%level(11)='Height'
      possible%level(12)='Top of Atmosphere'
      possible%level(13)='Soil Layers'
      possible%level(14)='Hybrid Height'
*     
*     liste des grid_desc possibles:
*
      possible%grid(1)='lon/lat'
      possible%grid(2)='gaussian'
      possible%grid(3)='polar_stereographic'
      possible%grid(4)='rotated_latitude_longitude'
      possible%grid(5)='rotated_pole'
      possible%grid(6)='unknown'
*
*     liste des time_desc possibles:
*
      possible%time(1)='seconds'
      possible%time(2)='minutes'
      possible%time(3)='hours'
      possible%time(4)='days'
      possible%time(5)='months'
      possible%time(6)='years'
*
*-----------------------------------------------------------------------
      end
