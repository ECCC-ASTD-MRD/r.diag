#     if !defined (unite_io_maximale)
#         define  unite_io_maximale 99
#     endif
      module Diag_TOC

!    Reads the parametres defining the GEM/DM vertical
!    hybrid coordinate system (from v_4.0.6 onward) for
!    use in the r.diag disnostic toolbox. Uses the
!    Ron Mctaggart-Cowan's Vgrid_Descriptors

!    Author: Bernard Dugas, automne 2009/hiver 2010
!
!    Revision 3.14 2020/02/19 11:11  dugas
!    - Deplacer le bloc de code calculant la variable
!      TOC_TOP pour les types 5005 et 5100 dans LirTOC
!
!    Revision 3.13 2020/01/29 16:16  dugas
!    - Seconde phase de l'ajout du support
!      des types 5100, 21001 et 21002
!
!    Revision 3.12 2019/08/11 14:14  dugas
!    - Premiere passe de l'ajout du support
!      des types 5100, 21001 et 21002
!
!    Revision 3.11 2019/01/16 15:15  dugas
!    - Verifier l'unicite des enregistrements TocToc
!      dans les routines LirToc et NewToc
!
!    Revision 3.10 2018/11/15 18:18  dugas
!    - Ajouter la routine CopTOC.
!
!    Revision 3.9  2018/06/12 17:17  dugas
!    - Variable globale max_nbr passe de 10 a 20.
!    - Correction du format 6101 et elimination
!      du format 6102 dans LirTOC.
!
!    Revision 3.8  2017/10/25 22:22  dugas
!    Correction dans toutes les instances de GetToc, et
!    dans SavToc et LoPToc d'un probleme d'initialisation
!    par defaut de la variable locale LIP2. Ce probleme
!    pouvait empecher le sauvetage des TocTocs.
!
!    Revision 3.7  2016/10/26 16:13  dugas
!    - Ajouter la routine publique NOSTOC (pour ne pas sauver de TocToc)
!    - Correction de commentaires dans GetTOC_rv
!
!    Revision 3.6  2015/03/30 22:18:18  dugas
!    Remplacer les 'self=TOC_GD' par des 'TOC_GD' dans les appels du type vgd_*.
!
!    Revision 3.5  2014/09/25 18:31:50  dugas
!    Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
!
!    Revision 3.4  2013/03/21 20:59:49  bernard
!    - Ajouter le support du type 5003.
!    - Ajouter du code DEBUG dans la routine LopTOC.
!    - La routine NewTOC va maintenant CREER un nouveau TocToc valide.
!    - Ajouter un argument optionnel (NBR) a GetTOC. IP1 et IP2 deviennent
!      egalement des arguments optionnels. Il faut par contre que soit NBR,
!      soit IP1 et IP2 soient specifies.
!
!    Revision 3.3  2012/07/03 16:34:39  dugas
!    Corriger le traitement de CA_T dans GetTOC_rv.
!
!    Revision 3.2  2012/06/12 16:21:08  dugas
!    - Adapter a vgrid_descriptors v3.1.0
!    - Re-organiser les messages informatifs
!    - Ajouter les options 'NKM' et 'NKT' dans GETTOC_i.
!    - Corriger une serie de bogues suivant les
!      appels a VGD_GEt dans LITTOC.
!
!    Revision 3.1  2012/05/22 15:31:21  dugas
!    Version CVS initiale.
!

      use vGrid_Descriptors, only: VGD_OK,           &
                                   vgrid_descriptor, &
                                   vgd_get,          &
                                   vgd_levels,       &
                                   vgd_new,          &
                                   vgd_put,          &
                                   vgd_print,        &
                                   vgd_write

!     use iso_c_binding, only : c_ptr, C_NULL_PTR, C_CHAR, C_NULL_CHAR, c_int, c_associated, c_loc

      IMPLICIT    NONE
      private

      public :: alltoc ! Allocates the structures for !! records
      public :: newtoc ! Creates (fills) a !! record
      public :: ecrtoc ! Writes appropriate !! records
      public :: lirtoc ! Reads all the !! records in a file
      public :: gettoc ! Retreives specific parametres from !! records
      public :: savtoc ! Determines if a !! record needs to be saved 
      public :: loptoc ! Calculates 3d local pressure field
      public :: nostoc ! DO NOT save a !! record on certain I/O unit
      public :: coptoc ! Re-ID an exiting !! record following an horizontal grid modification

      interface gettoc
         module procedure gettoc_i
         module procedure gettoc_iv
         module procedure gettoc_r
         module procedure gettoc_rv
      end interface

!    vGrid_Descriptors variable declarations

      integer, parameter :: max_nbr=20  ! Maximum number of TocToc in any file
      integer, parameter :: STDERR=0    ! Standard error I/O unit 
      integer, parameter :: STDOUT=6    ! Standard output I/O unit 

      type(vgrid_descriptor), dimension(:,:), allocatable, save :: TOC_GD

!    Local work variables.

      LOGICAL, SAVE :: INITIAL_CALL=.TRUE.
      LOGICAL, SAVE :: REWRIT=.FALSE.

      character(len=3), save :: myformat='FST'

!    Private DATA shared by ECRTOC/LIRP and GETTOC/SETTOC.

      INTEGER, SAVE :: TOC_IP  (3,max_nbr,0:unite_io_maximale), &
                       TOC_NBR (          0:unite_io_maximale), &
                       TOC_NK  (3,max_nbr,0:unite_io_maximale), &
                       TOC_KIND(  max_nbr,0:unite_io_maximale), &
                       TOC_VER (  max_nbr,0:unite_io_maximale)
      REAL(8), SAVE :: TOC_TOP (  max_nbr,0:unite_io_maximale), &
                       TOC_REF (  max_nbr,0:unite_io_maximale)
      REAL,    SAVE :: TOC_RC  (4,max_nbr,0:unite_io_maximale), &
                       TOC_DHM (  max_nbr,0:unite_io_maximale), &
                       TOC_DHT (  max_nbr,0:unite_io_maximale), &
                       TOC_DHW (  max_nbr,0:unite_io_maximale)
      LOGICAL, SAVE :: TOC_READ(          0:unite_io_maximale), &
                       TOC_SAVE(            unite_io_maximale)

      CONTAINS

!-------------------------------------------------------------------
      SUBROUTINE AllTOC ( )

!    Allocations/Initializations.

      IF (INITIAL_CALL)                                        THEN
          INITIAL_CALL = .FALSE. ; TOC_READ(:)  = .FALSE. ; TOC_SAVE(:) = .FALSE.
          TOC_NBR(:)   =  0      ; TOC_IP(1:2,:,:) = -1   ; TOC_IP(3,:,:) = 0
          ALLOCATE( TOC_GD (max_nbr,0:unite_io_maximale) )
      END IF

      End SUBROUTINE AllTOC
!-------------------------------------------------------------------

      SUBROUTINE NewTOC ( NFOUT, F_version,F_hyb,F_rcoef,F_ptop_8,F_pref_8,F_ip1,F_ip2, &
                                 NBR, F_ptop_out_8,F_dhm,F_dht,F_dhw,F_kind )

