#     if !defined (nombre_max_de_facteurs)
#         define   nombre_max_de_facteurs 20
#     endif
#     if !defined (lot_maximum)
#     define lot_maximum 16
#     endif
#     if !defined (nombre_de_taches)
#         define   nombre_de_taches 1
#     endif

*     $Log: fftcray.ftn,v $
*     Revision 3.8  2015/03/30 22:13:41  dugas
*     Verifier que N > 0 dans FTSETUP.
*
*     Revision 3.7  2014/09/25 18:42:02  dugas
*     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
*
*     Revision 3.6  2010/03/27 21:13:39  dugas
*     La routine FTSETUP fait maintenant un appel a
*     SETFFT_RD et VFFT de son cote utilise FFT_RD.
*
*     Revision 3.5  2008/04/28 21:40:20  dugas
*     Corriger l'usage des macros pour r.gppf (passe 2).
*
*     Revision 3.4  2005/07/28 17:18:51  dugas
*     Modifier le code pour enlever les messages d'avertissement de F90.
*
*     Revision 3.3  2003/09/15 16:22:58  dugas
*     Re-definir le macro lot_maximum de 1024 a 4 suite a
*      une modification equivalente dans les versions libpriv.a
*      de RPASSM8 et QPASSM8 sur nos frontaux survenues recamment.
*     Ajouter les routines FFGFW3 et FFWFG3 en replacement de
*      FFGFW et FFWFG. Le champ lu en entree est maintenant
*      re-ecrit a la sortie.
*
*     Revision 3.2  1995/11/01 20:04:03  armnrbd
*     De-allouer les appels multi-taches.
*
C     Revision 3.1  1994/11/17  14:13:15  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C
C     Revision 3.0  94/11/17  13:55:26  13:55:26  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.1  93/10/28  12:11:14  armnrbd
C     Petite correction pour isoler le mode MP de SGI.
C     
C     Revision 2.0  93/10/13  13:31:40  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.1  93/02/10  15:34:54  15:34:54  armnrbd (Bernard Dugas)
C     Ajouter le macro cpp de definition du lot maximum.
C     
C     Revision 1.0  92/02/21  11:32:34  armnrbd
C     Initial revision

C     SUBROUTINE FTSETUP
C     - COMPUTES FACTORS OF N & TRIGONOMETRIC FUNCTIONS
C       AS REQUIRED BY FFT_RD. 

      SUBROUTINE FTSETUP(TRIG,IFAX,N)

      IMPLICIT none
      INTEGER  N,IER
      REAL     TRIG(N),IFAX(*)
      EXTERNAL SETFFT_RD,XIT

      integer npts,i
      real *8, pointer, dimension(:) :: trigs
      integer, parameter :: maxfac=nombre_max_de_facteurs
      integer, dimension(maxfac) :: ifac
      common /QQQRD_FFFT8_DRQQQ/ trigs,ifac,npts

      IF (N <= 0) CALL                             XIT(' Ftsetup',-1 )
      CALL SETFFT_RD( N,IER )
      IF (IER /= 0) CALL                           XIT(' Ftsetup',-1 )

      do i=1,maxfac
          if (ifac(i) == 0) exit
          IFAX(i) = ifac(i)
      end do

      TRIG(1:N) = trigs(1:N)

      RETURN
      END 

C     * VFFT EST MAINTENANT SUBSTITUE PAR FFT772 QUE L'ON PEUT
C     * TROUVER  SUR LIBDIAG.  CETTE NOUVELLE VERSION  COMPORTE
C     * MOINS DE RESTRICTIONS TOUT EN ETANT COMPATIBLE EN TER-
C     * ME DES PARAMETRES D'APPELS.

C     * DEC 21/90 - B.DUGAS

      SUBROUTINE VFFT( A, WORK,TRIGS,IFAX,INC,JUMP,N,LOT,ISIGN ) 

C     * MULTIPLE FAST REAL PERIODIC TRANSFORM. 
C     * REAL TRANSFORM OF LENGTH N PERFORMED BY REMOVING REDUNDANT 
C     * OPERATIONS FROM COMPLEX TRANSFORM OF LENGTH N 

C     * A IS THE ARRAY CONTAINING INPUT & OUTPUT DATA 
C     * WORK IS KEPT FOR CALLING SEQUENCE COMPATIBILITY
C     * TRIGS IS A PREVIOUSLY PREPARED LIST OF TRIG FUNCTION VALUES 
C     * IFAX IS A PREVIOUSLY PREPARED LIST OF FACTORS OF N 
C     * INC IS THE INCREMENT WITHIN EACH DATA 'VECTOR' 
C     *     (E.G. INC=1 FOR CONSECUTIVELY STORED DATA) 
C     * JUMP IS THE INCREMENT BETWEEN THE START OF EACH DATA VECTOR 
C     * N IS THE LENGTH OF THE DATA VECTORS 
C     * LOT IS THE NUMBER OF DATA VECTORS 
C     * ISIGN = +1 FOR TRANSFORM FROM SPECTRAL TO GRIDPOINT 
C     *       = -1 FOR TRANSFORM FROM GRIDPOINT TO SPECTRAL 

