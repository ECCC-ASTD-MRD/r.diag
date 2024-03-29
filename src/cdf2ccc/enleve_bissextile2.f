
      subroutine enleve_bissextile2(ncid,xxtime,xtime)

      implicit none

      include 'netcdf.inc'
      include 'cdf2ccc.h'

      integer   ncid
      real*8    xxtime, xtime

*     Guy Bergeron    Juillet 2003
*      
*     Modifier le nombre d'heures ecoulees depuis la date de depart si la
*     simulation a ete fait sens annee bissextile. Ajoutons 24 heures pour 
*     chaque annee bisstexile ecoulee dans la simulation. Le decodeur de 
*     date de UDUNITS2 considere uniquement le cas avec annees bissextiles.
*     
* REVISIONS
*
*   Bernard Dugas  fev '17 :
*    Tout le traitement de type udunits (y compris 
*    l'initialisation) se fait maintenant dans
*    la routine udparse3 qui remplace udparse2
*   Bernard Dugas  oct '08 :
*   - nettoyer la variable unitstring au retour de nf_get_att_text
*   - Tenir compte du cas ou "unitstring(30:32) == '0.0'"
*   Bernard Dugas  mai  2008 :
*   - appel a UDPARSE2 generalise (+arguments minute,sec)
*   Bernard Dugas  aout 2007 :
*   - Renommer le fichier a enleve_bissextile2.ftn
*   - L'inclusion de "udunits.inc" se fait via un pre-processeur
*
******

*UDUNITS2 :

      integer, parameter :: sense=+1

      integer   year,  mounth,  day,  hour, minute, sec
      integer  iyear, imounth, iday, ihour,iminute,isec
      integer iiyear,iimounth,iiday,iihour
      integer  nyear, nmounth, nday, nhour,nminute,nsec

      integer i,timeid,jday,nleap,lag,retcode,status

      real    nhrs,rsec,nlen
      
      real*8  dtime,zero
      data zero /0.d0/

      character*128 unitstring,dummy

******fonction:

      integer julian_day

*-----------------------------------------------------------------------
      xtime=xxtime

*     Definir la date 

      status=nf_inq_varid(ncid,'time', timeid)
      status=nf_get_att_text(ncid,timeid,'units',unitstring)
      call handle_err2(status,'enleve_bissextile2')

      call clean_char( unitstring,dummy,nlen )
      unitstring = dummy

      call udparse3( unitstring,udunits_dat,sense,xtime,
     .               year,mounth,day,hour,minute,sec )

*     Combien d'annees bissextiles se sont ecoulees depuis "units"

      read(unitstring,8887)dummy,nyear,nmounth,nday,
     .                           nhour,nminute

      if (unitstring(30:32) == '0.0') then
         nsec = 0
      else
         read(unitstring(30:31),'(I2)') nsec
      endif

      iiday=nday                   ! jour de reference
      nyear=year-nyear+1           ! nbre d'annees ecoulees
      nhrs=365.0*24.0              ! nbre d'hres / annee de 365 jrs

      nleap=0                      ! nbre d'annee bissextile
      dtime=zero
      do i=1,nyear

         dtime=dtime+dble(nhrs)
         call udparse3(unitstring,udunits_dat,sense,dtime,
     .                  nyear,nmounth,nday,nhour,nminute,nsec )

         if(nday.ne.iiday) then
            nleap=nleap+1
            iiday=nday
         endif

      enddo

*     Correction du nbre d'heure ecoulee pour eliminer les bissextiles :
      
      xtime=xtime+dble(nleap*24)

      call udparse3( unitstring,udunits_dat,sense,xtime,
     .               iyear,imounth,iday,ihour,iminute,isec )

      lag=0
      if ((mod(iyear,4  ).eq.0 .and. mod(iyear,100).ne.0) .or.
     .                               mod(iyear,400).eq.0)           then

         jday=julian_day(imounth,iday)

         if (nleap.lt.60 .and. year.eq.iyear
     .                      .and. jday.ge.nleap .and. imounth.le.2) then 
            lag=-1
         else if (nleap.eq.60 .and. year.ne.iyear .and. jday.ge.60) then
            lag=1
         else if (nleap.gt.60 .and.
     .                            jday.ge.60 .and. jday.le.nleap-1) then
            lag=1
         endif
      endif

      xtime=xtime+dble(lag*24.)                    ! le nouveau nombre d'heure

*     
*-----------------------------------------------------------------------
      include 'format.h'  
*-----------------------------------------------------------------------
      end




*-----------------------------------------------------------------------
*-----------------------------------------------------------------------
      integer function julian_day(mounth,day)

      implicit none

      integer mounth,day
      integer fday(13)
      data   fday    /1,32,60,91,121,152,182,213,244,274,305,335,366/ 

*-----------------------------------------------------------------------
      
      julian_day= fday(mounth) + (day-1)
      return

*-----------------------------------------------------------------------
      end

