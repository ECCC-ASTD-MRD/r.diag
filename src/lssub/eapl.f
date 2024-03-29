C     $Log: eapl.ftn,v $
C     Revision 3.16  2021/01/22 16:16  dugas
C     Argument PS de NIVCAL dans EPAEL et ETAPHI en 64 bits.
C
C     Revision 3.15  2018/11/12 17:17  dugas
C     Correction pour le cas ou tous les niveaux
C     seraient sous la surface dans TGZEX/2
C
C     Revision 3.14  2014/09/25 18:31:50  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.13  2013/10/08 01:04:04  bernard
C     Ajouter le point d'entree TGZEX2 pour lequel SPL=PL et non LNPL.
C
C     Revision 3.12  2012/05/17 18:15:16  dugas
C     Bugfix dans EAPL: comparaison de X avec LOG(SIG) plutot que SIG.
C
C     Revision 3.11  2010/07/21 16:35:39  dugas
C     S'assurer que les calculs utilisent des coordonnees verticales
C      ayant la meme orientation (croissante/decroissante) quitte a
C      inverser certaines donnees a l'entree et/ou les resultats
C      a la fin (dans les routines EAPL, ELAEL, GEMAPL et PAEL).
C
C     Revision 3.10  2005/07/28 17:17:56  dugas
C     Modifier le code pour enlever les autres messages d'avertissement de F90.
C
C     Revision 3.9  1999/07/23 15:28:04  armnrbd
C     Ajouter la verification de NOABORT dans EATHL.
C
C     Revision 3.8  1998/10/15 15:10:35  armnrbd
C     S'assurer que theta local est decroissant dans EATHL.
C
C     Revision 3.7  1998/10/06  20:55:49  armnrbd
C     Verifier que theta local est decroissant dans EATHL.
C
C     Revision 3.6  1998/09/18  18:12:33  armnrbd
C     Les constantes utilisees par EATHL sont celles de RMNLIB.
C
C     Revision 3.5  1998/09/18  01:33:32  armnrbd
C     Les routine EAPL et EATHL fonctionne avec des
C     coordonnees verticales croissantes ou decroissantes.
C
C     Revision 3.4  1998/09/15  00:55:36  armnrbd
C     Redefinir P0 comme etant 1000 kPa plutot que 1013.2 kPa
C      pour le calcul de theta dans la routine EATHL.
C
C     Revision 3.3  1995/10/16  13:07:43  armnrbd
C     Ajouter la routine TFGZ, appellee par le programme CTEMPS.
C
C     Revision 3.2  95/02/13  19:37:54  19:37:54  armnrbd (Bernard Dugas)
C     Ajouter la routine EATHL pour l'interpolation sur
C     des surfaces de temperatures potentielles.
C     
C     Revision 3.2  95/02/13  19:35:58  armnrbd
C     *** empty log message ***
C     
C     Revision 3.1  94/11/17  14:13:07  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:55:19  13:55:19  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.0  93/10/13  13:31:36  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.0  92/02/21  11:32:10  armnrbd
C     Initial revision
C     

      SUBROUTINE eapl (FP, LA,PRLOG,NPL,
     +                 FS,SIG,NSL, PSLOG,RLUP,RLDN,
     +                 A,B,NSL1,FSC,DFDLNS,DLNS) 
  
***    FEB 11/88 - R.LAPRISE.

***    INTERPOLATES MULTI-LEVEL SET OF GRIDS FROM ETA LEVELS
***    TO PRESSURE LEVELS FOR HYBRID MODEL.
***    THE INTERPOLATION IS LINEAR IN LN(PRES).

***    ALL GRIDS HAVE THE SAME HORIZONTAL SIZE ( LA POINTS ).
***    FS         =  INPUT GRIDS ON ETA      LEVELS.
***    FP         = OUTPUT GRIDS ON PRESSURE LEVELS.
***   ( NOTE THAT FP AND FS MAY BE EQUIVALENCED IN CALLING PROGRAM )

