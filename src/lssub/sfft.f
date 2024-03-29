C     $Log: sfft.ftn,v $
C     Revision 3.8  2020/01/07 16:16  dugas
C     Enlever (commenter) le code dependant du macro i386.
C
C     Revision 3.7  2014/09/25 18:42:04  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.6  2008/04/28 21:38:53  dugas
C     Corriger l'usage des macros pour r.gppf (passe 2).
C
C     Revision 3.5  2007/08/29 20:10:34  dugas
C     Ajouter SFFT2 utilisee par RSFFT4 et FFFT8_B (F90).
C
C     Revision 3.4  2005/11/22 18:27:53  dugas
C     Definir les constantes avec 34 nombres significatifs.
C
C     Revision 3.3  2004/08/20 20:36:27  dugas
C     Definir les constantes trigonometriques avec 20 decimales.
C
C     Revision 3.2  1997/01/30 10:18:58  armnrbd
C     Diminuer le nombre de scalaires dans certains calculs.
C
C     Revision 3.1  1994/11/17  14:14:07  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C
C     Revision 3.0  94/11/17  13:56:10  13:56:10  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.1  94/02/18  17:11:21  armnrbd
C     Ne plus utiliser TAN dans PASS1 et PASS2.
C     
C     Revision 2.0  93/10/13  13:32:13  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.3  93/02/10  15:17:38  armnrbd
C     Enlever rsfft,rsfft2,csfft et csfft2.
C     
#     if !defined (nombre_de_facteurs)
#         define   nombre_de_facteurs 19
#     endif
C *** SFFTx COMPUTES STOCKHAM FFT BOTH FORWARD AND REVERSE TRANSFORMS. 
C *** THE FORTRAN PROGRAM WAS WRITTEN BY P. SWARZTRAUBER, NCAR (FOR
C *** ALGORITHM SEE "PARALLEL COMPUTING",1,(1984),45-63).

      SUBROUTINE sfft ( IS, N,LOT,IFAC,CCR,CCI,CHR,CHI, TRIG )

C     * MODIFIEE NOVEMBRE 1992 PAR B.Dugas, RPN:
C     * ...  UTILISER LES SUGGESTIONS DE MOSSBERG QUAND A
C     *      1) LA REDEFINITION DE LOT (PASSER DE TROIS A UNE BOUCLE),
C     *      2) CALCUL PLUS EFFICACE DE TRIG.
C     * ...  TOUT LE CALCUL SE FAIT EN REAL*8
C     * MODIFIEE LE 25 SEPTEMBRE 1992 PAR B.Dugas, RPN: 
C     * ...  UTILISER PASS1 ET PASS2, PLUTOT QUE PASS1 ET PASSG1.
C     * MODIFIEE LE 14 NOVEMBRE 1991 PAR B.Dugas, RPN: 
C     * ...  LE RESULTAT EST RETOURNE DANS CH.
C     * MODIFIEE A L'ETE 1991 PAR B.Dugas, RPN: 
C     * ...  CONSIDERER PASSG1 SI IDO=1.
C     * MODIFIEE LE 31 MAI 1991 PAR B.Dugas, RPN: 
C     * ...  DIMENSIONNER TRIG (2*N+4*N) PLUTOT QUE (2*N*N+4*N).
C     * MODIFIEE A L'ETE 1990 PAR B.DUGAS, UQAM:
C     * ...  UTILISER FTSET ET FFTINI AVANT LE PREMIER APPEL.

C *** THE FACTOR DECOMPOSITION IS PROVIDED BY ROUTINE FTSET AND
C *** THE TRIGONOMETRIC SIN/COS VALUES BY ROUTINE FFTini.

      IMPLICIT  none

      INTEGER,   PARAMETER :: MAXFAC = nombre_de_facteurs

      INTEGER    IS,N,LOT,IFAC(MAXFAC+1)
      REAL(8)    CCR(LOT,N),CHR(LOT,N),TRIG(N,3)
      REAL(8)    CCI(LOT,N),CHI(LOT,N)

      LOGICAL    CHECK
      CHARACTER  STRING*8
      INTEGER    UN, IDO,K0,NF,L1,L2,IP

      SAVE       CHECK

      COMMON    /FTSCAL/ STRING

      EXTERNAL   XIT,pass1,pass2

      DATA       UN    /    1   /
      DATA       CHECK / .TRUE. /

C--------------------------------------------------------------------
C     * CHECK (ONCE) THAT CALL TO FFTini HAS BEEN DONE.

      IF (CHECK)                                               THEN
          IF (STRING.NE.'InitialS')                            THEN
              WRITE(6,6001)
              CALL XIT ('  Sfft  ',-1)
              RETURN
          END IF
          CHECK = .FALSE.
      END IF

C ****************** TRANSPOSED STOCKHAM FFT ************************
C *** IS=-1 FOR FORWARD TRANSFORM AND IS=1 FOR BACKWARD TRANSFORM ***

      NF  = IFAC(UN)

      L1  = UN
      DO 100 K0=UN,NF

         IP   = IFAC(K0+UN)
         L2   = IP*L1
         IDO  = N/L2

         CALL pass1(  IS, LOT*IDO*L1,IP,N,
     +                    CCR,CCI,CHR,CHI,TRIG )
         IF  (IDO.NE.1)
     +   CALL pass2(  IS, LOT*L1,IDO,IP,L1,N,
     +                    CCR,CCI,CHR,CHI,TRIG )

         L1   = L2

  100 CONTINUE

      RETURN

C---------------------------------------------------------------
 6001 FORMAT(' FFTini2 HAS TO BE CALLED BEFORE SFFT.')

      END

      SUBROUTINE sfft2 ( IS, LOT, CCR,CCI,CHR,CHI )

      IMPLICIT  none

      INTEGER    IS,LOT

      INTEGER,   PARAMETER :: MAXFAC = 9

      CHARACTER  STRING*8
      INTEGER    N, IFAC
      REAL(8),   POINTER :: TRIG(:,:)

      COMMON   / FTSCAL  / STRING
      COMMON   / STKFFT8 / TRIG, IFAC(MAXFAC+1), N

      REAL(8)    CCR(LOT,N),CHR(LOT,N)
      REAL(8)    CCI(LOT,N),CHI(LOT,N)

      LOGICAL    CHECK
      INTEGER    UN, IDO,K0,NF,L1,L2,IP
      SAVE       CHECK

      EXTERNAL   pass1,pass2

      DATA       UN    /    1   /
      DATA       CHECK / .TRUE. /
!--------------------------------------------------------------------
!     * CHECK (ONCE) THAT A CALL TO FFTini2 HAS BEEN DONE.

      IF (CHECK)                                               THEN

          IF (STRING.NE.'InitialS')                            THEN
              WRITE(6,6001)
              STOP
          END IF

          CHECK = .FALSE.

      END IF

! ****************** TRANSPOSED STOCKHAM FFT ************************
! *** IS=-1 FOR FORWARD TRANSFORM AND IS=1 FOR BACKWARD TRANSFORM ***

      NF  = IFAC(UN)
      L1  = UN

      DO 100 K0=UN,NF

         IP   = IFAC(K0+UN)
         L2   = IP*L1
         IDO  = N/L2

         CALL pass1(  IS, LOT*IDO*L1,IP,N, 
     +                    CCR,CCI,CHR,CHI,TRIG )

         IF  (IDO.NE.1) 
     +   CALL pass2(  IS, LOT*L1,IDO,IP,L1,N, 
     +                    CCR,CCI,CHR,CHI,TRIG )

         L1   = L2

  100 CONTINUE

      RETURN
!---------------------------------------------------------------

 6001 FORMAT(' FFTini2 HAS TO BE CALLED BEFORE SFFT2.')

      END
