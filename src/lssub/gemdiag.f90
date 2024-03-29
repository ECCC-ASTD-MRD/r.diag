!     $Log: gemdiag.F90,v $
!     Revision 3.36  2020/01/07 17:17  dugas
!     - Enlever (commenter) le code dependant du macro i386
!
!     Revision 3.35  2019/12/17 14:14  dugas
!     - Convertir du format .ftn au format .F90
!
!     Revision 3.34  2019/04/15 07:07  dugas
!     - Ajouts au format 6001 de GEM4ATH.
!
!     Revision 3.33  2018/11/12 17:17  dugas
!     - Modifier la declaration de F_pr dans D_VT2GZ
!     - Meme chose pour FST_PR et TEMP_PR dans GEM4ATH
!     - Deux autres BUGFIXs dans cette meme routine
!
!     Revision 3.32  2018/09/19 16:16  dugas
!     - Modifier l'initialisation de DLAT dans D_ZONGINI
!     - Verifier la valeur de NORM avant de finaliser
!       le calcul des poids dans D_ZONGINI
!
!     Revision 3.31  2016/10/26 15:44  dugas
!     - Ajouter les arguments log_presure et calclp a GEM4APL ce
!       qui rend le calcul de la pression locale optionnelle
!     - Les variables reelles/locales de cette routines sont
!       maintenant toutes declarees en 64 bits
!     - Reorganisation majeure de la routine GEM4ATH, avec l'ajout
!       notamment la variable OTHER qui sert d'indicateur du fait
!       que les variables FST et TEMP ne sont peut-etre pas toujours
!       sur le meme jeux de niveaux verticaux. Les pressions locales
!       sur ces jeux de niveaux sont maintenant specifiees en
!       argument et non plus calculees a l'interne
!     - Et les variables reelles/locales de cette routines sont
!       aussi declarees en 64 bits
!     - Ajouter la routine D_VT2GZ qui calcule le GZ hydrostatique
!       a partir de PR et VT (adaptation du VT2GZ de la librairie GEM4)
!
!     Revision 3.30  2015/03/30 22:15:33  dugas
!     Initialiser les pointeurs qui seront passes a VGRIDDESCRIPTORS.
!
!     Revision 3.29  2014/10/16 12:16:55  dugas
!     Modifications commandees par la compilation avec GFORTRAN et IFORT.
!
!     Revision 3.28  2014/09/25 18:42:02  dugas
!     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
!
!     Revision 3.27  2014/02/05 19:57:38  dugas
!     Correction de l'appel d'erreur -1 de GEM4ATH.
!
!     Revision 3.26  2013/12/18 21:16:54  bernard
!      - Allocation dynamique du tableau PNINDEX dans les
!        routines d'interpolations verticales PRGEN et PRGZVTA.
!
!     Revision 3.25  2013/03/21 20:53:44  bernard
!     Ajouter la routine PLAGEM4.
!
!     Revision 3.24  2013/02/07 21:40:38  bernard
!     Modifucations a DSET_IGS pour GFORTRAN.
!
!     Revision 3.23  2011/01/13 19:12:12  dugas
!     Ajouter la routine DSET_IGS, une adaptation de SET_IGS/GEM v4.
!
!     Revision 3.22  2010/07/21 16:35:39  dugas
!     S'assurer que les calculs utilisent des coordonnees verticales
!      ayant la meme orientation (croissante/decroissante) quitte a
!      inverser certaines donnees a l'entree et/ou les resultats
!      a la fin (dans les routines EAPL, ELAEL, GEMAPL et PAEL).
!
!     Revision 3.21  2010/03/19 18:30:13  dugas
!     Utiliser ALLOCATE plutot que STKMEMW dans D_ROTA.
!
!     Revision 3.20  2010/02/12 22:44:21  dugas
!     Ajouter les routines principales GEM4APL (GEM4 vers Pression) et
!      GEM4ATHL (GEM4 ver Theta). On importe la routine d_P0VT2GZ_HYB
!      de GEM 3.3.2 (utilisee dans GSAPZL, mode GEM 1,2,3).
!
!     Revision 3.19  2008/04/25 20:46:44  dugas
!     Ne plus tenir compte du cas non-SQ98.
!
!     Revision 3.18  2008/02/18 18:52:56  dugas
!     Minuscule modification a D_CARTLL.
!
!     Revision 3.17  2007/12/19 18:52:23  dugas
!     Modifier le message d'erreur de grilles gaussiennes dans STRETCH_AXIS.
!
!     Revision 3.16  2007/08/29 21:24:22  dugas
!     Modifier la declaration de deg2rad_8 dans D_LLACAR.
!
!     Revision 3.15  2007/08/29 20:38:13  dugas
!     Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
!
!     Revision 3.14  2006/09/19 18:08:19  dugas
!     Modifications cosmetique de PRGZVTA.
!
!     Revision 3.13  2006/02/09 17:43:02  dugas
!     Ajouter la routine D_MERPOS utilisee par le module MERIAVG.
!
!     Revision 3.12  2005/11/22 18:39:24  dugas
!     1) Modifier le formar 1030 de D_GRIDGEF.
!     2) Definir deg2rad avec 34 decimales dans D_LLACAR.
!
!     Revision 3.11  2005/07/05 18:35:33  dugas
!     Modifier le calcul iteratif des latitudes dans la
!      fonction d_stretch_axis2 pour les grilles LAM.
!
!     Revision 3.10  2005/04/12 16:33:12  dugas
!     - Ajouter le support du mode LAM et des latitudes gaussiennes dans d_gridgef.
!     - De plus, les arguments NI,NJ et NILA peuvent maintenant etres modifies a
!       la sortie de cette derniere routine.
!     - La routine d_stretch_axis2 peut maintenant produire des grilles gaussiennes.
!     - Deplacer la routine d_llacar pour regler un irritant du loader sous AIX.
!     - Ajouter la routine d_crot2 qui retoune la matrice de rotation associee
!       a un grand cercle sur la sphere.
!
!     Revision 3.9  2004/11/08 21:06:04  dugas
!     Ajouter la routine D_ZONGINI (pour calculs zonaux sur grilles Z).
!
!     Revision 3.8  2003/10/24 21:05:48  dugas
!     Implementer du code compatible RS6000
!
!     Revision 3.7  2002/08/20 18:53:43  dugas
!     Corriger un commentaire dans ZIPIG.
!
!     Revision 3.6  2002/05/07 16:26:28  dugas
!     Imposer des bornes sur ig3 dans ZIPIG
!
!     Revision 3.5  2002/04/22 15:36:05  dugas
!     Ajouter le code associe au calcul D_GRIDGEF.
!
!     Revision 3.4  1999/11/17 18:02:20  armnrbd
!     Ajouter la routine ZIPIG (IPIG dans librairie GEM).
!
!     Revision 3.3  1998/09/23 16:14:34  armnrbd
!     Ajouter les routines GEMVRTL, GEMTRP2 et GEMDFDS.
!
!     Revision 3.2  1998/09/18  01:33:32  armnrbd
!     Modifier GEMAPL et ses sous-routines pour qu'elles fonctionnent
!     avec des coordonnees verticales croissantes ou decroissantes.
!
!     Revision 3.1  1998/07/03  20:22:35  armnrbd
!     Transferer la routine GEMAPL du deck EAPL.
!
!     Revision 3.0  1998/06/23  18:13:02  armnrbd
!     Premiere version R.DIAG.
!
!
   SUBROUTINE gemapl( FPS,LNPH,PR, LA,NPL,NSL, TOP,BOT,INC )
  
!**    June 18 1998 - B.Dugas

!**    INTERPOLATES MULTI-LEVEL SET OF GRIDS FROM
!**    GEM MODEL LEVELS TO PRESSURE LEVELS.

!**    AT THIS TIME, THE INTERPOLATION IS LINEAR IN LOG PRESSURE.
!**    CUBIC INTERPOLATION CAN BE OBTAINED BY MODIFYING THE CUBIC
!**    DATA SECTION.

!**    ALL GRIDS HAVE THE SAME HORIZONTAL SIZE ( LA POINTS ).
!**    FPS  (INPUT)  = GRIDS ON MODEL LEVELS.
!**         (OUTPUT) = GRIDS ON PRESSURE LEVELS.
!**    LNPH          = LOG OF HYDROSTATIC PRESSURE ON MODEL LEVELS.
!**    PR            = VALUES OF OUTPUT PRESSURE LEVELS (PA).
!**    TOP           = INDEX OF THE TOP MODEL LEVEL
!**    BOT           = INDEX OF THE BOTTOM MODEL LEVEL
!**    INC           = INCREMENT USED TO GO FROM TOP TO BOTTOM

      IMPLICIT none

      INTEGER  LA,NSL,NPL, TOP,BOT,INC
      REAL     FPS(1),LNPH(LA,NSL),PR(NPL)
  
!**    LOCAL FIELDS.
  
      LOGICAL, SAVE :: CUBIC=.FALSE.
      INTEGER  L,IER,BASE

      REAL,    dimension(:),allocatable :: FP,DFDLNPH

      EXTERNAL VERDER,PRGEN

!---------------------------------------------------------------------
      ALLOCATE( FP(LA*NPL),DFDLNPH(LA*NSL) )

!**    Compute derivative of F wrt log(ph)

      CALL VERDER( DFDLNPH,FPS,LNPH, 2.0,2.0, &
                   LA,1,NSL, LA,1,NSL, TOP,BOT,INC )

!**    Do the actual interpolation one level at a time.

      DO  L=1,NPL
          BASE = (L-1)*LA+1
          CALL PRGEN( FP(BASE),FPS,DFDLNPH,LNPH,PR(L), &
                      CUBIC, LA,1,NSL,LA,1,NSL, TOP,BOT,INC )
      END DO

!**    Return result in FPS.

      DO  L=1,LA*NPL
          FPS(L) = FP(L)
      END DO
          
      DEALLOCATE( FP,DFDLNPH )

      RETURN

   END SUBROUTINE gemapl

   SUBROUTINE gem4apl( F,PS, PR,ETA, NI,NJ, NPL,NSL, &
                       RLUP,RLDN, IG1,IG2,           &
                       log_pressure,calclp )

!**    INTERPOLATES MULTI-LEVEL SET OF GRIDS FROM gem4 LEVELS
!**    TO PRESSURE LEVELS. THE INTERPOLATION IS LINEAR IN LN(PRES).

!**    ALL GRIDS HAVE THE SAME HORIZONTAL SIZE ( NI*NJ POINTS ).
!**    F          =  (INPUT) GRIDS ON GEM4 LEVELS TO BE INTERPOLATED.
!**               =  (OUTPUT) INTERPOLATED GRIDS ON PRESSURE LEVELS.

!**    PS         = INPUT  GRID OF SURFACE PRESSURE IN Pa.

!**    ETA(NSL)   = INTEGER CODED GEM4 HYBRID LEVELS
!**    PR(NPL)    = PRESSURE VALUES OF OUTPUT LEVELS (Pa).
!**   ( BOTH OF THESE LAST FIELDS MUST BE MONOTONIC )

!**    RLUP       = LAPSE RATE USED TO EXTRAPOLATE ABOVE TOP ETA.
!**    RLDN       = LAPSE RATE USED TO EXTRAPOLATE BELOW BOTTOM ETA.
!**   ( THE UNITS OF RLUP,RLDN ARE  DF/D(LN PRES) )

!**    IG1,IG2    = GEM4 Grid_Desctriptors unique ID pair

!**    CALCLP     = Calulate 3D log-pressures or use the input values.

      use DIAG_TOC, only: LoPTOC

      IMPLICIT none

      LOGICAL  calclp
      INTEGER, intent(IN)    :: NI,NJ,NPL,NSL, ETA(NSL),IG1,IG2 
      REAL,    intent(IN)    :: RLUP,RLDN, PR(NPL), PS(NI,NJ)
      REAL,    intent(INOUT) :: F(NI,NJ,*)
      real,    intent(INOUT) :: log_pressure(NI,NJ,NSL)

!**    LOCAL WORK SPACE. 
  
      LOGICAL, SAVE :: MONOTON,REVERSE=.false.
      CHARACTER(15) ETA_S
      INTEGER  I,J,K,L,N, INTVL, VKIND
      INTEGER  TOPS,BOTS,INCS, TOPP,BOTP,INCP
      REAL(8)  FSC(NSL),DFDLNS(0:NSL+1),DLNS(NSL)
      REAL(8)  prlog(NPL),siglog(NSL),X
      REAL(8)  COLF(NPL),HOLD
      REAL     sig(NSL)

      real,    dimension(:,:,:), save, pointer :: my_log_pressure 
      real(8), dimension(:,:),   save, pointer :: pslog

      LOGICAL           INFO
      COMMON  /ZZVERBO/ INFO

!**    EXTERNAL DECLARATIONS.

      EXTERNAL MONVERT,XIT,CONVPR

!---------------------------------------------------------------------
      IF (.not.ASSOCIATED( pslog ))                            THEN
          nullify( pslog )
          ALLOCATE( pslog(NI,NJ) )
      END IF

      IF (calclp .and. .not.ASSOCIATED( my_log_pressure ))     THEN
          nullify( my_log_pressure )
          ALLOCATE( my_log_pressure(NI,NJ,NSL) )
      END IF

      pslog(:,:) = LOG( PS(:,:) )

!**    CHECK THAT PR IS MONOTONIC.

      CALL MONVERT( PR,NPL, TOPP,BOTP,INCP, MONOTON )

      IF (.NOT.MONOTON)                                        THEN
          IF (INFO) WRITE(6,6000) 'PRESSURE'
          CALL                                     XIT('Gem4apl',-1 )
      END IF

      prlog(:) = LOG( PR(:) ) 

!**    CHECK THAT ETA IS MONOTONIC (AND IN WHAT DIRECTION).

      DO  L=1,NSL
          CALL CONVPR( ETA(L),sig(L), VKIND,-2 )
          IF (VKIND /= 5)                                      THEN
              CALL get_ip1_string (ETA(L),ETA_S )
              IF (INFO) WRITE(6,6002) L,ETA_S
              CALL                                 XIT('Gem4apl',-2 )
          END IF
      END DO

      CALL MONVERT( sig,NSL, TOPS,BOTS,INCS, MONOTON )

      IF (.NOT.MONOTON)                                        THEN
          IF (INFO) WRITE(6,6000) 'ETA'
          CALL                                     XIT('Gem4apl',-3 )
      END IF

!**    ARE THE TWO COORDINATES IN THE SAME ORDER ?

      REVERSE = .NOT. ( (TOPS < BOTS) .EQV. (TOPP < BOTP) )

      IF (REVERSE)                                             THEN
          DO  L=1,NPL/2
              HOLD           = prlog(    L  )
              prlog(    L  ) = prlog(NPL-L+1)
              prlog(NPL-L+1) = HOLD
          END DO
          INCP =-INCP
          L    = BOTP
          BOTP = TOPP
          TOPP = L
      END IF

!**    COMPUTE LN(LOCAL PRESSURE) OF GEM4 LEVELS ?

      IF (calclp)                                              THEN
          CALL LoPTOC( my_log_pressure, ETA, PS, IG1,IG2 )
          log_pressure = my_log_pressure
      END IF

!**    LOOP OVER ALL HORIZONTAL POINTS.
  
      MAIN_LOOP : DO  J=1,NJ ; DO  I=1,NI
  
          siglog(:) = log_pressure(I,J,:) - pslog(I,J)
  
          DO  L=TOPS,BOTS-INCS,INCS
              DLNS(L) = 1.0 / (siglog(L+INCS)-siglog(L))
          END DO
  
!**        GET A COLUMN OF F (ON GEM4/ETA LEVELS).
  
          FSC(1:NSL) = F(I,J,1:NSL)
  
!**        COMPUTE VERTICAL DERIVATIVE WITH RESPECT TO
!**        LOG PRESSURE OVER ALL PRESSURE INTERVALS.
  
          DFDLNS(TOPS     ) = RLUP
          DFDLNS(BOTS+INCS) = RLDN

          DO  L=TOPS,BOTS-INCS,INCS
              DFDLNS(L+INCS) = (FSC(L+INCS)-FSC(L)) *DLNS(L)
          END DO
  
!**        LOOP OVER PRESSURE VALUES TO BE INTERPOLATED.
!**        X IS THE LN(SIGMA)=LN(PRES)-LN(PS) VALUE OF 
!**        REQUIRED PRESSURE LEVEL.
  
          K = TOPS
          DO  N=TOPP,BOTP,INCP

              X = prlog(N)-pslog(I,J)
  
!**            FIND WHICH SIGMA INTERVAL WE ARE IN.
  
              DO  L=K,BOTS,INCS
                  INTVL = L
                  IF (X.LT.siglog(L)) GOTO 100
              END DO

              INTVL = BOTS +INCS
  100         K     = INTVL-INCS

              IF (K.EQ.TOPS-INCS) K = TOPS
  
!**            NOW INTERPOLATE AT THIS POINT.
  
              COLF(N) = FSC(K)+DFDLNS(INTVL)*(X-siglog(K))

          END DO

          IF (REVERSE)                                         THEN
              DO  L=1,NPL/2
                  HOLD          = COLF(    L  )
                  COLF(    L  ) = COLF(NPL-L+1)
                  COLF(NPL-L+1) = HOLD
              END DO
          END IF

          F(I,J,1:NPL) = COLF(1:NPL)
  
      END DO ; END DO MAIN_LOOP
  
      RETURN
!-------------------------------------------------------------------- 

 6000 FORMAT('Gem4apl: ',A,' levels are not monotonous.'/)
 6002 FORMAT('Gem4apl: Level #',I3,' contains ',A/)

   END SUBROUTINE gem4apl

   SUBROUTINE gem4ath( FST,FST_PR, TEMP,TEMP_PR, TH,    &
                       NI,NJ, NSL,NSLT,NTHL, RLUP,RLDN, &
                       TOP,BOT,INC,TOPT,BOTT,INCT, OTHER )

!**    INTERPOLATES (IN PLACE) MULTI-LEVEL SETS OF GRIDS FROM GEM4 LEVELS
!**    TO THETA LEVELS.  THE INTERPOLATION IS LINEAR IN LN(THETA).
!**    HORTIZONTAL DIMENSION LA=(NI,NJ)

!**    NSL, NSLT and NTHL are the vertical dimensions
!**    of the FST,TEMP and TH fields, respectively.

!**    If OTHER is .true., FST and TEMP are NOT defined on the same
!**    set of levels. This is possible as GEM4 uses a staggered 
!**    vertical coordinates with differing momentum and
!**    thermodynamic sets of levels.