***    PSLOG      = INPUT  GRID OF LN(SURFACE PRESSURE IN MB).
***    PRLOG(NPL) = LOG PRESSURE VALUES OF OUTPUT LEVELS (MB).
***   ( BOTH OF THESE LAST FIELDS MUST BE MONOTONIC )

***    NSL1       = NSL+1.

***    RLUP       = LAPSE RATE USED TO EXTRAPOLATE ABOVE TOP ETA.
***    RLDN       = LAPSE RATE USED TO EXTRAPOLATE BELOW BOTTOM ETA.
***   ( THE UNITS OF RLUP,RLDN ARE  DF/D(LN PRES) )

      IMPLICIT none

      INTEGER        LA,NPL,        NSL, NSL1
      REAL     FP   (LA,NPL),FS (LA,NSL),PSLOG (LA)
      REAL     PRLOG(   NPL)
      REAL     RLUP,RLDN
  
      REAL     A(NSL),B(NSL)
  
***    WORK SPACE. 
  
      LOGICAL  MONOTON, REVERSE
      INTEGER  I,K,L,N, INTVL, TOPS,BOTS,INCS, TOPP,BOTP,INCP
      REAL     FSC(NSL),DFDLNS(0:NSL1),DLNS(NSL),SIG(NSL),X
      REAL     HOLD,  LOCSIG(NSL)
      REAL*8   PSJ(1)

      LOGICAL           INFO
      COMMON  /ZZVERBO/ INFO

      EXTERNAL NIVCAL,MONVERT,XIT

*---------------------------------------------------------------------

      LOCSIG(:) = SIG(:)

***    CHECK THAT PRLOG IS MONOTONIC.

      CALL MONVERT( PRLOG,NPL, TOPP,BOTP,INCP, MONOTON )

      IF (.NOT.MONOTON)                                        THEN
          IF (INFO) WRITE(6,6000) 'PRESSURE'
          CALL                                     XIT('  Eapl  ',-1 )
      END IF

***    LOOP OVER ALL HORIZONTAL POINTS.
  
      DO 500 I=1,LA 
  
***        GET A COLUMN OF FS (ON SIGMA LEVELS).
  
          FSC(:) = FS(I,:)
  
***        COMPUTE LOCAL SIGMA VALUES AND INVERSE OF DELTA LN SIGMA.
  
          PSJ(1) = 100.*EXP( PSLOG(I) )
          CALL NIVCAL( LOCSIG, A,B, PSJ, NSL,1,1 )

          IF (I.EQ.1)                                          THEN

***            CHECK THAT THE LOCAL SIGMA VECTOR IS MONOTONIC
***            (AND IN WHAT DIRECTION). DO THIS ONLY ONCE.

              CALL MONVERT( LOCSIG,NSL, TOPS,BOTS,INCS, MONOTON )

              IF (.NOT.MONOTON)                                THEN
                  IF (INFO) WRITE(6,6000) 'LOCAL SIGMA'
                  CALL                             XIT('  Eapl  ',-2 )
              END IF

***            ARE THE TWO COORDINATES IN THE SAME ORDER ?

              REVERSE = .NOT. ( (TOPS < BOTS) .EQV. (TOPP < BOTP) )

          END IF

          IF (REVERSE)                                         THEN
              DO  L=1,NSL/2

                  HOLD            = LOCSIG(    L  )
                  LOCSIG(    L  ) = LOCSIG(NSL-L+1)
                  LOCSIG(NSL-L+1) = HOLD

                  HOLD            = FSC   (    L  )
                  FSC   (    L  ) = FSC   (NSL-L+1)
                  FSC   (NSL-L+1) = HOLD

              END DO
              IF (I == 1)                                      THEN
                  INCS =-INCS
                  L    = BOTS
                  BOTS = TOPS
                  TOPS = L
              END IF
          END IF
  
          LOCSIG(:) = ALOG( LOCSIG(:) )

          DO  180 L=TOPS,BOTS-INCS,INCS
              DLNS(L) = 1.0 / (LOCSIG(L+INCS)-LOCSIG(L))
  180     CONTINUE
  