!
C *** SUBROUTINE NEEDED FOR FIRST PASS OF TRANSFORM IN SFFT. BASED ON
C *** PASSG FOUND IN WASHINGTON & PARKINSON, P.356.  ORIGINAL CODE BY
C *** SWARZTRAUBER.

      SUBROUTINE pass1( IS, LOT,IP,N, CCR,CCI,CHR,CHI, TAU )

      IMPLICIT   none

C     * AUTEUR: B.DUGAS - PRINTEMPS 1991.

C     * MODIFIEE NOVEMBRE 1992 PAR B.Dugas, RPN:
C     * ...  UTILISER LES SUGGESTIONS DE MOSSBERG QUAND A
C     *      1) LA REDEFINITION DE LOT (PASSER DE TROIS A UNE BOUCLE),
C     *      2) FORMULATION EN TERME DE VECTEURS TEMPORAIRES ET
C     *      3) CALCUL PLUS EFFICACE DE TAU.
C     * ...  TOUT LE CALCUL SE FAIT EN REAL*8
C     * MODIFIEE LE 11 FEV 1992 PAR B.Dugas, RPN: 
C     * ...  SIMPLIFIER EN UTILISANT R1,R2,R3,R4 ET I1,I2,I3,I4, ETC..
C     * MODIFIEE LE 14 NOV 1991 PAR B.Dugas, RPN: 
C     * ...  LE TRANSFERT DE CH A C1 SE FERA DANS SFFT.
C     * MODIFIEE LE 12 OCT 1991 PAR B.Dugas, RPN: 
C     * ...  DEFINITION EXPLICITE DES PARAMETRES TRIGONOMETRIQUES.

      INTEGER    IS,IP,N,LOT

      REAL(8)    CHR(LOT,IP),CCR(LOT,IP),TAU(0:N-1,3)
      REAL(8)    CHI(LOT,IP),CCI(LOT,IP)

      INTEGER    J,L,M,JL
      REAL(8)    R1,R2,R3,R4,R5,R6,      P1,P2,P3,P4,P5,P6,P7,P8,
     +           I1,I2,I3,I4,I5,I6,      Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,
     +           A1,A2,A3,A4,A5,A6,A7,A8,B1,B2,B3,B4,B5,B6,B7,B8,
     +           X1,X2,Y1,Y2, COSJL,SINJL, S,S2, T1,T2

!     TRIG FACTORS FOR IP=3,6 AND 8.

!#    if defined (i386)
      REAL(8),   PARAMETER ::
     +           SIN60  =0.8660254037844386467637231707529308D0 ,
     +           SIN45  =0.7071067811865475244008443621048408D0
!#    else
!     REAL(8),   PARAMETER ::
!    +           SIN60  =0.8660254037844386467637231707529308Q0 ,
!    +           SIN45  =0.7071067811865475244008443621048408Q0
!#    endif

!     * TRIG FACTORS FOR IP=5.

!     NOTE THAT  QSQRT5 = SIN(36)*SIN(72)

!#    if defined (i386)
      REAL(8),   PARAMETER ::
     +           SIN72  =0.9510565162951535721164393333793779D0 ,
     +           SIN36  =0.5877852522924731291687059546390678D0 ,
     +           QSQRT5 =0.5590169943749474241022934171828085D0
!#    else
!     REAL(8),   PARAMETER ::      
!    +           SIN72  =0.9510565162951535721164393333793779Q0 ,
!    +           SIN36  =0.5877852522924731291687059546390678Q0 ,
!    +           QSQRT5 =0.5590169943749474241022934171828085Q0
!#    endif

!     * TRIG FACTORS FOR IP=7.

!     NOTE THAT  C1TPI7 = COS(360/7) ,
!                C2TPI7 = COS(720/7) AND
!                C3TPI7 = COS(1080/7),

!#    if defined (i386)
      REAL(8),   PARAMETER ::
     +           C1TPI7 =0.6234898018587335305250048840042495D0 ,
     +           C2TPI7 =-.2225209339563144042889025644967823D0 ,
     +           C3TPI7 =-.9009688679024191262361023195074379D0
!#    else
!     REAL(8),   PARAMETER ::      
!    +           C1TPI7 =0.6234898018587335305250048840042495Q0 ,
!    +           C2TPI7 =-.2225209339563144042889025644967823Q0 ,
!    +           C3TPI7 =-.9009688679024191262361023195074379Q0
!#    endif

!     AND THAT   S1TPI7 = SIN(360/7),
!                S2S1   = SIN(720/7)/SIN(360/7) AND
!                S3S1   = SIN(1080/7)/SIN(360/7)

!#    if defined (i386)
      REAL(8),   PARAMETER ::
     +           S1TPI7 =0.7818314824680298087084445266740527D0 ,
     +           S2S1   =1.246979603717467061050009768008474D0  ,
     +           S3S1   =0.5549581320873711914221948710064385D0
!#    else
!     REAL(8),   PARAMETER ::      
!    +           S1TPI7 =0.7818314824680298087084445266740527Q0 ,
!    +           S2S1   =1.246979603717467061050009768008474Q0  ,
!    +           S3S1   =0.5549581320873711914221948710064385Q0
!#    endif

      EXTERNAL   FACT09,FACT10,FACT12,FACT16