!    NewTOC I/O declarations.

      integer, intent(in)               :: NFOUT              ! I/O unit associated to new TOC_GD variable
      integer, intent(in)               :: F_version          ! Secondary vertical layering version information
      real,    intent(in), dimension(:) :: F_hyb              ! User specification for vertical layering hyb
      real,    intent(in), dimension(:) :: F_rcoef            ! User specification for rcoef rectification values
      real(8), intent(in)               :: F_ptop_8, F_pref_8 ! User specification for lid and reference pressures
      integer, intent(in)               :: F_ip1,F_ip2        ! IP1,IP2 of the new TocToc record
      integer, intent(out)              :: NBR                ! The ordinal of the new TocToc records on NFOUT
      real(8), intent(out), optional    :: F_ptop_out_8       ! Top-level pressure (Pa) output if ptop_8 < 0
      real,    intent(in),  optional    :: F_dhm,F_dht,F_dhw  ! Diag levels Height for Momentum/Thermo/VerticalWind
      integer, intent(in),  optional    :: F_kind             ! Primary vertical layering version information.
                                                              ! Its supported values are 5 and 21. Default is 5

!    Local variables

      LOGICAL              info,debug
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/      debug

      character(len=4)   :: mykey
      integer            :: NF,I,status,VERS,Kind

      kind = 5 ; if (present(F_kind)) Kind = F_kind
      VERS = Kind*1000+F_version

      NBR = 0 ! Indication que l'enregistrement TocToc n'a pas encore ete cree

      IF ((size(F_rcoef) < 2 .and. VERS <= 5005) &
     .or. (size(F_rcoef) < 4 .and. VERS >  5005))     RETURN

      NF = ABS( NFOUT ) ; IF (NF > unite_io_maximale) RETURN

!    Allocations/Initializations.

      IF (INITIAL_CALL)                                        THEN
          INITIAL_CALL = .FALSE. ; TOC_READ(:) = .FALSE. ; TOC_SAVE(:) = .FALSE.
          TOC_NBR(:)   =  0      ; TOC_IP(1:2,:,:) = -1  ; TOC_IP(3,:,:) = 0
          ALLOCATE( TOC_GD (max_nbr,0:unite_io_maximale) )
      END IF

      IF (TOC_NBR(NF)+1 > max_nbr)                             THEN
          NBR = max_nbr ; IF (INFO) WRITE(6,6101) max_nbr
          RETURN
      ELSE IF (TOC_NBR(NF) > 1)                                THEN
         ! Est-ce que ceci est bien un nouvel enregistrement TocToc ?
          DO I=1,TOC_NBR(NF)
              IF (F_ip1 == TOC_IP(1,I,NF) .AND. &
                  F_ip2 == TOC_IP(2,I,NF))                     THEN
                  NBR = TOC_NBR(NF) ; IF (INFO) WRITE(6,6100) F_ip1,F_ip2,NF,I
                  RETURN
              END IF
          END DO
      END IF

      IF (5001 < VERS .and. VERS < 5004)                       THEN

          status = vgd_new( TOC_GD(TOC_NBR(NF)+1,NF),              &
                            kind=Kind,version=F_version,hyb=F_hyb, &
                            rcoef1=F_rcoef(1),rcoef2=F_rcoef(2),   &
                            ptop_8=F_ptop_8, pref_8=F_pref_8,      &
                            ip1=F_ip1,ip2=F_ip2 )

      ELSE IF (VERS == 5004)                                   THEN

          status = vgd_new( TOC_GD(TOC_NBR(NF)+1,NF),              &
                            kind=Kind,version=F_version,hyb=F_hyb, &
                            rcoef1=F_rcoef(1),rcoef2=F_rcoef(2),   &
                            ptop_8=F_ptop_8, pref_8=F_pref_8,      &
                            ip1=F_ip1,ip2=F_ip2,                   &
                            ptop_out_8=F_ptop_out_8 )

      ELSE IF (VERS == 5005)                                   THEN

          status = vgd_new( TOC_GD(TOC_NBR(NF)+1,NF),              &
                            kind=Kind,version=F_version,hyb=F_hyb, &
                            rcoef1=F_rcoef(1),rcoef2=F_rcoef(2),   &
                            pref_8=F_pref_8, ip1=F_ip1, ip2=F_ip2, &
                            ptop_out_8=F_ptop_out_8,               &
                            dhm=F_dhm, dht=F_dht )
                            
      ELSE IF (VERS == 5100  &
          .or. VERS == 21001)                                  THEN

          status = vgd_new( TOC_GD(TOC_NBR(NF)+1,NF),              &
                            kind=Kind,version=F_version,hyb=F_hyb, &
                            rcoef1=F_rcoef(1),rcoef2=F_rcoef(2),   &
                            rcoef3=F_rcoef(3),rcoef4=F_rcoef(4),   &
                            pref_8=F_pref_8, ip1=F_ip1, ip2=F_ip2, &
                            ptop_out_8=F_ptop_out_8,               &
                            dhm=F_dhm, dht=F_dht )

      ELSE IF (VERS == 21002)                                  THEN

          status = vgd_new( TOC_GD(TOC_NBR(NF)+1,NF),              &
                            kind=Kind,version=F_version,hyb=F_hyb, &
                            rcoef1=F_rcoef(1),rcoef2=F_rcoef(2),   &
                            rcoef3=F_rcoef(3),rcoef4=F_rcoef(4),   &
                            pref_8=F_pref_8, ip1=F_ip1, ip2=F_ip2, &
                            dhm=F_dhm, dht=F_dht, dhw=F_dhw,       &
                            ptop_out_8=F_ptop_out_8 )

      END IF

      IF (status == VGD_OK)                                    THEN

          TOC_SAVE(NF) = .TRUE. ! Il faudra sauver ceci a la sortie

          ! Rang du nouvel enregistrement TocToc
          TOC_NBR(NF) = TOC_NBR(NF)+1 ; NBR = TOC_NBR(NF)

          mykey='NL_M' ; status = vgd_get( TOC_GD(NBR,NF), key=mykey, value=TOC_NK(1,NBR,NF) )
          mykey='NL_T' ; status = vgd_get( TOC_GD(NBR,NF), key=mykey, value=TOC_NK(2,NBR,NF) )
          mykey='NL_W' ; status = vgd_get( TOC_GD(NBR,NF), key=mykey, value=TOC_NK(3,NBR,NF) )

          mykey='IP_3' ; status = vgd_get( TOC_GD(NBR,NF), key=mykey, value=TOC_IP(3,NBR,NF) )

          TOC_VER(   NBR,NF) = Kind*1000+F_version ! Un-safe !
          TOC_TOP(   NBR,NF) = F_ptop_8
          TOC_REF(   NBR,NF) = F_pref_8
          TOC_RC(1:4,NBR,NF) = F_rcoef(1:4)
          TOC_IP(1:2,NBR,NF) = (/ F_ip1, F_ip2 /)

          if (present(F_dhm))        TOC_DHM (NBR,NF) = F_dhm
          if (present(F_dht))        TOC_DHT (NBR,NF) = F_dht
          if (present(F_dhw))        TOC_DHW (NBR,NF) = F_dhw
          if (present(F_ptop_out_8)) TOC_TOP (NBR,NF) = F_ptop_out_8

