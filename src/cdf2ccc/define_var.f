
      subroutine define_var3(ID,infid)

      implicit none

      include 'netcdf.inc'
      include 'cdf2ccc.h'
      include 'dimmem.h'
      include 'infomem.h'

      integer id, infid

******
*
*AUTEUR Guy Bergeron             juin  2003
*
*     Definir dans le type derive var(id) la variable contnu dans le fichier CCCma. 
*
*REVISIONS 
* 
*     Bernard Dugas juin 2012 :
*     - Renommer a define_var3, suite a la nouvelle sequence d'appel
*     - Faire un plus usage du contenu de infvar, notamment
*       pour les noms de variable, leur facteur de compaction
*       et les dimension (dans infvar(i)%len(1:4))
*     Bernard Dugas fevrier 2009 :
*     - var(id)%type = nf_byte si varpack >= -8
*     Bernard Dugas  avril   2008 :
*     - Faire un "call xit" en cas d'erreur
*     - Utiliser VARPACK pour definir var(id)%type
*     Guy Bergeron   Juillet 2004 : Restructuration de l'algorithme
*     
******     

      integer m,varpack
*-----------------------------------------------------------------------
         
      var(id)%name=trim(infvar(infid)%name)

      varpack = npack
      if (npack == 999) varpack = infvar(infid)%npack

      if     (varpack >= -8  ) then
                                     var(id)%type=nf_byte
      elseif (varpack >= -16 ) then
                                     var(id)%type=nf_short
      elseif (varpack >= -32 ) then
                                     var(id)%type=nf_float
      else
                                     var(id)%type=nf_double
      endif

      if (spec) then
         print *,'Il faut definir le cas sepctral'
         call xit('define_var',-1)
            
      else

*     On determine quel sont les dimensions associe a la variable. 
* NOTA: Je ne pense pas que cet algorythme soit a toute epreuve!

         m=0

         if (dim(coord(xid)%dimid(1))%len > 1 .and.
     .               infvar(infid)%len(1) > 1 )then
            m=m+1                 
            var(id)%dimid(m)=coord(xid)%dimid(1)
         endif
         if (dim(coord(yid)%dimid(1))%len > 1 .and.
     .               infvar(infid)%len(2) > 1 )then
            m=m+1                 
            var(id)%dimid(m)=coord(yid)%dimid(1)
         endif
         if (dim(coord(zid)%dimid(1))%len > 0 .and. 
     .               infvar(infid)%len(3) > 1 .and.
     .                          zid /= maxdim) then 
            m=m+1                 
            var(id)%dimid(m)=coord(zid)%dimid(1)
         endif
         if (dim(coord(tid)%dimid(1))%len >= 1 .and.
     .               infvar(infid)%len(4) >  1 )then
            m=m+1                 
            var(id)%dimid(m)=coord(tid)%dimid(1)
         endif

         var(id)%ndim=m
      endif
*-----------------------------------------------------------------------
      end