C------------------------------------------------------------------------
C ***************** GENERAL RADIX STOCKHAM FFT **************************

      S = IS

      IF (IP.EQ.2)                                             THEN

          DO M=1,LOT
             A1 =       CCR(M,1)
             A2 =       CCR(M,2)
             B1 =       CCI(M,1)
             B2 =       CCI(M,2)
             CHR(M,1)= +A1 + A2
             CHR(M,2)= +A1 - A2
             CHI(M,1)= +B1 + B2
             CHI(M,2)= +B1 - B2
          END DO

      ELSE IF (IP.EQ.3)                                        THEN
 
          S     = S * SIN60

          DO M=1,LOT

             A1 =       CCR(M,1)
             A2 =       CCR(M,2)
             A3 =       CCR(M,3)

             B1 =       CCI(M,1)
             B2 =       CCI(M,2)
             B3 =       CCI(M,3)

             R1 =       A2 + A3
             I1 =       B2 + B3

             CHR(M,1)=  A1 + R1
             CHI(M,1)=  B1 + I1

             P1 =       A1 - R1 * 0.5
             P2 =       B1 - I1 * 0.5

             Q1 =     ( B2 - B3 ) * S
             Q2 =     ( A2 - A3 ) * S

             CHR(M,2)=  P1 - Q1
             CHR(M,3)=  P1 + Q1
             CHI(M,2)=  P2 + Q2
             CHI(M,3)=  P2 - Q2

          END DO

      ELSE IF (IP.EQ.4)                                        THEN

          DO M=1,LOT

             A1 =   CCR(M,1)
             A2 =   CCR(M,2)
             A3 =   CCR(M,3)
             A4 =   CCR(M,4)

             B1 =   CCI(M,1)
             B2 =   CCI(M,2)
             B3 =   CCI(M,3)
             B4 =   CCI(M,4)

             CHR(M,1) = ( A1 + A3 ) + ( A2 + A4 )
             CHR(M,3) = ( A1 + A3 ) - ( A2 + A4 )

             CHR(M,2) = ( A1 - A3 ) - ( B2 - B4 ) * S
             CHR(M,4) = ( A1 - A3 ) + ( B2 - B4 ) * S

             CHI(M,1) = ( B1 + B3 ) + ( B2 + B4 )
             CHI(M,3) = ( B1 + B3 ) - ( B2 + B4 )

             CHI(M,2) = ( B1 - B3 ) + ( A2 - A4 ) * S
             CHI(M,4) = ( B1 - B3 ) - ( A2 - A4 ) * S

          END DO

      ELSE IF (IP.EQ.5)                                        THEN

          S2    = S * SIN36
          S     = S * SIN72

          DO M=1,LOT

             A1 =    CCR(M,1)
             A2 =    CCR(M,2)
             A3 =    CCR(M,3)
             A4 =    CCR(M,4)
             A5 =    CCR(M,5)

             B1 =    CCI(M,1)
             B2 =    CCI(M,2)
             B3 =    CCI(M,3)
             B4 =    CCI(M,4)
             B5 =    CCI(M,5)

             T2       =      ( B2 + B5 ) + ( B3 + B4 )
             Y2       =    ( ( B2 + B5 ) - ( B3 + B4 ) ) * QSQRT5
             Q1       = S  * ( B2 - B5 ) + ( B3 - B4 )   * S2
             Q2       = S2 * ( B2 - B5 ) - ( B3 - B4 )   * S

             Q4       = S2 * ( A2 - A5 ) - ( A3 - A4 )   * S
             Q3       = S  * ( A2 - A5 ) + ( A3 - A4 )   * S2
             Y1       =    ( ( A2 + A5 ) - ( A3 + A4 ) ) * QSQRT5
             T1       =      ( A2 + A5 ) + ( A3 + A4 )

             CHR(M,1) =   A1 + T1
             CHI(M,1) =   B1 + T2
             X1       =   A1 - T1 * 0.25
             X2       =   B1 - T2 * 0.25

             P1       =   X1 + Y1
             P2       =   X1 - Y1
             P3       =   X2 + Y2
             P4       =   X2 - Y2

             CHR(M,2) =   P1 - Q1
             CHR(M,5) =   P1 + Q1
             CHR(M,3) =   P2 - Q2
             CHR(M,4) =   P2 + Q2

             CHI(M,2) =   P3 + Q3
             CHI(M,5) =   P3 - Q3
             CHI(M,3) =   P4 + Q4
             CHI(M,4) =   P4 - Q4

          END DO

      ELSE IF (IP.EQ.6)                                        THEN

          S     = S * SIN60

          DO M=1,LOT

             A1 =    CCR(M,1)
             A2 =    CCR(M,2)
             A3 =    CCR(M,3)
             A4 =    CCR(M,4)
             A5 =    CCR(M,5)
             A6 =    CCR(M,6)

             B1 =    CCI(M,1)
             B2 =    CCI(M,2)
             B3 =    CCI(M,3)
             B4 =    CCI(M,4)
             B5 =    CCI(M,5)
             B6 =    CCI(M,6)

             R1  =   A3 + A5
             I1  =   B3 + B5

             P1 =    A1 + R1
             P2 =  ( A1 - R1 * 0.5 ) + ( B3 - B5 ) * S
             P3 =  ( A1 - R1 * 0.5 ) - ( B3 - B5 ) * S
             P4 =    B1 + I1
             P5 =  ( B1 - I1 * 0.5 ) - ( A3 - A5 ) * S
             P6 =  ( B1 - I1 * 0.5 ) + ( A3 - A5 ) * S

             R4  =   A6 + A2
             I4  =   B6 + B2

             Q1 =    A4 + R4
             Q2 =  ( A4 - R4 * 0.5 ) + ( B6 - B2 ) * S
             Q3 =  ( A4 - R4 * 0.5 ) - ( B6 - B2 ) * S
             Q4 =    B4 + I4
             Q5 =  ( B4 - I4 * 0.5 ) - ( A6 - A2 ) * S
             Q6 =  ( B4 - I4 * 0.5 ) + ( A6 - A2 ) * S

             CHR(M,1)  =  P1 + Q1
             CHR(M,4)  =  P1 - Q1
             CHR(M,2)  =  P3 - Q3
             CHR(M,5)  =  P3 + Q3
             CHR(M,3)  =  P2 + Q2
             CHR(M,6)  =  P2 - Q2

             CHI(M,1)  =  P4 + Q4
             CHI(M,4)  =  P4 - Q4
             CHI(M,2)  =  P6 - Q6
             CHI(M,5)  =  P6 + Q6
             CHI(M,3)  =  P5 + Q5
             CHI(M,6)  =  P5 - Q5

          END DO

      ELSE IF (IP.EQ.7)                                        THEN

          S     = S * S1TPI7

          DO M=1,LOT

             A1 =   CCR(M,1)
             A2 =   CCR(M,2)
             A3 =   CCR(M,3)
             A4 =   CCR(M,4)
             A5 =   CCR(M,5)
             A6 =   CCR(M,6)
             A7 =   CCR(M,7)

             B1 =   CCI(M,1)
             B2 =   CCI(M,2)
             B3 =   CCI(M,3)
             B4 =   CCI(M,4)
             B5 =   CCI(M,5)
             B6 =   CCI(M,6)
             B7 =   CCI(M,7)

             R1 =   A2 + A7
             R2 =   A3 + A6
             R3 =   A4 + A5
             R4 =   B2 + B7
             R5 =   B3 + B6
             R6 =   B4 + B5

             I1 = ( B2 - B7 ) * S
             I2 = ( B3 - B6 ) * S
             I3 = ( B4 - B5 ) * S
             I4 = ( A2 - A7 ) * S
             I5 = ( A3 - A6 ) * S
             I6 = ( A4 - A5 ) * S

             CHR(M,1)  = A1 + R1 + R2 + R3
             CHI(M,1)  = B1 + R4 + R5 + R6

             P1 =  A1  + C1TPI7* R1 + C2TPI7* R2 + C3TPI7* R3
             P2 =  A1  + C2TPI7* R1 + C3TPI7* R2 + C1TPI7* R3
             P3 =  A1  + C3TPI7* R1 + C1TPI7* R2 + C2TPI7* R3
             P4 =  B1  + C1TPI7* R4 + C2TPI7* R5 + C3TPI7* R6
             P5 =  B1  + C2TPI7* R4 + C3TPI7* R5 + C1TPI7* R6
             P6 =  B1  + C3TPI7* R4 + C1TPI7* R5 + C2TPI7* R6

             Q1 =                I1 + S2S1  * I2 + S3S1  * I3
             Q2 =         S2S1 * I1 - S3S1  * I2 -         I3
             Q3 =         S3S1 * I1 -         I2 + S2S1  * I3
             Q4 =                I4 + S2S1  * I5 + S3S1  * I6
             Q5 =         S2S1 * I4 - S3S1  * I5 -         I6
             Q6 =         S3S1 * I4 -         I5 + S2S1  * I6

             CHR(M,2)  = P1 - Q1
             CHR(M,7)  = P1 + Q1
             CHR(M,3)  = P2 - Q2
             CHR(M,6)  = P2 + Q2
             CHR(M,4)  = P3 - Q3
             CHR(M,5)  = P3 + Q3

             CHI(M,2)  = P4 + Q4
             CHI(M,7)  = P4 - Q4
             CHI(M,3)  = P5 + Q5
             CHI(M,6)  = P5 - Q5
             CHI(M,4)  = P6 + Q6
             CHI(M,5)  = P6 - Q6

          END DO

      ELSE IF (IP.EQ.8)                                        THEN

          DO M=1,LOT

             A1 =   CCR(M,1)
             A2 =   CCR(M,2)
             A3 =   CCR(M,3)
             A4 =   CCR(M,4)
             A5 =   CCR(M,5)
             A6 =   CCR(M,6)
             A7 =   CCR(M,7)
             A8 =   CCR(M,8)

             B1 =   CCI(M,1)
             B2 =   CCI(M,2)
             B3 =   CCI(M,3)
             B4 =   CCI(M,4)
             B5 =   CCI(M,5)
             B6 =   CCI(M,6)
             B7 =   CCI(M,7)
             B8 =   CCI(M,8)

             X1 =   ( A2 - A6 ) - ( A4 - A8 )
             Y2 = ( ( A2 - A6 ) + ( A4 - A8 ) ) * S
             Q1 =   ( A2 + A6 ) + ( A4 + A8 )
             Q4 = ( ( A2 + A6 ) - ( A4 + A8 ) ) * S
             X2 =   ( B2 - B6 ) - ( B4 - B8 )
             Y1 = ( ( B2 - B6 ) + ( B4 - B8 ) ) * S
             Q2 = ( ( B2 + B6 ) - ( B4 + B8 ) ) * S
             Q3 =   ( B2 + B6 ) + ( B4 + B8 )

             Q5 =   ( X1 - Y1 ) *   SIN45
             Q6 =   ( X1 + Y1 ) *   SIN45
             Q7 =   ( X2 + Y2 ) *   SIN45
             Q8 =   ( X2 - Y2 ) *   SIN45

             P1 =   ( A1 + A5 ) + ( A3 + A7 )
             P2 =   ( A1 + A5 ) - ( A3 + A7 )
             P5 =   ( A1 - A5 ) - ( B3 - B7 ) * S
             P6 =   ( A1 - A5 ) + ( B3 - B7 ) * S
             P3 =   ( B1 + B5 ) + ( B3 + B7 )
             P4 =   ( B1 + B5 ) - ( B3 + B7 )
             P7 =   ( B1 - B5 ) + ( A3 - A7 ) * S
             P8 =   ( B1 - B5 ) - ( A3 - A7 ) * S

             CHR(M,1)= P1 + Q1
             CHR(M,5)= P1 - Q1
             CHR(M,3)= P2 - Q2
             CHR(M,7)= P2 + Q2

             CHI(M,1)= P3 + Q3
             CHI(M,5)= P3 - Q3
             CHI(M,3)= P4 + Q4
             CHI(M,7)= P4 - Q4

             CHR(M,2)= P5 + Q5
             CHR(M,6)= P5 - Q5
             CHR(M,4)= P6 - Q6
             CHR(M,8)= P6 + Q6

             CHI(M,2)= P7 + Q7
             CHI(M,6)= P7 - Q7
             CHI(M,4)= P8 - Q8
             CHI(M,8)= P8 + Q8

          END DO

      ELSE IF (IP.EQ.9)                                        THEN

          CALL FACT09( IS, LOT,IP,N, CCR,CCI,CHR,CHI )

      ELSE IF (IP.EQ.10)                                       THEN

          CALL FACT10( IS, LOT,IP,N, CCR,CCI,CHR,CHI )

      ELSE IF (IP.EQ.12)                                       THEN

          CALL FACT12( IS, LOT,IP,N, CCR,CCI,CHR,CHI )

      ELSE IF (IP.EQ.16)                                       THEN

          CALL FACT16( IS, LOT,IP,N, CCR,CCI,CHR,CHI )

      ELSE

          DO 32 L=1,IP

             DO M=1,LOT
                CHR(M,L)=0.0
                CHI(M,L)=0.0
             END DO

             DO 30 J=1,IP

                JL    = N * MOD( (J-1)*(L-1), IP ) / IP
                COSJL = TAU(JL,1)
                SINJL = TAU(JL,2) * S

                DO M=1,LOT
                   CHR(M,L)= CHR(M,L) + CCR(M,J)*COSJL - SINJL*CCI(M,J)
                   CHI(M,L)= CHI(M,L) + CCI(M,J)*COSJL + SINJL*CCR(M,J)
                END DO

   30        CONTINUE

   32     CONTINUE

      END IF

      RETURN
      END