!**    FST    (LA,NSL)  = (INPUT)  GRIDS ON GEM4 T- OR M-MODEL LEVELS.
!**           (LA,NTHL) = (OUTPUT) GRIDS ON THETA LEVELS.
!**    FST_PR (LA,NSL)  = LOG OF LOCAL PRESSURES ON FST LEVELS

!**    TEMP   (LA,NSLT) = GRIDS OF TEMPERATURE ON GEM4 T-MODEL LEVELS.
!**    TEMP_PR(LA,NSLT) = LOG OF LOCAL PRESSURES ON TEMP LEVELS

!**    TH      (NTHL)   = THETA LEVELS FOR WHICH THE INTERPOLATION IS DONE.

!**    RLUP = LAPSE RATE, DF/D(LN (THETA)) USED TO EXTRAPOLATE ABOVE TOP ETA.
!**    RLUP = LAPSE RATE USED TO EXTRAPOLATE BELOW BOTTOM ETA.

!**    TOP  = INDEX OF THE TOP FST MODEL LEVEL
!**    BOT  = INDEX OF THE BOTTOM FST MODEL LEVEL
!**    INC  = INCREMENT USED TO GO FROM FST TOP TO FST BOTTOM

!**    TOPT = INDEX OF THE TOP TEMP MODEL LEVEL
!**    BOTT  = INDEX OF THE BOTTOM TEMP MODEL LEVEL
!**    INCT  = INCREMENT USED TO GO FROM TEMP TOP TO TEMP BOTTOM

      IMPLICIT    none

!**    INPUT PARAMETERS

      LOGICAL     OTHER
      REAL        RLUP,RLDN
      INTEGER     NI,NJ,NSL,NSLT,NTHL
      INTEGER     TOP,BOT,INC, TOPT,BOTT,INCT
      REAL        FST(NI,NJ,*),TEMP(NI,NJ,NSLT),TH(NTHL)
!!!   REAL,       DIMENSION(:,:,:), POINTER :: FST_PR,TEMP_PR
      REAL        FST_PR(NI,NJ,NSL),TEMP_PR(NI,NJ,NSLT)

!**    WORK SPACE.

      INTEGER     I,J,K,L,INTVL,N,MTH(0:NSLT+1),VKIND
      REAL(8)     FSC(NSLT),THS(NSLT),DFDLNTH(0:NSLT+1),DLNTH(NSLT)
      REAL(8)     DLNPR(NSL),FSP(NSL),DFDLNPR(0:NSL+1)
      REAL(8)     LTH(NTHL),TEMPC(NSLT),PRM(NSL),PRT(NSLT)

      LOGICAL              INFO, NOABORT
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZABORT/       NOABORT

      REAL(8), PARAMETER :: P0    =   100000._8
      REAL(8), PARAMETER :: KAPPA = 0.2854912_8
      REAL(8), PARAMETER :: EPSIL =  0.999999_8
      REAL(8)            :: LP0, LEPSIL

!---------------------------------------------------------------------------------
      LP0 = LOG( P0 ) ; LEPSIL = LOG( EPSIL ) ; LTH = LOG( TH )

      ! Loop over all horizontal points.

      DO J=1,NJ ; DO I=1,NI

          MTH = 0 ! Initialise inversion marker.

          TEMPC(1:NSLT) =    TEMP(I,J,1:NSLT)
            PRT(1:NSLT) = TEMP_PR(I,J,1:NSLT)
            PRM(1:NSL)  =  FST_PR(I,J,1:NSL)

         ! Compute LN( potential temperature ) on ETA levels.

      !!! THS(TOPT) = TEMP(I,J,TOPT)*(P0/TEMP_PR(I,J,TOPT))**KAPPA !!!
          THS(TOPT) = LOG( TEMPC(TOPT) ) &
                    + KAPPA * ( LP0 -  PRT(TOPT) ) 
          
          DO  L=TOPT+INCT,BOTT,INCT
          !!! THS(L) = TEMP(I,J,L)*(P0/TEMP_PR(I,J,L))**KAPPA !!!
              THS(L) = LOG( TEMPC(L) ) &
                     + KAPPA * ( LP0 -  PRT(L) )
              IF (THS(L).GE.THS(L-INCT))                       THEN
                  THS(L)      = THS(L-INCT)+LEPSIL
                  MTH(L-INCT) =     L-INCT
              END IF
          END DO

          ! Compute inverse delta ln THETA on ETA levels.

          DO  L=TOPT,BOTT-INCT,INCT
          !!! DLNTH(L) = 1./LOG( THS(L+INCT)/THS(L) ) !!!
              DLNTH(L) = 1./( THS(L+INCT) - THS(L) )
          END DO

          IF (OTHER)                                           THEN

              ! Interpolate FST from NSL M-model to NSLT T-model levels.

              FSP(1:NSL) = FST(I,J,1:NSL)

              DO  L=TOP,BOT-INC,INC
              !!! DLNPR(L) = 1./LOG( FST_PR(I,J,L+INC)/FST_PR(I,J,L) ) !!!
                  DLNPR(L) = 1./( PRM(L+INC) - PRM(L) )
              END DO

                  DFDLNPR(TOP    ) = RLUP
              DO  L=TOP,BOT-INC,INC
                  DFDLNPR(L  +INC) = (FSP(L+INC)-FSP(L))*DLNPR(L)
              END DO
                  DFDLNPR(BOT+INC) = RLDN

              K = TOP
              DO  N=TOPT,BOTT-INCT,INCT
                  DO  L=K,BOT,INC
                      INTVL=L
                      IF (PRT(N) > PRM(L)) GOTO 100
                  END DO
                  INTVL = BOT  +INC
  100             K     = INTVL-INC
                  IF (K == TOP -INC) K = TOP
                  FSC(N) =  FSP(K) + DFDLNPR(INTVL) * ( PRT(N) - PRM(L) )
                       !!! LOG( TEMP_PR(I,J,N)/FST_PR(I,J,L) ) !!!
              END DO

          ELSE

              FSC(1:NSLT) = FST(I,J,1:NSLT)

          END IF

          ! Compute vertical derivative over all ETAT intervals.

              DFDLNTH(TOPT     ) = RLUP
          DO  L=TOPT, BOTT-INCT,INCT
              DFDLNTH(L   +INCT) = (FSC(L+INCT)-FSC(L))*DLNTH(L)
          END DO
              DFDLNTH(BOTT+INCT) = RLDN
!---------------------------------------------------------------------------------

          ! loop over THETA levels to be interpolated.

          K = TOPT
          DO  N=1,NTHL

              ! Find which LOG(THETA) interval we are in.

              DO  L=K,BOTT,INCT
                  INTVL=L
                  IF (LTH(N) > THS(L)) GOTO 200
              END DO

              INTVL = BOTT +INCT
  200         K     = INTVL-INCT

              IF (K.EQ.TOPT-INCT) K = TOPT

              ! Check for inversion layers.

              IF (MTH(K).NE.0)                                 THEN
                  IF (INFO) WRITE(6,6001) I,K,TH(N),THS(K),THS(K+INCT)
                  IF (.NOT.NOABORT) CALL           XIT(' Gem4ath',-1 )
              END IF

              ! Now interpolate at this point.

            ! FST(I,J,N)  = FSC(K)+DFDLNTH(INTVL)*LOG( TH(N)/THS(K) ) !
              FST(I,J,N)  = FSC(K)+DFDLNTH(INTVL)*( LTH(N) - THS(K) )

          END DO

      END DO ; END DO

      RETURN

!-------------------------------------------------------------------- 
 6001 FORMAT(/' Gem4ath: At point ',I6,', level ',I3.3,', THETA =', &
        F11.3,' and is at an inversion on model levels.'/           &
          10X,'The log(theta) values at these levels are ',2F11.6/)

   END SUBROUTINE gem4ath

   SUBROUTINE plagem4( F,PS, PR,ETA, NI,NJ, NPL,NSL, &
                       RLUP,RLDN, IG1,IG2 )

!**    INTERPOLATES MULTI-LEVEL SET OF GRIDS FROM PRESSURE LEVELS
!**    TO gem4 LEVELS. THE INTERPOLATION IS LINEAR IN LN(PRES).

!**    ALL GRIDS HAVE THE SAME HORIZONTAL SIZE ( NI*NJ POINTS ).
!**    F          =  (INPUT) GRIDS ON PRESSURE LEVELS TO BE INTERPOLATED.
!**               =  (OUTPUT) INTERPOLATED GRIDS ON GEM4 LEVELS.

!**    PS         = INPUT GRID OF SURFACE PRESSURE IN Pa.

!**    ETA(NSL)   = INTEGER CODED GEM4 HYBRID LEVELS
!**    PR(NPL)    = PRESSURE VALUES OF OUTPUT LEVELS (Pa).
!**   ( BOTH OF THESE LAST FIELDS MUST BE MONOTONIC )

!**    RLUP       = LAPSE RATE USED TO EXTRAPOLATE ABOVE TOP ETA.
!**    RLDN       = LAPSE RATE USED TO EXTRAPOLATE BELOW BOTTOM ETA.
!**   ( THE UNITS OF RLUP,RLDN ARE  DF/D(LN PRES) )

!**    IG1,IG2    = GEM4 Grid_Desctriptors unique ID pair

      use DIAG_TOC, only: LoPTOC

      IMPLICIT none

      INTEGER, intent(IN)    :: NI,NJ,NPL,NSL, ETA(NSL),IG1,IG2 
      REAL,    intent(IN)    :: RLUP,RLDN, PR(NPL)
      REAL,    intent(INOUT) :: F(NI,NJ,*)

      REAL,    DIMENSION(:,:), POINTER :: PS

!**    LOCAL WORK SPACE. 
  
      LOGICAL, SAVE :: MONOTON,REVERSE=.false.

      CHARACTER(15) ETA_S
      INTEGER  I,J,K,L,N, INTVL, VKIND, IER
      INTEGER  TOPS,BOTS,INCS, TOPP,BOTP,INCP
      REAL(8)  FPC(NPL),DFDLNS(0:NPL+1),DLNS(NPL)
      REAL(8)  prlog(NPL),siglog(NSL),X
      REAL(8)  COLF(NSL),HOLD
      REAL     sig(NSL)

      real,    dimension(:,:,:), save, pointer :: log_pressure
      real(8), dimension(:,:),   save, pointer :: pslog

      LOGICAL           INFO
      COMMON  /ZZVERBO/ INFO

!**    EXTERNAL DECLARATIONS.

      EXTERNAL MONVERT,XIT,CONVPR

!---------------------------------------------------------------------
      IF (.not.ASSOCIATED( log_pressure ))                     THEN
          nullify( log_pressure )
          ALLOCATE( log_pressure(NI,NJ,NSL) )
      END IF

      IF (.not.ASSOCIATED( pslog ))                            THEN
          nullify( pslog )
          ALLOCATE( pslog(NI,NJ) )
      END IF      

!**    CHECK THAT PR IS MONOTONIC.

      CALL MONVERT( PR,NPL, TOPP,BOTP,INCP, MONOTON )

      IF (.NOT.MONOTON)                                        THEN
          IF (INFO) WRITE(6,6000) 'PRESSURE'
          CALL                                     XIT('Plagem4',-1 )
      END IF

      prlog(:) = LOG( PR(:) ) 

!**    CHECK THAT ETA IS MONOTONIC (AND IN WHAT DIRECTION).

      DO  L=1,NSL
          CALL CONVPR( ETA(L),sig(L), VKIND,-2 )
          IF (VKIND /= 5)                                      THEN
              CALL get_ip1_string (ETA(L),ETA_S )
              IF (INFO) WRITE(6,6002) L,ETA_S
              CALL                                 XIT('Plagem4',-2 )
          END IF
      END DO

      CALL MONVERT( sig,NSL, TOPS,BOTS,INCS, MONOTON )

      IF (.NOT.MONOTON)                                        THEN
          IF (INFO) WRITE(6,6000) 'ETA'
          CALL                                     XIT('Plagem4',-3 )
      END IF

!**    ARE THE TWO COORDINATES IN THE SAME ORDER ?

!!!   REVERSE = .NOT. ( (TOPS < BOTS) .EQV. (TOPP < BOTP) )

      IF (REVERSE)                                             THEN
          DO  L=1,NPL/2
              HOLD           = prlog(    L  )
              prlog(    L  ) = prlog(NPL-L+1)
              prlog(NPL-L+1) = HOLD
          END DO
          INCP =-INCP
          L    = BOTP
          BOTP = TOPP
          TOPP = L
      END IF

!**    ALLOCATE surface pressure WORK FIELD. THE log pressure
!**    field will be allocated by gd_levels (called by LoPTOC).

!     ALLOCATE( pslog(NI,NJ) )

!**    COMPUTE LN(LOCAL PRESSURE) OF GEM4 LEVELS.

      CALL LoPTOC( log_pressure, ETA, PS, IG1,IG2 )

!**    LOOP OVER ALL HORIZONTAL POINTS.
  
      pslog(:,:) = LOG( PS(:,:) )

      MAIN_LOOP : DO  J=1,NJ ; DO  I=1,NI
  
          siglog(:) = prlog(:) - pslog(I,J)
  
          DO  L=TOPP,BOTP-INCP,INCP
              DLNS(L) = 1.0 / (siglog(L+INCP)-siglog(L))
          END DO
  
!**        GET A COLUMN OF F (ON PRESSURE LEVELS).
  
          FPC(1:NPL) = F(I,J,1:NPL)
  
!**        COMPUTE VERTICAL DERIVATIVE WITH RESPECT TO LOG PRESSURE
!**        OVER ALL GEM4 LOCAL PRESSURE INTERVALS.
  
          DFDLNS(TOPP     ) = RLUP
          DFDLNS(BOTP+INCP) = RLDN

          DO  L=TOPP,BOTP-INCP,INCP
              DFDLNS(L+INCP) = (FPC(L+INCP)-FPC(L)) *DLNS(L)
          END DO
  
!**        LOOP OVER GEM4/ETA VALUES TO BE INTERPOLATED.
!**        X IS THE LN(SIGMA)=LN(PRES)-LN(PS) VALUE OF 
!**        REQUIRED PRESSURE LEVEL.
  
          K = TOPP
          DO  N=TOPS,BOTS,INCS

              X = log_pressure(I,J,N)-pslog(I,J)
  
!**            FIND WHICH SIGMA INTERVAL WE ARE IN.
  
              DO  L=K,BOTP,INCP
                  INTVL = L
                  IF (X.LT.siglog(L)) GOTO 100
              END DO

              INTVL = BOTP +INCP
  100         K     = INTVL-INCP

              IF (K.EQ.TOPP-INCP) K = TOPP
  
!**            NOW INTERPOLATE AT THIS POINT.
  
              COLF(N) = FPC(K)+DFDLNS(INTVL)*(X-siglog(K))

          END DO

          IF (REVERSE)                                         THEN
              DO  L=1,NSL/2
                  HOLD          = COLF(    L  )
                  COLF(    L  ) = COLF(NSL-L+1)
                  COLF(NSL-L+1) = HOLD
              END DO
          END IF

          F(I,J,1:NSL) = COLF(1:NSL)
  
      END DO ; END DO MAIN_LOOP

      IF (ASSOCIATED( log_pressure )) DEALLOCATE( log_pressure, STAT=IER )
      IF (ASSOCIATED( pslog )) DEALLOCATE( pslog, STAT=IER )
  
      RETURN
!-------------------------------------------------------------------- 

 6000 FORMAT('Plagem4: ',A,' levels are not monotonous.'/)
 6002 FORMAT('Plagem4: Level #',I3,' contains ',A/)

   END SUBROUTINE plagem4

!===================================================================
   subroutine dset_igs( F_ig1, F_ig2, F_lon,F_lat,          &
                        F_ztyp,F_zig1,F_zig2,F_zig3,F_zig4, &
                        F_ni, F_nj )

      implicit  none
      character F_ztyp
      integer   F_ni, F_nj
      real      F_lon(F_ni,F_nj),F_lat(F_ni,F_nj)
      integer   F_zig1,F_zig2,F_zig3,F_zig4
      integer   F_ig1, F_ig2

!author (set_igs)
!     Ron McTaggart-Cowan - Aug 2009 (GEM v_4.0.5)

!revision
! 001 - Adapted to be used in r.diag by B. Dugas - December 2010

!object
!     Different grid infos uniquely define a set of ig1/ig2
!     values using a cyclic redundancy check. Should replace
!     calls to the zipig subroutine

! See /home/ordenv/ssm-domains9/release/x/modelutils_1.1.0-a2/modelutils_1.1.0-a2_all/RCS_UTILS/set_igs.ftn90,v

!arguments
! F_ig1, F_ig2   O  unique IG1 and IG2 pair used to describe this GEM array
! F_ztyp         I  grid type of the positional records (E, L, N or S)
! F_ni,  F_nj    I  x,y array dimensions
! F_lon, F_lat   I  real longitudes and latitudes of the GEM array
! F_zig1,F_zig2  I  these are the four descriptors of the GEM array
! F_zig3,F_zig4  I   "       "       "       "       "       "

      ! Internal variables
      integer :: xtra=-999
      integer :: i,j,k,cnt,crc
      integer, parameter :: ELEM=5
      real, dimension(F_ni*2 + F_nj*2 + ELEM) :: identity_vec
      real, dimension(F_ni,2) :: latlon_we
      real, dimension(F_nj,2) :: latlon_sn

      ! External functions
      integer, external :: f_calc_crc,f_crc32

      ! Get lat/lon values for the horizontal grid descriptors
      latlon_we(:,1) = F_lon( :,F_nj/2 ) ;  latlon_we(:,2) = F_lat( :,F_nj/2 )
      latlon_sn(:,1) = F_lon( F_ni/2,: ) ;  latlon_sn(:,2) = F_lat( F_ni/2,: )

      ! Set unique values of ig1 and ig2 for the descriptors
      F_ig1 = -1; F_ig2 = -1

      cnt = 1
      do i=1,F_nj
         identity_vec(cnt) = latlon_sn(i,1) ; cnt=cnt+1
         identity_vec(cnt) = latlon_sn(i,2) ; cnt=cnt+1
      enddo
      do i=1,F_ni
         identity_vec(cnt) = latlon_we(i,1) ; cnt=cnt+1
         identity_vec(cnt) = latlon_we(i,2) ; cnt=cnt+1
      enddo

      ! Account for the different F_ztyp values. Note
      ! That for backward compatibility issues, xtra
      ! is not used when F_ztyp = 'E'
      if     (F_ztyp == 'L') then ; xtra = 111
      elseif (F_ztyp == 'N') then ; xtra = 555
      elseif (F_ztyp == 'S') then ; xtra = 999
      endif

      if (F_ztyp == 'E') then
         identity_vec(cnt:cnt+ELEM-2) = (/F_zig1,F_zig2,F_zig3,F_zig4/)
         cnt=cnt+ELEM-2
      else
         identity_vec(cnt:cnt+ELEM-1) = (/F_zig1,F_zig2,F_zig3,F_zig4,xtra/)
         cnt=cnt+ELEM-1
      endif

      crc = f_crc32 (0., identity_vec(1:cnt), cnt)

      ! before rmn_011 convip was bugged for 3200 < ip1 < 32768
      ! we therefore add 32768 for now
      F_ig1 = ibits(crc,0,16)  + 32768
      F_ig2 = ibits(crc,16,16) + 32768

      return
   end subroutine dset_igs