C     * ORDERING OF COEFFICIENTS: 
C     *     A(0),B(0),A(1),B(1),A(2),B(2),...,A(N/2),B(N/2) 
C     *     WHERE B(0)=B(N/2)=0; (N+2) LOCATIONS REQUIRED 

C     * ORDERING OF DATA: 
C     *     X(0),X(1),X(2),...,X(N-1), 0 , 0 ; (N+2) LOCATIONS REQUIRED 

C     * VECTORIZATION IS ACHIEVED ON CRAY BY DOING THE TEANSFORMS 
C     * IN PARALLEL 

C     * N MUST BE COMPOSED OF FACTORS RECOGNIZED BY SET77 AND AS SUCH
C     * DOES NOT HAVE TO BE EVEN

C     * DEFINITION OF TRANSFORMS: 
C     * ------------------------- 

C     * ISIGN=+1: X(J)=SUM(K=0,...,N-1)(C(K)*EXP(2*I*J*K*PI/N)) 
C     *     WHERE C(K)=A(K)+I*B(K) AND C(N-K)=A(K)-I*B(K) 
C     * 
C     * ISIGN=-1: A(K)=(1/N)*SUM(J=0,...,N-1)(X(J)*COS(2*J*K*PI/N)) 
C     *           B(K)=-(1/N)*SUM(J=0,...,N-1)(X(J)*SIN(2*J*K*PI/N)) 
C----------------------------------------------------------------- 

      IMPLICIT    none

      INTEGER     MAXLOT
      PARAMETER ( MAXLOT = lot_maximum )

      INTEGER     IFAX(1), INC,JUMP,N,LOT,ISIGN, IA,IW,
     +            INCLOT,NPLOT,DEBUT,FIN,M,IER,  NP
      REAL        A(N),WORK(1),TRIGS(1)

      EXTERNAL    FFT_RD,XIT

      INTEGER     Bidon,mpserv
      EXTERNAL    mpserv

      SAVE        NP
      DATA        NP / nombre_de_taches /

C------------------------------------------------------------------- 
C     * CHECK THAT LOT IS NOT TOO LARGE.

      IF (LOT.GT.lot_maximum)                                           THEN
          WRITE(6,6000) LOT
          CALL                                       XIT('  Vfft  ',-1 )
      END IF

C     * CHECK THE NUMBER OF PARALLEL THREADS AVAILABLE.

      NP    = mpserv( 'THREADS', NP   )
      INCLOT = (LOT-1)/NP+1

C     * SEPARATE INTO PARRALLEL TASKS.

CC$doacross local( M,DEBUT,FIN,NPLOT,IA,IW,IER )

      DO 100 M=1,NP

          DEBUT =          (M-1)*INCLOT
          FIN   = MIN( LOT, M   *INCLOT )

          NPLOT = FIN-DEBUT

          IA    = DEBUT*JUMP +1

          CALL FFT_RD( A(IA), INC,JUMP,N,NPLOT,ISIGN, IER )
     +                       
  100 CONTINUE

C     * SWITCH OFF PARRALLEL TASKS.

CC$   Bidon = mpserv('BLOCK',Bidon)

      RETURN 
C-------------------------------------------------------------------

 6000 FORMAT(' Lot=',I5,' too large in vfft.')

      END 
      SUBROUTINE FFGFW  (GD, ILG,FC,ILH,IR,LON,WRK,ILEV,IFAX,TRIGS) 

C     * JAN 05/84 - B.DUGAS. 
C     * JUL 19/83 - R.LAPRISE. 
C     * DRIVING ROUTINE FOR THE FOURIER TRANSFORM, 
C     * COEFFICIENTS TO GRID. 
C     * ==================== 
C     * FC    = FOURIER COEFFICIENTS, 
C     * ILH   = FIRST DIMENSION OF COMPLEX FC, 
C     * GD    = GRID DATA, 
C     * ILG   = FIRST DIMENSION OF REAL GD, NOTE THAT IT IS 
C     *         ASSUMED THAT GD AND FC ARE EQUIVALENCED IN MAIN, 
C     *         SO OBVIOUSLY ILG MUST EQUAL 2*ILH, 
C     *         ACTUALLY FC IS DECLARED REAL FOR CONVENIENCE. 
C     * IR    = MAXIMUM EAST-WEST WAVE NUMBER (M=0,IR), 
C     * LON   = NUMBER OF DISTINCT LONGITUDES, 
C     * WRK   = WORK SPACE, 
C     * ILEV  = NUMBER OF LEVELS. 
C----------------------------------------------------------------- 

      IMPLICIT    none

      INTEGER     MAXLOT
      PARAMETER ( MAXLOT = lot_maximum )

      INTEGER     ILEV,LON,IR,ILG,ILH, I,L,N, IFAX(1),
     +            ISIGN,INC,IR121,NSTART,NTIMES,NREST,LENGTH

      REAL        GD(ILG,ILEV),FC(ILG,ILEV),WRK(1),TRIGS(LON) 

      EXTERNAL    VFFT,XIT