C *** ROUTINE NEEDED FOR SECOND PASS OF TRANSFORM IN SFFT. BASED
C *** ON PASSG FOUND IN WASHINGTON & PARKINSON, P.356. ORIGINAL CODE
C *** BY SWARZTRAUBER.

      SUBROUTINE pass2( IS, LOT,IDO,IP,L1,N, CCR,CCI,CHR,CHI, OMEG )

      IMPLICIT   none

C     * MODIFIEE NOVEMBRE 1992 PAR B.Dugas, RPN:
C     * ...  UTILISER LES SUGGESTIONS DE MOSSBERG QUAND A
C     *      1) LA REDEFINITION DE LOT (PASSER DE TROIS A DEUX BOUCLES),
C     *      2) FORMULATION EN TERME DE VECTEURS TEMPORAIRES ET
C     *      3) CALCUL PLUS EFFICACE DE TAU.
C     * ...  TOUT LE CALCUL SE FAIT EN REAL*8

C     * AUTEUR: B.DUGAS - AUTOMNE 1992.

      INTEGER    IS,IDO,IP,L1,N,LOT
      REAL(8)    CHR(LOT,IDO,IP),CCR(LOT,IP,IDO)
      REAL(8)    CHI(LOT,IDO,IP),CCI(LOT,IP,IDO),OMEG(0:N-1,3)

      INTEGER    I,J,IJ,M
      REAL(8)    COSIJ,SINIJ, S

C------------------------------------------------------------------------
      S = IS

C        * CAS I,J .NE. 1

      DO 100 J=2,IP
      DO 100 I=2,IDO

         IJ = (I-1)*(J-1)*L1

         COSIJ = OMEG(IJ,1)
         SINIJ = OMEG(IJ,2) * S

         DO M=1,LOT
            CCR(M,J,I) = COSIJ * CHR(M,I,J) - SINIJ * CHI(M,I,J)
            CCI(M,J,I) = SINIJ * CHR(M,I,J) + COSIJ * CHI(M,I,J)
         END DO

  100 CONTINUE

c     * CAS I .EQ. 1

      DO 200 J=1,IP

         DO M=1,LOT
            CCR(M,J,1)=CHR(M,1,J)
            CCI(M,J,1)=CHI(M,1,J)
         END DO

  200 CONTINUE

c     * CAS J .EQ. 1, I NE. 1

      DO 300 I=2,IDO

         DO M=1,LOT
            CCR(M,1,I)=CHR(M,I,1)
            CCI(M,1,I)=CHI(M,I,1)
         END DO

  300 CONTINUE

      RETURN
      END

C *** SUBROUTINE NEEDED FOR FIRST PART OF FACTOR 09 TRANSFORM IN PASS1.

      SUBROUTINE fact09( IS, LOT,IP,N, CCR,CCI,CHR,CHI )

      IMPLICIT   none

C     * AUTEUR: B.DUGAS - ETE 1991.

C     * MODIFIEE NOVEMBRE 1992 PAR B.Dugas, RPN:
C     * ...  UTILISER LES SUGGESTIONS DE MOSSBERG QUAND A
C     *      1) LA REDEFINITION DE LOT (PASSER DE TROIS A UNE BOUCLE),
C     *      2) FORMULATION EN TERME DE VECTEURS TEMPORAIRES ET
C     *      3) CALCUL PLUS EFFICACE DE TAU.
C     * ...  TOUT LE CALCUL SE FAIT EN REAL*8
C     * MODIFIEE LE 12 OCT 1991 PAR B.Dugas, RPN: 
C     * ...  DEFINITION EXPLICITE DES PARAMETRES TRIGONOMETRIQUES.

      INTEGER    IS,IP,N,LOT
      REAL(8)    CHR(LOT,IP),CCR(LOT,IP)
      REAL(8)    CHI(LOT,IP),CCI(LOT,IP)

      INTEGER    M

C     NOTE THAT  C6040 = COS(60) /COS(40) ,
C                C8040 = COS(80) /COS(40) ,
C                C16040= COS(160)/COS(40) ,
C                S6040 = SIN(60) /SIN(40) ,
C                S8040 = SIN(80) /SIN(40) AND
C                S16040= SIN(160)/SIN(40)
      
!#    if defined (i386)
      REAL(8),   PARAMETER ::
     +           COS40 = 0.7660444431189780352023926505554119D0 ,
     +           SIN40 = 0.6427876096865393263226434099072557D0 ,
     +           C6040 = 0.6527036446661393022965667464613741D0 ,
     +           C8040 = 0.2266815969056774658116518081881003D0 ,
     +           C16040=-1.226681596905677465811651808188088D0  ,
     +           S6040 = 1.347296355333860697703433253538626D0  ,
     +           S8040 = 1.532088886237956070404785301110861D0  ,
     +           S16040= 0.5320888862379560704047853011108424D0