***        COMPUTE VERTICAL DERIVATIVE OVER ALL PRESSURE INTERVALS.
  
          DO  260 L=TOPS,BOTS-INCS,INCS
  260     DFDLNS(L   +INCS) = (FSC(L+INCS)-FSC(L)) *DLNS(L)
          DFDLNS(TOPS     ) = RLUP
          DFDLNS(BOTS+INCS) = RLDN
  
***        LOOP OVER PRESSURE LEVELS TO BE INTERPOLATED.
***        X IS THE LN(SIGMA)=LN(PRES)-LN(PS) VALUE OF 
***        REQUIRED PRESSURE LEVEL.
  
          K = TOPS
          DO  350 N=TOPP,BOTP,INCP

              X = PRLOG(N)-PSLOG(I)
  
***            FIND WHICH SIGMA INTERVAL WE ARE IN.
  
              DO  310 L=K,BOTS,INCS
                  INTVL = L
                  IF (X.LT.LOCSIG(L)) GOTO 320
  310         CONTINUE

              INTVL = BOTS +INCS
  320         K     = INTVL-INCS

              IF (K.EQ.TOPS-INCS) K = TOPS
  
***            NOW INTERPOLATE AT THIS POINT.
  
              FP(I,N) = FSC(K)+DFDLNS(INTVL)*(X-SIG(K))

  350    CONTINUE
  
  500 CONTINUE
  
      RETURN
*-------------------------------------------------------------------- 

 6000 FORMAT(' Eapl: ',A,' levels are not monotonous.'/)

      END 

      SUBROUTINE nivcal (SJ, A,B,PSJ, NK,ILG,LON) 
  
***    FEB 02/88 - R.LAPRISE.

***    CALCUL LA VALEUR DE LA COORDONNEE SIGMA POUR UNE TRANCHE DE
***    LATITUDE A PARTIR DES PARAMETRES A ET B DE LA DISCRETISATION
***    VERTICALE TELS QUE CALCULES DANS COORDAB POUR LE MODELE HYBRIDE.

***    SJ (K,I)   : VALEUR SIGMA DE LA COORDONNEE VERTICALE.
***    A(K) ,B(K) : INFO. SUR POSITION DES NIVEAUX ETA.
***    NK         : NOMBRE DE COUCHES. 
***    ILG        : DIMENSION EN LONGITUDE.
***    LON        : NOMBRE DE LONGITUDES DISTINCTES.
  
      IMPLICIT none

      INTEGER  NK,ILG,LON, I,K
      REAL     SJ(NK ,ILG)
      REAL     A (NK), B (NK)
      REAL*8   PSJ(ILG)
*-------------------------------------------------------------------- 
      DO 500 I=1,LON
          DO 100 K=1,NK 
              SJ( K, I) = A(K)/PSJ(I) +B(K)
  100     CONTINUE
  500 CONTINUE
  
      RETURN
*--------------------------------------------------------------
      END 

      SUBROUTINE stfgz (T,GZ,LA,NLEV,S,RGAS)

***    JAN 17/78 - J.D.HENDERSON
***    COMPUTES TEMPERATURES ON EVEN LEVELS FROM GEOPOTENTIALS
***    ON ODD LEVELS. THE LAST GZ LEVEL CONTAINS THE MOUNTAINS.
***    S CONTAINS THE SIGMA VALUES OF THE GZ LEVELS.
***    RGAS IS THE GAS CONSTANT.

      IMPLICIT none

      INTEGER  LA,NLEV,NLEVM, I,L
      REAL T(LA,1),GZ(LA,1),S(1), DENI,RGAS