C----------------------------------------------------------------- 
      ISIGN = +1 
      INC   =  1 
      IR121 =  (IR+1)*2 +1 
      IF (ILG.LT.LON+2) CALL                       XIT('  Ffgfw ', -1 )

C     * SET TO ZERO FOURIER COEFFICIENTS BEYOND TRUNCATION. 

      DO 100 I=IR121,LON+2 
      DO 100 L=1,ILEV 
  100 FC(I,L) =0. 

C     * AS MANY AS lot_maximum ARE DONE AT ONCE FOR VECTORIZATION. 

      NSTART = 1 
      NTIMES = ILEV/MAXLOT
      NREST  = ILEV-NTIMES*MAXLOT

      IF (NREST.NE.0)                                          THEN 
          LENGTH = NREST 
          NTIMES = NTIMES+1 
      ELSE 
          LENGTH = MAXLOT
      END IF 

C     * DO THE FOURIER TRANSFORMS. 

      DO 300 N=1,NTIMES 
          CALL VFFT( FC(1,NSTART), WRK,TRIGS,IFAX,INC,ILG,
     +                             LON,LENGTH,ISIGN )
          NSTART = NSTART+LENGTH 
          LENGTH = MAXLOT 
  300 CONTINUE 

      RETURN 
C-------------------------------------------------------------------- 

      END 
      SUBROUTINE FFWFG  (FC,ILH, GD,ILG, IR,LON,WRK,ILEV,IFAX,TRIGS) 

C     * JUL 19/83 - R.LAPRISE. 
C     * DRIVING ROUTINE FOR THE FOURIER TRANSFORM, 
C     * GRID TO COEFFICIENTS. 
C     * ==================== 
C     * FC    = FOURIER COEFFICIENTS, 
C     * ILH   = FIRST DIMENSION OF COMPLEX FC, 
C     * GD    = GRID DATA, 
C     * ILG   = FIRST DIMENSION OF REAL GD, NOTE THAT IT IS 
C     *         ASSUMED THAT GD AND FC ARE EQUIVALENCED IN MAIN, 
C     *         OBVIOUSLY THEN ILG MUST EQUAL 2*ILH. 
C     *         ACTUALLY FC IS DECLARED REAL FOR CONVENIENCE. 
C     * IR    = MAXIMUM EAST-WEST WAVE NUMBER (M=0,IR), 
C     * LON   = NUMBER OF DISTINCT LONGITUDES, 
C     * WRK   = WORK SPACE.
C     * ILEV  = NUMBER OF LEVELS. 
C----------------------------------------------------------------- 

      IMPLICIT    none

      INTEGER     MAXLOT
      PARAMETER ( MAXLOT = lot_maximum )

      INTEGER     ILEV,LON,IR,ILG,ILH, I,L,N, IFAX(1),
     +            ISIGN,INC,NSTART,NTIMES,NREST,LENGTH

      REAL        GD(ILG,ILEV),FC(ILG,ILEV),WRK(1),TRIGS(LON) 

      EXTERNAL    VFFT,XIT

C----------------------------------------------------------------- 
      ISIGN = -1 
      INC   =  1 
      IF (ILG.LT.LON+2) CALL                       XIT('  Ffwfg ',-1 ) 

C     * DO AS MANY AS lot_maximum AT ONCE FOR VECTORIZATION. 

      NTIMES = ILEV/MAXLOT 
      NREST  = ILEV-NTIMES*MAXLOT 
      NSTART = 1 

      IF (NREST.NE.0)                                          THEN 
          LENGTH = NREST 
          NTIMES = NTIMES+1 
      ELSE 
          LENGTH = MAXLOT 
      END IF

C     * DO THE FOURIER TRANSFORMS. 

      DO 300 N=1,NTIMES 
          CALL VFFT( GD(1,NSTART), WRK,TRIGS,IFAX,INC,ILG,
     +                             LON,LENGTH,ISIGN ) 
          NSTART = NSTART+LENGTH 
          LENGTH = MAXLOT 
  300 CONTINUE 

      RETURN 
C----------------------------------------------------------------------- 

      END 
      SUBROUTINE FFGFW3 (GD,ILG, IR,LON,WRK,ILEV,IFAX,TRIGS) 