!#    else
!     REAL(8),   PARAMETER ::
!    +           COS40 = 0.7660444431189780352023926505554119Q0 ,
!    +           SIN40 = 0.6427876096865393263226434099072557Q0 ,
!    +           C6040 = 0.6527036446661393022965667464613741Q0 ,
!    +           C8040 = 0.2266815969056774658116518081881003Q0 ,
!    +           C16040=-1.226681596905677465811651808188088Q0  ,
!    +           S6040 = 1.347296355333860697703433253538626Q0  ,
!    +           S8040 = 1.532088886237956070404785301110861Q0  ,
!    +           S16040= 0.5320888862379560704047853011108424Q0
!#    endif

      REAL(8)    T1,T2,   R1,R2,R3,R4,R5,R6,R7,R8,
     +                    I1,I2,I3,I4,I5,I6,I7,I8,
     +           S40,S60, A1,A2,A3,A4,A5,A6,A7,A8,A9,
     +                    B1,B2,B3,B4,B5,B6,B7,B8,B9,
     +           PR0,PI0, P1,P2,P3,P4,P5,P6,P7,P8,
     +           QR0,QI0, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8

C------------------------------------------------------------------------
      S40  = SIN40 * IS
      S60  = S40   * S6040

        DO M=1,LOT

           A1 =   CCR(M,1)
           A2 =   CCR(M,2)
           A3 =   CCR(M,3)
           A4 =   CCR(M,4)
           A5 =   CCR(M,5)
           A6 =   CCR(M,6)
           A7 =   CCR(M,7)
           A8 =   CCR(M,8)
           A9 =   CCR(M,9)

           B1 =   CCI(M,1)
           B2 =   CCI(M,2)
           B3 =   CCI(M,3)
           B4 =   CCI(M,4)
           B5 =   CCI(M,5)
           B6 =   CCI(M,6)
           B7 =   CCI(M,7)
           B8 =   CCI(M,8)
           B9 =   CCI(M,9)

           R1     = ( A2  + A9 ) * COS40
           R2     = ( A3  + A8 ) * COS40
           R3     = ( A4  + A7 ) * 0.5
           R4     = ( A5  + A6 ) * COS40
           R5     = ( B2  + B9 ) * COS40
           R6     = ( B3  + B8 ) * COS40
           R7     = ( B4  + B7 ) * 0.5
           R8     = ( B5  + B6 ) * COS40

           T1     =   A1  - R3
           T2     =   B1  - R7
   
           PR0    =   A1       + R3 * 2.0
           PI0    =   B1       + R7 * 2.0
           QR0    = ( R1       + R2         + R4 ) * C6040
           QI0    = ( R5       + R6         + R8 ) * C6040

           CHR(M,1)=  PR0 + QR0 * 2.0
           CHI(M,1)=  PI0 + QI0 * 2.0

           I1     = ( B2 - B9 ) * S40
           I2     = ( B3 - B8 ) * S40
           I3     = ( B4 - B7 ) * S60
           I4     = ( B5 - B6 ) * S40
           I5     = ( A2 - A9 ) * S40
           I6     = ( A3 - A8 ) * S40
           I7     = ( A4 - A7 ) * S60
           I8     = ( A5 - A6 ) * S40

           P1   =   PR0 - QR0
           P5   =   PI0 - QI0

           Q1   = ( I1       - I2              + I4 ) * S6040
           Q2   =   I1       + I2*S8040 + I3   + I4   * S16040
           Q3   =   I1*S8040 + I2*S16040- I3   - I4
           Q4   =   I1*S16040- I2       + I3   - I4   * S8040

           Q5   = ( I5       - I6              + I8 ) * S6040
           Q6   =   I5       + I6*S8040 + I7   + I8   * S16040
           Q7   =   I5*S8040 + I6*S16040- I7   - I8
           Q8   =   I5*S16040- I6       + I7   - I8   * S8040

           P2   =   T1
     +          +   R1       + R2*C8040 + R4 * C16040
           P3   =   T1
     +          +   R1*C8040 + R2*C16040+ R4      
           P4   =   T1
     +          +   R1*C16040+ R2       + R4 * C8040

           P6   =   T2
     +          +   R5       + R6*C8040 + R8 * C16040
           P7   =   T2
     +          +   R5*C8040 + R6*C16040+ R8
           P8   =   T2
     +          +   R5*C16040+ R6       + R8 * C8040

           CHR(M,4)=  P1 - Q1
           CHR(M,7)=  P1 + Q1   
           CHR(M,2)=  P2 - Q2
           CHR(M,9)=  P2 + Q2
           CHR(M,3)=  P3 - Q3
           CHR(M,8)=  P3 + Q3
           CHR(M,5)=  P4 - Q4
           CHR(M,6)=  P4 + Q4

           CHI(M,4)=  P5 + Q5
           CHI(M,7)=  P5 - Q5
           CHI(M,2)=  P6 + Q6
           CHI(M,9)=  P6 - Q6
           CHI(M,3)=  P7 + Q7
           CHI(M,8)=  P7 - Q7
           CHI(M,5)=  P8 + Q8
           CHI(M,6)=  P8 - Q8

        END DO

      RETURN
      END

C *** SUBROUTINE NEEDED FOR FIRST PASS OF FACTOR 10 TRANSFORM IN PASS1.

      SUBROUTINE fact10( IS, LOT,IP,N, CCR,CCI,CHR,CHI )

      IMPLICIT   none

C     * AUTEUR: B.DUGAS - ETE 1991.

C     * MODIFIEE NOVEMBRE 1992 PAR B.Dugas, RPN:
C     * ...  UTILISER LES SUGGESTIONS DE MOSSBERG QUAND A
C     *      1) LA REDEFINITION DE LOT (PASSER DE TROIS A UNE BOUCLE),
C     *      2) FORMULATION EN TERME DE VECTEURS TEMPORAIRES ET
C     *      3) CALCUL PLUS EFFICACE DE TAU.
C     * ...  TOUT LE CALCUL SE FAIT EN REAL*8
C     * MODIFIEE LE 12 OCT 1991 PAR B.Dugas, RPN: 
C     * ...  DEFINITION EXPLICITE DES PARAMETRES TRIGONOMETRIQUES.

      INTEGER    IS,IP,N,LOT
      REAL(8)    CHR(LOT,IP),CCR(LOT,IP)
      REAL(8)    CHI(LOT,IP),CCI(LOT,IP)

      INTEGER    M

C     NOTE THAT  S3672 = SIN(36)/SIN(72) AND
C                QSQRT5= SIN(36)*SIN(72)
      
!#    if defined (i386)
      REAL(8),   PARAMETER ::
     +           SIN72 =0.9510565162951535721164393333793779D0 ,
     +           S3672 =0.6180339887498948482045868343656355D0 ,
     +           QSQRT5=0.5590169943749474241022934171828085D0
!#    else
!     REAL(8),   PARAMETER ::
!    +           SIN72 =0.9510565162951535721164393333793779Q0 ,
!    +           S3672 =0.6180339887498948482045868343656355Q0 ,
!    +           QSQRT5=0.5590169943749474241022934171828085Q0
!#    endif

      REAL(8)    R1,R2,R3,R4,R5,R6,R7,R8,R9,R0, S72,
     +           I1,I2,I3,I4,I5,I6,I7,I8,I9,I0,
     +           A1,A2,A3,A4,A5,A6,A7,A8,A9,A0,
     +           B1,B2,B3,B4,B5,B6,B7,B8,B9,B0,
     +           X1,X2,X3,X4,X5,X6,X7,X8,T1,T2,
     +           Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,U1,U2,
     +           P1,P2,P3,P4,P5,P6,P7,P8, 
     +           Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8