*--------------------------------------------------------------------
      NLEVM = NLEV-1
      DO 210 L=1,NLEVM
          DENI = 1./(RGAS*ALOG( S(L+1)/S(L)) )
          DO 210 I=1,LA
              T(I,L) = ( GZ(I,L)-GZ(I,L+1) )*DENI
  210 CONTINUE

      RETURN
      END
      SUBROUTINE tfgz (T,PHI,PHIS,LA,ILEV,SF,RGAS) 

***    AVR 12/85 - B.DUGAS. (VERSION VECTORISEE DE RHSPEE) 
***    JUN 26/79 - J.D.HENDERSON 

***    CALCULATES TEMPERATURES T(LA,ILEV) AT EVEN LEVELS 
***    FROM GEOPOTENTIALS PHI,PHIS AT ODD LEVELS. 

***    PHI AND T MAY BE EQUIVALENCED.

      IMPLICIT NONE

      INTEGER  LA,ILEV
      COMPLEX  T(LA,ILEV),PHI(LA,ILEV),PHIS(LA)
      REAL     SF(ILEV),RGAS

      INTEGER  ILEVM,L,MN
      REAL     DENI

*-------------------------------------------------------------------- 
      ILEVM=ILEV-1

      DO  L=1,ILEVM
          DENI = 1.0/( RGAS*SF(L) )
          DO  MN=1,LA 
              T(MN,L) = ( PHI(MN,L)-PHI(MN,L+1) )*DENI
          END DO
      END DO
 
      DENI = 1.0/( RGAS*SF(ILEV) )

      DO  MN=1,LA
          T(MN,ILEV) = ( PHI(MN,ILEV)-PHIS(MN) )*DENI
      END DO
 
      RETURN
      END 
      SUBROUTINE etaphi (PHI, T,PSMBLN,
     +                   AG,BG, RGAS, LEN, NSL,NSLP, SIG)
 
***    FEB 12/88 - R.LAPRISE.
***    COMPUTE PHI FROM T ON ETA COORDINATES.
***    PHI ANF T MAY BE EQUIVALENCED IN THE CALLING PROGRAM.
***    AG AND BG CONTAIN THE VERTICAL COORDINATE INFORMATION FOR PHI.
***    PHIS, THE SURFACE GEOPOTENTIAL, MUST BE IN PHI( ,NSL+1)
***    PSMBLN IS LN(PS), FOR PS IN MB.
***    NSLP = NSL + 1.
 
      IMPLICIT NONE

      INTEGER  LEN,NSLP,NSL,N,L
      REAL     PHI(LEN,NSLP),T(LEN,NSL),PSMBLN(LEN)
      REAL     AG(NSL),BG(NSL),SIG(NSLP), RGAS
      REAL*8   PSJ(1)

      EXTERNAL NIVCAL

*-----------------------------------------------------------------------
      SIG(NSL+1) = 1.
 
      DO 500 N=1,LEN
 
          PSJ(1) = 100.*EXP( PSMBLN(N) )
          CALL NIVCAL( SIG, AG,BG,PSJ, NSL,1,1 )

          DO 200 L=1,NSL
              SIG(L)   = ALOG( SIG(L+1)/SIG(L) )
  200     CONTINUE
 
          DO 300 L=NSL,1,-1
              PHI(N,L) = PHI(N,L+1) +RGAS*T(N,L)*SIG(L)
  300     CONTINUE
 
  500 CONTINUE

      RETURN
      END
      SUBROUTINE tgzex (GZ,T,SPL,LA,PR ,NPL,GAMMA)
 
***    AUG 13/90 - M.LAZARE. - REMOVE HARD-COAT ON "PR", SINCE PASSED.
***    FEB 22/78 - J.D.HENDERSON
 
***    T,GZ(LA,NPL) CONTAIN TEMPERATURE AND GEOPOTENTIAL
***                 ON NPL PRESSURE LEVELS.
***    SPL = LN(SURFACE PRESSURE) (tgzex)   ***OR*** 
***             SURFACE PRESSURE  (tgzex2)
***    PR  = NPL VALUES OF PRESSURE.
***    GAMMA = DT/DZ (DEG/M)  (STD ATM = .0065).