C     * JAN 05/84 - B.DUGAS. 
C     * JUL 19/83 - R.LAPRISE. 
C     * DRIVING ROUTINE FOR THE FOURIER TRANSFORM, 
C     * COEFFICIENTS TO GRID. 
C     * ==================== 
C     * GD    = GRID DATA, 
C     * ILG   = FIRST DIMENSION OF REAL GD
C     * IR    = MAXIMUM EAST-WEST WAVE NUMBER (M=0,IR), 
C     * LON   = NUMBER OF DISTINCT LONGITUDES, 
C     * WRK   = WORK SPACE, 
C     * ILEV  = NUMBER OF LEVELS. 
C----------------------------------------------------------------- 

      IMPLICIT    none

      INTEGER     MAXLOT
      PARAMETER ( MAXLOT = lot_maximum )

      INTEGER     ILEV,LON,IR,ILG, I,L,N, IFAX(1),
     +            ISIGN,INC,IR121,NSTART,NTIMES,NREST,LENGTH

      REAL        GD(ILG,ILEV),WRK(1),TRIGS(LON) 

      EXTERNAL    VFFT,XIT

C----------------------------------------------------------------- 
      ISIGN = +1 
      INC   =  1 
      IR121 =  (IR+1)*2 +1 
      IF (ILG.LT.LON+2) CALL                       XIT('  Ffgfw3', -1 )

C     * SET TO ZERO FOURIER COEFFICIENTS BEYOND TRUNCATION. 

      DO 100 I=IR121,LON+2 
      DO 100 L=1,ILEV 
  100 GD(I,L) =0. 

C     * AS MANY AS lot_maximum ARE DONE AT ONCE FOR VECTORIZATION. 

      NSTART = 1 
      NTIMES = ILEV/MAXLOT
      NREST  = ILEV-NTIMES*MAXLOT

      IF (NREST.NE.0)                                          THEN 
          LENGTH = NREST 
          NTIMES = NTIMES+1 
      ELSE 
          LENGTH = MAXLOT
      END IF 

C     * DO THE FOURIER TRANSFORMS. 

      DO 300 N=1,NTIMES 
          CALL VFFT( GD(1,NSTART), WRK,TRIGS,IFAX,INC,ILG,
     +                             LON,LENGTH,ISIGN )
          NSTART = NSTART+LENGTH 
          LENGTH = MAXLOT 
  300 CONTINUE 

      RETURN 
C-------------------------------------------------------------------- 

      END 
      SUBROUTINE FFWFG3 (FC,ILG, IR,LON,WRK,ILEV,IFAX,TRIGS) 

C     * JUL 19/83 - R.LAPRISE. 
C     * DRIVING ROUTINE FOR THE FOURIER TRANSFORM, 
C     * GRID TO COEFFICIENTS. 
C     * ==================== 
C     * FC    = FOURIER COEFFICIENTS, 
C     * ILG   = FIRST DIMENSION OF REAL DATA.
C     * IR    = MAXIMUM EAST-WEST WAVE NUMBER (M=0,IR), 
C     * LON   = NUMBER OF DISTINCT LONGITUDES, 
C     * WRK   = WORK SPACE.
C     * ILEV  = NUMBER OF LEVELS. 
C----------------------------------------------------------------- 

      IMPLICIT    none

      INTEGER     MAXLOT
      PARAMETER ( MAXLOT = lot_maximum )

      INTEGER     ILEV,LON,IR,ILG, I,L,N, IFAX(1),
     +            ISIGN,INC,NSTART,NTIMES,NREST,LENGTH

      REAL        FC(ILG,ILEV),WRK(1),TRIGS(LON) 

      EXTERNAL    VFFT,XIT

C----------------------------------------------------------------- 
      ISIGN = -1 
      INC   =  1 
      IF (ILG.LT.LON+2) CALL                       XIT('  Ffwfg3',-1 ) 

C     * DO AS MANY AS lot_maximum AT ONCE FOR VECTORIZATION. 

      NTIMES = ILEV/MAXLOT 
      NREST  = ILEV-NTIMES*MAXLOT 
      NSTART = 1 

      IF (NREST.NE.0)                                          THEN 
          LENGTH = NREST 
          NTIMES = NTIMES+1 
      ELSE 
          LENGTH = MAXLOT 
      END IF

C     * DO THE FOURIER TRANSFORMS. 

      DO 300 N=1,NTIMES 
          CALL VFFT( FC(1,NSTART), WRK,TRIGS,IFAX,INC,ILG,
     +                             LON,LENGTH,ISIGN ) 
          NSTART = NSTART+LENGTH 
          LENGTH = MAXLOT 
  300 CONTINUE 

      RETURN 
C----------------------------------------------------------------------- 

      END 