!        Initialize the default values (unit 0).

          if (TOC_NBR( 0 ) == 0)                               THEN
              
              TOC_NBR(      0) = 1
              TOC_NK ( : ,1,0) = TOC_NK( : ,NBR,NF)

              TOC_GD (    1,0) = TOC_GD(    NBR,NF)
              TOC_VER(    1,0) = TOC_VER(   NBR,NF)
              TOC_TOP(    1,0) = TOC_TOP(   NBR,NF)
              TOC_REF(    1,0) = TOC_REF(   NBR,NF)
              TOC_RC (1:3,1,0) = TOC_RC(1:3,NBR,NF)
              TOC_IP (1:3,1,0) = TOC_IP(1:3,NBR,NF)

              if (present(F_dhm)) TOC_DHM(1,0) = TOC_DHM(NBR,NF)
              if (present(F_dht)) TOC_DHT(1,0) = TOC_DHT(NBR,NF)
              if (present(F_dhw)) TOC_DHW(1,0) = TOC_DHW(NBR,NF)

              if (INFO)                                        THEN
                  write(STDOUT,6104) NF
                  status = vgd_print( TOC_GD(NBR,NF),stdout )
              end if

          end if

      End If

      RETURN

 6100 FORMAT('*INFO:  NewToc duplicate indicators found, IP1,IP2=',2I6, &
             ' TocToc #',I2.2,' for file unit ',I3)
 6101 FORMAT('*INFO:  NewToc attempt to create more that the maximum number (',I2,') of TocToc records.')
 6104 FORMAT('*INFO:  NewToc VGD_NEW *OK*, I/O unit ',I3)

      End SUBROUTINE NewTOC

!-------------------------------------------------------------------
      SUBROUTINE LirTOC (NFIN,NBR)

!    lirtoc I/O declarations.

!    NFIN  = input unit number to read from
!    NBR   = returns the number of TocToc found on NFIN

      INTEGER, intent(IN)  :: NFIN
      INTEGER, intent(OUT) ::  NBR

!    External declarations.

      INTEGER     FSTINL,FSTPRM,FSTLUK,FSTECR
      EXTERNAL    FSTINL,FSTPRM,FSTLUK,FSTECR, &
                  GETNAM,CONVPR

      LOGICAL              info,debug
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/      debug

