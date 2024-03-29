C     $Log: precon.ftn,v $
C     Revision 3.6  2014/09/25 18:42:04  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.5  2010/02/10 18:19:40  dugas
C     Remplacer les appel a CVMGT par des appels a MERGE
C
C     Revision 3.4  2006/07/04 16:42:37  dugas
C     La routine PRECON3 tient maintenant compte des valeurs manquantes (via MISPAR).
C
C     Revision 3.3  2004/11/08 20:51:48  dugas
C     Modifier le format 6000 de PRECON3.
C
C     Revision 3.2  2002/04/22 13:45:11  dugas
C     Mettre des bonnes "hard" pour les calculs
C     des min/max effectues par PRECON2/3.
C
C     Revision 3.1  1994/11/17 14:14:01  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C
c      Revision 3.0  94/11/17  13:56:04  13:56:04  armnrbd (Bernard Dugas)
c      *** empty log message ***
c      
c      Revision 2.0  93/10/13  13:32:09  armnrbd
c      Premiere version compatible HP-UX.
c      
c      Revision 1.0  92/06/01  15:29:56  armnrbd
c      Initial revision
c      

      SUBROUTINE PRECON2(FLO,HI,CINT,SCALE,A,NI,NJ,NC)
 
C **********************************************************************
C *   OBTAINS CONTOUR INTERVAL AND SCALING FACTOR FOR AN SCM ARRAY     *
C *   APPROPRIATE FOR INPUT TO CONREC.                                 *
C *   INPUT: A=ARRAY                                                   *
C *          NI,NJ=DIMENSIONS OF A                                     *
C *          NC=APPROXIMATE NUMBER OF CONTOUR INTERVALS                *
C *   OUTPUT:FLO  =MINIMUM CONTOUR CONSIDERED                          *
C *          HI   =MAXIMUM CONTOUR CONSIDERED                          *
C *          CINT =CONTOUR INTERVAL                                    *
C *          SCALE=SCALING FACTOR                                      *
C *   JOHN L. WALMSLEY     1979-12-27  (MODIFIED 1985-01-15 - BD)      *
C **********************************************************************

      IMPLICIT  none
 
      INTEGER   NI,NJ,NC
      REAL      A(NI,NJ),FLO,HI,CINT,SCALE,AMX,AMN,RANGE
      REAL      FSCAL,CONT
C     ------------------------------------------------------------------
      AMX   = MAXVAL(A)
      AMN   = MINVAL(A)

      IF (ABS( AMN ).LT.2E-37) AMN = 0.0
      IF (ABS( AMX ).LT.2E-37) AMX = 0.0

      RANGE = AMX-AMN
      SCALE = FSCAL( AMX,AMN )
      CINT  = CONT( RANGE,NC,SCALE )
      FLO   = FLOAT( (IFIX( AMN*SCALE )/100+1)*100 )
      HI    = FLOAT( (IFIX( AMX*SCALE )/100  )*100 )
C     ------------------------------------------------------------------
      RETURN
      END

      SUBROUTINE PRECON3(FLO,HI,CINT,SCALE,A,NI,NJ,NC,SPVAL)
 
      IMPLICIT  none
 
      INTEGER   NI,NJ,NC
      REAL      FLO,HI,CINT,SCALE,A(NI,NJ),SPVAL

C **********************************************************************
C *   FEB 28/90 - F.MAJAESS (BASED ON PRECON2 WITH SPVAL ADDED)        *
C *   OBTAINS CONTOUR INTERVAL AND SCALING FACTOR FOR AN SCM ARRAY     *
C *   APPROPRIATE FOR INPUT TO CONREC WITH VALUES EQUAL TO "SPVAL"     *
C *   SKIPPED.                                                         *
C *   INPUT: A=ARRAY                                                   *
C *          NI,NJ=DIMENSIONS OF A                                     *
C *          NC=APPROXIMATE NUMBER OF CONTOUR INTERVALS                *
C *   OUTPUT:FLO  =MINIMUM CONTOUR CONSIDERED                          *
C *          HI   =MAXIMUM CONTOUR CONSIDERED                          *
C *          CINT =CONTOUR INTERVAL                                    *
C *          SCALE=SCALING FACTOR                                      *
C *          SPVAL=SKIPPING REAL VALUE                                 *
C **********************************************************************

      INTEGER   MF,I0,I
      LOGICAL   MVALUE,CALLED
      REAL      CONT,AMN,AMX,RANGE
      REAL*8    MISFLAG,EPSILON,SPVAL8,A8(NI,NJ)
      SAVE      MVALUE,CALLED,MISFLAG,EPSILON

      REAL      FSCAL
      EXTERNAL  FSCAL,MISPAR

      DATA      CALLED / .FALSE. /
