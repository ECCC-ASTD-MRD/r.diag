
! successeur de convip

SUBROUTINE Diag_CONVIP_plus( ip, p, ikind, mode, string, flagv )
  ! use diag_convert_ip123, only : diag_is_invalid_kind
  implicit none
  integer, intent(INOUT) :: ip, ikind
  integer, intent(IN) :: mode
  real, intent(INOUT) :: p
  character *(*), intent(OUT) :: string 
  logical, intent(IN) :: flagv

!*********************************************************************
!     Codage/Decodage P de/a IP pour IP1, IP2, IP3
!     necessaire avant de lire/ecrire un enregistrement
!     sur un fichier standard.
!
!     Etendue des valeurs encodes: 10e-5 -> 10e10
!     1024x1024-1 = 1048575    1048001 -> 1048575 non utilise
!                              1000000 -> 1048000 utilise pour valeurs negatives
!
!     Auteurs: N. Ek et B. Dugas - Mars 1996
!     Revision 001  M. Lepine - juin 1997 convpr devient convip
!     Revision 002  M. Valin  - mai  1998 fichiers std 98
!     Revision 003  B. Dugas  - juillet 2000 code arbitraire 
!     Revision 004  M. Lepine - fevrier 2002 kind = 4, hauteur au sol +
!                               possibilite de forcer newstyle ou non avec mode=2 et mode=3
!     Revision 005  M. Lepine - avril 2002 kind = 5 (hybride), kind = 21 (GalChen)
!                               valeur min, max, zero et facteur multiplicatif
!     Revision 006  M. Lepine - Juin 2002 kind = 6 (Theta)
!                   B. Dugas  - juin 2002 ajouter mode = -2
!     Revision 007  M. Lepine - Oct 2003 kind = 10 (temps en heure)
!     Revision 008  M. Lepine - Dec 2005 kind = 17 (indice de matrice de niveaux)
!     Revision 009  B. Dugas  - Dec 2006 ajouter decodage de -10000 < valeur CCC < -99
!     Revision 010  M. Valin  - Mars 2008 kind = 21 (metres pression remplacant GalChen)
!                               introduction de zero_val2 pour la conversion ip->p
!     Revision 011  B. Dugas  - Oct 2009 usage de KINDP; kind=1002,5001,5002 ==> 1,5,5
!     Revision 012  M. Lepine - Mai 2010 traitement des valeurs en dehors des intervals connus
!                               comme valeurs arbitraires
!     Revision 013  M. Valin  - Mai/Juin 2013 activation du code 15, ajout de la conversion groupee,
!                               menage dans le code, changement de nom, refactoring
!     Revision 014  M. Valin  - Oct/Nov 2013 bug de conversion corrige pour certains cas limites
!                               enleve une amelioration qui entrainait une non compatibilite avec convip
!     Revision 015  B, Dugas  - Deplacer du module DIAG_CONVERT_IP123 a la routine DIAG_CONVIP_PLUS
!                             - Quitter apres l'appel a conv_kind_15 lorsque mode < 0 (c'etait un oubli)
!                             - Mofifier usage de KINDP. Ajouter kind=1003,2001,5003,5004 ==> 1,2,5,5
!                             - Ajouter les routines ENCODE_RANGE/DECODE_RANGE
!     Revision 016  B, Dugas  - Modifier la documentation pour tenir compte de kind=5005
!     Revision 017  B, Dugas  - Corriger la declaration de la limite superieure du mode dans
!                               la routine interne conv_kind_15 (idem dans convip_plus)
!     Revision 018  B, Dugas  - Renommer conv_kind_15 et value_to_string a
!                               diag_conv_kind_15 et diag_value_to_string
!     Revision 019  B. Dugas  - diag_is_invalid_kind est maintenant une reference externe
!                               et non plus un element du module diag_convert_ip123
!     Revision 020  B. Dugas  - Sauver zzvkind lorsque mode=-1 et kind=21
!                             - Ajouter le support des valeurs kind=21001,21002 (= 21)
!                               et 5100,5999 (= 5) lorsque MODE > 0
!
!     Input:    MODE = -2, de IP -->  P (sans definir zzvkind)
!               MODE = -1, de IP -->  P
!               MODE =  0, forcer conversion pour ip a 31 bits
!                          (default = ip a 15 bits)
!                          (appel d'initialisation)
!               MODE = +1, de P  --> IP
!               MODE = +2, de P  --> IP en mode NEWSTYLE force a true
!               MODE = +3, de P  --> IP en mode NEWSTYLE force a false
!               FLAG = .true. , ecriture de P avec format dans string
!
!     Input/
!     Ouput:    IP  =   Valeur codee 
!               P    =   Valeur reelle
!               IKIND =0, p est en hauteur (m) par rapport au niveau de la mer (-20,000 -> 100,000)
!               IKIND =1, p est en sigma                                       (0.0 -> 1.0)
!               IKIND =2, p est en pression (mb)                               (0 -> 1100)
!               IKIND =3, p est un code arbitraire                             (-4.8e8 -> 1.0e10)
!               IKIND =4, p est en hauteur (M) par rapport au niveau du sol    (-20,000 -> 100,000)
!               IKIND =5, p est en coordonnee hybride                          (0.0 -> 1.0)
!               IKIND =6, p est en coordonnee theta                            (1 -> 200,000)
!               IKIND =10, p represente le temps en heure                      (0.0 -> 1.0e10)
!               IKIND =15, entiers                                   
!               IKIND =17, p represente l'indice x de la matrice de conversion (1.0 -> 1.0e10)
!                                                   (partage avec kind=1 a cause du range exclusif
!               IKIND =21,21001,21002, ou p est en metres-pression
!                                                   (partage avec kind=5 a cause du range exclusif)
!                                                                              (0 -> 1,000,000) fact=1e4
!               STRING = valeur de P formattee
!
!               Notez de plus que ...
!               IKIND =1001, 1002 et 1003   en input, deviennent IKIND=1  a l'interne
!               IKIND =2001                 en input, devient    IKIND=2  a l'interne
!               IKIND =5001,5002,5003,5004,
!                      5005 ,5100, 5999     en input, deviennent IKIND=5  a l'interne
!               IKIND =21001,21002          en input, deviennent IKIND=21 a l'interne
!
!*********************************************************************
  real *8 TEN
  parameter (TEN=10.0)
  real *8 limit1, limit2, temp
  real abs_p
  integer iexp,  offset, itemp, lstring
  character *128 var_fmt

  INTEGER, PARAMETER :: Max_Kind = 31
  integer iaaa,ix, kind,maxkind
  logical NEWSTYLE, NEWENCODING, info
  real *8 exptab(0:15)
  character *3 kinds(0:Max_Kind)
  character (len=12) :: string2
  integer :: status

  INTEGER :: i
  logical :: flag

  LOGICAL, PARAMETER, DIMENSION(0:Max_Kind) :: validkind =                    &
  & (/ (.true.,i=0,6), (.false.,i=7,9), .true., (.false.,i=11,14),            &
  &    .true., .false.,.true.,                                                &
  &    (.false., i=18,20), .true., (.false., i=22,30),.true. /)   ! kind 15,31 valides

  REAL, PARAMETER, DIMENSION(0:Max_Kind) :: low_val =                         &
  &  (/  -20000., 0., 0.,    -4.8e+8,  -20000., 0.,                           &
  &    1.0, (-4.8e+8,i=7,9), 0.0, (-4.8e+8,i=11,16),                          &
  &    1.0, (-4.8e+8,i=18,20), 0., (-4.8e+8,i=22,31) /)
  REAL, PARAMETER, DIMENSION(0:Max_Kind) :: hi_val =                          &
  &  (/ 100000., 1., 1100., 1.0e+10, 100000., 1.,                             &
  &     200000., (1.0e+10,i=7,9), 1.0e+10, (1.0e+10,i=11,16),                 &
  &     1.0e+10, (1.0e+10,i=18,20), 1000000., (1.0e+10,i=22,31) /)
  REAL, PARAMETER, DIMENSION(0:Max_Kind) :: zero_val =                        &
  &  (/ 0., 0., 0., 0., 0., 0., 1., (0.0,i=7,16),                             &
  &    1.0, (0.0,i=18,20), 1.001e-4, (0.0,i=22,31) /)
  REAL, PARAMETER, DIMENSION(0:Max_Kind) :: zero_val2 =                       &
  &  (/ 0., 0., 0., 0., 0., 0., 1., (0.0,i=7,16),                             &
  &    1.0, (0.0,i=18,20), 0.0, (0.0,i=22,31) /)
  REAL, PARAMETER, DIMENSION(0:Max_Kind) :: fact_val =                        &
  &  (/ 1., 1., 1., 1., 1., 1., 1., (1.0,i=7,16),                             &
  &    -1.0, (1.0,i=18,20), 1.0e+4, (1.0,i=22,31) /)

  save NEWSTYLE, exptab, kinds, maxkind

  data NEWSTYLE /.false./

  data exptab /0.0001D0, 0.001D0, 0.01D0, 0.1D0, 1.0, 10.0, 100.0,            &
  &  1000.0, 10000.0, 100000.0, 1000000.0, 10000000.0,                        &
  &  100000000.0, 1000000000.0, 10000000000.0, 100000000000.0 /

  data kinds                                                                  &
  &   / 'm ', 'sg', 'mb', 'ar', 'M ', 'hy', 'th', '??',                       &
  &     '??', '??', 'H ', '??', '??', '??', '??', '_0',                       &
  &     '??', '[]', '??', '??', '??', 'mp', '??', '??',                       &
  &     '??', '??', '??', '??', '??', '??', '??', '_1'/

  logical, external :: diag_is_invalid_kind

  if (mode .eq.0) then
      NEWSTYLE = .true.
      return
  endif
  NEWENCODING = NEWSTYLE
  if (mode .eq. 2) NEWENCODING = .true.
  if (mode .eq. 3) NEWENCODING = .false.
  if ((NEWENCODING) .or. (mode .lt. 0)) then
      maxkind = Max_Kind
  else
      maxkind = 3
  endif
!
  kind = IKIND ; if (kind > 1000) kind = kind/1000
  call get_infomod( info )
!
  if (mode.gt.0) then  ! .... Conversion P,KIND a IP  ....

      if ( diag_is_invalid_kind(kind) ) then
         if (info) write(6,6004) kind
         call xit('Convip_plus',-4 )
      endif
      if (kind .eq. 2 .and. p .eq. 0.) then  ! ou ajouter .and. .not. NEWENCODING
         ip = 0
!          if(NEWENCODING) ip =  ishft(2,24) +  ishft(1,20) ! si  newstyle (kind=2, mantissa=0, exponent=1)
         return
      endif
!
      if(NEWENCODING)then    ! new style encoding
          if(iand(kind,15) == 15) then  ! kind 15 and subkinds done elsewhere (pure integers)
            status = diag_conv_kind_15(p,kind,ip,mode)
            return
          endif
          if (p .lt. low_val(kind) .or. p .gt. hi_val(kind)) then
              if (info) write(6,6006) p,low_val(kind),hi_val(kind)
              ip = -999999
              return
          endif
          iexp = 4
          temp = p
          if (abs(temp) .lt. zero_val(kind)) temp = zero_val(kind)
          temp = temp * fact_val(kind)  ! apply scaling factor before conversion to mantissa and pseudo exponent
          if ( temp .ge. 0) then
              limit1 = 1000000
              limit2 = 100000
              offset = 0
          else
              temp = -temp
              limit1 = 48000
              limit2 = 4800
              offset = 1000000
          endif
          ! temp=temp*1.00000005D0
          do while ( iexp .gt. 0 .and. iexp .lt. 15 )  ! must keep pseudo exponent in range
              if (temp .ge. limit1 ) then        ! too big, divide by 10 and adjust pseudo exponent
                temp = temp / TEN
                iexp = iexp -1
              else if ( temp .lt. limit2 ) then  ! too small multiply by 10 and adjust pseudo exponent
                temp = temp * TEN
                iexp = iexp + 1
              else   ! >=limit2 and <limit1
                EXIT
              endif
          enddo
          if ( temp .gt. limit1 ) then          ! number is too big, cannot code
              ip = -1
          else
              ip = offset + nint(temp)
          endif
          ip = ior (ip,ishft(iexp,20))          ! add pseudo exponent
          ip = ior (ip,ishft(iand(15,kind),24)) ! add primary kind flag

      else ! OLD style encoding

          if (kind.eq.0) then   ! ...  hauteur ...
              ip = max( 12001,min( 32000,nint( p/5.0 + 12001 ) ) )
          elseif (kind.eq.1) then  ! ...  sigma ...
              if ( .not. (  0.0 .le. p .and. p .le. 1.0 ) ) then
                if (info) write(6,6001) p
                ip = -999999
                return
              endif
              ip = nint( p * 10000. ) + 2000
          elseif (kind.eq.2) then  ! ...  pression ...
              if (  .not. (0.0 .le. p .and. p .lt. 1100. ) ) then
                if (info) write(6,6002) p
                ip = -999999
                return
              endif
              if (0.999999e+1 .le. p .and. p .lt. 1100. ) then
                ip = nint ( p )
              elseif ( p .lt. 0.999999e+1 ) then
                if( p .ge. 0.999999e0 ) then
                    ip = 1800 + nint(20.*p)
                elseif ( p .ge. 0.999999e-1 ) then
                    ip = 1600 + nint(200.*p)
                elseif ( p .ge. 0.999999e-2 ) then
                    ip = 1400 + nint(2000.*p)
                elseif ( p .ge. 0.999999e-3 ) then
                    ip = 1200 + nint(20000.*p)
                else
                    ip = 0
                endif
              endif
          elseif (kind.eq.3) then  ! ...  code arbitraire
              if ( .not. &
                 (( 0.0 .le. p .and. p .le.   100. ) .or. &
                                    p .eq. 32767. ) )  then
                 if (info) write(6,6003) p
                 ip = -999999
                 return
              end if
              ip = nint( p )
              ip = 1200 - ip
          else  !  OLD encoding not valid for this kind
              if (info) write(6,6004) kind,' (in OLD-STYLE)'
              call xit(' Convip ',-4 )
          endif
      endif  ! .not NEWENCODING, OLD style encoding

  elseif (mode.lt.0) then  ! ....  Conversion de ip a p,kind .....
      flag = flagv
      lstring=0
      if(flag) then
         lstring=len(string)
         if(lstring<9) flag=.false. ! if less than 9 characters are available, no attempt to format value will be made
      endif
      IF_ip_GT_32767 : if ( ip .gt. 32767 ) then  !   tous types, nouveau codage
          p = 0.0
          kind = iand(15,ishft(ip,-24))
          if(kind == 15) then  ! type 15 et associes traite a part
             if(diag_conv_kind_15(p,kind,ip,mode) /= 0) goto 777  ! il y a une erreur de decodage pour ip
          else
             if ( .not. validkind(kind) ) goto 777
             !
             iexp = iand (15,ishft(ip,-20))
             itemp = iand (1048575, ip)
             if (itemp > 1000000) itemp = -(itemp - 1000000)
555          continue
                p = itemp / exptab(iexp)             ! apply pseudo exponent
                p = p / fact_val(kind)               ! apply scaling factor
                !
                if (p < low_val(kind) .or. p>hi_val(kind)) then ! hors limite, essayer le type associe si valide
                   if(kind+16 <= Max_Kind) then
                      if(validkind(kind) .and. validkind(kind+16)) then
                         kind = kind+16
                         goto 555         ! try new kind
                      else
                         goto 777  ! invalid kind
                      endif
                   else
                      goto 777  ! invalid kind
                   endif
                endif
             p = max(p,low_val(kind))     ! clipping a la valeur minimale
             p = min(p,hi_val(kind))      ! clipping a la valeur maximale
             if (abs(p) .lt. 1.001*zero_val(kind)) p = zero_val2(kind)   ! mise a "zero" si valeur absolue trop faible
          endif
          if (flag) then  ! convert P into a formatted string with appropriate units for kind
             string2=""
             status=diag_value_to_string(p , string2 , min(len(string2),len(string)-3) )
             string=trim(string2)//' '//kinds(kind)
          endif
      elseif (  12000 .lt. ip .and. ip .le. 32000) then  !  ...  hauteur old style ...
          kind = 0
          p = 5 * ( ip -12001)
          if (flag) write(string,'(i6,1x,a1)') nint(p),'m'
      elseif (  2000 .le. ip .and. ip .le. 12000 ) then  !  ...  sigma old style ...
          kind = 1
          p = float (ip - 2000) / 10000.
          if (flag) then
             if (len(string) .ge. 15) then
                write(var_fmt,'(f12.4,1x,a2)') p,kinds(kind)
             else
                write(var_fmt,'(f6.4,1x,a2)') p,kinds(kind)
             end if
             string = var_fmt
          end if
      elseif (( 0    .le. ip .and. ip .lt. 1100 )  .or. ( 1200 .lt. ip .and. ip .lt. 2000 )) then  !  ... pression old style ...
          kind = 2
          if ( 0 .le. ip .and. ip .lt. 1100 ) then
             p = float(ip)
          elseif ( ip .lt. 1400 ) then
                p = float(ip-1200) / 20000.D0
          elseif ( ip .lt. 1600) then
                p = float(ip-1400) / 2000.D0
          elseif ( ip .lt. 1800) then
                p = float(ip-1600) / 200.D0
          elseif  ( ip .lt. 2000) then
                p = float(ip-1800) / 20.D0
          endif
          abs_p = abs(p)
          if (flag) then
             if (len(string) .ge. 15) then
                if      (abs_p.eq. int(abs_p) .and. &
                         abs_p.lt. 10000.)   then
                   write(var_fmt,'(i12,1x,a2)') nint(p),kinds(kind)
                else if (abs_p.ge. 10000.)    then
                   write(var_fmt,'(e12.6,1x,a2)') p,kinds(kind)
                else if (abs_p.ge. 1000.)     then
                   write(var_fmt,'(f12.3,1x,a2)') p,kinds(kind)
                else if (abs_p.ge. 100.)       then
                   write(var_fmt,'(f12.4,1x,a2)') p,kinds(kind)
                else if (abs_p.ge. 10.)        then
                   write(var_fmt,'(f12.5,1x,a2)') p,kinds(kind)
                else if (abs_p.ge. 1.)         then
                   write(var_fmt,'(f12.6,1x,a2)') p,kinds(kind)
                else if (abs_p.ge. 0.1)        then
                   write(var_fmt,'(f12.7,1x,a2)') p,kinds(kind)
                else if (abs_p.ge. 0.01)       then
                   write(var_fmt,'(f12.8,1x,a2)') p,kinds(kind)
                else if (abs_p.ge. 0.001)      then
                   write(var_fmt,'(f12.9,1x,a2)') p,kinds(kind)
                else
                   write(var_fmt,'(e12.6,1x,a2)') p,kinds(kind)
                endif
             else
                if      (abs_p.eq. int(abs_p) .and. &
                         abs_p.lt. 10000.)    then
                   write(var_fmt,'(i6,1x,a2)') nint(p),kinds(kind)
                else if (abs_p.gt. 10000.)     then
                   write(var_fmt,'(e9.4,1x,a2)') p,kinds(kind)
                else if (abs_p.gt. 100.)       then
                   write(var_fmt,'(f6.2,1x,a2)') p,kinds(kind)
                else if (abs_p.gt. 10.)        then
                   write(var_fmt,'(f6.3,1x,a2)') p,kinds(kind)
                else if (abs_p.gt. 1.)         then
                   write(var_fmt,'(f6.4,1x,a2)') p,kinds(kind)
                else if (abs_p.ge. 0.001)      then
                   write(var_fmt,'(f6.5,1x,a2)') p,kinds(kind)
                else
                   write(var_fmt,'(e9.4,1x,a2)') p,kinds(kind)
                end if
             end if
             string = var_fmt
          end if
      elseif (( 1100 .le. ip .and. ip .le. 1200)  .or. &
                                   ip .eq. 32767) then
          kind = 3
          if (ip .ne. 32767) then
             p = float( ip )
             p = 1200. - p
          else !  Valeur utilisee pour coder NEWL.
             p = 0.
          end if
          if (flag) then
             if (len(string) .ge. 15) then
                write(var_fmt,'(i12,1x,a2)') nint(p),kinds(kind)
             else
                write(var_fmt,'(i6, 1x,a2)') nint(p),kinds(kind)
             end if
             string = var_fmt
          end if
      elseif ( -10000 .lt. ip .and. ip .lt. -99 ) then 
          ! On suppose que cet interval corresponds a un codage de type
          ! CCC valide pour des niveaux de pression au-dessus de 10mb,
          ! supportant ainsi la lecture des fichiers de type CCCma
          kind = 2
          ix   = ip / 1000
          iaaa = 1000*ix - ip
          write (var_fmt,1000) iaaa, ix-2
          read  (var_fmt,1010) p
          if (flag) then
             if (len(string) .ge. 15) then
                write(var_fmt,'(e12.3,1x,a2)') p,kinds(kind)
             else
                write(var_fmt,'(e9.3, 1x,a2)') p,kinds(kind)
             end if
             string = var_fmt
          end if
      else !  Valeur illegale/inderminee de ip  old style
          kind = -1
          p = float( ip )
          if (info) write(6,6005) ip
      endif IF_ip_GT_32767

      if (mode /= -2 .and. .not. (kind == 3 .and. ip == 32767) &
                     .and.       (kind <= 6 .or.  kind == 21)) call setkindi( kind )
      ikind = kind ! ikind est la variable de sortie

  endif  ! ....  Conversion de xx a yy .....
      
  return

777  continue  ! invalid ip, return kind = -1
  ikind = -1 ; if (info) write(6,6005) ip

  return

  1000 FORMAT (I3,'.E',I3.2) 
  1010 FORMAT (E8.0) 

  6001 format(' Error in convip: sigma value =',e12.5,' returned ip is -999999')
  6002 format(' Error in convip: pressure value =',e12.5,' returned ip is -999999')
  6003 format(' Error in convip: arbitrary value=',e12.5,' returned ip is -999999')
  6004 format(' Error in convip: invalid kind =',I10:A)
  6005 format(' Error in convip: invalid ip =',I10)
  6006 format(' Error in convip: p is out of bounds =',e12.5,' min=',e12.5,' max=',e12.5,' returned ip is -999999')
! 6007 format(' Warning in convip: undetermined kind used =',I10)

!=========================== start of private function =========================================
contains
!===============================================================================================
function diag_conv_kind_15(p,mykind,ip,mode) result(status) ! convert kind = 15 and subkinds
  implicit none
  integer :: status
  integer, intent(INOUT) :: mykind,ip
  integer, intent(IN) :: mode ! -1, 1, 2, 3 (see Diag_convip_plus code for meaning of modes)
  real, intent(INOUT) :: p
!
  type e15
    integer :: lo      ! lowest value of ipv for this sub kind
    integer :: hi      ! lhighest value of ipv for this sub kind
    integer :: base    ! offset for this sub kind
  end type
  type(e15), dimension(2), save :: t15 = & 
         (/ &
         e15(       0,  2000000,      0), &     ! values between 0 and 1 999 999    (kind 15)
         e15(16000000, 15000001,  -1000)  &     ! values between -1000 and 998 999 (kind 31) ! entries swapped to deactivate
         /)
  integer :: i, subt, ipv
  integer, parameter :: FFFFFF=Z'FFFFFF'
!
  status = -1               ! precondition for failure
!
  if(ip > 0 .and. ishft(ip,-24) == 15 .and. mode <= -1) then  ! kind 15 and sub kinds ip to p conversion
    mykind = -1
    ipv = iand(ip,FFFFFF)  ! get rid of kind 15 indicator
    subt = -1
    do i=1,size(t15)   ! lookup in bounds table
      if(ipv >= t15(i)%lo .and. ipv <= t15(i)%hi ) then ! is ipv in the range of this sub kind ?
        subt = i    ! yes
        exit
      endif
    enddo
    if(subt == -1) return  ! invalid ip value for kind = 15 and associated sub kinds
    p = ipv - t15(subt)%lo + t15(subt)%base   ! convert ipv to actual value
    mykind = 15 + 16*(subt-1)    ! return proper kind type
    status = 0
  endif
!
  if(15 == iand(mykind,15) .and. mode > 0 .and. mode <3) then  ! newstyle p to ip conversion
    ip = -1                      ! precondition for fail
    subt = 1 + ishft(mykind,-4)
    if(subt <= 0 .or. subt > size(t15)) return   ! sub kind out of range
    ipv = nint(p) - t15(subt)%base + t15(subt)%lo
    if(ipv < t15(subt)%lo .or. ipv > t15(subt)%hi) return  ! p is out of range
    ip = ior(ipv,ishft(15,24))  ! add type 15 flag
    status = 0
  endif
! total failure if we get here
  return
end function diag_conv_kind_15
!===============================================================================================
! SUMMARY
! write value val into string using at most maxlen characters
! SYNOPSIS
integer function diag_value_to_string(val,string,maxlen)
! AUTHOR
!  M.Valin 2013
!  Revision 001 :  M.Valin  Oct 2013 alignement a droite corrige pour valeurs entieres > 0
! ARGUMENTS
  integer, intent(IN) :: maxlen
  character (len=*), intent(OUT) :: string
  real *4, intent(IN) :: val
! INPUTS
!  maxlen : use at most maxlen characters to code value
!  val    : real value to be encoded (left aligned) into string
! OUTPUTS
!  string : result of encoding
! RESULT
!  if something went wrong, the return value will be <= 0
!  if an integer format (I) is used, the return value is the number of characters used
!  if a floating format (F/G) is used, return value =- 100*field_width + nb_of_significant_digits
!  ex: if F8.3 is used, the result will be 803, if I6 is used, the result will be 6
!******
  character (len=32) :: fstring
  character (len=128) :: tempstring
  real *4 :: value
  integer :: after, before
  integer :: grosint, maxc, intdig

  string=" "
  maxc=min(maxlen,len(string))
  value=abs(val)
  after=min(7,maxc-6)
  before=maxc
  diag_value_to_string=-(100*before+after*10)
  write(fstring,11)maxc,after    ! default G format

  if(value /= 0.0) then
    if(value >= 1000000000000.0 .or. value < .0001) goto 666   ! use G format
  endif

  if(nint(value)==value) then ! exact integral value
    grosint=1
    intdig=2
    do i=1,min(9,maxc-1)
      if(nint(value) > grosint) intdig=intdig+1
      grosint=grosint*10  ! largest integer value that will fit in maxc characters
    enddo
    if(value >= grosint) goto 444   ! try something else
    if(val>0) intdig = intdig - 1   ! one less character if number is positive
    write(fstring,12)'(I',min(maxc,intdig),')'    ! use I format
    diag_value_to_string=min(maxc,intdig)
    goto 777
  endif

  444 continue  ! real values within "civilized" range
  if (value >= 1.0) then
    before = 0
    after = 0
    do while(value>=1.0)
      before = before +1
      value = value * .1
    enddo
    if(before<6) after=min(6-before,maxc-before-2) ! we have at best 6 significant digits
!    if(before<8) after=max(0,maxc-before-2)
  else   ! value < 1.0
    after = 6
    before = 0
    do while(value<1.0)
      value = value * 10.0
      after = after  +1
    enddo
    after=min(after,maxc-2)
  endif

  after=min(9,after)  ! never more than 9 digits after the decimal point

  if(before+after+2 > maxc) goto 666  ! use G format

  before=before+after+2
  diag_value_to_string=100*before+after*10

  write(fstring,10)before,after       ! use F format
  !print *,'=',trim(fstring)
  write(string,fstring)val            ! F format
  i=len(trim(string))
  do while(i>4 .and. string(i-1:i-1)=='0')
    string(i:i)=' '
    i=i-1
  enddo
  if(string(1:1)==' ') then
    tempstring=string(2:len(string))
    string=tempstring
  endif
  return

  666 continue
  if(maxc-6<=0) goto 888
  !print *,'=',trim(fstring)
  write(string,fstring)val            ! G format
  if(string(1:1)==' ') then
    tempstring=string(2:len(string))
    string=tempstring
  endif
  return

  777 continue
  !print *,'=',trim(fstring)
  write(string,fstring)nint(val)      ! I format
  if(string(1:1)==' ') then
    tempstring=string(2:len(string))
    string=tempstring
  endif
  return

  888 continue
  diag_value_to_string=0
  return

10 format(2H(F,I2,1H.,I1,1H))
11 format(2H(G,I2,1H.,I1,1H))
12 format(A,I2,A)
end function diag_value_to_string

!===============================================================================================
!============================= end of private function =========================================
!===============================================================================================

end SUBROUTINE Diag_CONVIP_plus
SUBROUTINE ENCODE_RANGE( HIVAL,LOVAL,KIND, IBUF )

! Converts the (HIVAL,LOVAL,KIND) range into the appropriate (IP1,IP2,IP3)
! values following the the KIND value and puts the results into the HIGHBUF
! section of the IBUF information vector.

! Author: B. Dugas, August 2016

   use diag_convert_ip123

   implicit none

   INTEGER, PARAMETER :: HEAD = taille_entete

   ! Arguments declarations

   integer, INTENT(IN)  :: KIND
   real,    INTENT(IN)  :: HIVAL,LOVAL
   integer, INTENT(OUT) :: IBUF(*)

   ! Local variables declarations

   integer  stat, ip1,ip2,ip3, k1,k2,k3, lkind
   real     v1,v2,v3

   if (KIND > 999) then
       lkind = KIND/1000
   else
       lkind = KIND
   end if

   if (lkind == KIND_HOURS) then

      ! TIME range, uses IP2,IP3. V1 set to 0.0
       v1 = 0.0   ; k1 = KIND_PRESSURE
       V2 = HIVAL ; k2 = lkind
       v3 = LOVAL ; k3 = lkind
       stat = diag_encode_ip( ip1,ip2,ip3, v1,k1, v2,k2, v3,k3 )

      ! Case: Old style IP1 and new style IP2.
      !       As we are interested in the IP2,IP3 pair
      ! ==>   Change the output status to OK
      if (ip2 >= 32768 .and. stat == CONVERT_GOOD_GUESS) &
          stat = CONVERT_OK 

      if (stat == CONVERT_ERROR) then
         write(6,'("ENCODE error = ",I3)') stat
         call xit('ENCODE_RANGE',-1 )
      end if

      ! Transfer IP2,IP3 to IBUF. IP1 is not set.
      call puthigh( ip2,'IP2',IBUF )
      call puthigh( ip3,'IP3',IBUF )
      
   else

      ! VERTICAL range, uses IP1,IP3. V2 set to 0.0
      v1 = HIVAL ; k1 = lkind
      v2 = 0.0   ; k2 = KIND_HOURS
      v3 = LOVAL ; k3 = lkind
      stat = diag_encode_ip( ip1,ip2,ip3, v1,k1, v2,k2, v3,k3 )

      ! Case: New style IP1 and old style IP2.
      !       As we are interested in the IP1,IP3 pair
      ! ==>   Change the output status to OK
      if (ip1 >= 32768 .and. stat == CONVERT_GOOD_GUESS) &
          stat = CONVERT_OK 

      if (stat == CONVERT_ERROR) then
         write(6,'("ENCODE error = ",I3)') stat
         call xit('ENCODE_RANGE',-2 )
      end if
      
      ! Transfer IP1,IP3 to IBUF. IP2 is not set.
      call puthigh( ip1,'IP1',IBUF )
      call puthigh( ip3,'IP3',IBUF )
      
   end if

return

end SUBROUTINE ENCODE_RANGE
SUBROUTINE DECODE_RANGE( IBUF, HIVAL,LOVAL,KIND )

! Converts the (IP1,IP2,IP3) values found in the HIGHBUF section of the
! IBUF information vector into the appropriate (HIVAL,LOVAL,KIND) range,
! if applicable. Otherwise, KIND=-1 on output.

! Author: B. Dugas, August 2016

   use diag_convert_ip123

   implicit none

   INTEGER, PARAMETER :: HEAD = taille_entete

   ! Arguments declarations

   integer, INTENT(IN)  :: IBUF(*)
   integer, INTENT(OUT) :: KIND ! = -1 when no ranges are found
   real,    INTENT(OUT) :: HIVAL,LOVAL

   ! Local variables declarations

   integer  stat, ip1,ip2,ip3, k1,k2,k3
   type(FLOAT_IP) :: RP1,RP2,RP3
   integer, external :: gethigh

   ! Get IP1,IP2,IP3 from IBUF.
   ip1 = ibuf(4) ! au lieu de gethigh('IP1',IBUF )
   ip2 = gethigh('IP2',IBUF )
   ip3 = gethigh('IP3',IBUF )

   ! Decode/Check for ranges
   stat = diag_decode_ip( RP1,RP2,RP3,ip1,ip2,ip3 )

   if (stat == CONVERT_ERROR) then
      write(6,'("DECODE error = ",I3)') stat
      call xit('DECODE_RANGE',-1 )
   end if

   k1 = RP1%kind ; k2 = RP2%kind

   if (stat == CONVERT_OK) then
      ! Time or level range ?
      if (RP1%hi /= RP1%lo) then ! level range found
         HIVAL = RP1%hi ; LOVAL = RP1%lo ; KIND = k1
      else if (RP2%hi /= RP2%lo) then ! time range found
         HIVAL = RP2%hi ; LOVAL = RP2%lo ; KIND = k2
      else ! No range found
         KIND = -1
      end if
   else
      KIND = -1
   end if

return

end SUBROUTINE DECODE_RANGE