C------------------------------------------------------------------------
      S72 = SIN72 * IS

        DO M=1,LOT

           A1 =   CCR(M, 1)
           A2 =   CCR(M, 2)
           A3 =   CCR(M, 3)
           A4 =   CCR(M, 4)
           A5 =   CCR(M, 5)
           A6 =   CCR(M, 6)
           A7 =   CCR(M, 7)
           A8 =   CCR(M, 8)
           A9 =   CCR(M, 9)
           A0 =   CCR(M,10)

           B1 =   CCI(M, 1)
           B2 =   CCI(M, 2)
           B3 =   CCI(M, 3)
           B4 =   CCI(M, 4)
           B5 =   CCI(M, 5)
           B6 =   CCI(M, 6)
           B7 =   CCI(M, 7)
           B8 =   CCI(M, 8)
           B9 =   CCI(M, 9)
           B0 =   CCI(M,10)

           R1 =   A1 + A6
           R6 =   A1 - A6
           R2 =   A2 + A5
           R7 =   A2 - A5
           R3 =   A3 + A4
           R8 =   A3 - A4
           R4 =   A7 + A0
           R9 =   A7 - A0
           R5 =   A8 + A9
           R0 =   A8 - A9

           I1 =   B1 - B6
           I6 =   B1 + B6
           I2 =   B2 - B5
           I7 =   B2 + B5
           I3 =   B3 - B4
           I8 =   B3 + B4
           I4 =   B7 - B0
           I9 =   B7 + B0
           I5 =   B8 - B9
           I0 =   B8 + B9

           T1 =             ( R2 + R4 )
           U1 =             ( R3 + R5 )
           T2 =             ( I2 - I4 )
           U2 =             ( I3 - I5 )

           CHR(M, 1) = R1 + ( T1 + U1 )
           X1 =        R1 - ( T1 + U1 ) * 0.25
           Y1 =             ( T1 - U1 ) * QSQRT5

           CHI(M, 6) = I1 - ( T2 - U2 )
           X2 =        I1 + ( T2 - U2 ) * 0.25
           Y2 =             ( T2 + U2 ) * QSQRT5

           X3 =             ( I2 + I4 ) * S72
           Y3 =             ( I3 + I5 ) * S72
           X4 =             ( R2 - R4 ) * S72
           Y4 =             ( R3 - R5 ) * S72

           T1 =             ( I7 + I9 )
           U1 =             ( I8 + I0 )
           T2 =             ( R7 - R9 )
           U2 =             ( R8 - R0 )

           CHI(M, 1) = I6 + ( T1 + U1 )
           X5 =        I6 - ( T1 + U1 ) * 0.25
           Y5 =             ( T1 - U1 ) * QSQRT5

           CHR(M, 6) = R6 - ( T2 - U2 )
           X6 =        R6 + ( T2 - U2 ) * 0.25
           Y6 =             ( T2 + U2 ) * QSQRT5

           X7 =             ( R7 + R9 ) * S72
           Y7 =             ( R8 + R0 ) * S72
           X8 =             ( I7 - I9 ) * S72
           Y8 =             ( I8 - I0 ) * S72

           P1 =            X1 + Y1
           P2 =            X1 - Y1
           P3 =            X2 + Y2
           P4 =            X2 - Y2

           P5 =            X5 + Y5
           P6 =            X5 - Y5
           P7 =            X6 + Y6
           P8 =            X6 - Y6

           Q1 =            X3 + Y3   * S3672
           Q2 =    S3672 * X3 - Y3
           Q3 =    S3672 * X4 + Y4
           Q4 =            X4 - Y4   * S3672

           Q5 =            X7 + Y7   * S3672
           Q6 =    S3672 * X7 - Y7
           Q7 =    S3672 * X8 + Y8
           Q8 =            X8 - Y8   * S3672

           CHR(M, 3) =     P1 - Q1
           CHR(M, 9) =     P1 + Q1
           CHR(M, 5) =     P2 - Q2
           CHR(M, 7) =     P2 + Q2

           CHI(M, 2) =     P3 + Q3
           CHI(M,10) =     P3 - Q3
           CHI(M, 4) =     P4 + Q4
           CHI(M, 8) =     P4 - Q4

           CHI(M, 3) =     P5 + Q5
           CHI(M, 9) =     P5 - Q5
           CHI(M, 5) =     P6 + Q6
           CHI(M, 7) =     P6 - Q6

           CHR(M, 2) =     P7 - Q7
           CHR(M,10) =     P7 + Q7
           CHR(M, 4) =     P8 - Q8
           CHR(M, 8) =     P8 + Q8

        END DO

      RETURN
      END

C *** SUBROUTINE NEEDED FOR FIRST PASS OF FACTOR 12 TRANSFORM IN PASS1.

      SUBROUTINE fact12( IS, LOT,IP,N, CCR,CCI,CHR,CHI )

      IMPLICIT   none

C     * AUTEUR: B.DUGAS - ETE 1991.

C     * MODIFIEE NOVEMBRE 1992 PAR B.Dugas, RPN:
C     * ...  UTILISER LES SUGGESTIONS DE MOSSBERG QUAND A
C     *      1) LA REDEFINITION DE LOT (PASSER DE TROIS A UNE BOUCLE),
C     *      2) FORMULATION EN TERME DE VECTEURS TEMPORAIRES ET
C     *      3) CALCUL PLUS EFFICACE DE TAU.
C     * ...  TOUT LE CALCUL SE FAIT EN REAL*8
C     * MODIFIEE LE 12 OCT 1991 PAR B.Dugas, RPN: 
C     * ...  DEFINITION EXPLICITE DES PARAMETRES TRIGONOMETRIQUES.

      INTEGER    IS,IP,N,LOT
      REAL(8)    CHR(LOT,IP),CCR(LOT,IP)
      REAL(8)    CHI(LOT,IP),CCI(LOT,IP)

      INTEGER    M

!#    if defined (i386)
      REAL(8), PARAMETER :: SIN60=0.8660254037844386467637231707529308D0
!#    else
!     REAL(8), PARAMETER :: SIN60=0.8660254037844386467637231707529308Q0
!#    endif
      
      REAL(8)       R2,R3,   R5,R6,   R8,R9,   RB,RC,
     +              I2,I3,   I5,I6,   I8,I9,   IB,IC,
     +           A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,AC,
     +           B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,
     +           P1,P2,P3,P4,P5,P6,P7,P8,
     +           Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,   S,S2,
     +           X1,X2,X3,X4,X5,X6,X7,X8,
     +           Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8