!===================================================================


!*   The following routines were originally extracted from the
!**  GEM model library in June 1998. Care should be taken to keep
!*   them in phase with the original codes. BD


!**s/r  verder - compute vertical derivative of input field with respect to
!                field frwrt

   subroutine verder( frder,  frin,   frwrt, &
                      frcon1, frcon2,        &
                      fni,    fnj,    fnk,   &
                      fnis,   fnjs,   fnks,  &
                      TOP,    BOT,    INC )

      implicit none

      integer TOP,  BOT,  INC

      integer fni,  fnj,  fnk
      integer fnis, fnjs, fnks
      real    frcon1, frcon2
      real    frder(fnis,fnjs,fnks)
      real    frin (fnis,fnjs,fnks)
      real    frwrt(fnis,fnjs,fnks)

!author
!     alain patoine - after ddsig (efr)

!revision
! v0_14 - alain patoine - initial version
! v1_00 - sylvie gravel - optimisation

!language
!     fortran 77

!object
!     see id section

!arguments
! ______________________________________________________________________
!         |                                             |           |   |
!  NAME   |             DESCRIPTION                     |DIMENSIONS |IN |
!         |                                             |           |OUT|
! --------|---------------------------------------------|-----------|---|
! frder   | derivative of the input field with respect  | 3D        | o |
!         | to log of hydrostatic pressure              |           |   |
! --------|---------------------------------------------|-----------|---|
! frin    | input field on the eta levels of the model  | 3D        | i |
! --------|---------------------------------------------|-----------|---|
! frwrt   | field w.r.t which we derive                 | 3D        | i |
! --------|---------------------------------------------|-----------|---|
! frcon1  | used for boundary conditions                | scalar    | i |
! frcon2  | used for boundary conditions                | scalar    | i |
! --------|---------------------------------------------|-----------|---|
! fni     | number of points in x-direction             | scalar    | i |
! fnj     | number of points in y-direction             | scalar    | i |
! fnk     | number of levels in z-direction             | scalar    | i |
! --------|---------------------------------------------|-----------|---|
! fnis    | field dimension in x-direction              | scalar    | i |
! fnjs    | field dimension in y-direction              | scalar    | i |
! fnks    | field dimension in y-direction              | scalar    | i |
! -----------------------------------------------------------------------

!implicits
!     none

!modules
!     none

!*
      integer i, j, k

      do k=TOP+INC,BOT,INC
         do j=1,fnj
            do i=1,fni
               frder(i,j,k) =   ( frin (i,j,k) - frin (i,j,k-INC) ) &
                              / ( frwrt(i,j,k) - frwrt(i,j,k-INC) )
            enddo
         enddo
      enddo

      do j=1,fnj
         do i=1,fni
            frder(i,j,TOP) =  frder(i,j,TOP+INC)
         enddo
      enddo

      do k=TOP+INC,BOT-INC,INC
         do j=1,fnj
            do i=1,fni
               frder(i,j,k) = &
             ((frwrt(i,j,k+INC)-frwrt(i,j,k))     * frder(i,j,k)      &
             +(frwrt(i,j,k)    -frwrt(i,j,k-INC)) * frder(i,j,k+INC)) &
             /(frwrt(i,j,k+INC)-frwrt(i,j,k-INC))
            enddo
         enddo
      enddo

      do j=1,fnj
         do i=1,fni
            frder(i,j,TOP) =   frcon1 * frder(i,j,TOP) &
                             + (1.0 - frcon1) * frder(i,j,TOP+INC)
            frder(i,j,BOT) =   frcon2 * frder(i,j,BOT) &
                             + (1.0 - frcon2) * frder(i,j,BOT-INC)
         enddo
      enddo

      return
   end subroutine verder

!**s/r prgen - interpolation (general) on a pressure level

   subroutine prgen( frout,   frin,          &
                     frderin, frlhpin,       &
                     frprout, flcubic,       &
                     fni,     fnj,     fnk,  &
                     fnis,    fnjs,    fnks, &
                     TOP,     BOT,     INC )

      implicit none

      integer TOP,  BOT,  INC

      logical flcubic
      integer fni,  fnj,  fnk
      integer fnis, fnjs, fnks
      real    frprout
      real    frout  (fnis,fnjs)
      real    frin   (fnis,fnjs,fnks)
      real    frderin(fnis,fnjs,fnks)
      real    frlhpin(fnis,fnjs,fnks)

!author
!     alain patoine - after intfev (efr)

!revision
! v0_14 - alain patoine - initial version
! v1_00 - Sylvie Gravel - optimisation
! v1_01 - alain patoine - document flcubic

!language
!     fortran 77

!object
!     see id section

!arguments
! ______________________________________________________________________
!         |                                             |           |   |
!  NAME   |             DESCRIPTION                     |DIMENSIONS |IN |
!         |                                             |           |OUT|
! --------|---------------------------------------------|-----------|---|
! frout   | output field on the required pressure level | fnis, fnjs| o |
! --------|---------------------------------------------|-----------|---|
! frprout | pressure level of output                    | scalar    | i |
! --------|---------------------------------------------|-----------|---|
! frin    | input field on the eta levels of the model  | 3D        | i |
! --------|---------------------------------------------|-----------|---|
! frderin | vertical derivative of input field with     | 3D        | i |
!         | respect to log of hydrostatic pressure      |           |   |
! --------|---------------------------------------------|-----------|---|
! frlhpin | log of hydrostatic pressure on the eta      | 3D        | i |
!         | levels of the model                         |           |   |
! --------|---------------------------------------------|-----------|---|
! flcubic | switch: true   -> cubic  interpolation      | scalar    |   |
!         |         false     linear interpolation      | scalar    |   |
! --------|---------------------------------------------|-----------|---|
! fni     | number of points in x-direction             | scalar    | i |
! fnj     | number of points in y-direction             | scalar    | i |
! fnk     | number of levels in z-direction             | scalar    | i |
! --------|---------------------------------------------|-----------|---|
! fnis    | field dimension in x-direction              | scalar    | i |
! fnjs    | field dimension in y-direction              | scalar    | i |
! fnks    | field dimension in y-direction              | scalar    | i |
! -----------------------------------------------------------------------

!modules
!     none

!*
      integer i, j, k, pnk, pnkm, err
      integer, allocatable :: pnindex(:,:)

      real    prlprso
      real    prd, pre, prr
      real    prfm0, prfm1, prfm2, prfm3, prfl2

      allocate( pnindex(fnis,fnjs), stat=err )
      prlprso = log(frprout)

      do j=1,fnj
         do i=1,fni
            pnindex(i,j) = TOP-INC
         enddo
      enddo

      do k=TOP,BOT,INC
         do j=1,fnj
            do i=1,fni
               if ( prlprso > frlhpin(i,j,k) ) pnindex(i,j) = k
            enddo
         enddo
      enddo

      do j=1,fnj
         do i=1,fni

!******************************************************************************
!                                                                             *
! If:    output pressure   <   hydrostatic pressure on the                    *
!                              first level of the model                       *
!                                                                             *
! Then:  upward extrapolation                                                 *
!                                                                             *
!******************************************************************************

            if ( pnindex(i,j) == TOP-INC ) then

               prd = prlprso - frlhpin(i,j,TOP)

               frout(i,j) = frin(i,j,TOP) + prd * frderin(i,j,TOP)

!******************************************************************************
!                                                                             *
! If:    output pressure   >   hydrostatic pressure on the                    *
!                              last level of the model                        *
!                                                                             *
! Then:  downward extrapolation                                               *
!                                                                             *
! We put in frout the value of frin on the lowest level of the model          *
!                                                                             *
!******************************************************************************

            else if (pnindex(i,j) == BOT ) then

               frout(i,j)= frin(i,j,BOT)
               
!******************************************************************************
!                                                                             *
! Else, interpolate between appropriate levels.                               *
!                                                                             *
!******************************************************************************

            else

               pnk = pnindex(i,j) + INC
               pnkm= pnindex(i,j)

               prd = frlhpin(i,j,pnk) - frlhpin(i,j,pnkm)

               pre = prlprso - 0.5 * ( frlhpin(i,j,pnk) + frlhpin(i,j,pnkm) )

               prfm0 = 0.5 * ( frin(i,j,pnk) + frin(i,j,pnkm) )

               prfm1 = ( frin(i,j,pnk) - frin(i,j,pnkm) ) / prd

               if ( flcubic ) then

                  prr = 0.125 * prd ** 2 - 0.5 * pre ** 2

                  prfm2 = ( frderin(i,j,pnk) - frderin(i,j,pnkm) ) / prd

                  prfm3 = frderin(i,j,pnk) + frderin(i,j,pnkm)
                  prfm3 = ( prfm3 - prfm1 - prfm1 ) / ( prd ** 2 )

                  prfl2 = prfm2 + 2.0 * pre * prfm3

                  frout(i,j)= prfm0 + pre * prfm1 - prr * prfl2

               else

                  frout(i,j)= prfm0 + pre * prfm1

               endif

            endif

         enddo
      enddo

      deallocate( pnindex, stat=err )

      return
   end subroutine prgen

!**S/R p0vt2gz  Compute hydrostatic GZ from P0 and VT

   subroutine p0vt2gz( frgz, freta, frp0, frpt, frvt,fni,fnj,fnk)

      implicit none

       integer fni, fnj, fnk
       real frgz(fni,fnj,fnk)
       real freta(fnk)
       real frp0(fni,fnj), frpt(fni,fnj)
       real frvt(fni,fnj,fnk)

!author - Methot/Laroche - April '97 - v1_01

!revision
! v1_01 - Andre Methot  - Initial version

!language
!       fortran 77

!object(p0vt2gz)
!       computes hydrostatic GZ from surface pressure, virtual
!       temperature over ETA or SIGMA levels.

!arguments

! ______________________________________________________________________
!         |                                             |          |   |
!  NAME   |             DESCRIPTION                     |DIMENSIONS|IN |
!         |                                             |          |OUT|
! --------|---------------------------------------------|----------|---|
! frgz    | geopotential height                         |fni,fnj,fnk o |
!         |                                             |          |   |
! freta   | list of eta/sigma levels                    | fnk      | i |
!         |                                             |          |   |
! frp0    | surface pressure                            | fni,fnj  | i |
!         |                                             |          |   |
! frpt    | TOP     pressure                            | fni,fnj  | i |
!         |                                             |          |   |
! frvt    | virtual temperature                         |fni,fnj,fnk i |
!         |                                             |          |   |
! fni     | number of grid point along x axis           | scalar   | i |
!         |                                             |          |   |
! fnj     | number of grid point along y axis           | scalar   | i |
!         |                                             |          |   |
! fnk     | number of eta/sigma levels                  | scalar   | i |
!         |                                             |          |   |
!-----------------------------------------------------------------------

!constants

!implicites
       integer, parameter :: lvmax   =  100
       real,    parameter :: grrgasd = .28705e+3

!modules

      external MATAPAST,  VTAPST
!*
      integer i,j,k
      real prcon
      real prpna(lvmax), prgz(lvmax), prvt(lvmax)
      real vma(lvmax), vmb(lvmax), vmc(lvmax)
      real vmd(lvmax), vme(lvmax), vmf(lvmax)

      prcon = -grrgasd
      do j=1,fnj
         do i=1,fni

            do k=1,fnk
               prvt(k)   = frvt(i,j,k)
               prpna(k)  = frpt(i,j) + freta(k)*(frp0(i,j) - frpt(i,j))
            enddo

            prgz(fnk)  = frgz(i,j,fnk)

            CALL MATAPAST(prpna,-1.0,fnk,VMA,VMB,VMC,VMD,VME,VMF)
            CALL VTAPST(prgz,prvt,prcon,fnk,1,VMA,VMB,VMC)

            do k=1,fnk-1
               frgz(i,j,k) = prgz(k)
            enddo

         enddo
      enddo

      return
   end subroutine p0vt2gz
   
   SUBROUTINE MATAPAST(S,ALPHA,N,VMA,VMB,VMC,VMD,VME,VMF)

!***************************************************************
!     CALCULE LES ELEMENTS DE LA MATRICE TRIDIAGONALE ASSOCIEE A LA
!     SOLUTION PAR UN ALGORITHME DU 4EME ORDRE DE L'EQUATION
!     T*S**ALPHA=D(P)/DS OU T ET P SONT DEUX FONCTIONS ECHANTILLONNEES
!     AUX N NIVEAUX SIGMA. LES MATRICES GENEREES ICI SERONT UTILISEES
!     PAR LES SUBR. VTAP ET VPAT. L'ALGORITHME EST DU A J. COTE.
!     NOTE: ON CALCULE IMMEDIATEMENT DANS LE COMMON MAPAT
!           LES COEFFICIENTS GENERES PAR LA REDUCTION GAUSSIENNE
!           LORS DU CALCUL DE T.
!     A(I),B(I),C(I): DIAG. INF., PRINC., ET SUP. DE LA MAT.
!     ALPHA         : EXPOSANT DE SIGMA.
!     N             : NOMBRE DE NIVEAUX SIGMA DU MODELE.
!     ADAPTE AU MODELE SEF PAR MICHEL BELAND, AVRIL 1984.
!     RECODAGE PAR HAL RITCHIE, JANVIER 1993.
!     MODIFIER PAR S. LAROCHE POUR L'ANALYSE REGIONALE DECEMBRE 1996.
!******************************************************************

!revision
!     v1_01     Stephane Laroche     - initial revision

      integer   N
      REAL      VMA(N), VMB(N), VMC(N)
      REAL      VMD(N), VME(N), VMF(N)
      REAL      S(N),Q(3), ALPHA

      integer   K,L,KM
      real      X0,XM,XP,AA,BB,CC,DD,DET,EX

      DO K=1,N
         X0=S(K)
         IF (K == 1) THEN
            XM=S(1)
            XP=S(2)
            AA=S(3)-X0
            BB=S(2)-X0
         ELSEIF (K == N) THEN
            XM=S(N-1)
            XP=S(N)
            AA=S(N-1)-X0
            BB=S(N-2)-X0
         ELSE
            XM=S(K-1)
            XP=S(K+1)
            AA=XM-X0
            BB=XP-X0
         ENDIF
         DO L=1,3
            EX=ALPHA+FLOAT(L)
            IF (EX /= 0.) Q(L)=(XP**EX-XM**EX)/EX
            IF (EX == 0.) Q(L)=ALOG(XP/XM)
         ENDDO
         Q(3)=Q(3)-X0*(2.0*Q(2)-X0*Q(1))
         Q(2)=Q(2)-X0*Q(1)
         CC=AA**2
         DD=BB**2
         DET=AA*DD-BB*CC
         VMA(K)=(DD*Q(2)-BB*Q(3))/(2.0*DET)
         VMC(K)=(AA*Q(3)-CC*Q(2))/(2.0*DET)
         VMB(K)=Q(1)/2.0-VMA(K)-VMC(K)
      ENDDO

!     COEFFICIENTS DE L'OPERATEUR INVERSE

      DO K=1,N
         VMD(K)=VMA(K)
         VME(K)=VMB(K)
         VMF(K)=VMC(K)
      ENDDO

      VMD(1)=VMD(1)/VMF(2)
      VME(1)=VME(1)-VMD(1)*VMD(2)
      VMF(1)=VMF(1)-VMD(1)*VME(2)
      VMF(N)=VMF(N)/VMD(N-1)
      VMD(N)=VMD(N)-VMF(N)*VME(N-1)
      VME(N)=VME(N)-VMF(N)*VMF(N-1)

      VME(1)=1.0/VME(1)
      DO K=2,N
         KM=K-1
         VMF(KM)=VMF(KM)*VME(KM)
         VME(K)=1.0/(VME(K)-VMD(K)*VMF(KM))
      ENDDO

      RETURN
      
   END SUBROUTINE MATAPAST
   
   SUBROUTINE VTAPST(PY,PR,PCON,KLEV,KILG,VMA,VMB,VMC)

!S/P VTAP:
!         CALCULE Y A PARTIR DE R PAR SOLUTION DE L'EQUATION R*CON=S**E*D(Y)
!         AVEC UN SCHEME DU 4EME ORDRE DU A J. COTE. ON DOIT FOURNIR LA COND
!         A LA LIMITE INF. Y(N). LA MATRICE MATAP A ETE CALCULEE DANS LA
!         SUBR. MATAPAT.
!         NOTE: CET ALGORITHME EST EXACTEMENT REVERSIBLE (VOIR VPAT).

! AUTHOR: MICHEL BELAND - AVRIL 1984 - ADAPTE AU MODELE SEF, AVRIL 1984.

! REVISION: LUC FILLION - AUG 94 - MODIFIED FOR VARIATIONAL ANALYSIS.
!     v1_01   Stephane Laroche   - pour analyse regional dec 96

! ARGUMENTS:
!     PY      : PRIMITIVE
!     PR      : INTEGRAND
!     PCON    : CONSTANTE
!     KLEV    : NOMBRE DE NIVEAUX SIGMA DU MODELE.
!     KILG    : NOMBRE DE LONGITUDES SUR LA GRILLE DE CALCUL.

      IMPLICIT NONE

      INTEGER  KILG, KLEV
      REAL     PY(KILG,KLEV), PR(KILG,KLEV), PCON
      real     vma(klev),vmb(klev),vmc(klev)

      INTEGER  JLON, IKLEVM2, JK, IK
      REAL     ZAK, ZBK, ZCK