*-------------------------------------------------------------------- 

      SPVAL8 = SPVAL

      IF (.NOT.CALLED)                                         THEN
          CALLED = .TRUE.
          CALL MISPAR( MVALUE,MISFLAG,EPSILON )
          IF (MVALUE) EPSILON = ABS( MISFLAG )*EPSILON
      END IF

      IF (MVALUE) SPVAL8 = MISFLAG

      SPVAL = SPVAL8
      AMN   = SPVAL
      AMX   = SPVAL
      
      IF (MVALUE)                                              THEN

          A8 = A

          MF = 0
          I0 = 1

  100     IF (ABS( A8(I0,1)-MISFLAG ).GT.EPSILON) GOTO 200

              MF = MF+1
              I0 = I0+1

              IF (I0.GT.NI*NJ) RETURN

              GOTO 100

  200     AMX = A(I0,1)
          AMN = A(I0,1)

          DO  I=I0,NI*NJ
              IF (ABS( A8(I,1)-MISFLAG ).GT.EPSILON)           THEN
                  AMN = MIN( A(I,1), AMN )
                  AMX = MAX( A(I,1), AMX )
              END IF
          END DO

      ELSE

          DO  I=1,NI*NJ
              AMN = MERGE( A(I,1),   AMN,
     +                     A(I,1).NE.SPVAL .AND.
     +                   ( A(I,1).LT.AMN   .OR.   AMN.EQ.SPVAL ) )
              AMX = MERGE( A(I,1),   AMX,
     +                     A(I,1).NE.SPVAL .AND.
     +                   ( A(I,1).GT.AMX   .OR.   AMX.EQ.SPVAL ) )
          END DO

      END IF

      WRITE(6,6000) AMN,AMX,SPVAL

      IF (ABS( AMN ).LT.2E-37) AMN = 0.0
      IF (ABS( AMX ).LT.2E-37) AMX = 0.0

      RANGE   = AMX-AMN
      SCALE   = FSCAL( AMX,AMN )
      CINT    = CONT(  RANGE,NC,SCALE )
      FLO     = FLOAT( (IFIX( AMN*SCALE )/50+1) *50 )
      HI      = FLOAT( (IFIX( AMX*SCALE )/50)   *50 )

C     ------------------------------------------------------------------
      RETURN
 6000 FORMAT(' Min,Max,SpVal=',3E14.6)
      END

      FUNCTION FSCAL(AMX,AMN)
 
C     * FUNCTION BORROWED FROM J.WALMSLEY, JAN 15 1985.
C    *******************************************************************
C    *        THIS FUNCTION CALCULATES THE APPROPRIATE SCALING FACTOR  *
C    *   FOR THE CONTOUR MAP.                                          *
C    *******************************************************************
 
      IMPLICIT none

      REAL     FSCAL, AMX,AMN, AAMX,AAMN,AAMXN, P
      INTEGER  LR,IQ,IQ10

C     ------------------------------------------------------------------
C     * BEGIN FUNCTION...

                          FSCAL = 1.
                          AAMX  = ABS( AMX )
                          AAMN  = ABS( AMN )
                          AAMXN = AMAX1( AAMX,AAMN )

      IF (AAMXN.NE.0.)                                         THEN
                          LR    = IFIX( ALOG10( AAMXN ) )
          IF (AAMXN.LT.1) LR    = LR - 1
                          FSCAL = 10.**( 3-LR )
                          P     = AAMXN*FSCAL
                          IQ    = IFIX( P+0.5 )
                          IQ10  = IQ/10000
          IF (IQ10.NE.0)  FSCAL = FSCAL/10.
      END IF