C------------------------------------------------------------------------
      S  = IS
      S2 = S * SIN60

        DO M=1,LOT

           A1 =   CCR(M, 1)
           A2 =   CCR(M, 2)
           A3 =   CCR(M, 3)
           A4 =   CCR(M, 4)
           A5 =   CCR(M, 5)
           A6 =   CCR(M, 6)
           A7 =   CCR(M, 7)
           A8 =   CCR(M, 8)
           A9 =   CCR(M, 9)
           AA =   CCR(M,10)
           AB =   CCR(M,11)
           AC =   CCR(M,12)

           B1 =   CCI(M, 1)
           B2 =   CCI(M, 2)
           B3 =   CCI(M, 3)
           B4 =   CCI(M, 4)
           B5 =   CCI(M, 5)
           B6 =   CCI(M, 6)
           B7 =   CCI(M, 7)
           B8 =   CCI(M, 8)
           B9 =   CCI(M, 9)
           BA =   CCI(M,10)
           BB =   CCI(M,11)
           BC =   CCI(M,12)

           R2 =   A2 - A6 
           R8 =   A2 + A6 
           R3 =   A3 - A5 
           R9 =   A3 + A5 
           R5 =   A8 - AC 
           RB =   A8 + AC 
           R6 =   A9 - AB 
           RC =   A9 + AB 

           I2 =   B2 + B6 
           I8 =   B2 - B6 
           I3 =   B3 + B5 
           I9 =   B3 - B5 
           I5 =   B8 + BC 
           IB =   B8 - BC 
           I6 =   B9 + BB 
           IC =   B9 - BB 

           X1 = ( B1 + B7 ) - ( B4 + BA )
           X2 = ( B1 + B7 ) + ( B4 + BA )
           X3 = ( A1 - A7 ) - ( B4 - BA ) * S
           X4 = ( A1 - A7 ) + ( B4 - BA ) * S
           X5 = ( A1 + A7 ) - ( A4 + AA )
           X6 = ( A1 + A7 ) + ( A4 + AA )
           X7 = ( B1 - B7 ) + ( A4 - AA ) * S
           X8 = ( B1 - B7 ) - ( A4 - AA ) * S

           Y1 =     ( I2 + I5 ) - ( I3 + I6 )
           Y2 =     ( I2 + I5 ) + ( I3 + I6 )
           Y3 = S * ( I2 - I5 ) - ( R3 - R6 )
           Y4 = S * ( I2 - I5 ) + ( R3 - R6 )

           Q1 =   ( ( R2 + R5 ) + ( R3 + R6 )     ) * S2
           Q2 =   ( ( R2 + R5 ) - ( R3 + R6 )     ) * S2
           Q3 =   ( ( R2 - R5 ) - ( I3 - I6 ) * S ) * SIN60
           Q4 =   ( ( R2 - R5 ) + ( I3 - I6 ) * S ) * SIN60

           Y5 =     ( R8 + RB ) - ( R9 + RC )
           Y6 =     ( R8 + RB ) + ( R9 + RC )
           Y7 = S * ( R8 - RB ) + ( I9 - IC )
           Y8 = S * ( R8 - RB ) - ( I9 - IC )

           Q5 =   ( ( I8 + IB ) + ( I9 + IC )     ) * S2
           Q6 =   ( ( I8 + IB ) - ( I9 + IC )     ) * S2
           Q7 =   ( ( I8 - IB ) + ( R9 - RC ) * S ) * SIN60
           Q8 =   ( ( I8 - IB ) - ( R9 - RC ) * S ) * SIN60

           CHR(M,1)=    X6 + Y6
           CHR(M,7)=    X5 - Y5
           CHI(M,1)=    X2 + Y2
           CHI(M,7)=    X1 - Y1

           CHR(M,10)=   X3 + Y3
           CHR(M,4)=    X4 - Y4
           CHI(M,10)=   X7 - Y7
           CHI(M,4)=    X8 + Y8

           P1 =   X1 + Y1 * 0.5
           P2 =   X2 - Y2 * 0.5
           P3 =   X3 - Y3 * 0.5
           P4 =   X4 + Y4 * 0.5
           P5 =   X5 + Y5 * 0.5
           P6 =   X6 - Y6 * 0.5
           P7 =   X7 + Y7 * 0.5
           P8 =   X8 - Y8 * 0.5

           CHR(M,2)=  P3 + Q3
           CHR(M,6)=  P3 - Q3

           CHR(M,3)=  P5 - Q5
           CHR(M,11)= P5 + Q5

           CHR(M,5)=  P6 - Q6
           CHR(M,9)=  P6 + Q6

           CHR(M,8)=  P4 - Q4
           CHR(M,12)= P4 + Q4

           CHI(M,2)=  P7 + Q7
           CHI(M,6)=  P7 - Q7

           CHI(M,3)=  P1 + Q1
           CHI(M,11)= P1 - Q1

           CHI(M,5)=  P2 + Q2
           CHI(M,9)=  P2 - Q2

           CHI(M,8)=  P8 - Q8
           CHI(M,12)= P8 + Q8

        END DO

      RETURN
      END

C *** SUBROUTINE NEEDED FOR FIRST PASS OF FACTOR 16 TRANSFORM IN PASS1.

      SUBROUTINE fact16( IS, LOT,IP,N, CCR,CCI,CHR,CHI )

      IMPLICIT   none

C     * AUTEUR: B.Dugas, RPN - 03 JUIL 1991

C     * MODIFIEE NOVEMBRE 1992 PAR B.Dugas, RPN:
C     * ...  UTILISER LES SUGGESTIONS DE MOSSBERG QUAND A
C     *      1) LA REDEFINITION DE LOT (PASSER DE TROIS A UNE BOUCLE),
C     *      2) FORMULATION EN TERME DE VECTEURS TEMPORAIRES ET
C     *      3) CALCUL PLUS EFFICACE DE TAU.
C     * ...  TOUT LE CALCUL SE FAIT EN REAL*8
C     * MODIFIEE LE 12 OCT 1991 PAR B.Dugas, RPN: 
C     * ...  DEFINITION EXPLICITE DES PARAMETRES TRIGONOMETRIQUES.

      INTEGER    IS,IP,N,LOT

      REAL(8)    CHR(LOT,IP),CCR(LOT,IP)
      REAL(8)    CHI(LOT,IP),CCI(LOT,IP)

      INTEGER    M

C     NOTE THAT  TAN23 = TAN(22.5) AND
C                COS23 = COS(22.5)
      
!#    if defined (i386)
      REAL(8),   PARAMETER ::
     +           SIN45 =0.7071067811865475244008443621048408D0 ,
     +           TAN23 =0.4142135623730950488016887242096939D0 ,
     +           COS23 =0.9238795325112867561281831893967826D0
!#    else
!     REAL(8),   PARAMETER ::
!    +           SIN45 =0.7071067811865475244008443621048408Q0 ,
!    +           TAN23 =0.4142135623730950488016887242096939Q0 ,
!    +           COS23 =0.9238795325112867561281831893967826Q0
!#    endif

      REAL(8)    R1,R2,R3,R4,R5,R6,R7,R8,R9,RA,RB,RC,RD,RE,RF,RG, S,
     +           I1,I2,I3,I4,I5,I6,I7,I8,I9,IA,IB,IC,ID,IE,IF,IG, 
     +           A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,AC,AD,AE,AF,AG, 
     +           B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF,BG, 
     +           PR1,PR2,PR3,PR4,PR5,PR6,PR7,PR8,PR9,PR0,
     +           QR1,QR2,QR3,QR4,QR5,QR6,
     +           PI1,PI2,PI3,PI4,PI5,PI6,PI7,PI8,PI9,PI0,
     +           QI1,QI2,QI3,QI4,QI5,QI6,
     +           P1,P2,P3,P4,P5,P6,P7,P8,P9,PA,PB,PC,PD,PE,PF,PG,
     +           Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,QA,QB,QC,QD,QE,QF,QG,
     +           XR1,XR2,XR3,XR4,XR5,XR6,XR7,XR8,
     +           XI1,XI2,XI3,XI4,XI5,XI6,XI7,XI8