!*
      ZAK = -2.0*PCON*VMA(KLEV)
      ZBK = -2.0*PCON*VMB(KLEV)
      ZCK = -2.0*PCON*VMC(KLEV)
      DO JLON = 1, KILG
         PY(JLON,KLEV-1) = ZAK * PR(JLON,KLEV-1) + ZBK * PR(JLON,KLEV) &
                         + ZCK * PR(JLON,KLEV-2) + PY(JLON,KLEV)
      ENDDO

      IKLEVM2 = KLEV-2
      DO JK = 1, IKLEVM2
         IK = KLEV-1-JK
         ZAK = -2.0*PCON*VMA(IK+1)
         ZBK = -2.0*PCON*VMB(IK+1)
         ZCK = -2.0*PCON*VMC(IK+1)
         DO JLON = 1, KILG
            PY(JLON,IK) = ZAK * PR(JLON,IK) + ZBK * PR(JLON,IK+1) &
                        + ZCK * PR(JLON,IK+2) + PY(JLON,IK+2)
         ENDDO
      ENDDO


      RETURN
   END SUBROUTINE VTAPST

!**s/r prgzvta - interpolation of geopotential and virtual temperature on a
!                pressure level

   subroutine prgzvta( frfiout, frvtout,  frprout,       &
                       frfiin,  frvtin,   frlpin,  frla, &
                       frvtund, frfiund,  fnund,         &
                       flcubic, fnlinbot,                &
                       fni,     fnj,      fnk,           &
                       fnis,    fnjs,     fnks)

      implicit none

      logical flcubic
      integer fnund, fnlinbot
      integer fni,  fnj,  fnk
      integer fnis, fnjs, fnks
      real    frprout
      real    frfiout(fnis,fnjs),      frvtout(fnis,fnjs)
      real    frfiin (fnis,fnjs,fnks), frvtin (fnis,fnjs,fnks)
      real    frlpin (fnis,fnjs,fnks), frla   (fnis,fnjs)
      real    frvtund(fnis,fnjs,fnks), frfiund(fnis,fnjs,fnks)

!author
!     alain patoine - same as prgzvtl except we introduce possibility
!                     of linear interpolation in a certain number of layers
!                     (equal to fnlinbot) close to the bottom of the model even
!                     if flcubic is .true.

!revision
! v1_02 - alain patoine - initial version

!language
!     fortran 77

!object
!     see id section

!arguments
! ______________________________________________________________________
!         |                                             |           |   |
!  NAME   |             DESCRIPTION                     |DIMENSIONS |IN |
!         |                                             |           |OUT|
! --------|---------------------------------------------|-----------|---|
! frfiout | geopotential field on the required pressure | fnis, fnjs| o |
!         | level                                       |           |   |
! frvtout | virtual temperature field on the required   | fnis, fnjs| o |
!         | pressure level                              |           |   |
! --------|---------------------------------------------|-----------|---|
! frprout | pressure level of output                    | scalar    | i |
! --------|---------------------------------------------|-----------|---|
! frfiin  | geopotential field on the eta levels of the | 3D        | i |
!         | model                                       |           |   |
! frvtin  | virtual temperature field on the eta levels | 3D        | i |
!         | of the model                                |           |   |
! frlpin  | log of hydrostatic pressure on the eta      | 3D        | i |
!         | levels of the model                         |           |   |
! --------|---------------------------------------------|-----------|---|
! frla    | geographical latitude (radian)              | fnis, fnjs| i |
! --------|---------------------------------------------|-----------|---|
! frvtund | virtual temperatures                        | fnis,fnjs,| i |
!         | for underground extrapolation               | fnks      |   |
! --------|---------------------------------------------|-----------|---|
! frfiund | geopotential levels for which virtual       | fnis,fnjs,| i |
!         | temperature is given                        | fnks      |   |
!         | for underground extrapolation               |           |   |
! --------|---------------------------------------------|-----------|---|
! fnund   | number of virtual temperature levels        | scalar    | i |
!         | for underground extrapolation               |           |   |
!         | = 0 if no underground temperature is used;  |           |   |
!         | the traditional scheme is then used         |           |   |
! --------|---------------------------------------------|-----------|---|
! flcubic | switch: true   -> cubic  interpolation      | scalar    | i |
!         |         false     linear interpolation      | scalar    |   |
! --------|---------------------------------------------|-----------|---|
! fni     | number of points in x-direction             | scalar    | i |
! fnj     | number of points in y-direction             | scalar    | i |
! fnk     | number of levels in z-direction             | scalar    | i |
! --------|---------------------------------------------|-----------|---|
! fnis    | field dimension in x-direction              | scalar    | i |
! fnjs    | field dimension in y-direction              | scalar    | i |
! fnks    | field dimension in z-direction              | scalar    | i |
! -----------------------------------------------------------------------

!notes
!   All fields in arguments are assumed to be workable on the same grid
!   (fni x fnj). This grid could be the staggered or the non staggered.

!   It is important that the data stored in frvtund and frfiund be ordered
!   in the proper manner:
!   frvtund(i,j,1) and frfiund(i,j,1) --> highest level
!   frvtund(i,j,2) and frfiund(i,j,2) --> second highest level
!   ......................................and so on

!implicits

      real, parameter :: grstlo  =.6628486583943e-3
      real, parameter :: grrgasd =.28705e+3
      real, parameter :: grpi    =.314159265359e+1

!modules
!     none

!*
      integer i, j, k, pnk, pnkm, err
      integer, allocatable :: pnindex(:,:)

      real    prlprso
      real    prd, pre, prr
      real    prfm0, prfm1, prfm2, prfm3, prfl2
      real    prl, prsmall

      integer pnund,   pn1
      real    prlptop, prvttop, prfitop
      real    prlpbot, prvtbot, prfibot

      prsmall = .001
      allocate( pnindex(fnis,fnjs), stat=err )
      prlprso = log(frprout)

      pnindex(1:fni,1:fnj) = 0

      do k=1,fnk
         do j=1,fnj
            do i=1,fni
               if ( prlprso > frlpin(i,j,k) ) pnindex(i,j) = k
            enddo
         enddo
      enddo


      do j=1,fnj
         mainloop : do i=1,fni

!******************************************************************************
!                                                                             *
! If:    output pressure   <   hydrostatic pressure on the                    *
!                              first level of the model                       *
!                                                                             *
! Then:  upward extrapolation                                                 *
!                                                                             *
!******************************************************************************

            if ( pnindex(i,j) == 0 ) then

               prd = prlprso - frlpin(i,j,1)

               frvtout(i,j) = frvtin(i,j,1) + prd &
                                            * (frvtin(i,j,1)-frvtin(i,j,2)) &
                                            / (frlpin(i,j,1)-frlpin(i,j,2))

               frfiout(i,j) = frfiin(i,j,1) - prd &
                                            * grrgasd  &
                                            * (frvtin(i,j,1) + frvtout(i,j)) &
                                            * 0.5

!******************************************************************************
!                                                                             *
! If:    output pressure   >   hydrostatic pressure on the                    *
!                              last level of the model                        *
!                                                                             *
! Then:  downward extrapolation                                               *
!                                                                             *
! The hypsometric equation is used:                                           *
!                                                                             *
!                         /    \                                              *
!                         | p  |                                              *
!                    _    |  t |                                              *
!  fi  - fi   = - R  T ln |----|                                          (1) *
!    t     b       d      | p  |                                              *
!                         |  b |                                              *
!                         \    /                                              *
!                                                                             *
!  Here the subscript t and b stand respectively for top and bottom of the    *
!  considered layer.                                                          *
!                                                dT                           *
!  We consider a constant temperature lapse rate --- = - L                    *
!                                            _   dfi                          *
!  (e.g. L = STLO) and use the definition of T:                               *
!                                                                             *
!          /                \                                                 *
!          |   fi  - fi     |                                                 *
!  _       |     t     b    |                                                 *
!  T = - L |----------------| ,                                           (2) *
!          |    / T   /   \ |                                                 *
!          | ln |  t / T  | |                                                 *
!          |    \   /   b / |                                                 *
!          \                /                                                 *
!                                                                             *
!  into expression (1) and get an expression for T :                          *
!                                                 b                           *
!               /                     \                                       *
!               |         / p   /   \ |                                       *
!  T  = T   exp | R  L ln |  b / p  | |                                   (3) *
!   b    t      |  d      \   /   t / |                                       *
!               \                     /                                       *
!                                                                             *
!  Then, we use the definition of L, to get an expression for fi :            *
!                                                               b             *
!              /         \                                                    *
!              | T  - T  |                                                    *
!              \  t    b /                                                    *
!  fi  = fi  + ----------- .                                              (4) *
!    b     t        L                                                         *
!                                                                             *
! In the case where L -> 0, we have to revert to expression (1) in which      *
!        _                                                                    *
! we use T = T .                                                              *
!             t                                                               *
!                                                                             *
! * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
!                                                                             *
! At points where we want to use underground temperatures for extrapolation,  *
! we first determine the layer bottom pressure using (3) rearranged:          *
!                                                                             *
!             /    / T   /   \ \                                              *
!             | ln |  b / T  | |                                              *
!             |    \   /   t / |                                              *
! p  = p  exp | -------------- |                                              *
!  b    t     |      R  L      |                                              *
!             |       d        |                                              *
!             \                /                                              *
!                                                                             *
! In the case where L -> 0, we have to revert to the expression (1) in which  *
!        _                                                                    *
! we use T = T .                                                              *
!             t                                                               *
!                                                                             *
! Then, if the layer bottom pressure is larger than the destination pressure, *
! we proceed with calculation (3) and (4). Otherwise, we update the variables *
! at top and bottom for next layer calculation and iterate.                   *
!                                                                             *
!******************************************************************************
            else if ( pnindex(i,j) == fnk ) then

               do pnund=1,fnund+1
                  if ( pnund > fnund )                        exit
                  if ( frfiin(i,j,fnk) > frfiund(i,j,pnund) ) exit
               enddo

               prlptop = frlpin(i,j,fnk)
               prvttop = frvtin(i,j,fnk)
               prfitop = frfiin(i,j,fnk)

               do pn1=pnund,fnund

                  prvtbot = frvtund (i,j,pn1)
                  prfibot = frfiund (i,j,pn1)

                  if ( abs(prvtbot-prvttop) <= prsmall ) then

                     prlpbot = prlptop &
                             + (prfitop-prfibot)/(grrgasd*prvttop)

                     if ( prlpbot >= prlprso ) then

                        frvtout(i,j) = prvttop
                        frfiout(i,j) = prfitop &
                                     + grrgasd*prvttop*(prlptop-prlpbot)

                        cycle mainloop

                     endif

                  else

                     prl     = - ( prvttop - prvtbot ) &
                             /   ( prfitop - prfibot )
                     prlpbot = prlptop + (log(prvtbot/prvttop)) &
                                       /     (grrgasd*prl)

                     if ( prlpbot >= prlprso ) then

                        frvtout(i,j) = prvttop * exp ( &
                                       grrgasd * prl * (prlprso-prlptop))
                        frfiout(i,j) = prfitop + (prvttop-frvtout(i,j)) / prl

                        cycle mainloop

                     endif

                  endif

                  prlptop = prlpbot
                  prvttop = prvtbot
                  prfitop = prfibot

               enddo

               if ( abs (frla(i,j)*180./grpi) >= 49.0 ) then

                  prl = .0005

               else

                  prl = grstlo

               endif

               frvtout(i,j) = prvttop * exp( grrgasd * prl * (prlprso-prlptop) )
               frfiout(i,j) = prfitop + (prvttop-frvtout(i,j)) / prl

!******************************************************************************
!                                                                             *
! Else, interpolate between appropriate levels                                *
!                                                                             *
!******************************************************************************
            else

!        **********************************************************************
!        *                                                                    *
!        * NOTE ABOUT "fnlinbot"                                              *
!        *             --------                                               *
!        *                                                                    *
!        * this parameter is used to force a linear interpolation in a        *
!        * certain number of layers (equal to fnlinbot) close to the bottom   *
!        * of the model even if flcubic is .true.                             *
!        *                                                                    *
!        * it has no effect if flcubic is .false.                             *
!        *                                                                    *
!        **********************************************************************

               pnkm = pnindex(i,j)
               pnk  = pnindex(i,j) + 1

               prd = frlpin(i,j,pnk) - frlpin(i,j,pnkm)

               pre = prlprso - 0.5 * ( frlpin(i,j,pnk) + frlpin(i,j,pnkm) )

               if ( flcubic .and. ( pnk < fnk+1-fnlinbot ) ) then

                  prr = 0.125 * prd ** 2 - 0.5 * pre ** 2

                  prfm0 = 0.5 * ( frfiin(i,j,pnk) + frfiin(i,j,pnkm) )

                  prfm1 = ( frfiin(i,j,pnk) - frfiin(i,j,pnkm) ) / prd

                  prfm2 = - grrgasd * ( frvtin(i,j,pnk) - frvtin(i,j,pnkm) ) / prd

                  prfm3 = - grrgasd * ( frvtin(i,j,pnk) + frvtin(i,j,pnkm) )
                  prfm3 = ( prfm3 - prfm1 - prfm1 ) / ( prd ** 2 )

                  prfl2 = prfm2 + 2.0 * pre * prfm3

                  frfiout(i,j)= prfm0 + pre * prfm1 - prr * prfl2

                  frvtout(i,j) = prfm1 + pre * prfl2 - 2.0 * prr * prfm3
                  frvtout(i,j) = - frvtout(i,j) / grrgasd

               else

                  prfm0 = 0.5 * ( frfiin(i,j,pnk) + frfiin(i,j,pnkm) )

                  prfm1 = ( frfiin(i,j,pnk) - frfiin(i,j,pnkm) ) / prd

                  frfiout(i,j)= prfm0 + pre * prfm1

                  prfm0 = 0.5 * ( frvtin(i,j,pnk) + frvtin(i,j,pnkm) )

                  prfm1 = ( frvtin(i,j,pnk) - frvtin(i,j,pnkm) ) / prd

                  frvtout(i,j)= prfm0 + pre * prfm1

               endif

            endif

         enddo mainloop
      enddo

      deallocate( pnindex, stat=err )

      return

   end subroutine prgzvta
   SUBROUTINE gemdfds( G, F, HR, N, ALFA, BETA, TOP,BOT,INC )

!     (ancien DFDS: CALCULATES THE FIRST DIFFERENCE G OF A
!                   FUNCTION F AT UNEVENLY SPACED POINTS)

      implicit none

      INTEGER N, TOP,BOT,INC 
      REAL    G(N), F(N), HR(N)
      REAL    ALFA, BETA

!AUTHOR    -       INCONNU

!REVISION  001     G.VERNER   NOV 86, REFONTE DU EFR POUR CRAY X-MP
!          002     B.Dugas    SEP 98, Ajouter TOP,BOT,INC 

!ARGUMENTS
!   OUT    - G     - RESULT
!   IN     - F     - FUNCTION TO BE DIFFERENCED
!          - HR    - INVERSE OF THE INTERVAL LENGTHS
!          - ALFA  - USED FOR BOUNDARY CONDITIONS 
!          - BETA  - USED FOR BOUNDARY CONDITIONS 
!          - N     - DIMENSION (NUMBER OF POINTS) 
!          - TOP   - INDEX OF THE TOP MODEL LEVEL
!          - BOT   - INDEX OF THE BOTTOM MODEL LEVEL
!          - INC   - INCREMENT USED TO GO FROM TOP TO BOTTOM

!NOTES     - GIVEN A FUNCTION F AT N UNEVENLY SPACED POINTS, THIS ROUTINE
!          - CALCULATES ITS FIRST DIFFERENCE G AT THESE POINTS.
!          - HR MUST CONTAIN THE INVERSE OF THE INTERVAL LENGTHS.
!          - BOUNDARY CONDITIONS SPECIFIED BY ALFA,BETA, (SEE BELOW). 
!*
      INTEGER I, BM, TP
      REAL    A

      BM = BOT-INC
      TP = TOP+INC

      DO I=TOP,BM,INC
         G(I+1) = HR(I)*(F(I+INC)-F(I))
      ENDDO

      A = G(TP)

      DO I=TP,BM,INC
         G(I) = (HR(I)*G(I+INC)+HR(I-INC)*G(I))/(HR(I)+HR(I-INC))
      ENDDO

!     BOUNDARIES
      G(TOP) = ALFA*A     +(1.-ALFA)*G(TP)
      G(BOT) = BETA*G(BOT)+(1.-BETA)*G(BM)

      RETURN

   END SUBROUTINE gemdfds 
   SUBROUTINE gemtrp2( FX, GX, X, F, G, Y, NN, RLAPSE,TOP,BOT,INC )

!**   (ancien TERP2: parametres TOP,BOT,INC ont ete ajoutes)

      implicit none

      INTEGER NN, TOP,BOT,INC 
      REAL    FX ,GX ,X, F(NN), G(NN), Y(NN), RLAPSE

!     * GIVEN A FUNCTION F AND ITS FIRST DERIVATIVE G AT A SET OF NN
!     *   UNEVENLY SPACED POINTS Y, THIS ROUTINE CALCULATES FX AND GX,
!     *   THE VALUES OF F AND G AT THE SPECIFIED POINT X.

!     * RLAPSE IS A LAPSE RATE USED FOR EXTRAPOLATING.
!     * EXTRAPOLATION

      INTEGER N
      REAL    FA, GA, A, FM0, FM1, FM2, FM3, D, E, R, FB, GB, B, FL0, FL1, FL2

      IF(X <= Y(TOP)) THEN 
         GX = G(TOP)
         FX = F(TOP)+(X-Y(TOP))*G(TOP)
      ELSEIF(X >= Y(BOT)) then
         GX = G(BOT)+(X-Y(BOT))*RLAPSE
         FX = F(BOT)+.5*(X-Y(BOT))*(GX+G(BOT))
      ELSE