!    Local variables

      INTEGER,    PARAMETER :: NbrMaxDeToctoc=1024

      INTEGER     ivalue,mode,kind
      REAL        rvalue,hyb1,hyb2
      REAL(8)     rvalue8,zsrf,zetau,zeta2,ztop
      logical     OLD,flag,savTOP0
      character   blk*16,name*256,mykey*4,string
      INTEGER     DUM,status,NF,I,J,K,CLE(NbrMaxDeToctoc), &
                  SWA,LNG,DLTF,UBC,EXTRA1,EXTRA2,EXTRA3
      INTEGER     NI0,NJ0,NK0
      INTEGER,    EXTERNAL :: GETKIND

      integer,    dimension(:), pointer :: IPM ! Pour le calcul de PTOP

      NF = ABS( NFIN ) ; IF (NF > unite_io_maximale) RETURN ; savTOP0 = .false.

      ! Allocations/Initializations.

      IF (INITIAL_CALL)                                        THEN
          INITIAL_CALL = .FALSE. ; TOC_READ(:)  = .FALSE. ; TOC_SAVE(:) = .FALSE.
          TOC_NBR(:)   =  0      ; TOC_IP(1:2,:,:) = -1   ; TOC_IP(3,:,:) = 0
          ALLOCATE( TOC_GD (max_nbr,0:unite_io_maximale) )
      END IF

      IF (.NOT.TOC_READ(NF))                                   THEN

          TOC_READ(NF) = .TRUE.

          IF (INFO)                                            THEN
              CALL GETNAM( NF, NAME )
              WRITE(STDOUT,6000) TRIM( NAME )
          END IF

          ! Attempt (ONCE) to find and all vertical reference
          ! records (TocToc) on unit NF. Please note that this
          ! procedure quits at the first error.

          status = FSTINL( NF, NI0,NJ0,NK0,          &
                           -1,' ',-1,-1,-1,'X','!!', &
                           CLE, TOC_NBR(NF),NbrMaxDeToctoc )

          IF (status < 0 .OR. TOC_NBR(NF) == 0)                THEN
              ! status = -TOC_NBR(NF) (le nombre touve * -1)
              IF (INFO) WRITE(STDOUT,6101) trim( NAME )
              TOC_NBR(NF) = 0
              GOTO 100
          END IF

          J = 0 ! Current ordinal of (unique) TocToc record
          
          ReadNew: DO  I=1,TOC_NBR(NF)

              status = FSTPRM( CLE(I),                    &
                       DUM,DUM,DUM,NI0,NJ0,NK0, DUM,BLK,  &
                       TOC_IP(1,J+1,NF),TOC_IP(2,J+1,NF), &
                       TOC_IP(3,J+1,NF), BLK,BLK,BLK,BLK, &
                       TOC_VER(J+1,NF), DUM,DUM,DUM,SWA,  &
                       LNG,DLTF,UBC,EXTRA1,EXTRA2,EXTRA3 )

              IF (status < 0)                                  THEN
                  TOC_NBR(NF) = 0
                  IF (INFO) WRITE(STDERR,6103) status,I
                  TOC_NBR(NF) = 0 ; EXIT ReadNew
              END IF

              ! Check that this TocToc is new.
 
              OLD = .FALSE.
              CheckNew: DO K=1,J
                  IF (TOC_IP(1,J+1,NF) == TOC_IP(1,K,NF) .AND. &
                      TOC_IP(2,J+1,NF) == TOC_IP(2,K,NF) .AND. &
                      TOC_IP(3,J+1,NF) == TOC_IP(3,K,NF))      THEN
                      OLD = .TRUE.
                      EXIT CheckNew
                  END IF
              END DO CheckNew

              IF (OLD) CYCLE ReadNew

              ! Construct a new set of 3D coordinate descriptors
              ! using the last TocToc record record found.

              J = J+1
              
              kind=getkind()
              status = vgd_new( TOC_GD(J,NF),            &
                                unit=NF,format=myformat, &
                                ip1=TOC_IP(1,J,NF),      &
                                ip2=TOC_IP(2,J,NF) )
              call setkindi(kind)

              if (status /= VGD_OK)                            THEN
                  IF (DEBUG) write(STDERR,6100) TOC_IP(1,J,NF),TOC_IP(2,J,NF)
                  TOC_NBR(NF) = 0 ; EXIT ReadNew
              else if (INFO)                                   THEN
                  write(STDOUT,6104)
                  status = vgd_print( TOC_GD(J,NF),stdout )
              end if

              ! Explore the current TocToc vertical grid
              ! descriptor, saving certain of its elements.

              if (TOC_VER(J,NF) == 5001) THEN ! Un-staggered hybrid levels

                 ! Start by determining the number of levels.

                  mykey='NL_M' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=IVALUE )

                  if (status /= VGD_OK)                        THEN
                      if (DEBUG) write(STDERR,6200) 'NL_M'
                      TOC_NBR(NF) = 0 ; EXIT ReadNew
                  else
                      TOC_NK(1,J,NF) = ivalue
                      if (INFO) write(stdout,6105) 'NL_M'
                  end if

                  ! Save PTOP the pressure the model top level.

                  mykey='PTOP' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=rvalue8 )

                  if (status /= VGD_OK)                        THEN
                      IF (DEBUG) write(STDERR,6200) 'PTOP'
                      TOC_NBR(NF) = 0 ; EXIT ReadNew
                  else
                      TOC_TOP(J,NF) = rvalue8
                      if (INFO) write(stdout,6105) 'PTOP'
                  end if

                  ! Save PREF the model reference pressure.

                  mykey='PREF' ; status = vgd_get( TOC_GD(J,NF), & 
                                                   key=mykey,    &
                                                   value=rvalue8 )

                  if (status /= VGD_OK)                        THEN
                      IF (DEBUG) write(STDERR,6200) 'PREF'
                      TOC_NBR(NF) = 0 ; EXIT ReadNew
                  else
                      TOC_REF(J,NF) = rvalue8
                      if (INFO) write(stdout,6105) 'PREF'
                  end if

                  ! Save RCOEF.

                  mykey='RC_1' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=rvalue8 )

                  if (status /= VGD_OK)                        THEN
                      IF (DEBUG) write(STDERR,6200) 'RC_1'
                      TOC_NBR(NF) = 0 ; EXIT ReadNew
                  else
                      TOC_RC(1,J,NF) = rvalue8
                      if (INFO) write(stdout,6105) 'RC_1'
                  end if

              else if (TOC_VER(J,NF) ==  5002  &
                  .or. TOC_VER(J,NF) ==  5003  &
                  .or. TOC_VER(J,NF) ==  5004  & ! The first four are staggered hybrid pressure levels (v1,2,3,4)
                  .or. TOC_VER(J,NF) ==  5005  & !
                  .or. TOC_VER(J,NF) ==  5100  & ! SLEVE hybrid pressure levels
                  .or. TOC_VER(J,NF) == 21001  & ! Hybrid heights (Gal-Chen). May be SLEVE.
                  .or. TOC_VER(J,NF) == 21002  ) THEN !  Hybrid heights (on Lorenz grid). May also be SLEVE.

                  ! Start by determining the number of dynamic levels.

                  mykey='NL_M' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=IVALUE )

                  if (status /= VGD_OK)                        THEN
                      if (DEBUG) write(STDERR,6200) 'NL_M'
                      TOC_NBR(NF) = 0 ; EXIT ReadNew
                  else
                      TOC_NK(1,J,NF) = ivalue
                      if (INFO) write(stdout,6105) 'NL_M'
                  end if

                  ! Determine the number of thermodynamic levels.

                  mykey='NL_T' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=IVALUE )

                  if (status /= VGD_OK)                        THEN
                      if (DEBUG) write(STDERR,6200) 'NL_T'
                      TOC_NBR(NF) = 0 ; EXIT ReadNew
                  else
                     TOC_NK(2,J,NF) = ivalue
                     if (INFO) write(stdout,6105) 'NL_T'
                  end if

                  if (TOC_VER(J,NF)/1000 /= 21)                THEN

                      ! Save PREF the model reference pressure.

                      mykey='PREF' ; status = vgd_get( TOC_GD(J,NF), &
                                                       key=mykey,    &
                                                       value=rvalue8 )

                      if (status /= VGD_OK)                    THEN
                          IF (DEBUG) write(STDERR,6200) 'PREF'
                          TOC_NBR(NF) = 0 ; EXIT
                      else
                          TOC_REF(J,NF) = rvalue8
                          if (INFO) write(stdout,6105) 'PREF'
                      end if

                  end if

                  ! Save the first RCOEF.

                  mykey='RC_1' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=rvalue8 )

                  if (status /= VGD_OK)                        THEN
                      IF (DEBUG) write(STDERR,6200) 'RC_1'
                      TOC_NBR(NF) = 0 ; EXIT ReadNew
                  else
                      TOC_RC(1,J,NF) = rvalue8
                      if (INFO) write(stdout,6105) 'RC_1'
                  end if

                  ! Save the second RCOEF.

                  mykey='RC_2' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=rvalue8 )

                  if (status /= VGD_OK)                        THEN
                      IF (DEBUG) write(STDERR,6200) 'RC_2'
                      TOC_NBR(NF) = 0 ; EXIT ReadNew
                  else
                      TOC_RC(2,J,NF) = rvalue8
                      if (INFO) write(stdout,6105) 'RC_2'
                  end if
                
                  if (TOC_VER(J,NF) == 5005  &
                 .or. TOC_VER(J,NF) == 5100  &
                 .or. TOC_VER(J,NF) == 21001 &
                 .or. TOC_VER(J,NF) == 21002  )                THEN

                      ! Save the momentum diagnostic level DHM.
                  
                      mykey='DHM ' ; status = vgd_get( TOC_GD(J,NF), &
                                                       key=mykey,    &
                                                       value=rvalue )

                      if (status /= VGD_OK)                    THEN
                          IF (DEBUG) write(STDERR,6200) 'DHM '
                          TOC_NBR(NF) = 0 ; EXIT ReadNew
                      else
                          TOC_DHM(J,NF) = rvalue
                          if (INFO) write(stdout,6105) 'DHM '
                      end if

                      ! Save the thermodynamic diagnostic level DHT.
                  
                      mykey='DHT ' ; status = vgd_get( TOC_GD(J,NF), &
                                                       key=mykey,    &
                                                       value=rvalue )

                      if (status /= VGD_OK)                    THEN
                          IF (DEBUG) write(STDERR,6200) 'DHT '
                          TOC_NBR(NF) = 0 ; EXIT ReadNew
                      else
                          TOC_DHT(J,NF) = rvalue
                          if (INFO) write(stdout,6105) 'DHT '
                      end if

                      if (TOC_VER(J,NF) == 5100  &
                     .or. TOC_VER(J,NF) == 21001 &
                     .or. TOC_VER(J,NF) == 21002  )            THEN

                         ! Save the third RCOEF.

                          mykey='RC_3' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=rvalue8 )

                          if (status /= VGD_OK)                THEN
                             IF (DEBUG) write(STDERR,6200) 'RC_3'
                             TOC_NBR(NF) = 0 ; EXIT ReadNew
                          else
                             TOC_RC(3,J,NF) = rvalue8
                             if (INFO) write(stdout,6105) 'RC_3'
                          end if

                          ! Save the fourth RCOEF.

                          mykey='RC_4' ; status = vgd_get( TOC_GD(J,NF), &
                                                   key=mykey,    &
                                                   value=rvalue8 )

                          if (status /= VGD_OK)                THEN
                             IF (DEBUG) write(STDERR,6200) 'RC_4'
                             TOC_NBR(NF) = 0 ; EXIT ReadNew
                          else
                             TOC_RC(4,J,NF) = rvalue8
                             if (INFO) write(stdout,6105) 'RC_4'
                          end if

                          if (TOC_VER(J,NF) == 21002)          THEN

                              ! Save the vertical wind diagnostic level DHW.

                              mykey='DHW ' ; status = vgd_get( TOC_GD(J,NF), &
                                                               key=mykey,    &
                                                               value=rvalue )

                              if (status /= VGD_OK)            THEN
                                 IF (DEBUG) write(STDERR,6200) 'DHM '
                                 TOC_NBR(NF) = 0 ; EXIT ReadNew
                              else
                                 TOC_DHW(J,NF) = rvalue
                                 if (INFO) write(stdout,6105) 'DHM '
                              end if

                          end if

                      end if

                  else

                      ! Save PTOP the pressure the model top level.

                      mykey='PTOP' ; status = vgd_get( TOC_GD(J,NF), &
                                                       key=mykey,    &
                                                       value=rvalue8 )

                     if (status /= VGD_OK)                     THEN
                          IF (DEBUG) write(STDERR,6200) 'PTOP'
                          TOC_NBR(NF) = 0 ; EXIT ReadNew
                      else
                          TOC_TOP(J,NF) = rvalue8
                          if (INFO) write(stdout,6105) 'PTOP'
                      end if

                  end if

              end if

              exit ReadNew

          END DO ReadNew

          TOC_NBR(NF) = J
          
          ! Initialize the default values (unit 0).

          if (TOC_NBR( 0 ) == 0 .AND.  TOC_NBR(NF) /= 0)       THEN
              
              TOC_NBR(         0) = 1
              TOC_NK ( :    ,1,0) = TOC_NK ( :    ,1,NF)

              TOC_GD (       1,0) = TOC_GD (       1,NF)
              TOC_VER(       1,0) = TOC_VER(       1,NF)
              TOC_IP ( :    ,1,0) = TOC_IP ( :    ,1,NF)
              if (TOC_VER(J,NF) /= 5005 .and. TOC_VER(J,NF) /= 5100) &
              TOC_TOP(       1,0) = TOC_TOP(       1,NF)
              TOC_REF(       1,0) = TOC_REF(       1,NF)
              TOC_RC ( :    ,1,0) = TOC_RC ( :    ,1,NF)

              TOC_DHM(       1,0) = TOC_DHM(       1,NF)
              TOC_DHT(       1,0) = TOC_DHT(       1,NF)
              TOC_DHW(       1,0) = TOC_DHW(       1,NF)

              if (INFO) write(stdout,6106) TOC_IP(:,1,NF)

              savTOP0 = .true.

          end if

          if (TOC_VER(J,NF) == 5005 .OR. TOC_VER(J,NF) == 5100) THEN

              ! Save calculated PTOP, the pressure at the model top level.

              mykey='VIPM' ; call GetTOC_iv (NF, mykey,IPM,TOC_IP(1,J,NF),TOC_IP(2,J,NF) )

              mode = -2 ; flag = .false.
              call diag_convip_plus( IPM(1),hyb1, kind,mode,string,flag )
              call diag_convip_plus( IPM(2),hyb2, kind,mode,string,flag )

              ! How to Auto-Compute effective ptop_out for modes
              ! 5005/5100 as found in the vgrid.c (v 6.4) code
              ! zsrf_8  = log(pref8)
              ! zetau_8 = zsrf_8 + log( dble( hybuser(1) ) )
              ! zeta2_8 = zsrf_8 + log( dble( hybuser(2) ) )
              ! ztop_8  = 0.5 * ( 3. * zetau_8 - zeta2_8)
              ! ptop_out_8 = exp( ztop_8 )
              zsrf  = log( TOC_REF(J,NF) )
              zetau = zsrf + log( dble( hyb1) )
              zeta2 = zsrf + log( dble( hyb1) )
              ztop  = 0.5 * ( 3. * zetau - zeta2 )
              TOC_TOP(J,NF) = exp( ztop )

              if (savTOP0) TOC_TOP(1,0) = TOC_TOP(1,NF)

          end if

      end if

  100 NBR = TOC_NBR(NF)

      RETURN

 6000 FORMAT(' LirTOC:   Attempt to find !! on file...'/10X,A/)

 6101 FORMAT('*INFO:  LirTOC error in FSTINL.'/ &
             '        The !! record treatment has been interrupted in file...'/ &
             '        ',A)
 6103 FORMAT('*INFO:  LirTOC error ',I3,' in FSTPRM, VGRID # ',I2)
 6104 FORMAT('*INFO:  LirTOC VGD_NEW *OK*')
 6105 FORMAT('*INFO:  LirTOC VGD_GET *OK* on ',A)
 6106 FORMAT('*INFO:  LirTOC first grid descriptor found... IP1/2 =',2I7/)


 6100 FORMAT(' LirTOC:   WARNING - error during construction', &
                        ' of grid description structure associated', &
                        ' to IP1/2 =',2I7/)
 6200 FORMAT(' LirTOC:   WARNING - error during get operation OF ',A/)

      End SUBROUTINE LirTOC
