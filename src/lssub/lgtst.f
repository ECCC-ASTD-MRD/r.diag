C     $Log: lgtst.ftn,v $
C     Revision 3.9  2014/10/16 12:00:42  dugas
C     Modifications commandees par la compilation avec GFORTRAN et IFORT.
C
C     Revision 3.8  2014/09/25 18:42:03  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.7  2013/10/28 20:46:19  bernard
C     Appel a GAUSSG16 plutot qu'a GAUSSG.
C
C     Revision 3.6  2013/10/08 01:12:14  bernard
C      - Appels a ALPCAL2/ALPDY3 plutot qu'a ALPST2/ALPDY2. Ces
C        nouvelles routines implementent les calculs selon les
C        formules de Belousov (1962)
C      - Inclure le comdeck calpi.cdk (utilise aussi par ALPCAL2/ALPDY3)
C      - Calculs completement en REAL(8) des variables P, DP et CA
C      - EPSI devient EPSIO (juste pour la sortie)
C      - Enlever le code MP
C
C     Revision 3.5  2008/04/28 21:38:53  dugas
C     Corriger l'usage des macros pour r.gppf (passe 2).
C
C     Revision 3.4  2001/01/19 00:23:17  armnrbd
C     Modifier le traitement des "underflows/overflows".
C
C     Revision 3.3  1999/11/03 21:20:07  armnrbd
C     Ajouter une comparaison avec UNDERFL des ALP et DALP.
C
C     Revision 3.2  1995/11/01 20:04:03  armnrbd
C     De-allouer les appels multi-taches.
C
C     Revision 3.1  94/11/17  14:13:38  14:13:38  armnrbd (Bernard Dugas)
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:55:44  13:55:44  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.0  93/10/13  13:31:53  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.4  93/08/19  16:20:39  16:20:39  armnrbd (Bernard Dugas)
C     Modifications cosmetiques.
C     
C     Revision 1.3  92/12/24  12:03:45  armnrbd
C     Utiliser la routine TRIGL2 plutot que TRIGL.
C     
C     Revision 1.2  92/12/18  11:36:54  armnrbd
C     Utiliser les symmetries hemispheriques dans les transformees de legendre.
C     
C     Revision 1.1  92/11/15  19:50:06  armnrbd
C     N'entreposer qu'une seule hemisphere de polynomes de Legendre.
C     
C     Revision 1.0  92/02/21  11:33:36  armnrbd
C     Initial revision
C     
      SUBROUTINE lgtst ( ILAT, LRLMT, GLATS,GWTS, CA,P,DP, SIA,RAD,WOCS,
     +                ALPO,DALPO,EPSIO, LSR,LA,LM, SPEC,DERIV, KIND,NP )

C *** SUBROUTINE TO COMPUTE GAUSSIAN LATITUDES, WEIGHTS AND
C *** LEGENDRE POLYNOMIALS, AS WELL AS THE DERIVATIVE LEGENDRE 
C *** POLYNOMIALS AND ASSOCIATED CONSTANTS.

C----------------------------------------------------------------------
      IMPLICIT  none

      INTEGER   IA,DEB,     PAS,NP,      N,NI,NF,
     +          LSR(2,*),   ILAT,ILATH,  LRLMT,
     +          LA,LR,LM,   KTR,KIND,    LAL,NM,
     +          LAT,KL,KR,  J,K,L,M
      LOGICAL   DERIV,      SPEC,        GLOBAL
      REAL*8    P(LA,*),    DP(LA,*),    CA(*)
      REAL*8    PIH,        RADIUS,      TERRE2,
     +          GWTS(ILAT), GLATS(ILAT), UNDERFL,
     +          SIA(ILAT),  RAD(ILAT),   WOCS(ILAT),
     +          ALPO(*),    DALPO(*),    EPSIO(*)

      EXTERNAL  XIT,DIMGT2, EPSCAL,      GAUSSG,TRIGL2,
     +          ALPST2,     ALPDY2

!#    include  "machtype.cdk" 
#     include  "calpi.cdk"

      DATA      RADIUS / 6371220.0  /

C----------------------------------------------------------------------
C *** LRLMT CONTAINS TRUNCATION INFORMATION (E.G., 16160 FOR R15)
C *** FOR ALIAS-FREE LATITUDE/LONGITUDE GRID, ILAT=40 AT R15

C *** GWTS  HOLDS THE GAUSSIAN WEIGHTS
C *** GLATS HOLDS THE GAUSSIAN LATITUDES
C *** P     ARE THE NORMALIZED LEGENDRE POLYNOMIALS (IF SPEC IS TRUE)
C *** DP    CONTAINS THE DIFFERENTIATED LEGENDRE POLYNOMIALS (IF BOTH 
C ***       SPEC AND DERIV ARE TRUE) ... [COS LAT]**2 D(P)/D(SIN LAT)
C *** LSR   IS THE ROW LENGTHS OF P AND DP FOR EACH ZONAL WAVE NUMBER
C *** KIND  CONTROLS THE HEMISPHERE (0,1,2) AND SYMMETRY (+/-).