!        INTERPOLATION
!        GIVEN FA,FB,GA AND GB THE VALUES OF F AND G AT POINTS A AND B 
!        RESPECTIVELY, THIS CUBIC INTERPOLATION ALGORITHM GIVES FX AND
!        GX THE VALUES OF THE FUNCTIONS F AND G AT THE INTERMEDIATE POI
         DO N=TOP+INC,BOT,INC
            IF (X < Y(N)) THEN
               FA  = F(N-INC)
               FB  = F(N)
               GA  = G(N-INC)
               GB  = G(N)
               A   = Y(N-INC)
               B   = Y(N)
               D   = B-A
               E   = X-.5*(A+B)
               R   = .125*D*D-.5*E*E
               FM0 = .5*(FA+FB)
               FM1 = (FB-FA)/D 
               FM2 = (GB-GA)/D 
               FM3 = (GB+GA-FM1-FM1)/(D*D) 
               FL2 = FM2+2.*E*FM3
               FL1 = FM1+E*FL2 
               FL0 = FM0+E*FM1 
               FX  = FL0-R*FL2
               GX  = FL1-2.*R*FM3
               RETURN
            ENDIF
         ENDDO
      ENDIF

      RETURN

   END SUBROUTINE gemtrp2
   SUBROUTINE gemvrtl( F, PS, TOPP, NP, ETA, NK , LNA, LV, LAPSE, FDCOL, SD,  FCOL, TOP,BOT,INC )

!     (ancien VRTICAL: INTERPOLATION VERTICALE LES COMPOSANTES DU VENT)

      implicit none

      LOGICAL LAPSE 
      INTEGER LV, NK , NP, TOP,BOT,INC 
      REAL    F(NP,*), LNA(LV), ETA(NK ), PS(NP), TOPP(NP), FDCOL(*), SD(*), FCOL(*)

!AUTEUR M.VALIN DRPN MAI 1987 
!Modifie le 21 septembre 1998: ajouter TOP,BOT,INC et supposer que
! (Bernard Dugas)              TOPP et PS,LNA sont en pascal et LN(pascal).

!LANGUAGE FTN 77

!ARGUMENTS
!  ENTREE  - F     -  CHAMP A INTERPOLER........................F(NP,LV)
!  SORTIE  - F     -  RESULTAT INTERPOLE VERTICALEMENT..........F(NP,NK)
!  ENTREE  - PS    -  LOG. DE PS..................................PS(NP)
!     "    - TOPP  -  LOG. DE PRESSION AU TOIT..................TOPP(NP)
!     "    - NP    -  DIMENSION HORIZONTALE DE F, PS, TOPP, LNA
!     "    - ETA   -  NIVAUX DE SORTIE...........................ETA(NK)
!     "    - NK    -  NOMBRE DE NIVAUX DE SORTIE
!     "    - LNA   -  LOG. NIVEAUX D'ANALYSE.....................LNA(LV)
!     "    - LV    -  NOMBRE DE NIVAUX D'ENTREE
!     "    - LAPSE -  LOGICAL SWITCH, IF .FALSE. USE ZERO LAPSE RATE
!     "    - TOP   -  INDEX OF THE TOP MODEL LEVEL
!     "    - BOT   -  INDEX OF THE BOTTOM MODEL LEVEL
!     "    - INC   -  INCREMENT USED TO GO FROM TOP TO BOTTOM
!  SORTIE  - FDCOL -  CHAMP DE TRAVAIL......................FDCOL(LVMAX)
!     "    - SD    -  CHAMP DE TRAVAIL.........................SD(LVMAX)
!     "    - DCOL  -  CHAMP DE TRAVAIL.......................FCOL(LVMAX)

!MODULES
      EXTERNAL GEMDFDS, GEMTRP2
!*
      REAL     FLAPSE, DUMMY, XLAPSE, XLNP
      INTEGER  I, L

      IF( LAPSE ) THEN
         XLAPSE = 1.0
      ELSE
         XLAPSE = 0.0
      ENDIF

      DO 10 L=TOP,BOT-INC,INC
         SD(L) = 1.0/(LNA(L+INC)-LNA(L))
10       CONTINUE
  
      DO I=1,NP 

         DO L=TOP,BOT,INC
            FCOL(L) = F(I,L)
         ENDDO

         CALL GEMDFDS(FDCOL, FCOL, SD, LV, 1.0, 1.0, TOP,BOT,INC )
         FDCOL(TOP) = 0.
         FLAPSE   = (FDCOL(LV)-FDCOL(LV-INC))*SD(LV-INC)*XLAPSE
  
         DO L=1,NK
            XLNP = ALOG( ETA(L) * EXP( PS(I) ) + &
                         ( 1.0 - ETA(L) ) * EXP( TOPP(I) ) )
            CALL GEMTRP2(F(I,L), DUMMY, XLNP, FCOL, FDCOL, LNA, LV, &
                       FLAPSE, TOP,BOT,INC )
         ENDDO

      ENDDO

      RETURN

   END  SUBROUTINE gemvrtl
   subroutine zipig( F_ig1, F_ig2, F_ig3, F_dxla, F_dyla, F_nila, &
                     F_njla, F_ni, F_nj, F_rot_8, F_tourn_L)

       implicit none

       integer F_ig1, F_ig2, F_ig3
       real    F_dxla, F_dyla
       real(8) F_rot_8(3,3)
       integer F_nila, F_njla, F_ni, F_nj
       logical F_tourn_L

!author A. Methot  - cmc  - dec 1995 - v0_17

!revision
! v2_00 - Lee V.            - initial MPI version (from ipig v1_03)
! v2_21 - J. P. Toviessi    - new grid descriptors algorithm to free
! v2_21                       third grid descriptor.
! v2_30 - Dugas B.          - use real*8 rotation matrix

!object
!       Initialize the basic grid descriptors.
!       These grid descriptors are constructed from the 
!       grid specifications.

!arguments
!  Name        I/O                 Description
!----------------------------------------------------------------
! F_ig1        O    - first grid descriptor
! F_ig2        O    - second grid descriptor
! F_ig3        O    - third grid descriptor
! F_dxla       I    - distance in x between grid points in the uniform
!                                             resolution part of the grid
! F_dyla       I    - distance in y between grid points in the uniform
!                                             resolution part of the grid
! F_nila       I    - number of points on x for the uniform part of the grid
! F_njla       I    - number of points on y for the uniform part of the grid
! F_ni         I    - total number of points along x for the whole grid
! F_nj         I    - total number of points along y for the whole grid
! F_rot_8(3,3) I    - rotation matrix
! F_tourn_L    I    - .true. if grid is rotated

!     
!notes
!     F_ig1 is the heart resolution in tenth of kilometers
!     F_ig2 stands from 0 to 1000 if the grid is variable
!                  from 1000 to ..., if the grid is uniform

      F_ig1 = nint( ( F_dxla + F_dyla) * 0.5 * 1112. )
      if ( F_ig1 .ge. 2000 ) then
           F_ig1 = 2000 + nint( ( F_dxla + F_dyla) * 0.5 )
      endif

      if ( F_tourn_L ) then
         F_ig2 = nint( 100.* &
                        ( F_rot_8(1,1)+F_rot_8(1,2)+F_rot_8(1,3)+ &
                          F_rot_8(2,1)+F_rot_8(2,2)+F_rot_8(2,3)+ &
                          F_rot_8(3,1)+F_rot_8(3,2)+F_rot_8(3,3) ) )
         F_ig2 = iabs(F_ig2)
      else
         F_ig2 = 0
      endif

      if ((F_ni.eq.F_nila).and.(F_nj.eq.F_njla)) F_ig2 = F_ig2 + 1000
      F_ig3 = max( 0, min( 268435455, F_ig3 ) )

      return

   end subroutine zipig

!===================================================================
!===================================================================

!**  The following routines are adapted from the GEM/DM v2.3.1 library
!    and compute the parametres associated with the scalar GEM grid.

   SUBROUTINE D_GRIDGEF( X,Y,lon,lat, GXTYP,IG1,IG2,IG3,IG4,NI,NJ,NILA,NJLA, &
                         ROT_8,XLON1,XLAT1,XLON2,XLAT2,ROULE_L,DXLA,DYLA, &
                         dxmax,dymax,grid_S,IREF,JREF,LONR,LATR )

      implicit none

      character*1 gxtyp
      character * (*) grid_S
      INTEGER IG1,IG2,IG3,IG4
      INTEGER NI,NJ,NILA,NJLA
      REAL    LAT(1),LON(1), X(1),Y(1)
      REAL(8) ROT_8(3,3)
      LOGICAL ROULE_L
      REAL    XLON1(1),XLAT1(1),XLON2(1),XLAT2(1)
      REAL    DXLA,DYLA,dxmax,dymax
      INTEGER IREF,JREF
      REAL    LONR,LATR

!AUTEUR     M. ROCH - MARS 90 - A PARTIR DE GRID

!revision
! v2_30 - A. Methot              - introduction of a new stretch grid design
! v2_30 -                          with upper limits on grid point spacing      
! v???? - bernard dugas          - adaptation a r.diag
! v???? - bernard dugas          - 1) add LAM mode and GAUSSIAN latitudes options
!                                     via a modification to grid_S
!                                  2) NI,NJ and NILA may be modified on output

!OBJET
!	compute the grid of the model. The grid generated
!	is an Arakawa "C" grid. All of the U- and V-grid
!       code has been removed in the diagnostic version

!ARGUMENTS
!______________________________________________________________________
!                    |                                                 |
! NAME               | DESCRIPTION                                     |
!--------------------|-------------------------------------------------|
! INPUT  only                                                          |
!--------------------|-------------------------------------------------|
! GXTYP              | grid type for the positional records            |
! NJLA               | # of points in y of the high resolution domain  |
! ETIK               | Label for the model run to be saved in RPN files|
! ROULE_L            | if  .TRUE., rotate the system coordinates       |
!                    | if  .FALSE. do not rotate the system coordinates|
! dxmax              | maximum grid point spacing along x (degrees)    |
! dymax              | maximum grid point spacing along y (degrees)    |
! grid_S             | grid type ('U', 'V' or 'PHI'), as well as LAM or|
!                    | GAUSSIAN latitudes. These last two options are  |
!                    | set by adding either an L or G, as the first    |
!                    | character in grid_S, respectively (i.e. LU, GU) |
!--------------------|-------------------------------------------------|
! LAM mode only                                                        |
!--------------------|-------------------------------------------------|
! iref               | position of reference point in x in [1,NI]      |
! jref               | position of reference point in y in [1,NJ]      |
! lonr               | longitude of reference point                    |
! latr               | latitude of reference point                     |
!--------------------|-------------------------------------------------|
! OUTPUT only                                                          |
!--------------------|-------------------------------------------------|
! X(NI)              | longitudes in the non-rotated coordinate system |
! Y(NJ)              | latitudes in the non-rotated coordinate system  |
! LON(NI*NJ)         | if ROULE_L=true, LONGITUDES in the rotated      |
!                    | coordinate system, else LON=X                   |
! LAT(NI*NJ)         | if ROULE_L=true, LATITUDES  in the rotated      |
!                    | coordinate system, else LAT=Y                   |
! IG1                | ig1 grid descriptor for the positional record   |
! IG2                | ig2 grid descriptor for the positional record   |
! IG3                | ig3 grid descriptor for the positional record   |
! IG4                | ig4 grid descriptor for the positional record   |
! ROT_8              | cartesian rotation matrix                       |
!--------------------|-------------------------------------------------|
! INPUT and OUTPUT                                                     |
!--------------------|-------------------------------------------------|
!  NI                | number of points in x for the grid              |
!  NJ                | number of points in y for the grid              |
!  NILA              | # of points in x of the high resolution domain  |
!  XLON1             | geographic longitude of the center of the       |
!                    | computational domain when ROULE_L= .true.       |
!  XLAT1             | geographic latitude of the center of the        |
!                    | computational domain when ROULE_L= .true.       |
!  XLON2             | geographic latitude of a point on the equator of|
!                    | the computational domain when ROULE_L= .true.   |
!  XLAT2             | geographic latitude of a point on the equator of|
!                    | the computational domain when ROULE_L= .true.   |
!  DXLA              | resolution of the high resolution (constant)    |
!                    | domain in x                                     |
!  DYLA              | resolution of the high resolution (constant)    |
!                    | domain in y                                     |
!----------------------------------------------------------------------

!MODULES
      integer, EXTERNAL :: d_stretch_axis2

!*

!--------------------|-------------------------------------------------|
! INTERNAL SCALARS                                                     |
!--------------------|-------------------------------------------------|
! X0                 | longitude of the point at the lower left corner |
!                    | of the domain                                   |
! Y0                 | latitude of the point at the lower left corner  |
!                    | of the domain                                   |
! X0LA               | same as X0 but for region at constant resolution|
! Y0LA               | same as Y0 but for region at constant resolution|
! XL                 | length of the computational domain in x         |
! YL                 | length of the computational domain in y         |
! MLEFT              | number of points to the left of the high        |
!                    | resolution domain                               |
! MBOT               | number of points to the bottom of the high      |
!                    | resolution domain                               |
! debug_L            | logical debug information printing flag         |
!--------------------|-------------------------------------------------|

      REAL(8)            R_8
      COMMON / D_RMAT  / R_8(3,3)

      logical debug_L,lam_L,gauss_L
      character*4 ogrid_S
      REAL*8, dimension (:), allocatable :: x_8,y_8,xdec_8,ydec_8
      integer nimax, njmax,njo,nijmax
      INTEGER MLEFT,MBOT,niu,njv
      INTEGER I,J,IJ, ier,ierx,iery
      REAL R1,R2,S1,S2
      REAL X0,Y0,XL,YL
      REAL X0LA,Y0LA
      REAL XLON0(1),XLAT0(1)

      LOGICAL       DEBUG
      COMMON     /ZZDEBUG/ DEBUG
!----------------------------------------------------------------------

      gauss_L = .false.
      lam_L   = .false.
      debug_L =  DEBUG

      ogrid_S = grid_S

!  check for lam configuration and define
!  grid dimension for the U- and V-grids

      if (ogrid_S(1:1).eq.'L') then
         lam_L = .true.
         ogrid_S = ogrid_S(2:4)
      else if (ogrid_S(1:1).eq.'G') then
         gauss_L = .true.
         ogrid_S = ogrid_S(2:4)
      endif

      if (.not.lam_L) then
         ni = ni+1
         if ( ni.eq.nila+1) nila = nila+1
      endif

      if (lam_L) then
         x0   = lonr - (iref-1) * dxla
         y0   = latr - (jref-1) * dyla
         xl   = x0   + (ni  -1) * dxla
         yl   = y0   + (nj  -1) * dyla
         if (x0 < 0.) x0=x0+360.
         if (xl < 0.) xl=xl+360.
         if ( (x0 <   0.).or.(y0 < -90.)   .or. &
              (xl > 360.).or.(yl >  90.) ) then
            write (6,1003) x0,y0,xl,yl
            call                                   xit('D_gridgef',-3 )
         endif
      else
         X0 =   0.0
         Y0 = -90.0
         XL = 360.0
         YL =  90.0
      endif

      niu = ni
      njv = nj

      if (ogrid_S.eq.'U' .and. lam_L) niu = ni-1
      if (ogrid_S.eq.'V')             njv = nj-1

!  reset xlon1, xlat1, xlon2, xlat2 if not rotated grid

      write(6,1001) ogrid_S

!  allocate real*8 arrays

      allocate( x_8(NI+2),xdec_8(NI+2),y_8(NJ+2),ydec_8(NJ+2) )

      if (.not.(ROULE_L .or. lam_L)) then
         xlon1=180.
         xlat1=0.
         xlon2=270.
         xlat2=0.
      endif

!	compute descriptors of the PHI grid

      write(6,'(/'' INITIAL VALUES OF ROTATION PARAMETERS'')')
      write(6,'('' XLAT1,XLON1,XLAT2,XLON2 = '',4f12.6)') &
                   xlat1,xlon1,xlat2,xlon2

      call cxgaig(gxtyp,IG1,IG2,IG3,IG4,xlat1,xlon1,xlat2,xlon2 )
      call cigaxg(gxtyp,xlat1,xlon1,xlat2,xlon2,IG1,IG2,IG3,IG4 )

      write(6,'(/'' AJUSTED VALUES OF ROTATION PARAMETERS'')')
      write(6,'('' XLAT1,XLON1,XLAT2,XLON2 = '',4f12.6,/)') &
                   xlat1,xlon1,xlat2,xlon2

!	compute x and y positions grid

      ierx= d_stretch_axis2( x_8, dxla, x0, xl, mleft, ni,nila, r1, &
                          .false., debug_L, dxmax, nimax, gauss_L )

      if (ierx /= 0) then
          write(6,*)' ERROR in generating X axis!!! ABORT!!!!'
          call                                     xit('D_gridgef',-1 )
      endif

      if (lam_L) then

         iery= d_stretch_axis2( y_8, dyla, y0, yl, mbot,  nj,njla, s1, &
                             .false., debug_L, dymax, njmax, gauss_L )

      else
 
          iery= d_stretch_axis2( y_8, dyla, y0, yl, mbot, nj,njla, s1, &
                              .true., debug_L, dymax, njmax, gauss_L )

      endif

      if (iery /= 0) then
          write(6,*)' ERROR in generating Y axis!!! ABORT!!!!'
          call                                     xit('D_gridgef',-2 )
      endif

!	expansion coefficients are equal on both sides
!	of the constant resolution window in both directions

      r2 = r1
      s2 = s1

!       convert from real*8 to real values

      do i=1,ni
         x(i)=x_8(i)
      enddo
      do j=1,nj
         y(j)=y_8(j)
      enddo

      if (ogrid_S.eq.'U' .or. ogrid_S.eq.'V') then

!        compute the staggered positions for U and V grids

         call d_decal( x_8, y_8, xdec_8, ydec_8, ni, nj, niu, njv )

         if (ogrid_S.eq.'U') then
            ni = niu
            do i=1,ni
               x(i) = xdec_8(i)
            enddo
         else if (ogrid_S.eq.'V') then
            nj = njv
            do j=1,njv
               y(j) = ydec_8(j)
            enddo
         endif

      endif

      deallocate( x_8, y_8, xdec_8, ydec_8 )

!     adjust grid parameters

        X0= x(1)
        Y0= y(1)
        XL= x(ni)-X0
        YL= y(nj)-Y0
        X0LA=  180. - ((FLOAT(NILA)-1.)*DXLA) /2.
        Y0LA=       - ((FLOAT(NJLA)-1.)*DYLA) /2.

      write(6,1020) NI,XL,NJ,YL,X0,Y0,XLON1,XLAT1
      write(6,1025) NILA,DXLA,NJLA,DYLA,X0LA,Y0LA

      i = ni-nila-mleft
      j = nj-njla-mbot

      write(6,1030) mleft,r1,i,r2,mbot,s1,j,s2
      if ( nimax > 0 ) write(6,1035) dxmax, nimax
      if ( njmax > 0 ) write(6,1036) dymax, njmax


!  Calculate the latitudes and longitudes of the original grid
!  on the earth

      IF(ROULE_L) THEN