!-------------------------------------------------------------------

      SUBROUTINE EcrTOC (NFOUT)

!    ecrtoc I/O declarations.

!    NFOUT = output unit number to write to

      INTEGER, intent(IN)  :: NFOUT

!    External declarations

      LOGICAL              info,debug
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/      debug

!    Local variables

      CHARACTER(len=256) NAME
      INTEGER i,NF,status

      NF = ABS( NFOUT )

!    Writes to I/O unit abs( NFOUT ) a record that defines the
!    parametres of the GEM/DM vertical hybrid coordinate system.

      IF (TOC_SAVE(NF) .AND. TOC_NBR(NF) > 0)                  THEN

!        Write the data as it last read. We use
!        the parametres of the previous operation.

          do  i=1,TOC_NBR(NF)

              status = vgd_write( TOC_GD(i,NF),    &
                                  format=myformat, &
                                  unit=NF )

              if (status /= VGD_OK)                            THEN
                  IF (DEBUG) write(STDERR,'(A/)') &
                  ' EcrTOC:  WARNING - error during write'
                  CALL                             XIT(' Ecrtoc ',-1 ) 
              end if

              IF (INFO)                                        THEN
                  CALL GETNAM( NF, NAME )
                  WRITE(STDOUT,6400) TOC_IP(1:2,i,NF),TRIM( NAME )
              END IF

          end do

      END IF

      RETURN

 6400 FORMAT(' EcrTOC:   Written !! with IP1/2 =',2I7,' to file...'/10X,A/)

      End SUBROUTINE EcrTOC

!-------------------------------------------------------------------
      SUBROUTINE GetTOC_i (NFIN, varname,ivalue, IP1,IP2,NBR)