***    THIS PROGRAM HYDROSTATICALLY CORRECTS THE TEMPERATURE
***    AND THE GEOPOTENTIAL BELOW THE SURFACE. PR AND SPL
***    SHOULD BE DEFINED WITH THE SAME UNITS !!!

      IMPLICIT NONE

      character(6), save :: mode = 'tgzex2'

      INTEGER  LA,NPL,I,N,L
      REAL     GZ(LA,1),T(LA,1),SPL(1),PR(1)
      REAL     GAMMA,RGAS,GRAV,GOG,POWER,SFPR,PPEXP

      mode = 'tgzex'
*--------------------------------------------------------------------

      ENTRY tgzex2 (GZ,T,SPL,LA,PR ,NPL,GAMMA)

*--------------------------------------------------------------------
      RGAS  = 287.
      GRAV  = 9.80616
      GOG   = GRAV/GAMMA
      POWER = RGAS*GAMMA/GRAV

      DO 390 I=1,LA
 
         IF (mode == 'tgzex') THEN
              SFPR=EXP(SPL(I))
          ELSE
              SFPR=SPL(I)
          END IF

***        FIND THE FIRST PRESSURE LEVEL BELOW THE SURFACE.

          DO 330 L=1,NPL
              N = L
              IF (SFPR.LT.PR(L)) GOTO 340
  330     CONTINUE
          GOTO 390

***        CORRECT ALL LEVELS BELOW GROUND.

  340     IF (N == 1) N = 2     ! All levels are below the surface !

          DO 350 L=N,NPL
              PPEXP   = (PR(L)/PR(N-1))**POWER
              T(I,L)  = T(I,N-1)*PPEXP
              GZ(I,L) = GZ(I,N-1)-GOG*T(I,N-1)*(PPEXP-1.)
  350     CONTINUE

  390 CONTINUE

      mode = 'tgzex2'

      RETURN
      END
      SUBROUTINE eathl (FS,LA,TH,NTHL,FTH,NSL,PSLOG,
     +                  RLUP,RLDN,TEMPS, A,B,NSL1,
     +                  FSC,THS,DFDLNTH,DLNTH,
     +                  TOP,BOT,INC, MTH )

***    OCT  5/94 - J.KOSHYK (INTRODUCE COLUMN ARRAY FSC TO CORRECT
***                 CALCULATION OF FTH).
***    JUL 27/94 - J. KOSHYK

***    INTERPOLATES MULTI-LEVEL SETS OF GRIDS FROM ETA OR PRESSURE LEVELS
***    TO THETA LEVELS.  THE INTERPOLATION IS LINEAR IN LN(THETA).

***    ALL GRIDS HAVE THE SAME HORIZONTAL SIZE (LA POINTS).
***    FTH      = OUTPUT GRIDS ON THETA LEVELS.
***    TH(NTHL) = VALUES OF INPUT THETA LEVELS (K).
***               (MUST BE MONOTONIC AND DECREASING).
***    FS       = INPUT GRIDS ON ETA OR PRESSURE LEVELS.
***    PSLOG    = INPUT GRID OF LN(SURFACE PRESSURE IN MB).
***    RLUP     = LAPSE RATE, DF/D(LN (THETA)) USED TO EXTRAPOLATE
***               ABOVE TOP ETA.
***    RLUP     = LAPSE RATE USED TO EXTRAPOLATE BELOW BOTTOM ETA.
***    TEMPS    = INPUT GRIDS OF TEMPERATURE ON ETA LEVELS.
***    NSL1     = NSL+1.
***    TOP      = INDEX OF THE TOP MODEL LEVEL
***    BOT      = INDEX OF THE BOTTOM MODEL LEVEL
***    INC      = INCREMENT USED TO GO FROM TOP TO BOTTOM

      IMPLICIT    none