!       (if rotated coordinate system...)

         CALL D_ROTA( LON,LAT,X,Y, XLON1,XLAT1,XLON2,XLAT2, &
                      XLON0,XLAT0, NI,NJ  )

         write(6,1037) XLON0,XLAT0

!  Normalize the longitudes between 0 and 360 degrees

         IJ = 1
         do j=1,NJ
            do i=1,NI
              LON(IJ) = MOD(LON(IJ)+360.0,360.0)
              IJ = IJ+1
            enddo
         enddo

      ELSE

!       (if NOT rotated coordinate system...)
!        Assign the latitudes and longitudes of the original grid
!        for the Phi grid, Ugrid and Vgrid, and normalize all the
!        longitudes.

         XLON0=0.0
         XLAT0=90.

         IJ = 1
         do j=1,NJ
            do i=1,NI
               LON(IJ) = MOD(X(I)+360.0,360.0)
               LAT(IJ) = Y(J)
               IJ = IJ+1
            enddo
         enddo

      ENDIF

      do j=1,3
         do i=1,3
            rot_8(i,j) = r_8(i,j)
         enddo
      enddo

      RETURN

!----------------------------------------------------------------------
 1001 format(//' COMPUTATION OF THE ',A,' GEM GRID'/' ==============================='/)
 1003 format(/,' WRONG LAM GRID CONFIGURATION --- ABORT ---'/, &
               ' Grd_x0,Grd_y0,Grd_xl,Grd_yl:'/4f10.3/)
 1020 FORMAT(' *** FINAL VALUES ***'//' THE HORIZONTAL GRID HAS NI=',I4,            &
             ' POINTS IN THE X-DIRN IN A LENGTH OF XL=',F9.2,' DEGREES'/            &
             '  NJ=',I4,' POINTS IN THE Y-DIRN IN A LENGTH OF YL=',F9.2,' DEGREES'/ &
             '  WITH LOWER LEFT CORNER AT (X0,Y0)=',2F10.2,' DEGREES'//             &
             '  CENTRAL POINT OF THE GRID  (XLON1,XLAT1)=',2F10.2,' DEGREES'/)
1025  FORMAT(' THE LIMITED AREA PORTION HAS'/ &
             '  NILA=',I4,' POINTS IN THE X-DIRN WITH A GRID-LENGTH OF DXLA=',F6.2,' DEGREES'/ &
             '  NJLA=',I4,' POINTS IN THE Y-DIRN WITH A GRID LENGTH OF DYLA=',F6.2,' DEGREES'/ &
             '  WITH LOWER LEFT CORNER AT (X0LA,Y0LA)=',2F9.2,' DEGREES'/)
1030  FORMAT(' FEATURES OF VARIABLE MESH PORTION.'/ &
             ' SIDE  ',10X, 'NO.OF POINTS',10X,'OUTWARD AMPLIFICATION FACTOR FOR HX OR HY'/ &
             ' LEFT  ',13X,I4,36X,F6.3/' RIGHT ',13X,I4,36X,F6.3/ &
             ' BOTTOM',13X,I4,36X,F6.3/' TOP   ',13X,I4,36X,F6.3)
 1035  FORMAT(/' THE HORIZONTAL RESOLUTION IS LIMITED TO ',F6.3, &
              ' DEGREES OVER ', I4, ' POINTS AT EACH ENDS OF THE X AXIS.')
 1036  FORMAT(' THE HORIZONTAL RESOLUTION IS LIMITED TO ',F6.3, &
              ' DEGREES OVER ', I4, ' POINTS AT EACH ENDS OF THE Y AXIS.')

 1037  FORMAT(/' The position of the rotated POLE is LON0 = ',F9.2,' LAT0 = ',F9.2/)

   END SUBROUTINE D_GRIDGEF

!**s/r d_decal - computation of the staggered positions for wind and/or
!              divergence

   SUBROUTINE d_decal( F_x_8,F_y_8,F_xdec_8,F_ydec_8,fni, fnj, fniu, fnjv )

      IMPLICIT none

      integer fni, fnj, fniu, fnjv
      real(8) F_x_8(fni), F_y_8(fnj), F_xdec_8(fniu), F_ydec_8(fnjv)

!auteur jean cote - 1991 (decal)

!revision
! v0_11 - michel roch            - monotonous distribution of the staggered grid
! v1_96 - Lee V.                 - added fniu,fnjv in the calling sequence
! v2_20 - Lee V.                 - x,y,xdec,ydec converted to real*8
! v???? - bernard dugas          - adaptation a r.diag
 
!object
!     see above id

!arguments

!______________________________________________________________________
!                    |                                                 |
! NAME               | DESCRIPTION                                     |
!--------------------|-------------------------------------------------|
! F_x_8              | position of grid points in x direction (deg)    |
! F_y_8              | position of grid points in y direction (deg)    |
! F_xdec_8           | staggered position of grid points in x direction|
!                    | in degrees                                      |
! F_ydec_8           | staggered position of grid points in y direction|
!                    | in degrees                                      |
! fni                | # of grid points in x direction for Phi grid    |
! fnj                | # of grid points in y direction for Phi grid    |
! fniu               | # of grid points in x direction for U grid      |
! fnjv               | # of grid points in y direction for V grid      |
!----------------------------------------------------------------------

!note: the list of points in the x direction must be in degree 

!*
      real(8) dum
      integer i
!______________________________________________________________________

      if (fni == fniu) dum = 360.

      do i=1,fni-2
         F_xdec_8(i) = 0.5 * ( F_x_8(i) + F_x_8(i+1) )
      enddo

      if (fni == fniu) then
         F_xdec_8(fni-1) = 0.5 * ( F_x_8(fni-1) + F_x_8(1) + dum )
         F_xdec_8(fni) = F_xdec_8(1) + dum 
      else
         F_xdec_8(fni-1) = 0.5 * ( F_x_8(fni-1) + F_x_8(fni))
      endif

       do i=1,fnj-1
         F_ydec_8(i) = 0.5 * ( F_y_8(i) + F_y_8(i+1) )
       enddo

      return

!______________________________________________________________________
   end SUBROUTINE d_decal

!**S/R D_ROTA

   SUBROUTINE D_ROTA( LONP,LATP,LON,LAT,LON1,LAT1,LON2,LAT2,LON0,LAT0, NI,NJ )

!author  unknown

!revision
! v1_96 - V. Lee            - eliminated common block BUFR and introduced
!                             dynamic allocation instead.
! v2_30 - Dugas B.          - use real*8 rotation matrices and cartesian coordinates
! v???? - bernard dugas     - adaptation a r.diag

      implicit none

      INTEGER NI,NJ 
      REAL LON0(1),LON1(1),LON2(1),LAT0(1),LAT1(1),LAT2(1)
      REAL LONP(NI,NJ),LATP(NI,NJ),LON(NI),LAT(NJ)

!object
!     calculates longitudes and longitudes for the rotated coordinate system

!arguments
!______________________________________________________________________
!                    |                                                 |
! NAME               | DESCRIPTION                                     |
!--------------------|-------------------------------------------------|
!         (output)   |                                                 |
! lonp               | calculated longitudes for the rotated coordinate|
!                    |                                        system   |
! latp               | calculated latitudes for the rotated coordinate |
!                    |                                        system   |
! lon0               | longitude position of the rotated POLE          |
! lat0               | latitude position of the rotated POLE           |
! lon                | longitudes for the non-rotated coordinate system|
! lat                | latitudes for the non-rotated coordinate system |
! lon1               | geographic longitude of the centre of the domain|
!                    |                                     for rotation|
! lat1               | geographic latitude of the centre of the domain |
!                    |                                     for rotation|
! lon2               | geographic longitude on the equator of the      |
!                    |                              domain for rotation|
! lat2               | geographic latitude on the equator of the domain|
!                    |                                     for rotation|
! ni                 | X dimension of LONP,LATP,LON,LAT                |
! nj                 | Y dimension of LONP,LATP,LON,LAT                |
!----------------------------------------------------------------------

!implicits

!**   common block for rotation matrix

      COMMON / D_RMAT  / R_8(3,3)
      COMMON / D_RMATI / RI_8(3,3)
      REAL(8)            R_8,RI_8

      REAL(8), DIMENSION(:), ALLOCATABLE :: CART_8,CAROT_8
      REAL(8) XYZ0_8(3)
!----------------------------------------------------------------------

      ALLOCATE( CART_8(3*NI*NJ),CAROT_8(3*NI*NJ) )

!     CALCUL DES COORDONNEES CARTESIENNES

      CALL D_LLACAR( CART_8,LON,LAT,NI,NJ )

!     CALCUL DES MATRICES DE TRANSFORMEES

      CALL D_CROT( LON1,LAT1,LON2,LAT2 )

!     CALCUL DES COORDONNEES DU POLE DU SYSTEME AVEC ROTATION

      XYZ0_8(1)=R_8(3,1)
      XYZ0_8(2)=R_8(3,2)
      XYZ0_8(3)=R_8(3,3)
      CALL D_CARTALL( LON0,LAT0,XYZ0_8,1) 

!     CALCUL DES COORDONNEES CARTESIENNES TRANSFORMEES

      CALL MXMA8( RI_8,1,3,CART_8,1,3,CAROT_8,1,3,3,3,NI*NJ )

!     CALCUL DES LATITUDES LONGITUDES TRANSFORMEES

      CALL D_CARTALL( LONP,LATP,CAROT_8,NI*NJ )

      DEALLOCATE( CART_8,CAROT_8 )

      RETURN

!----------------------------------------------------------------------
   END SUBROUTINE D_ROTA

!**function: D_STRETCH_AXIS2 - will return a stretched axis given the
!                            parameters NX,F_nxla,F_xbeg,F_xend,F_dxla

   integer function d_stretch_axis2 &
           ( F_x_8, F_dxla, F_xbeg, F_xend, F_margin, NX, F_nxla, F_amp, &
             F_stagger_L, F_print_L, F_dxmax, F_nimax, F_gauss_L )

      implicit none

      integer F_margin, NX, F_nxla, F_nimax
      real    F_amp, F_dxla, F_xbeg, F_xend, F_dxmax
      real(8) F_x_8(NX)
      logical F_stagger_L, F_print_L, F_gauss_L

!author  Vivian Lee - July 1999

!revision
! v2_00 - Lee V.            - initial MPI version
! v2_20 - Lee V.            - converted input F_x to F_x_8 (real*8)
! v2_30 - A. Methot         - introduction of a new stretch grid design
! v2_30 -                     with upper limits on grid point spacing   
! v3_11 - M. Tanguay        - Introduce Grd_gauss_L 

!object
!        see above id

!arguments
!  Name        I/O                 Description
!----------------------------------------------------------------
! stretch_axis O     - value of 0(no error), -1 (error)
! F_x_8        O     - axis containing values for each grid point
! F_dxla       I/O   - on input,number of degrees between grid points in
!                      the uniform domain.
!                    - on output, calculated number of degrees between grid
!                      points if the axis is uniform
! F_xbeg       I     - starting (latitude/longitude) degree of the axis
! F_xend       I     - ending (latitude/longitude) degree of the axis
! F_margin     O     - number of points between the border of the variable
!                      variable grid to the border of the uniform domain
! NX           I     - total number of points of the grid in the axis
! F_nxla       I     - number of points in the uniform domain of the axis
! F_amp        O     - the amplification factor used to determine the grid
!                      points outside of the uniform domain.
! F_stagger_L  I     - .TRUE.if grid points do not lie on the end points
!                      of the axis (F_xbeg,F_xend)
! F_print_L    I     - .TRUE. to print comments,values of this function
! F_dxmax      I     - upper limit on grid spacing (degrees)
! F_nimax      O     - number of points having upper limit grid spacing
! F_gauss_L    I     - TRUE if GEM grid is set as Gaussian
! 

!notes
!      The function d_qqqroot3 is included in this deck (written by J.Cote)

!modules
      real(8), external :: d_qqqroot3
      external ez_gla

      logical sampar
      integer nit, it, i,j
      real(8) a0, am, eps, xdist_8, e, guess, hx, x1, x2
      real(8) amp_8, F_dxla_8
      real(8) hxmax

      real(8) deg2rad_8
      real*8, parameter :: CLXXX_8 = 180.0
      real*8, parameter :: ONE_8   = 1.0

      real    groots(NX)
      real    ay(NX)
      real(8) G_ygauss_8(NX+1)
!----------------------------------------------------------------------

      F_dxla_8 = F_dxla
      hxmax    = F_dxmax

      if (F_print_L) then
         print *,'*'
         print *,'*** stretch_axis(begin) *******'
         print *,'*'
         print *,'NX = ',NX,' F_nxla = ',F_nxla,' F_dxla = ',F_dxla, &
                 ' F_stagger_L = ',F_stagger_L
         print *,'F_xbeg = ',F_xbeg,' F_xend = ',F_xend
      endif

      if(F_xend > F_xbeg) then
         xdist_8    = F_xend - F_xbeg
      else if(F_xend < F_xbeg) then
         xdist_8    = F_xend - F_xbeg + 360.
      else
           print *,'*'
           print *, 'STRETCH_AXIS ERROR: F_xbeg - F_xend = 0.'
           d_stretch_axis2 = -1
           return
      endif

      guess = - 1.0
      eps   = 1.0e-15
      nit   = 10

!     Evaluate Gaussian latitudes if requested
!     ----------------------------------------

      if(F_gauss_L .and. F_stagger_L) then

        if( NX /= F_nxla) then

           print *,'*'
           print *, 'STRETCH_AXIS GAUSSIAN MODE ERROR: NX = ',NX,' /= F_nxla =',F_nxla
           d_stretch_axis2 = -2
           return
           
        endif
 
        deg2rad_8 = acos( -ONE_8 )/CLXXX_8
 
        call ez_glat( ay,groots,NX,0 )
 
        do j=1,NX
           G_ygauss_8(j) = ay(j) 
        enddo

      endif
 
      if ( NX < F_nxla ) then

         print *,'*'
         print *, 'STRETCH_AXIS ERROR: NX = ',NX,' < F_nxla = ',F_nxla
         d_stretch_axis2 = -3
         return
   
      else if ( NX == F_nxla ) then
 
!        the grid is uniform
 
         amp_8 = 1.0
         e = 0.0
         if ( F_stagger_L ) then
            F_dxla_8 = xdist_8/(NX)
         else
            F_dxla_8 = xdist_8/(NX-1)
         endif
         F_margin = 0
         F_nimax  = 0
         if (F_print_L) then
            print *
            print *,'Uniform Grid Detected: F_dxla=',F_dxla_8
         endif

      else
 
!        the grid is variable
         if (F_print_L) then
            print *
            print *,'Variable Grid Detected'
         endif

         F_nimax  = 0
         if ( (NX-1)*F_dxla <= xdist_8 ) then
            print *,'*'
            print *,'STRETCH_AXIS ERROR: ',   &
            '(NX-1)*F_dxla = ',(NX-1)*F_dxla, &
            ' ge F_xend-F_xbeg = ',xdist_8
            d_stretch_axis2 = -4
            return
         endif

       endif
!C-----------------------------------------------------------------------
!C    -BEGIN ITERATION LOOP IF UPPER LIMIT GRID SPACING IS REACHED -------
!C-----------------------------------------------------------------------
8888     continue

      if (  NX > F_nxla ) then
         if ( F_nimax > ( NX - F_nxla - 1 ) /2 ) then
            print *,'STRETCH_AXIS ERROR: no convergence in ', &
                      ' in nimax iteration: nimax=', F_nimax
            d_stretch_axis2 = -5
            return
         endif
         a0 = 0.5 *( ( F_nxla-1 ) - &
                     ( xdist_8 - 2. * F_nimax * hxmax )/F_dxla_8 )

         if ( a0 > 0.0 ) then
            print *
            print *,'STRETCH_AXIS ERROR: illegal values for F_nxla and F_dxla, a0 = ',a0,' < 0'
            d_stretch_axis2 = -6
            return
         endif

         if (F_print_L) print *,'a0 = ',a0
         sampar = mod( NX - F_nxla, 2 ) .eq. 0

         if (F_print_L) print *,'sampar = ',sampar,' NX=',NX,' F_nxla=',F_nxla

         if ( .not. sampar ) then
            print *
            print *,'STRETCH_AXIS ERROR: sampar must be true'
            print *,'Cannot have equal points (F_margins) on either', &
                      ' side of uniform grid'
            d_stretch_axis2 = -7
            return
         endif

         F_margin = ( NX - F_nxla )/2 - F_nimax
         if (F_print_L) print *,'F_margin = ',F_margin

         if ( .not. F_stagger_L ) then
            am = 1.0
            amp_8 = d_qqqroot3 ( guess,a0,am,F_margin,nit,eps,it,e )
            if ( it < 0 ) then
               print *
               print *,'STRETCH_AXIS: ERROR in D_QQQROOT3 function'
               d_stretch_axis2 = -8
               return
            endif
         else
            am = 1.5
            amp_8 = d_qqqroot3 ( guess,a0,am,F_margin,nit,eps,it,e)
            if ( it .lt. 0 ) then
               print *
               print *,'STRETCH_AXIS: ERROR in D_QQQROOT3 function'
               d_stretch_axis2 = -9
               return
            endif
         endif

      endif

      if (F_print_L) print *,'amp_8 = ',amp_8,' estimate = ',e
      if (F_print_L) print *,'nimax = ',F_nimax

!     phi-grid

      x1  = - 0.5 * ( F_nxla - 1 ) * F_dxla_8 + (F_xbeg+F_xend)/2.0
      F_x_8(F_nimax+F_margin+1) = x1

      if (F_gauss_L .and. F_stagger_L) &
          F_x_8(F_nimax+F_margin+1) = G_ygauss_8(1)

!C                   computed grid points in the stretched sector
!C                          to the left or bottom of central area

      x2 = x1
      hx = F_dxla_8
      do i=F_nimax+F_margin,F_nimax+1,-1
         hx   = amp_8 * hx
         x2   = x2 - hx
         F_x_8(i) = x2
      enddo
      
      if ( NX > F_nxla .and. hx > hxmax ) then
         F_nimax=F_nimax+1
         go to 8888
      endif

!C-----------------------------------------------------------------------
!C    ---END ITERATION LOOP IF UPPER LIMIT GRID SPACING IS REACHED -------
!C-----------------------------------------------------------------------


!C                        compute grid points in the central area
!C                                          of uniform resolution

      if (F_gauss_L .and. F_stagger_L) then
         do i=F_nimax+F_margin+1,F_nimax+F_margin+F_nxla-1
            F_x_8(i+1) = G_ygauss_8(i+1) 
         enddo
      else
         do i=F_nimax+F_margin+1,F_nimax+F_margin+F_nxla-1
            x2     = x1 + ( i - F_margin - F_nimax ) * F_dxla_8
            F_x_8(i+1) = x2
         enddo
      endif

      hx = F_dxla_8

!C                   computed grid points in the stretched sector
!C                            to the right or top of central area

      do i=F_nimax+F_margin+F_nxla,NX-F_nimax
         hx     = amp_8 * hx
         x2     = x2 + hx
         F_x_8(i+1) = x2
      enddo

      if ( hxmax/hx > amp_8 .and. F_nimax /= 0 ) then
             print *,'STRETCH_AXIS ERROR: problem with amplification factor '
             d_stretch_axis2 = -10
             return
      endif

!C                 NOTING IS DONE HERE IF F_nimax=0
!C                 compute grid points in the upper limit uniform
!C              resolution area to the left or bottom end of grid

      do i=F_nimax,1,-1
         F_x_8(i)=F_x_8(i+1)-hxmax
      enddo

!C                 NOTING IS DONE HERE IF F_nimax=0
!C                 compute grid points in the upper limit uniform
!C                resolution area to the right or top end of grid

      do i=NX-F_nimax+1,NX
         F_x_8(i)=F_x_8(i-1)+hxmax
      enddo

      if (F_print_L) then
         print *,'x  = ',(F_x_8(i),i=1,NX)
         print *,'F_x_8(end)-F_x_8(beg) = ', (F_x_8(NX) - F_x_8(1))
         print *,'*'
         print *,'*** stretch_axis(end) *******'
         print *,'*'
      endif

      d_stretch_axis2 = 0
      F_amp = amp_8
      F_dxla = F_dxla_8
      F_margin = F_margin + F_nimax

      return

!----------------------------------------------------------------------
   end function d_stretch_axis2

!**function: D_QQQROOT3 - finds a root of a0+r+r**2+...+r**(m-1)+am*r**m=0.,
!                       using at most nit iterations of bodewigs method,
!                       with initial guess r = x or computed.

   real(8) function d_qqqroot3( x, a0, am, m, nit, eps, it, e )

      implicit none

      real(8) a0, am, x, eps
      integer m, nit, it

!author  j. cote  - august 1995 - modification of root2x -> root2

!arguments
!   in     - x   - first guess, if x > 0
!          - a0  - constant coefficient of equation
!          - am  - coefficient of r ** m
!          - m   - degree of polynomial equation
!          - nit - max no. of iterations
!          - eps - accuracy of the root
!   out    - it  - no of iter. taken, failure flag if < 0

!*

!----------------------------------------------------------------------
      real(8) f, fp, fs, e, de, fm
!----------------------------------------------------------------------

      it = 0
      if ( x > 0.0 ) then

         d_qqqroot3 = x
         e = d_qqqroot3 - 1.0

      else

!        compute first guess assuming e is near 0.0

!        coefficients of power series

!        c0 =  a0 + m - 1 + am
!        c1 =  m * ( m - 1 + 2 * am )/2
!        c2 =  m * ( m - 1 ) * ( m - 2 + 3 * am )/6
!        c3 =  m * ( m - 1 ) * ( m - 2 ) * ( m - 3 + 4 * am )/24

         fm = m
!        f  = - c0/c1
         f  = - 2.0 * ( a0 + am + fm - 1.0 )/ &
              ( fm * ( fm - 1.0 + 2.0 * am ) )
!        fp = + c2/c1
         fp =  ( fm - 1.0 ) * ( fm + 3.0 * am - 2.0 )/ &
               ( 3.0 * ( fm - 1.0 + 2.0 * am ) )
!        fs = + c3/c1
         fs =  ( fm - 1.0 ) * ( fm - 2.0 ) * ( fm - 3.0 + 4.0 * am )/ &
              ( 12.0 * ( fm - 1.0 + 2.0 * am )  )

!      first order estimate

!      second order estimate

         e = f/( 0.5 + sqrt( 0.25 + fp * f ) )

!      third order estimate

         e = f/( 1.0 + e * ( fp + e * fs ) )
         d_qqqroot3 = 1.0 + e

      endif

      do it=1,nit

         de = d_qqqroot3 ** ( m - 2 )
         f  = a0 + d_qqqroot3 * ( ( d_qqqroot3 * de - 1.0 )/e +       &
              am * d_qqqroot3 * de )
         fs = ( ( ( fm - 1.0 ) * e - 1.0 ) * d_qqqroot3 * de + 1.0 )/ &
              (e**2)
         fp = fs + am * fm * d_qqqroot3 * de
         fs = ( fm * ( fm - 1.0 ) * ( 1.0 + am * e ) * de - 2.0 * fs )/e

!      bodewigs method for correcting the root ( 3rd order convergence )

         de = - f / fp
         de = - f / ( fp + 0.5 * fs * de )
         e = e + de
         d_qqqroot3 = 1.0 + e

         if ( abs( de ) <= eps ) return

      enddo

      it = - nit

      return
!----------------------------------------------------------------------
   end function d_qqqroot3

!**S/R D_CROT - compute the rotation matrix that allows the transformation
!               from the spherical coordinate system to the rotated spherical
!               coordinate system.

   SUBROUTINE D_CROT( LON1,LAT1,LON2,LAT2 )

      implicit none

      REAL LON1(1),LAT1(1),LON2(1),LAT2(1)

!author michel roch - april 1990

!revision
! v1_96 - V. Lee            - comdeck cleanup and revision for gempp version
! v2_30 - Dugas B.          - use real*8 rotation matrices and cartesian coordinates
! v???? - bernard dugas     - adaptation a r.diag


!ARGUMENTS
!    IN
!    LON1    - longitude on the unrotated coordinate system corresponding to
!              the point (lat,lon)=(0,180) of the rotated coordinate system
!    Lat1    - latitude on the unrotated coordinate system corresponding to
!              the point (lat,lon)=(0,180) of the rotated coordinate system
!    LON2    - longitude on the unrotated coordinate system corresponding to
!              a point (lat,lon) located on the equator of the rotated 
!              coordinate system
!    Lat2    - latitude on the unrotated coordinate system corresponding to
!              a point (lat,lon) located on the equator of the rotated 
!              coordinate system

!implicits

!**   common block for rotation matrix


      COMMON / D_RMAT  / R_8(3,3)
      COMMON / D_RMATI / RI_8(3,3)
      REAL(8)            RI_8,R_8


!modules
      EXTERNAL D_LLACAR

!*
      INTEGER I,J
      REAL(8) A,B,C,D
      REAL(8) XYZ1_8(3),XYZ2_8(3)
!----------------------------------------------------------------

!     CALCUL DES COORDONNEES CARTESIENNES DES POINTS R1 ET R2

      CALL D_LLACAR(XYZ1_8,LON1,LAT1,1,1)
      CALL D_LLACAR(XYZ2_8,LON2,LAT2,1,1)

!     CALCUL DE A=COS(ALPHA)

      A = (XYZ1_8(1)*XYZ2_8(1)) &
        + (XYZ1_8(2)*XYZ2_8(2)) &
        + (XYZ1_8(3)*XYZ2_8(3))

!     CALCUL DE B=SIN(ALPHA)

      B=SQRT(  ( (XYZ1_8(2)*XYZ2_8(3)) - (XYZ2_8(2)*XYZ1_8(3)) )**2 + &
               ( (XYZ2_8(1)*XYZ1_8(3)) - (XYZ1_8(1)*XYZ2_8(3)) )**2 + &
               ( (XYZ1_8(1)*XYZ2_8(2)) - (XYZ2_8(1)*XYZ1_8(2)) )**2  )

!     CALCUL DE C=NORM(-R1)

      C=SQRT( XYZ1_8(1)**2 + XYZ1_8(2)**2 + XYZ1_8(3)**2 )

!     CALCUL DE D=NORM(R4)

      D=SQRT(  ( ( (A*XYZ1_8(1)) - XYZ2_8(1) ) / B )**2 + &
               ( ( (A*XYZ1_8(2)) - XYZ2_8(2) ) / B )**2 + &
               ( ( (A*XYZ1_8(3)) - XYZ2_8(3) ) / B )**2  )

      r_8(1,1)=     -XYZ1_8(1)/C
      r_8(1,2)=     -XYZ1_8(2)/C
      r_8(1,3)=     -XYZ1_8(3)/C
      r_8(2,1)=  ( ((A*XYZ1_8(1)) - XYZ2_8(1)) / B)/D
      r_8(2,2)=  ( ((A*XYZ1_8(2)) - XYZ2_8(2)) / B)/D
      r_8(2,3)=  ( ((A*XYZ1_8(3)) - XYZ2_8(3)) / B)/D
      r_8(3,1)=  ( ( XYZ1_8(2)*XYZ2_8(3)) - (XYZ2_8(2)*XYZ1_8(3)) ) / B
      r_8(3,2)=  ( ( XYZ2_8(1)*XYZ1_8(3)) - (XYZ1_8(1)*XYZ2_8(3)) ) / B
      r_8(3,3)=  ( ( XYZ1_8(1)*XYZ2_8(2)) - (XYZ2_8(1)*XYZ1_8(2)) ) / B

!     MATRICE DE ROTATION INVERSE

      DO 10 I=1,3
      DO 10 J=1,3
 10      RI_8(I,J)=R_8(J,I)

      RETURN

!----------------------------------------------------------------
   END  SUBROUTINE D_CROT

   SUBROUTINE D_CROT2( LON1,LAT1,LON2,LAT2, ROT_8)

      implicit none

      REAL(8) ROT_8(3,3)
      REAL    LON1(1),LAT1(1),LON2(1),LAT2(1)

!**   common block for rotation matrix

      COMMON / D_RMAT / R_8(3,3)
      REAL(8)           R_8

      INTEGER I,J
!----------------------------------------------------------------

      CALL D_CROT( LON1,LAT1,LON2,LAT2 )

      do j=1,3
         do i=1,3
            ROT_8(i,j) = R_8(i,j)
         enddo
      enddo

      RETURN

!----------------------------------------------------------------
   END SUBROUTINE D_CROT2

   SUBROUTINE D_ZONGINI( rang,poids,theta,F_nbin,G_ni,G_nj, &
                         Geomn_longs,Geomn_latgs,           &
                         ZGRTYP,ZIG1,ZIG2,ZIG3,ZIG4 )

      implicit none

      character ZGRTYP
      integer   ZIG1,ZIG2,ZIG3,ZIG4
      integer   G_ni,G_nj, rang(G_ni,G_nj), F_nbin
      real(8)   poids(G_ni,G_nj), theta(G_ni,G_nj)
      real      Geomn_longs(G_ni),Geomn_latgs(G_nj)

!author andre methot - cmc - aug 1994 - v0_14

!revision
! v2_31 - Methot A. and Dugas B.
! v2_31 -               - generalized weight and bin calculation
! v2_31 -                 for rotated or variable grids
! v2_31 - Dugas B.      - account for MPI geometry
! v3_00 - Desgagne & Lee    - Lam configuration
! v???? - Dugas B.      - adaptation to r.diag (from zongini)

!object
!      This routine initializes the variables used to
!      determine zonal average of GEM 'Z' scalar grids

!arguments
! OUT	rang   = indicies with respect to zonal bins
! OUT   poids  = grid point weights in zonal averages
! OUT   theta  = local wind rotation angle
! IN    F_nbin = number of zonal bins
! IN    G_ni,G_nj input dimensions
! IN    Geomn_longs,Geomn_latgs longitude and latitude
!                of grid points in the model reference frame
! IN    ZGRTYP,ZIG1,ZIG2,ZIG3,ZIG4 model grid descriptors

!notes
!       the code takes into account all grid rotations.
!  Each grid point is placed in the appropriate latitude
!  band according to its real geographical latitude.

!  Within each latitude band, grid points are weighted
!  according to their actual horizontal area coverage
!  on the sphere.

!implicits

!     Work space for coordinate calculations

      integer boxlat(F_nbin),irot(1)
      real(8) hxu(0:G_ni), hyv(0:G_nj)
      real    lon(G_ni*G_nj), lat(G_ni*G_nj)
      real(8) lonr(G_ni*G_nj),latr(G_ni*G_nj)
      real(8) cosy(G_nj),siny(G_nj),cosx(G_ni),sinx(G_ni)
      real(8) cart(3*G_ni*G_nj),carot(3*G_ni*G_nj)
      real(8) xg_8(G_ni),yg_8(G_nj)
      real    polon(1),polat(1),rot(1)
      real    lon1(1),lon2(1),lat1(1),lat2(1), v90(1)

      logical debug_L
      integer i,j,k,l, ij,jj, ni,nj, nbin
      real(8) mp(3,2),mt(2,3), sinteta,costeta, thetaz
      real(8) dlat,latmn, norm, pis2,pi_8, rmp, deg2rad

      LOGICAL              DEBUG
      COMMON   / ZZDEBUG / DEBUG

      COMMON   / D_RMAT  / R_8(3,3)
      COMMON   / D_RMATI / RI_8(3,3)
      REAL(8)              RI_8,R_8

!     ---------------------------------------------------------------

      debug_L = DEBUG
      v90(1)  = 90.
      irot(1) = 999

      pis2    = 2.0  * atan( 1d0 )
      pi_8    = 2.0  * pis2
      deg2rad = pis2 / 90.

!**    Calculates weights, row indicies, and angles
!**    --------------------------------------------

      ni    = G_ni
      nj    = G_nj

      nbin  = F_nbin
      dlat  = 180._8/nbin
      latmn = -90.0

      xg_8 = Geomn_longs * deg2rad
      yg_8 = Geomn_latgs * deg2rad

!**   Calcul de la matrice de rotation R_8

      call d_llacar( cart, Geomn_longs,Geomn_latgs, ni,nj )

      call cigaxg( zgrtyp,lat1,lon1,lat2,lon2, &
                          ZIG1,ZIG2,ZIG3,ZIG4 )

      call d_crot( lon1,lat1,lon2,lat2 )

!**   Calcul des latitudes et longitudes de la
!**   grille tournee dans le cadre non-tourne

      call mxma8( ri_8,1,3,cart,1,3,carot,1,3, 3,3, ni*nj )
      call d_cartall( lon, lat, carot, ni*nj)

!**   Calcul de l'angle entre les poles des deux grilles

      call d_llacar( cart, v90,v90, 1,1 )
      call mxma8 (RI_8,1,3,cart,1,3,carot,1,3, 3,3,1)
      call d_cartall( polon,polat, carot, 1 )

      rot  = 90. - polat
      irot = nint( rot )

      do i=1,ni*nj
         lon(i)  = mod(lon(i) + 360.0,360.0)
         lonr(i) = lon(i)*deg2rad
         latr(i) = lat(i)*deg2rad
      end do

!**   Pre-calcul de certains autres facteurs trigonometriques globaux

      cosy = cos( yg_8 )
      siny = sin( yg_8 )

      cosx = cos( xg_8 )
      sinx = sin( xg_8 )

      hyv(1) = (yg_8(2)- yg_8(1)) * 0.5
      hxu(1) = (xg_8(2)- xg_8(1)) * 0.5

      do j=2,nj-1
         hyv(j)  = (yg_8(j+1)- yg_8(j-1)) * 0.5
      end do

      do i=2,ni-1
         hxu(i)  = (xg_8(i+1)- xg_8(i-1)) * 0.5
      end do

      hyv(nj) = (yg_8(nj)- yg_8(nj-1)) * 0.5
      hxu(ni) = (xg_8(ni)- xg_8(ni-1)) * 0.5

!**   Boucle sur les nbin bandes de latitudes geographiques

      BANDESdeLATITUDES : do jj=1,nbin

         boxlat(jj) = 0
         thetaz     = latmn + (jj-1)*dlat
         norm       = 0.

!**       Boucle sur le domaine complet pour l'identification
!**       de tous les points pour UNE BANDE jj DONNEE 

         do j=1,nj 
            do i=1,ni

               ij = (j-1)*ni+i

               if (  ( lat(ij) >= thetaz )      .and. &
                     ( lat(ij) < thetaz+dlat ) ) then

                  poids(i,j) =  hxu(i) * hyv(j) * cosy(j)
!**                             delta X  delta Y  map scale

                  norm       = norm + poids(i,j)
                  boxlat(jj) = boxlat(jj)+1
                  rang(i,j)  = jj

!**               Calcul de la matrice de rotation des vents
!**               ------------------------------------------

                  if ( irot(1) /= 0 ) then

!**                  Definir les composantes requises de M' 
!**                  [ ou M':(u,v)geo --> (dx/dt,dy/dt,dz/dt)geo ]
                     mp(1,1) = -sin( lonr(ij) )
                     mp(2,1) =  cos( lonr(ij) )
                     mp(3,1) =  0.0
!CC                  mp(1,2) = -sin( latr(ij) )*cos( lonr(ij) )
!CC                  mp(2,2) = -sin( latr(ij) )*sin( lonr(ij) )
!CC                  mp(3,2) =  cos( latr(ij) )

!**                  Definir les composantes de MT, la transposee de M
!**                  [ ou M:(u,v)mod --> (dx/dt,dy/dt,dz/dt)mod ]
                     mt(1,1) = -sinx(i)
                     mt(1,2) =  cosx(i)
                     mt(1,3) =  0.0
                     mt(2,1) = -siny(j)*cosx(i)
                     mt(2,2) = -siny(j)*sinx(i)
                     mt(2,3) =  cosy(j)

!**                  Calculer la premiere colonne du produit MT RT M' = TT
!**                  [ ou R:(repere modele) --> (repere geographique) ] 
                     sinteta = 0.0
                     costeta = 0.0

!**                  On ne calcule donc que -TT(1,1) (= sin(theta)) et
!**                  TT(2,1) (= cos(theta) dans la routine mvznxst)

                     do k=1,3
                        rmp       = 0.0
                        do l=1,3
                           rmp    = rmp+R_8(k,l)*mp(l,1)
                        enddo
                        sinteta   = sinteta - mt(1,k)*rmp
                        costeta   = costeta + mt(2,k)*rmp
                     enddo

!**                  Trouver theta a partir de sin(theta) et cos(theta)
                     if ( costeta /= 0.0 ) then
                        theta(i,j) = atan( sinteta/costeta )
                     else if ( sinteta > 0.0 ) then
                        theta(i,j) = pis2
                     else if ( sinteta < 0.0 ) then
                        theta(i,j) = -pis2
                     endif

!**                  theta est defini dans l'interval [ -pi , +pi ]
                     if ( costeta < 0.0 ) then
                        if ( sinteta >= 0.0 ) then
                           theta(i,j) = theta(i,j) + pi_8
                        else
                           theta(i,j) = theta(i,j) - pi_8
                        endif
                     endif

                  else

                     theta(i,j) = - pis2

                  endif

               endif

            enddo
         enddo

         if (norm /= 0.0_8) then
!**          Deuxieme boucle sur le domaine complet pour la normalisation
            do j=1,nj
               do i=1,ni
                  if (rang(i,j) == jj) poids(i,j)=poids(i,j) / norm
               enddo
            enddo
         endif

      enddo BANDESdeLATITUDES

!     Print debug-mode information

      if (  debug_L ) then
         write(6,*) 'rot:   ', irot
         write(6,*) 'Poids: ', poids
         write(6,*) 'Rangs: ', rang
         write(6,*) 'Theta: ', theta
      endif

!     ---------------------------------------------------------------
      return

   end SUBROUTINE D_ZONGINI

   SUBROUTINE D_MERPOS( rang,poids,F_nbin,G_ni,G_nj, &
                        Geomn_longs,Geomn_latgs,     &
                        ZGRTYP,ZIG1,ZIG2,ZIG3,ZIG4 )

      implicit none

      character ZGRTYP
      integer   ZIG1,ZIG2,ZIG3,ZIG4
      integer   G_ni,G_nj, rang(G_ni,G_nj), F_nbin
      real(8)   poids(G_ni,G_nj)
      real      Geomn_longs(G_ni),Geomn_latgs(G_nj)

!auteur Bernard Dugas - RPN - jan 06 (base sur zongini de A. Methot)

!object
!      This routine initializes the variables used to
!      calculate meridional averages of GEM 'Z' scalar
!      grids

!arguments
! OUT	rang   = indicies with respect to meridional bins
! OUT   poids  = grid point weights in meridional averages
! IN    F_nbin = number of meridional bins
! IN    G_ni,G_nj input dimensions
! IN    Geomn_longs,Geomn_latgs longitude and latitude
!                of grid points in the model reference frame
! IN    ZGRTYP,ZIG1,ZIG2,ZIG3,ZIG4 model grid descriptors

!notes
!       the code takes into account all grid rotations.
!  Each grid point is placed in the appropriate longitude
!  band according to its real geographical longitude.

!  Within each longitude band, grid points are weighted
!  according to their actual horizontal area coverage
!  on the sphere.

!implicits

!     Work space for coordinate calculations

      real(8) hxu(0:G_ni), hyv(0:G_nj)
      real    lon(G_ni*G_nj), lat(G_ni*G_nj)
      real(8) cart(3*G_ni*G_nj),carot(3*G_ni*G_nj)
      real(8) cosy(G_nj), xg_8(G_ni),yg_8(G_nj)
      real    lon1(1),lon2(1),lat1(1),lat2(1), lonmn

      logical debug_L,periodic
      integer i,j,k,l, ii,ij, ni,nim,nj, nbin
      real(8) dlon, norm, pis2, deg2rad,  phiz

      LOGICAL              DEBUG
      COMMON   / ZZDEBUG / DEBUG

      COMMON   / D_RMAT  / R_8(3,3)
      COMMON   / D_RMATI / RI_8(3,3)
      REAL(8)              RI_8,R_8

!     ---------------------------------------------------------------

      debug_L = DEBUG

      pis2    = 2.0  * atan( 1d0 )
      deg2rad = pis2 / 90.

!**    Calculates weights, row indicies, and angles
!**    --------------------------------------------

      ni    = G_ni
      nj    = G_nj

      nbin  = F_nbin

!**    Tenter de voir si on est en mode LAM. Dans le
!**    cas contraire, la dernier longitude est toujours
!**    repetee (donc, periodic = vrai).

      dlon = mod( Geomn_longs(ni)-Geomn_longs(1)+180.,360. )
      dlon = abs( dlon-180. )

      if (dlon < (1./nbin)) then
          periodic = .true.
      else
          periodic = .false.
      end if

      xg_8 = Geomn_longs * deg2rad
      yg_8 = Geomn_latgs * deg2rad

!**   Calcul de la matrice de rotation R_8

      call d_llacar( cart, Geomn_longs,Geomn_latgs, ni,nj )

      call cigaxg( zgrtyp,lat1,lon1,lat2,lon2, &
                          ZIG1,ZIG2,ZIG3,ZIG4 )

      call d_crot( lon1,lat1,lon2,lat2 )

!**   Calcul des latitudes et longitudes de la
!**   grille tournee dans le cadre non-tourne

      call mxma8( ri_8,1,3,cart,1,3,carot,1,3, 3,3, ni*nj )
      call d_cartall( lon, lat, carot, ni*nj)

      dlon  = 360./nbin
      lonmn = -dlon/2.

      do i=1,ni*nj
         lon(i)  = mod(lon(i) + 360.0 - lonmn, 360.0) + lonmn
      end do

!**   Pre-calcul de certains autres facteurs trigonometriques globaux

      cosy = cos( yg_8 )

      hyv(1) = (yg_8(2)- yg_8(1)) * 0.5
      hxu(1) = (xg_8(2)- xg_8(1)) * 0.5

      do j=2,nj-1
         hyv(j)  = (yg_8(j+1)- yg_8(j-1)) * 0.5
      end do

      do i=2,ni-1
         hxu(i)  = (xg_8(i+1)- xg_8(i-1)) * 0.5
      end do

      hyv(nj) = (yg_8(nj)- yg_8(nj-1)) * 0.5
      hxu(ni) = (xg_8(ni)- xg_8(ni-1)) * 0.5

!**   Boucle sur les nbin bandes de latitudes geographiques

      do ii=1,nbin

         phiz       = (ii-1.5)*dlon
         norm       = 0.

!**       Boucle sur le domaine complet pour l'identification
!**       de tous les points pour UNE BANDE ii DONNEE 

         ij = 0
 
         do j=1,nj 
            do i=1,ni

               ij = ij+1

               if (  ( lon(ij) >= phiz      )  .and. &
                     ( lon(ij) <  phiz+dlon ) ) then

                  poids(i,j) =  hxu(i) * hyv(j) * cosy(j)
!**                             delta X  delta Y  map scale

                  norm       = norm + poids(i,j)
                  rang(i,j)  = ii

               endif

            enddo
         enddo

!**      Deuxieme boucle sur le domaine complet pour la normalisation
         do j=1,nj
            do i=1,ni
               if ( rang(i,j) == ii ) poids(i,j) = poids(i,j) / norm
            enddo
         enddo

      enddo

!     Print debug-mode information

      if (  debug_L ) then
         write(6,*) 'Poids: ', poids
         write(6,*) 'Rangs: ', rang
      endif

!     ---------------------------------------------------------------
      return

   end SUBROUTINE D_MERPOS

!*s/r d_cartall - Computes the F_lon,F_lat positions for a rotated system

   subroutine d_cartall( F_lon,F_lat,F_xyz_8, n )

      implicit none

      integer n
      real(8) F_xyz_8(3,*)
      real    F_lon(*),F_lat(*)

!author
!     unknown

!revision
! v2_00 - Lee V.            - initial MPI version (from cartall v1_03)
! v2_30 - Dugas B.          - input real*8 cartesian coordinates
! v???? - bernard dugas     - adaptation a r.diag

!object
!     see above ID

!arguments
!  Name        I/O                 Description
!----------------------------------------------------------------
! F_lon        O   F_longitude positions for a rotated coordinate system
! F_lat        O   F_latitude  positions for a rotated coordinate system
! F_xyz_8      I   rotation matrix

!*
      integer i
      real*8, parameter :: ONE = 1.0d0, PI = 180.0d0
      real(8) rad_8
!---------------------------------------------------------------

      rad_8 = PI/acos(-ONE)
      do i=1,n
         F_lat(i) = asin(max(-ONE,min(ONE,F_xyz_8(3,i)))) * rad_8
         F_lon(i) = atan2( F_xyz_8(2,i),F_xyz_8(1,i) ) * rad_8
         F_lon(i) = amod( F_lon(i) , 360.0 )
         if (F_lon(i) < -1E-7) then
            F_lon(i) = F_lon(i)+360.0
         else if (F_lon(i) < 0.0) then
            F_lon(i) = 0.0
         endif
      enddo

      return

! ---------------------------------------------------------------
   end subroutine d_cartall

!**s/r d_llacar - transformation from a set of points (F_lat,F_lon) in 
!                 the spherical coordinate system to cartesian space

   subroutine d_llacar( F_xyz_8,F_lon,F_lat, ni,nj )

      implicit none

      integer ni,nj 
      real(8) F_xyz_8(3,ni*nj)
      real    F_lon(ni),F_lat(nj) 

!author 
!     Michel Roch - April 90

!revision
! v2_00 - Lee V.            - initial MPI version (from llacar v1_03)
! v2_30 - Dugas B.          - output real*8 cartesian coordinates
! v???? - bernard dugas     - adaptation a r.diag

!object
!     See above ID

!arguments
!  Name        I/O                 Description
!----------------------------------------------------------------
! F_xyz_8      O    - coordinates in cartesian space
! F_lon        I    - longitudes of the grid in spherical coordinates
! F_lat        I    - latitudes of the grid in spherical coordinates

!*
      integer i,j,k 
      real(8), parameter :: deg2rad_8 = 0.01745329251994329576923690768488609D0
!----------------------------------------------------------------

!CC      deg2rad_8 = acos(-1Q0)/180.

      k=0 
      do j=1,nj
      do i=1,ni
         k=k+1
         F_xyz_8(1,K) = cos(deg2rad_8*F_lat(j))*cos(deg2rad_8*F_lon(i))
         F_xyz_8(2,K) = cos(deg2rad_8*F_lat(j))*sin(deg2rad_8*F_lon(i))
         F_xyz_8(3,K) = sin(deg2rad_8*F_lat(j))
      enddo
      enddo

      return

!----------------------------------------------------------------
   end subroutine d_llacar

!**s/r d_vt2gz - Compute hydrostatic GZ from PR and VT (for GEM4)

   subroutine d_lpvt2gz( F_gz, F_pr, F_vt, ni,nj,nk )

      implicit none

      integer ni,nj, Nk
      real   F_gz(ni,nj,Nk), F_vt(ni,nj,Nk)
!     real,  pointer  :: F_pr(:,:,:)
      real   F_pr(ni,nj,nk)

!author

!revision
! v4_02 - Desgagne M.       - initial version (from p0vt2gz v3.3.0)
!         Dugas B.          - adapt to r.diag (GSAPZL)

!object
!       see id section

!arguments
!  Name        I/O                 Description
!----------------------------------------------------------------
! F_gz         O    - geopotential height on model levels
! F_pr         I    - log of local pressure in pascals
! F_vt         I    - virtual temperature on model levels

!implicits

      real, parameter :: rgasd=.28705e+3
!*
      integer i,k,ik,n
      real(8) invdet
      real    con,q1,q2,q3,x0,xm,xp,aa,bb,cc,dd,zak,zbk,zck,ex,lnpis_8
      real    vma(ni,nj,nk), vmb(ni,nj,nk), vmc(ni,nj,nk), pr(ni,nj,nk)

!     ---------------------------------------------------------------

      con = -rgasd ; n = ni*nj 
      pr(1:ni,1:nj,1:nk) = exp( F_pr(1:ni,1:nj,1:nk) )

      do k=1,Nk            
      do i=1,n
         x0=pr(i,1,k)
         if (k.eq.1) then
            xm=pr(i,1,1)
            xp=pr(i,1,2)
            aa=pr(i,1,3)-x0
            bb=pr(i,1,2)-x0
         elseif (k.eq.nk) then
            xm=pr(i,1,Nk-1)
            xp=pr(i,1,Nk)
            aa=pr(i,1,Nk-1)-x0
            bb=pr(i,1,Nk-2)-x0
         else
            xm=pr(i,1,k-1)
            xp=pr(i,1,k+1)
            aa=xm-x0
            bb=xp-x0
         endif

         q1=alog(xp/xm)
         q2=xp-xm
         q3=(xp*xp - xm*xm)*0.5

         q3=q3-x0*(2.0*q2-x0*q1)
         q2=q2-x0*q1
         cc=aa*aa
         dd=bb*bb
         invdet=aa*dd-bb*cc
         invdet = 0.5/invdet
         vma(i,1,k)=(dd*q2-bb*q3)*invdet
         vmc(i,1,k)=(aa*q3-cc*q2)*invdet
         vmb(i,1,k)=q1*0.5-vma(i,1,k)-vmc(i,1,k)
      end do
      end do

      do i=1,n
         zak = -2.0*con*vma(i,1,nk)
         zbk = -2.0*con*vmb(i,1,nk)
         zck = -2.0*con*vmc(i,1,nk)
         F_gz(i,1,nk-1) = zak * F_vt(i,1,nk-1) + zbk * F_vt(i,1,nk) &
                        + zck * F_vt(i,1,nk-2) + F_gz(i,1,nk)
      end do

      do k = 1, nk-2
         ik  = nk-1-k
         do i=1,n
            zak = -2.0*con*vma(i,1,ik+1)
            zbk = -2.0*con*vmb(i,1,ik+1)
            zck = -2.0*con*vmc(i,1,ik+1)
            F_gz(i,1,ik) = zak * F_vt(i,1,ik  ) + zbk * F_vt(i,1,ik+1) &
                         + zck * F_vt(i,1,ik+2) + F_gz(i,1,ik+2)

         end do
      end do

!     ---------------------------------------------------------------

      return
      
   end subroutine d_lpvt2gz

!**s/r d_p0vt2gz - Compute hydrostatic GZ from P0 and VT

   subroutine d_p0vt2gz (F_gz, F_pia, F_pib, F_ps, F_vt, &
                            n, Nk, F_pib_L, F_sig_L)

      implicit none

      logical F_pib_L,F_sig_L
      integer n, Nk
      real F_gz(n,Nk), F_vt(n,Nk), F_ps(n), F_pia(Nk), F_pib(Nk)

!author

!revision
! v2_00 - Desgagne M.       - initial MPI version (from p0vt2gz v1_03)
! v2_30 - Edouard  S.       - adapt for vertical hybrid coordinate
! v3_00 - Lee v.            - treats 2D plane as 1-D vector no halos
! v3_02 - Lemay G.          - Vectorisation
! v3_21 - Lee V.            - Output Optimization
!       - Bernard Dugas     - adapt to r.diag (GSAPZL)


!object
!       see id section

!arguments
!  Name        I/O                 Description
!----------------------------------------------------------------
! F_gz         I    - surface geopotential at level Nk
!              O    - geopotential height at all of the other levels
! F_pia        I    - actually RNA if F_sig_L=T
!                   - pia          if F_sig_L=F
! F_pib        I    - unused       if F_sig_L=T
!                   - pib          if F_sig_L=F and F_pib_L=T
!                   - pibb         if F_sig_L=F and F_pib_L=F
! F_ps         I    - ln(pi_s/z_s) if F_pib_L=T
!                   - pi_S         if F_pib_L=F or F_sig_L=T
! F_vt         I    - virtual temperature
! F_pib_L      I    - TRUE or FALSE
! F_sig_L      I    - TRUE or FALSE

!implicits
!*
      real, parameter :: grrgasd=.28705e+3

      integer i,k,ik
      real(8) invdet
      real    con,q1,q2,q3,x0,xm,xp,aa,bb,cc,dd,zak,zbk,zck
      real    pr(n,Nk), vma(n,Nk), vmb(n,Nk), vmc(n,Nk), ex,expps(n)

!     ---------------------------------------------------------------

      con = -grrgasd

      if (F_pib_L) then
          do i=1,n
             expps(i)=exp( F_ps(i) )
          enddo
      endif

      if (F_sig_L) then
          do k=1,Nk
          do i=1,n
          pr(i,k) =  F_pia(k)  *  F_ps(i)
          enddo
          enddo
      else
          if (F_pib_L) then
              do k=1,Nk
              do i=1,n
               pr(i,k) = F_pia(k) + F_pib(k)*expps(i)
              enddo
              enddo
          else
              do k=1,Nk
              do i=1,n
               pr(i,k) = F_pia(k) + F_pib(k)*F_ps(i)
              enddo
              enddo
          endif
      endif

      do k=1,Nk            
         do i=1,n

            x0=pr(i,k)

            if (k == 1) then
               xm=pr(i,1)
               xp=pr(i,2)
               aa=pr(i,3)-x0
               bb=pr(i,2)-x0
            elseif (k == nk) then
               xm=pr(i,Nk-1)
               xp=pr(i,Nk)
               aa=pr(i,Nk-1)-x0
               bb=pr(i,Nk-2)-x0
            else
               xm=pr(i,k-1)
               xp=pr(i,k+1)
               aa=xm-x0
               bb=xp-x0
            endif

            q1=alog(xp/xm)
            q2=xp-xm
            q3=(xp*xp - xm*xm)*0.5

            q3=q3-x0*(2.0*q2-x0*q1)
            q2=q2-x0*q1
            cc=aa*aa
            dd=bb*bb

            invdet=aa*dd-bb*cc
            invdet = 0.5/invdet

            vma(i,k)=(dd*q2-bb*q3)*invdet
            vmc(i,k)=(aa*q3-cc*q2)*invdet
            vmb(i,k)=q1*0.5-vma(i,k)-vmc(i,k)

         end do
      end do

      do i=1,n
         zak = -2.0*con*vma(i,nk)
         zbk = -2.0*con*vmb(i,nk)
         zck = -2.0*con*vmc(i,nk)
         F_gz(i,nk-1) = zak * F_vt(i,nk-1) + zbk * F_vt(i,nk) + &
                        zck * F_vt(i,nk-2) + F_gz(i,nk)
      end do

      do k = 1, nk-2
         ik  = nk-1-k
         do i=1,n
            zak = -2.0*con*vma(i,ik+1)
            zbk = -2.0*con*vmb(i,ik+1)
            zck = -2.0*con*vmc(i,ik+1)
            F_gz(i,ik) = zak * F_vt(i,ik  ) + zbk * F_vt(i,ik+1) + &
                         zck * F_vt(i,ik+2) + F_gz(i,ik+2)

         end do
      end do

!     ---------------------------------------------------------------

      return
   end subroutine d_p0vt2gz