!    NFIN     = input unit number to read from
!    varname  = Grid_Desctriptors variable we are interested in
!    ivalue   = integer scalar returned (gettoc_i)
!    IP1,IP2  = Grid_Desctriptors unique ID pair
!    NBR      = Actual ordinal of the Grid_Desctriptor

      integer, intent(IN)  :: NFIN
      CHARACTER(len=*), intent(IN) :: varname
      integer, intent(IN), optional :: IP1,IP2,NBR
      integer, intent(OUT) :: ivalue

!    Local variables

      INTEGER I,NF, LIP1,LIP2
      CHARACTER(LEN=4) local_name

      ivalue = -1 ; IF (TOC_NBR(0) == 0) RETURN

      NF = ABS( NFIN )

      if (present( IP1 ) .and. present( IP2 ))                 THEN
          LIP1 = IP1 ; LIP2 = IP2
      else if (present( NBR ))                                 THEN
          if (NBR > 0 .and. NBR <= TOC_NBR(NF))               THEN
              if (varname == 'IP1') ivalue = TOC_IP(1,NBR,NF)
              if (varname == 'IP2') ivalue = TOC_IP(2,NBR,NF)
              if (varname == 'IP3') ivalue = TOC_IP(3,NBR,NF)
              RETURN
          end if
      else
          RETURN
      end if

!    Is (IP1,IP2) recognition possible ?
!    If not, ignore IP1,IP2 parametres
!    and use default values.

      if (TOC_NBR(0) == 1 .and. TOC_IP(1,1,0) == 0   &
                          .and. TOC_IP(2,1,0) == 0 ) THEN
         LIP1 = TOC_IP(1,1,0) ; LIP2 = TOC_IP(2,1,0)
      end if

!    Now, try to find an existing grid descriptor
!    set corresponding to these (IP1,IP2).

      if (LIP1 == -1 .or. LIP2 == -1)                          THEN
          NF = 0 ; LIP1 = TOC_IP(1,1,NF) ; LIP2 = TOC_IP(2,1,NF) 
      end if

      DO  I=1,TOC_NBR(NF)

          IF (LIP1 == TOC_IP(1,I,NF) .AND. &
              LIP2 == TOC_IP(2,I,NF) )                         THEN

!            This is the correct grid_descriptor.

              call low2up( varname, local_name )
              select case ( trim( local_name ) )

              case ('VER')
                  ivalue = TOC_VER(I,NF)
              case ('NK' )
                  ivalue = TOC_NK (1,I,NF)
              case ('NKM')
                  ivalue = TOC_NK (1,I,NF)
              case ('NKT')
                  ivalue = TOC_NK (2,I,NF)
              case ('NKW')
                  ivalue = TOC_NK (3,I,NF)
              end select

          END IF

      END DO

      RETURN

      End SUBROUTINE GetTOC_i
!-------------------------------------------------------------------

      SUBROUTINE GetTOC_r (NFIN, varname,rvalue8, IP1,IP2)

!    NFIN     = input unit number to read from
!    varname  = Grid_Desctriptors variable we are interested in
!    rvalue8  = real(8) scalar returned    (gettoc_r)
!    IP1,IP2  = Grid_Desctriptors unique ID pair

      integer, intent(IN)  :: NFIN,IP1,IP2
      CHARACTER(len=*), intent(In) :: varname
      real(8), intent(OUT) :: rvalue8

!    Local variables

      INTEGER I,NF, LIP1,LIP2
      CHARACTER(LEN=4) local_name

      rvalue8 = -1 ; IF (TOC_NBR(0) == 0) RETURN

      NF = ABS( NFIN ) ; LIP1 = IP1 ; LIP2 = IP2

!    Is (IP1,IP2) recognition possible ?
!    If not, ignore IP1,IP2 parametres
!    and use default values.

      if (TOC_NBR(0) == 1 .and. TOC_IP(1,1,0) == 0   &
                          .and. TOC_IP(2,1,0) == 0 ) THEN
         LIP1 = TOC_IP(1,1,0) ; LIP2 = TOC_IP(2,1,0)
      end if

!    Now, try to find an existing grid descriptor
!    set corresponding to these (IP1,IP2).

      if (LIP1 == -1 .or. LIP2 == -1)                          THEN
          NF = 0 ; LIP1 = TOC_IP(1,1,NF) ; LIP2 = TOC_IP(2,1,NF) 
      end if

      DO  I=1,TOC_NBR(NF)

          IF (LIP1 == TOC_IP(1,I,NF) .AND. &
              LIP2 == TOC_IP(2,I,NF) )                         THEN

!            This is the correct grid_descriptor.

              call low2up( varname, local_name )
              select case ( trim( local_name ) )

              case ('PTOP')
                  rvalue8 = TOC_TOP(I,NF)
              case ('PREF')
                  rvalue8 = TOC_REF(I,NF)
              case ('DHM' )
                  rvalue8 = TOC_DHM(I,NF)
              case ('DHT' )
                  rvalue8 = TOC_DHT(I,NF)
              case ('DHW' )
                  rvalue8 = TOC_DHW(I,NF)
              case ('RC_1')
                  rvalue8 = TOC_RC(1,I,NF)
              case ('RC_2')
                  rvalue8 = TOC_RC(2,I,NF)
              case ('RC_3')
                  rvalue8 = TOC_RC(3,I,NF)
              case ('RC_4')
                  rvalue8 = TOC_RC(4,I,NF)
              end select

          END IF

      END DO

      RETURN

      End SUBROUTINE gettoc_r

!-------------------------------------------------------------------
      SUBROUTINE GetTOC_iv (NFIN, varname,ivalue1d, IP1,IP2)

!    NFIN     = input unit number to read from
!    varname  = Grid_Desctriptors variable we are interested in
!    ivalue1d = integer vector returned (gettoc_iv)
!    IP1,IP2  = Grid_Desctriptors unique ID pair

      integer, intent(IN)  :: NFIN,IP1,IP2
      CHARACTER(len=*), intent(In) :: varname
      integer, dimension(:), pointer :: ivalue1d

!    External declarations

      LOGICAL              debug
      COMMON     /ZZDEBUG/ debug

!    Local variables

      INTEGER I,NF,status, LIP1,LIP2
      CHARACTER(LEN=4) local_name

      IF (TOC_NBR(0) == 0) RETURN
 
      if (associated( ivalue1d )) deallocate( ivalue1d )
      nullify( ivalue1d )

      NF = ABS( NFIN ) ; LIP1 = IP1 ; LIP2 = IP2

!    Is (IP1,IP2) recognition possible ?
!    If not, ignore IP1,IP2 parametres
!    and use default values.

      if (TOC_NBR(0) == 1 .and. TOC_IP(1,1,0) == 0   &
                          .and. TOC_IP(2,1,0) == 0 ) THEN
         LIP1 = TOC_IP(1,1,0) ; LIP2 = TOC_IP(2,1,0)
      endif

!    Now, try to find an existing grid descriptor
!    set corresponding to these (IP1,IP2).

      if (LIP1 == -1 .or. LIP2 == -1)                          THEN
          NF = 0 ; LIP1 = TOC_IP(1,1,NF) ; LIP2 = TOC_IP(2,1,NF) 
      end if

      DO  I=1,TOC_NBR(NF)

          IF (LIP1 == TOC_IP(1,I,NF) .AND. &
              LIP2 == TOC_IP(2,I,NF) )                         THEN