***    INPUT PARAMETERS

      REAL        RLUP,RLDN
      INTEGER     LA,NSL,NSL1,NTHL,TOP,BOT,INC
      REAL        FS(LA,NSL),PSLOG(LA),TEMPS(LA,NSL)
      REAL        TH(NTHL),A(NSL),B(NSL)
      REAL        FTH(LA,NTHL)

      LOGICAL              INFO, NOABORT
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZABORT/       NOABORT

***    WORK SPACE.

      INTEGER     I,K,L,INTVL,N,MTH(0:NSL1)
      REAL        FSC(NSL),THS(NSL),DFDLNTH(0:NSL1),DLNTH(NSL),PRES

      REAL*8                                   EPSIL
      REAL        P0        , KAPPA
      PARAMETER ( P0=100000., KAPPA=.2854912 , EPSIL = .999999 )
CCC   PARAMETER ( P0=101320., KAPPA=.285714 )

*---------------------------------------------------------------------------------
***    LOOP OVER ALL HORIZONTAL POINTS.

      DO  300 I=1,LA

          DO  L=0,NSL1
              MTH(L) = 0
          END DO

***        COMPUTE THE POTENTIAL TEMPERATURE ON ETA LEVELS.

          PRES     = A(TOP)+B(TOP)*(100.*EXP(PSLOG(I)))
          THS(TOP) = TEMPS(I,TOP)*(P0/PRES)**KAPPA
          
          DO  L=TOP+INC,BOT,INC
              PRES   = A(L)+B(L)*(100.*EXP(PSLOG(I)))
              THS(L) = TEMPS(I,L)*(P0/PRES)**KAPPA
              IF (THS(L).GE.THS(L-INC))                   THEN
                  THS(L)     = THS(L-INC)*EPSIL
                  MTH(L-INC) =     L-INC
              END IF
          END DO

***        COMPUTE INVERSE DELTA LN THETA ON ETA LEVELS.

          DO  L=TOP,BOT-INC,INC
              DLNTH(L) = 1./LOG( THS(L+INC)/THS(L) )
          END DO

          DO  L=TOP,BOT,INC
              FSC(L) = FS(I,L)
          END DO

***        COMPUTE VERTICAL DERIVATIVE OVER ALL ETA INTERVALS.

              DFDLNTH(TOP    ) = RLUP
          DO  L=TOP,BOT-INC,INC
              DFDLNTH(L  +INC) = (FSC(L+INC)-FSC(L))*DLNTH(L)
          END DO
              DFDLNTH(BOT+INC) = RLDN
*---------------------------------------------------------------------------------

***        LOOP OVER THETA LEVELS TO BE INTERPOLATED.

          K = TOP
          DO  200 N=1,NTHL

***            FIND WHICH SIGMA INTERVAL WE ARE IN.

              DO  L=K,BOT,INC
                  INTVL=L
                  IF (TH(N).GT.THS(L)) GOTO 100
              END DO

              INTVL = BOT  +INC
  100         K     = INTVL-INC

              IF (K.EQ.TOP-INC) K = TOP

***            CHECK FOR INVERSION LAYERS.

              IF (MTH(K).NE.0)                                 THEN
                  IF (INFO) WRITE(6,6001) I,K,TH(N)
                  IF (.NOT.NOABORT) CALL           XIT('  Eathl ',-1 )
              END IF

***            NOW INTERPOLATE AT THIS POINT.

              FTH(I,N)  = FSC(K)+DFDLNTH(INTVL)*LOG( TH(N)/THS(K) )

  200     CONTINUE

  300 CONTINUE

      RETURN

*-------------------------------------------------------------------- 
 6001 FORMAT(/' EATHL: At point ',I6,', level ',I3.3,', THETA =',F11.3/
     +            8X,'And is at an inversion. '/)

      END