!!!   IF (MACHINE.EQ.1) UNDERFL = 1.D-300
!!!   IF (MACHINE.EQ.2) UNDERFL = 1.2D-38
      UNDERFL = 1.D-300

      IF (KIND.NE.0) GLOBAL = .FALSE.
      IF (KIND.EQ.0) GLOBAL = .TRUE.
                     TERRE2 = -RADIUS*RADIUS
                     PIH    =  ATAN(1.D0)*2.D0

      IF (MOD(ILAT,2).NE.0)                                    THEN
          WRITE(6,6001)
          CALL                                    XIT ('  LGTST ',-1)
      END IF

                             ILATH = ILAT
      IF (IABS( KIND ).EQ.0) ILATH = ILAT/2

      CALL DIMGT2( LSR, LA, LR,LM,KTR,LRLMT, KIND,0 )
      CALL EPSCAL( EPSIO,LSR,LM )

      LAL = LSR(2,LM+1)-1

      CALL  GAUSSG16( ILATH, GLATS,GWTS,SIA,RAD,WOCS ) 
      CALL  TRIGL2( ILATH, GLATS,GWTS,SIA,RAD,WOCS, IABS( KIND ) ) 

C *** AGAIN, WE HAVE TO CONSIDER THE POSSIBILITIES OF 
C *** SYMMETRY AND/OR HEMISPHERIC DATA.  

          DEB = 0
      IF (GLOBAL)                                              THEN
          PAS = 1
      ELSE
          PAS = 2
          IF (KIND.LT.0) DEB = 1
      END IF

      IF (SPEC)                                                THEN

C ***     CALCULATE P (AND POSSIBLY DP) AT EVERY 
C ***     LATITUDE OF THE FIRST AVAILABLE HEMISPHERE.

          DO  LAT=1,ILATH

                         CALL ALPCAL2( LSR,LM,GLATS(LAT) )
              IF (DERIV) CALL ALPDY3( LSR,LM )

C ***         ACCOUNT FOR POSSIBLE UNDERFLOWS.

              DO  M=1,LM
                  KR = LSR(2,M+1)-LSR(2,M)
                  DO  N=1,KR
                      IF (ABS(  ALP(N,M) ).LT.UNDERFL) ALP(N,M) = 0.0
                  END DO
              END DO

              IF (DERIV)                                       THEN
                  DO  M=1,LM
                      KR = LSR(2,M+1)-LSR(2,M)
                      DO  N=1,KR
                          IF (ABS(DALP(N,M)).LT.UNDERFL) DALP(N,M)=0.0
                      END DO
                  END DO
              END IF

C ***         TREAT ZONAL WAVE 0 SEPARATELY.

              L  = 0
              KL = 1
              KR = LSR(2,2)-2
                  
              DO  K=KL,KR
                  L                = L+1
                  P(L,        LAT) = ALP(K,1)
              END DO

              DO   M=2,LM
                  KL = 1+DEB
                  KR = LSR(2,M+1)-LSR(2,M)-1
                  DO  K=KL,KR,PAS
                      L            = L+1
                      P(L,    LAT) = ALP(K,M)
                  END DO
              END DO

              IF (DERIV)                                       THEN

                  L  = 0
                  KL = 1
                  KR = LSR(2,2)-2

                  DO  K=KL,KR
                      L            = L+1
                      DP(L,   LAT) = DALP(K,1)
                  END DO

                  DO  M=2,LM
                      KL = 1+DEB
                      KR = LSR(2,M+1)-LSR(2,M)-1 
                      DO  K=KL,KR,PAS
                          L         = L+1
                          DP(L,LAT) = DALP(K,M)
                      END DO
                  END DO

              END IF

          END DO

      END IF

C *** CALCULATE CA, THE EIGENVALUES OF THE SPHERICAL LAPLACIAN.

      L  = 0
      NI = LSR(2,1)
      NF = LSR(2,2)-2
      DO 300 N=0,NF-NI
          L     = L+1
          CA(L) = FLOAT(N*(N+1))
  300 CONTINUE
      DO 350 M=1,LM-1
          NI = LSR(2,M+1)+DEB
          NF = LSR(2,M+2)-2
          DO 350 N=0,NF-NI,PAS
              L     = L+1
              CA(L) = FLOAT((M+N)*(M+N+1))
  350 CONTINUE

      DO 400 NM=2,LA
          CA(NM) = TERRE2/CA(NM)
  400 CONTINUE

      CA(1) = 0.0

C     WRITE(*,6100) GLATS
C     WRITE(*,6200) GWTS

      RETURN

C-------------------------------------------------------------------
 6001 FORMAT(' THE NUMBER OF LATITUDES HAS TO BE EVEN ')

 6100 FORMAT(1X,'GAUSSIAN LATITUDES'/(1X,5F15.11))
 6200 FORMAT(1X,'GAUSSIAN WEIGHTS'/(1X,5F15.11))

      END