!            This is the correct grid_descriptor.

              call low2up( varname, local_name )
              select case ( trim( local_name ) )

              case ('VIPM','VIP1')
!                Get the (coded IP1) hybrid levels.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=ivalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'VIPM'
              case ('VIPT')
!                Get the (coded IP1) thermodynamic hybrid levels.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=ivalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'VIPT'
              case ('VIPW')
!                Get the (coded IP1) vertical velocity hybrid levels.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=ivalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'VIPT'
              end select

          END IF

      END DO

      RETURN

 6201 FORMAT(' GetTOC:   WARNING - error during get operation OF ',A/)

      End SUBROUTINE GetTOC_iv
!-------------------------------------------------------------------

      SUBROUTINE GetTOC_rv (NFIN, varname,rvalue1d, IP1,IP2)

!    NFIN     = input unit number to read from
!    varname  = Grid_Desctriptors variable we are interested in
!    rvalue1d = real vector returned  (gettoc_rv)
!    IP1,IP2  = Grid_Desctriptors unique ID pair

      integer, intent(IN)  :: NFIN,IP1,IP2
      CHARACTER(len=*), intent(IN) :: varname
      real(8), dimension(:), pointer :: rvalue1d

!    External declarations

      LOGICAL              debug
      COMMON     /ZZDEBUG/ debug

!    Local variables

      INTEGER I,NF,status, LIP1,LIP2
      CHARACTER(LEN=4) local_name

      IF (TOC_NBR(0) == 0) RETURN

      if (associated( rvalue1d )) deallocate( rvalue1d )
      nullify( rvalue1d )

      NF = ABS( NFIN ) ; LIP1 = IP1 ; LIP2 = IP2

!    Is (IP1,IP2) recognition possible ?
!    If not, ignore IP1,IP2 parametres
!    and use default values.

      if (TOC_NBR(0) == 1 .and. TOC_IP(1,1,0) == 0   &
                          .and. TOC_IP(2,1,0) == 0 ) THEN
         LIP1 = TOC_IP(1,1,0) ; LIP2 = TOC_IP(2,1,0)
      end if

!    Now, try to find an existing grid descriptor
!    set corresponding to these (IP1,IP2).

      if (LIP1 == -1 .or. LIP2 == -1)                          THEN
          NF = 0 ; LIP1 = TOC_IP(1,1,NF) ; LIP2 = TOC_IP(2,1,NF) 
      end if

      DO  I=1,TOC_NBR(NF)

          IF (LIP1 == TOC_IP(1,I,NF) .AND. &
              LIP2 == TOC_IP(2,I,NF) )                         THEN

              ! This is the correct grid_descriptor.

              call low2up( varname, local_name )
              select case ( trim( local_name ) )

              case ('COFA','CA_M')
               ! Get A, the first pressure levels
               !  reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'COFA'
              case ('COFB','CB_M')
               ! Get B, the second pressure levels
               !  reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'COFB'
              case ('CC_M')
               ! Get CM, the third momemtum levels
               !  reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'CC_M'
              case ('CA_T')
               ! Get AT, the first thermodynamic levels
               !  reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'CA_T'
              case ('CB_T')
               ! Get BT, the second thermodynamic levels
               !  reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'CB_T'
              case ('CC_T')
               ! Get CT, the third thermodynamic levels
               !  reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'CC_T'
               case ('CA_W')
                ! Get AW, the first vertical velocity
                !  levels reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'CA_W'
              case ('CB_W')
               ! Get BW, the second vertical velocity
               !  levels reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'CB_W'
              case ('CC_W')
               ! Get CW, the third vertical velocity
                 !  levels reconstruction vector.
                  status = vgd_get( TOC_GD(I,NF),      &
                                    key=local_name,    &
                                    value=rvalue1d )
                  if (DEBUG .and. status /= VGD_OK)    &
                      write(STDOUT,6201) 'CC_W'
              end select

          END IF

      END DO

      RETURN

 6201 FORMAT(' GetTOC:   WARNING - error during get operation OF ',A/)

      End SUBROUTINE GetTOC_rv

!-------------------------------------------------------------------
      SUBROUTINE SavTOC (NFOUT, IP1,IP2)

!    NFOUT    = output unit number to write to
!    IP1,IP2  = Grid_Desctriptors unique ID pair

      integer, intent(IN)  :: NFOUT,IP1,IP2

!    External declarations

      LOGICAL              info
      COMMON     /ZZVERBO/ info

!    Local variables

      INTEGER I,J,NF,status, LIP1,LIP2

      IF (TOC_NBR(0) == 0) RETURN

      NF = ABS( NFOUT ) ; LIP1 = IP1 ; LIP2 = IP2

!    Is (IP1,IP2) recognition possible ?
!    If not, ignore IP1,IP2 parametres
!    and use default values.

      if (TOC_NBR(0) == 1 .and. TOC_IP(1,1,0) == 0   &
                          .and. TOC_IP(2,1,0) == 0 ) THEN
         LIP1 = TOC_IP(1,1,0) ; LIP2 = TOC_IP(2,1,0)
      end if

!    A record with hybrid vertical coordinate was written to
!    I/O unit abs( NFOUT ), with (IG1,IG2) == (ip1,IP2).
!    Defaults to the first saved !! (unit 0).

      if (LIP1 == -1) LIP1 = TOC_IP(1,1,0)
      if (LIP2 == -1) LIP2 = TOC_IP(2,1,0) 

!    Check that we have not already flagged the (possibly)
!    associated grid descriptor to be saved to unit NFOUT
!    as well.

      DO  I=1,TOC_NBR(NF)
          IF (LIP1 == TOC_IP(1,I,NF) .AND. LIP2 == TOC_IP(2,I,NF)) RETURN
      END DO

!    Now, try to find an existing grid descriptor
!    set corresponding to these (IP1,IP2).

      ALREADY_SAVED : DO  J=0,unite_io_maximale

          IF (J /= NF .and. TOC_NBR(J)  >    0     &
                      .and. TOC_NBR(NF) < max_nbr)             THEN
              DO  I=1,TOC_NBR(J)
                  IF (LIP1 == TOC_IP(1,I,J) .AND.  &
                      LIP2 == TOC_IP(2,I,J) )                  THEN

!                    This is it.

                      TOC_NBR(              NF) = TOC_NBR(NF)+1
                      TOC_GD (  TOC_NBR(NF),NF) = TOC_GD (  I,J)
                      TOC_IP (:,TOC_NBR(NF),NF) = TOC_IP (:,I,J)
                      TOC_NK (:,TOC_NBR(NF),NF) = TOC_NK (:,I,J)
                      
                      IF (INFO) WRITE(STDOUT,6500) IP1,IP2,NF

                      TOC_SAVE(NF) = .TRUE.

                      EXIT ALREADY_SAVED

                  END IF
              END DO
          END IF

      END DO ALREADY_SAVED

      RETURN

 6500 FORMAT(' SavTOC:   !! with IP1/2 =',2I7, &
             ' is now scheduled to be saved to I/O unit ',I2/)

      End SUBROUTINE SavTOC