C------------------------------------------------------------------------ 
      S = IS

        do M=1,lot

          A1 =    CCR(M, 1)
          A2 =    CCR(M, 2)
          A3 =    CCR(M, 3)
          A4 =    CCR(M, 4)
          A5 =    CCR(M, 5)
          A6 =    CCR(M, 6)
          A7 =    CCR(M, 7)
          A8 =    CCR(M, 8)
          A9 =    CCR(M, 9)
          AA =    CCR(M,10)
          AB =    CCR(M,11)
          AC =    CCR(M,12)
          AD =    CCR(M,13)
          AE =    CCR(M,14)
          AF =    CCR(M,15)
          AG =    CCR(M,16)

          B1 =    CCI(M, 1)
          B2 =    CCI(M, 2)
          B3 =    CCI(M, 3)
          B4 =    CCI(M, 4)
          B6 =    CCI(M, 6)
          B7 =    CCI(M, 7)
          B8 =    CCI(M, 8)
          B9 =    CCI(M, 9)
          BA =    CCI(M,10)
          BB =    CCI(M,11)
          BC =    CCI(M,12)
          BE =    CCI(M,14)
          BF =    CCI(M,15)
          BG =    CCI(M,16)

          R1 =    A1  + A9
          R2 =    A2  + A8
          R3 =    A3  + A7
          R4 =    A4  + A6
          R6 =    AA  + AG
          R7 =    AB  + AF
          R8 =    AC  + AE

          I1 =    B1  - B9
          I2 =    B2  - B8
          I3 =    B3  - B7
          I4 =    B4  - B6
          I6 =    BA  - BG
          I7 =    BB  - BF
          I8 =    BC  - BE

          R5 =    A5  + AD
          I5 =  ( A5  - AD) * S

          PR1 = ( R1  + R5 )
          PR5 = ( R1  - R5 )
          QR4 = ( R2  - R6 ) * S
          PR2 = ( R2  + R6 )
          PR3 = ( R3  + R7 )
          QR5 = ( R3  - R7 ) * S
          QR6 = ( R4  - R8 ) * S
          PR4 = ( R4  + R8 )

          PR6 = ( I1  + I5 )
          PR0 = ( I1  - I5 )
          PR7 = ( I2  - I6 )
          QR1 = ( I2  + I6 ) * S
          QR2 = ( I3  + I7 ) * S
          PR8 = ( I3  - I7 )
          PR9 = ( I4  - I8 )
          QR3 = ( I4  + I8 ) * S

          P1  = ( PR1 + PR3 )
          P2  = ( PR1 - PR3 )
          P3  = ( PR5 - QR2 )
          P4  = ( PR5 + QR2 )

          Q1  = ( PR2 + PR4 )
          XR1 = ( PR2 - PR4 ) * SIN45
          XR2 = ( QR1 + QR3 ) * SIN45
          Q2  = ( QR1 - QR3 )

          Q3  = ( XR1 - XR2 )
          Q4  = ( XR1 + XR2 )

          XR3 = ( PR8 + QR5 ) * SIN45
          XR6 = ( PR8 - QR5 ) * SIN45
          XR4 = ( PR7 + QR6 ) * COS23
          XR7 = ( PR7 - QR6 ) * COS23
          XR5 = ( PR9 + QR4 ) * COS23
          XR8 = ( PR9 - QR4 ) * COS23

          Q5  = ( XR4       + XR5*TAN23 )
          Q6  = ( XR4*TAN23 - XR5       )
          Q7  = ( XR7*TAN23 - XR8       )
          Q8  = ( XR7       + XR8*TAN23 )

          P5  = ( PR6 + XR3 )
          P6  = ( PR6 - XR3 )
          P7  = ( PR0 - XR6 )
          P8  = ( PR0 + XR6 )

          CHR(M, 1)=  P1 + Q1
          CHR(M, 9)=  P1 - Q1
          CHR(M, 5)=  P2 - Q2
          CHR(M,13)=  P2 + Q2

          CHI(M, 2)=  P5 + Q5
          CHI(M,10)=  P5 - Q5
          CHI(M, 6)=  P6 - Q6
          CHI(M,14)=  P6 + Q6

          CHR(M, 3)=  P3 + Q3
          CHR(M,11)=  P3 - Q3
          CHR(M, 7)=  P4 - Q4
          CHR(M,15)=  P4 + Q4

          CHI(M, 4)=  P7 + Q7
          CHI(M,12)=  P7 - Q7
          CHI(M, 8)=  P8 - Q8
          CHI(M,16)=  P8 + Q8

       end do
       do M=1,lot

          A1 =    CCR(M, 1)
          A2 =    CCR(M, 2)
          A3 =    CCR(M, 3)
          A4 =    CCR(M, 4)
          A6 =    CCR(M, 6)
          A7 =    CCR(M, 7)
          A8 =    CCR(M, 8)
          A9 =    CCR(M, 9)
          AA =    CCR(M,10)
          AB =    CCR(M,11)
          AC =    CCR(M,12)
          AE =    CCR(M,14)
          AF =    CCR(M,15)
          AG =    CCR(M,16)

          B1 =    CCI(M, 1)
          B2 =    CCI(M, 2)
          B3 =    CCI(M, 3)
          B4 =    CCI(M, 4)
          B5 =    CCI(M, 5)
          B6 =    CCI(M, 6)
          B7 =    CCI(M, 7)
          B8 =    CCI(M, 8)
          B9 =    CCI(M, 9)
          BA =    CCI(M,10)
          BB =    CCI(M,11)
          BC =    CCI(M,12)
          BD =    CCI(M,13)
          BE =    CCI(M,14)
          BF =    CCI(M,15)
          BG =    CCI(M,16)

          I9 =    A1  - A9
          IA =    A2  - A8
          IB =    A3  - A7
          IC =    A4  - A6
          IE =    AA  - AG
          IF =    AB  - AF
          IG =    AC  - AE

          R9 =    B1  + B9
          RA =    B2  + B8
          RB =    B3  + B7
          RC =    B4  + B6
          RE =    BA  + BG
          RF =    BB  + BF
          RG =    BC  + BE

          ID =  ( B5  - BD ) * S
          RD =    B5  + BD

          PI1 = ( R9  + RD )
          PI5 = ( R9  - RD )
          QI4 = ( RA  - RE ) * S
          PI2 = ( RA  + RE )
          PI3 = ( RB  + RF )
          QI5 = ( RB  - RF ) * S
          QI6 = ( RC  - RG ) * S
          PI4 = ( RC  + RG )

          PI6 = ( I9  - ID )
          PI0 = ( I9  + ID )
          PI7 = ( IA  - IE )
          QI1 = ( IA  + IE ) * S
          QI2 = ( IB  + IF ) * S
          PI8 = ( IB  - IF )
          PI9 = ( IC  - IG )
          QI3 = ( IC  + IG ) * S

          P9  = ( PI1 + PI3 )
          PA  = ( PI1 - PI3 )
          PB  = ( PI5 + QI2 )
          PC  = ( PI5 - QI2 )

          Q9  = ( PI2 + PI4 )
          XI1 = ( PI2 - PI4 ) * SIN45
          XI2 = ( QI1 + QI3 ) * SIN45
          QA  = ( QI1 - QI3 )

          QB  = ( XI1 + XI2 )
          QC  = ( XI1 - XI2 )

          XI3 = ( PI8 - QI5 ) * SIN45
          XI6 = ( PI8 + QI5 ) * SIN45
          XI4 = ( PI7 - QI6 ) * COS23
          XI7 = ( PI7 + QI6 ) * COS23
          XI5 = ( PI9 - QI4 ) * COS23
          XI8 = ( PI9 + QI4 ) * COS23

          QD  = ( XI4       + XI5*TAN23 )
          QE  = ( XI4*TAN23 - XI5       )
          QF  = ( XI7*TAN23 - XI8       )
          QG  = ( XI7       + XI8*TAN23 )

          PD  = ( PI6 + XI3 )
          PE  = ( PI6 - XI3 )
          PF  = ( PI0 - XI6 )
          PG  = ( PI0 + XI6 )

          CHI(M, 1)=  P9 + Q9
          CHI(M, 9)=  P9 - Q9
          CHI(M, 5)=  PA + QA
          CHI(M,13)=  PA - QA

          CHR(M, 2)=  PD + QD
          CHR(M,10)=  PD - QD
          CHR(M, 6)=  PE - QE
          CHR(M,14)=  PE + QE

          CHI(M, 3)=  PB + QB
          CHI(M,11)=  PB - QB
          CHI(M, 7)=  PC - QC
          CHI(M,15)=  PC + QC

          CHR(M, 4)=  PF + QF
          CHR(M,12)=  PF - QF
          CHR(M, 8)=  PG - QG
          CHR(M,16)=  PG + QG

        end do

      RETURN

      END