C     ------------------------------------------------------------------
      RETURN
      END

      FUNCTION CONT(R,NC,SCALE)

C     ALGORITHM TO OBTAIN CONTOUR INTERVAL GIVEN THE RANGE, R.
C     GIVES APPROXIMATELY NC CONTOUR INTERVALS OVER THE  RANGE.
C     RETURNS CONT=1,2 OR 5 *10**N, WHERE N IS AN INTEGER (POS. OR NEG.)
C     SCALE IS A SCALING FACTOR.
C     PROGRAMMED BY J.L. WALMSLEY, JANUARY 1977
C     MODIFIED APRIL 1978

      IMPLICIT none

      REAL     CONT,P,RM,R,S,SCALE
      INTEGER  NC,L,M,N

C     ------------------------------------------------------------------
C     * BEGIN FUNCTION...

                      CONT = 1.0
      IF (R.EQ.0.)    RETURN

                      S    = ALOG10( R/NC )
                      N    = IFIX( S )
                      L    = N
      IF (S.LT.0.)    L    = N-1
                      P    = S-L
                      M    = IFIX( 10.**P )

      IF (M.GE.8)                                              THEN
                      M    = 10
      ELSE IF (M.GE.4)                                         THEN
                      M    = 5
      ELSE IF (M.EQ.3)                                         THEN
                      M    = 2 
      END IF

                      RM   = M 
                      CONT = 10.**( ALOG10( RM )+L )*SCALE

C     ------------------------------------------------------------------
      RETURN
      END

      FUNCTION AMEAN2(A,M,N,IPER,JPER)
 
C     * ROUTINES BORROWED FROM J.WALMSLEY, JAN 15 1985.
C     * ARITHMETIC MEAN OF FIELD, A.
C     * IPER,JPER  = 0  NON-PERIODIC BOUNDARY CONDITIONS
C     *            1  PERIODIC BOUNDARY CONDITIONS (I.E., LAST ROW OR
C     *                  COLUMN OMITTED IN AVERAGING)
 
      IMPLICIT  none

      INTEGER   M,N,IPER,JPER,ILAST,JLAST,I,J
      REAL      AMEAN2,A(M,N),ABAR
C     -------------------------------------------------------------
 
      ILAST=M-IPER
      JLAST=N-JPER

      ABAR=0.
      DO 10 J=1,JLAST
          DO 10 I=1,ILAST
              ABAR = ABAR+A(I,J)
   10 CONTINUE

      AMEAN2 = ABAR/(ILAST*JLAST)

C     ------------------------------------------------------------------
      RETURN
      END

      FUNCTION GMEAN2(A,M,N,IPER,JPER)
 
C     * FUNCTION BORROWED FROM J.WALMSLEY, JAN 15 1985.
C     * GEOMETRIC MEAN OF FIELD, A.
C     * IPER,JPER  = 0  NON-PERIODIC BOUNDARY CONDITIONS
C     *             1  PERIODIC BOUNDARY CONDITIONS (I.E., LAST ROW OR
C     *                   COLUMN OMITTED IN AVERAGING)
 
      IMPLICIT  none

      INTEGER   M,N,IPER,JPER,ILAST,JLAST,I,J
      REAL      GMEAN2,A(M,N),ABAR
C     -----------------------------------------------------------------
 
      ILAST = M-IPER
      JLAST = N-JPER

      ABAR=0.
      DO 10 J=1,JLAST
          DO 10 I=1,ILAST
              ABAR = ABAR+ALOG( A(I,J) )
   10 CONTINUE

      ABAR   = ABAR/(ILAST*JLAST)
      GMEAN2 = EXP( ABAR )

C     ------------------------------------------------------------------
      RETURN
      END