!-------------------------------------------------------------------

      SUBROUTINE LoPTOC ( LocalPressure, IP1V, P0, IP1,IP2, IN_LNP )

      integer,                  intent(IN) :: IP1,IP2       ! IP1,IP2 associated to Descriptor instance 
      integer, dimension(:),    intent(IN) :: IP1V          ! IP1 list of prototype field
      real,    dimension(:,:),  intent(IN) :: P0            ! Surface field reference for coordinate
      logical, optional,        intent(IN) :: IN_LNP        ! Output LN( pressure ) ? Default is yes !

      real,    dimension(:,:,:), pointer   :: LocalPressure ! Physical level values

!    External declarations

      LOGICAL              info
      COMMON     /ZZVERBO/ info
      LOGICAL              debug
      COMMON     /ZZDEBUG/ debug

!     Local variables

      logical :: my_IN_LNP
      integer i,j, status, LIP1,LIP2, ni,nj,nk

!     Set default values
      my_IN_LNP = .true.
      if (present( IN_LNP )) my_IN_LNP = IN_LNP

      LIP1 = IP1 ; LIP2 = IP2

!    Is (IP1,IP2) recognition possible ?
!    If not, ignore IP1,IP2 parametres
!    and use default values.

      if (TOC_NBR(0) == 1 .and. TOC_IP(1,1,0) == 0   &
                          .and. TOC_IP(2,1,0) == 0 ) THEN
         LIP1 = TOC_IP(1,1,0) ; LIP2 = TOC_IP(2,1,0)
      end if

!    Now, try to find an existing grid descriptor
!    set corresponding to this (IP1,IP2) pair.

      IF (TOC_NBR(0) == 0) RETURN

      if (LIP1 == -1 .or. LIP2 == -1)                          THEN
          LIP1 = TOC_IP(1,1,0) ; LIP2 = TOC_IP(2,1,0) 
      end if

      LOOK_FOR_DESCRIPTOR : DO  J=0,unite_io_maximale

          IF (TOC_NBR(J)  >  0)                                THEN
              DO  I=1,TOC_NBR(J)
                  IF (LIP1 == TOC_IP(1,I,J) .AND.  &
                      LIP2 == TOC_IP(2,I,J) )                  THEN

!                      This is it.

                      EXIT LOOK_FOR_DESCRIPTOR

                  END IF
              END DO
          END IF

      END DO LOOK_FOR_DESCRIPTOR

      if (J > unite_io_maximale) call              xit(' LoPTOC ',-1 )


      ni = size(P0,dim=1); nj = size(P0,dim=2) ; nk = size( IP1V,dim=1 )

      status = vgd_levels( TOC_GD(I,J),          &
                           ip1_list=IP1V,        &
                           levels=LocalPressure, &
                           sfc_field=P0,         &
                           in_log=my_IN_LNP )

      if (status /= VGD_OK)                                    THEN
          IF (DEBUG) write(STDOUT,6600) nk,IP1,IP2
          call                                     xit(' LoPTOC ',-2 )
      else if (INFO)                                           THEN
          write(STDOUT,6601) nk,ni,nj
      end if

      RETURN

 6600 FORMAT('*DEBUG:  LoPTOC cannot compute the ',I3,' vertical levels local pressures associated to !! with IP1/2 =',2I7/)
 6601 FORMAT('*INFO:   LoPTOC computed ',I3,' pressures levels distributed over ',I3.3,'x',I3.3,' horizontal points.')

      End SUBROUTINE LoPTOC

!-------------------------------------------------------------------
      SUBROUTINE NosTOC (NFOUT)

!    NFOUT    = output unit number we do NOT want to write a !! record to

      integer, intent(IN)  :: NFOUT

!    External declarations

      LOGICAL              info
      COMMON     /ZZVERBO/ info

!    Local variables

      INTEGER NF

      NF = ABS( NFOUT )

      IF (INFO .and. TOC_SAVE(NF)) WRITE(STDOUT,6700) NF

      TOC_SAVE(NF) = .FALSE.

      RETURN

 6700 FORMAT(' NosTOC:   !! will not be written to I/O unit ',I2/)

      End SUBROUTINE NosTOC
!-------------------------------------------------------------------

      SUBROUTINE CopTOC (NFIN, IP10,IP20, IP1,IP2)

!    NFIN      = input unit number from which we want to copy a !! record to
!    IP10,IP20 = Original !! IP descriptors
!    IP1, IP2  = New !! IP descriptors

      integer , intent(IN)  :: NFIN, IP10,IP20, IP1,IP2

!    External declarations

      LOGICAL              info
      COMMON     /ZZVERBO/ info
      LOGICAL              debug
      COMMON     /ZZDEBUG/ debug

!    Local variables

      INTEGER I,NF,status1,status2, LIP1,LIP2

      IF (TOC_NBR(0) == 0) RETURN

      NF = ABS( NFIN ) ; LIP1 = IP1 ; LIP2 = IP2

!    Check that we have not already created the (possibly)
!    associated grid descriptor to be saved to unit NFOUT
!    as well.

      DO  I=1,TOC_NBR(NF)
          IF (LIP1 == TOC_IP(1,I,NF) .AND. LIP2 == TOC_IP(2,I,NF)) RETURN
      END DO

      IF (TOC_NBR(NF) < max_nbr) THEN

          DO  I=1,TOC_NBR(NF)

              IF (TOC_IP(1,I,NF) /= IP10 .OR. TOC_IP(2,I,NF) /= IP20) CYCLE

              ! Copy the IP1,IP2-associated structure
              TOC_NBR(              NF) = TOC_NBR(NF)+1
              TOC_GD (  TOC_NBR(NF),NF) = TOC_GD (  I,NF)
              TOC_NK (:,TOC_NBR(NF),NF) = TOC_NK (:,I,NF)
              TOC_IP (1,TOC_NBR(NF),NF) = IP1
              TOC_IP (2,TOC_NBR(NF),NF) = IP2
              status1 = vgd_put( TOC_GD(TOC_NBR(NF),NF),'IP_1',IP1 )
              status2 = vgd_put( TOC_GD(TOC_NBR(NF),NF),'IP_2',IP2 )

              if (status1 /= VGD_OK .or. status2 /= VGD_OK)      THEN
                  IF (DEBUG) write(STDOUT,6801) IP1,IP2
                  call                             xit(' CopTOC ',-1 )
              end if

              EXIT

          END DO

      ELSE

          ! Cannot create a new !! record associated with unit NF
          if (INFO) write(6,6800) NF

      END IF

      RETURN

 6800 FORMAT(' CopTOC:   !! will not be written to I/O unit ',I2/)
 6801 format(' CopTOC:   Unable to save IP1,IP2 to !! record.'/)

      END SUBROUTINE CopTOC

!-------------------------------------------------------------------
      End module Diag_TOC
