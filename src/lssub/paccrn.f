#     if !defined (nombre_de_taches)
#         define   nombre_de_taches 1
#     endif
C     $Log: paccrn.ftn,v $
C     Revision 3.13  2016/10/26 15:29  dugas
C     Modification syntaxique F77 --> F90
C
C     Revision 3.12  2014/09/25 18:42:03  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.11  2008/04/28 21:38:53  dugas
C     Corriger l'usage des macros pour r.gppf (passe 2).
C
C     Revision 3.10  2007/12/19 18:54:43  dugas
C     Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
C
C     Revision 3.9  2005/03/11 14:31:21  dugas
C     Changer le seuil acceptable (MIN) de RANGE (correction pour AIX)
C
C     Revision 3.8  2005/03/07 19:39:58  dugas
C     Changer le seuil acceptable (MIN) de RANGE dans PACCRN (v2)
C
C     Revision 3.6  2000/11/24 12:44:50  armnrbd
C     Enlever la definition par defaut du macro taille_entete.
C
C     Revision 3.5  1999/04/08 19:46:05  armnrbd
C     Utiliser le comdeck MACHTYPE.CDK.
C     Remplacer MEMOIRH par HPALLOC/HPDEALLC.
C
C     Revision 3.4  1998/05/21 18:48:27  armnrbd
C     Changer la valeur par defaut du macro taille_entete.
C
C     Revision 3.3  1997/02/17  03:57:30  armnrbd
C     Ajouter un peu d'informations pour le mode DEBUG.
C
C     Revision 3.2  1995/11/01  20:04:03  armnrbd
C     De-allouer les appels multi-taches.
C
C     Revision 3.1  1994/11/17  14:13:55  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C
C     Revision 3.0  94/11/17  13:55:59  13:55:59  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.0  93/10/13  13:32:04  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.3  93/08/19  16:20:41  16:20:41  armnrbd (Bernard Dugas)
C     Modifications cosmetiques.
C     
C     Revision 1.2  92/11/12  13:58:01  armnrbd
C     Troisieme iteration PKTYP.
C     
C     Revision 1.1  92/10/28  13:45:39  armnrbd
C     Premier jeux de modification pour l'implantation du PK92.
C     
C     Revision 1.0  92/02/21  11:34:00  armnrbd
C     Initial revision
C     
      SUBROUTINE paccrn (X,IX,IXPAK, NWDS,NBITS, XMIN,XSCAL, KIND)

C     * FEB 06/84 - R.LAPRISE, J.F.FORTIN.

C     * MODIFIED APRIL 04/1990 BY B.DUGAS (UQAM) ...
C     *   ...   USES IEEE-754 REAL*8 NUMBERS AND A 32-BIT CPU.
C     * MODIFIED OCT. 28/1990 BY B.DUGAS (RPN) ...
C     *   ...   POSSIBLE PARALLEL EXECUTION ON SGI CPU'S.
C     *   ...   USES IEEE-754 REAL*4 NUMBERS FOR I/O. XMIN,XSCAL
C     *         STILL USE 64 BITS REPRESENTATIONS.
C     * MODIFIED SEPT 16/1991 BY B.DUGAS (RPN) ...
C     *   ...   NPACK-SPECIFIC CALLS TO GBYTESX/SBYTESX, X=2,3,4.

C     * FOR KIND .GE. 0, PACK NWDS OF FLOATING POINT ARRAY X
C     *                  INTO ARRAY IXPAK.
C     *          .LT. 0, UNPACK IXPAK INTO NWDS OF X.

C     * PACKING STEPS, (FOR EACH ARRAY ELEMENT)

C     *    1- FIND THE MINIMUM (XMIN) AND MAXIMUM (XMAX)
C     *       VALUE IN THE ARRAY X.
C     *    2- REMOVE BIAS (SUBTRACT XMIN FROM X). 
C     *    3- SCALE BY FACTOR (2**NBITS-1)/RANGE SO THAT
C     *       THE VALUES ARE BETWEEN 0. AND 2**NBITS-1.
C     *    4- TRANSFORM INTO INTEGER ARRAY.
C     *    5- PACK THIS ARRAY WITH SBYTESB.

C     * UNPACKING, (FOR EACH ARRAY ELEMENT)

C     *    1- UNPACK WITH GBYTESB.
C     *    2- TRANSFORM TO REAL ARRAY.
C     *    3- RESCALE FIELD WITH XMIN AND XSCAL.

C     * PARAMETERS, 

C     *    X     = NON-PACKED ARRAY. 
C     *           (INPUT IF KIND .GE. 0, OUTPUT IF KIND .LT. 0)
C     *    IX    = NO LONGER USED. KEPT FOR CALLING COMPATIBILTY.
C     *    IXPAK = PACKED ARRAY. 
C     *           (OUTPUT IF KIND .GE. 0, INPUT IF KIND .LT. 0)
C     *    NWDS  = NUMBER OF ELEMENTS IN ARRAY X (INPUT).
C     *    NBITS = NUMBER OF BITS TO CODE THE ARRAY ELEMENTS IN MEMORY.
C     *    XMIN  = MINIMUM OF X ARRAY. 
C     *           (OUTPUT IF KIND .GE. 0, ELSE INPUT)
C     *    XSCAL = SCALE USED = (2**NBITS-1)/(XMAX-XMIN). 
C     *           (OUTPUT IF KIND .GE. 0, ELSE INPUT)
C     *    KIND  = PACKING   (KIND .GE. 0),
C     *            UNPACKING (KIND .LT. 0).

C----------------------------------------------------------------------
      IMPLICIT none

      INTEGER, PARAMETER :: HEAD = taille_entete

      INTEGER  NWDS,     NBITS,    KIND,
     +         IX(1),    IXPAK(1)
      REAL     X(NWDS),  XSCAL,    XMIN,
     +         XMAX,     XSCALI,
     +         XMN(64),  XMX(64)
      REAL*8   RANGE,    BIGGEST

      INTEGER  NWDS0
      INTEGER, DIMENSION(:), ALLOCATABLE :: WORK
      SAVE     NWDS0,                       WORK

      INTEGER  INBR,JNBR,IMOD,IDEB,IFIN,IXPK,INB,
     +         I,N,NPi,NP,NBW,MAXINT,MAXBIT,NPACK

      EXTERNAL macspe,   XIT,      GBYTESB,   SBYTESB,
     +         GBYTES2,  SBYTES2,  GBYTES3,   SBYTES3,
     +         GBYTES4,  SBYTES4

CC$    INTEGER  mpserv,Bidon
CC$    EXTERNAL mpserv

      LOGICAL           DEBUG
      COMMON  /ZZDEBUG/ DEBUG

#     include "machtype.cdk" 

      COMMON  /MACHSPEC/ NBW

      DATA     NPi    /   64   /,
     +         NWDS0  /   -1   /

C -------------------------------------------------------------------
C     * SET NBW AND MAXINT.

      IF (MACHINE.EQ.1) NBW = 64
      IF (MACHINE.EQ.2) NBW = 32

      IF (MACHINE.EQ.1)                                        THEN
          MAXINT = 47
      ELSE IF (MACHINE.EQ.2)                                   THEN
          MAXINT = 23
      ELSE
          CALL                                     XIT(' Paccrn ',-101)
      END IF

C     * CHECK THE NUMBER OF ALLOWED THREADS.

      NP   = nombre_de_taches
C     NP   = mpserv('THREADS',NPi  )
CC$mp_schedtype=INTERLEAVE

C     * ARITHMETIC IS NOT GUARANTEED IF NBITS IS TOO LARGE. 

      NPACK  = NBW/NBITS
      MAXBIT = MIN0( MAXINT, NBW)

      IF (DEBUG) WRITE(6,1002) NP,NBITS,NPACK

      IF (NBITS .GT. MAXBIT) CALL                  XIT (' Paccrn ',-1)
      IF (NBITS .LT. 1) CALL                       XIT (' Paccrn ',-2)

      IF (NPACK.GT.4 .AND. NWDS0.NE.NWDS)                      THEN

C         * ALLOCATE WORK SPACE FOR OLDER PACKING/UNPACKING CODES.

          IF (NWDS0.NE.-1) 
     +    DEALLOCATE( WORK )
            ALLOCATE( WORK(NWDS+2) )

          NWDS0 = NWDS

      END IF

C     * SIZES FOR PARALLEL EXECUTION.

      INBR = (NWDS-1)/NP+1
      JNBR = INBR/NPACK
      IMOD = MOD(INBR,NPACK)
      IF (IMOD.NE.0)                                           THEN
          JNBR = JNBR+1
          INBR = JNBR*NPACK
      END IF

C     * TEST FOR PACKING OR UNPACKING CASE.

      IF (KIND .GE. 0)                                         THEN

C ------------------------------------------------------------------- 
C         * PACKING CASE.

C         * FIRST, FIND EXTREMA.

CC$doacross local(N, I,IDEB,IFIN, XMIN,XMAX)

          DO 051 N=1,NP
              IDEB =    ( N-1)*INBR + 1
              IFIN = MIN( N   *INBR, NWDS )
              XMIN = X(IDEB)
              XMAX = X(IDEB)
              DO 050 I=IDEB+1,IFIN
                  IF (X(I).LT.XMIN) XMIN = X(I)
                  IF (X(I).GT.XMAX) XMAX = X(I)
   50         CONTINUE
              XMN(N) = XMIN
              XMX(N) = XMAX
   51     CONTINUE

          XMIN = XMN(1)
          XMAX = XMX(1)
          DO 052 N=2,NP
              XMIN = MIN( XMIN,XMN(N) )
              XMAX = MAX( XMAX,XMX(N) )
   52     CONTINUE

C         * SCALE FIELD AND REPRESENT AS INTEGER.

          BIGGEST = DBLE( 2**NBITS-1 )
          RANGE   = DBLE( XMAX ) - DBLE( XMIN )

          IF (ABS( RANGE ) .LE. 1.E-36) RANGE = 1.0

          XSCAL = BIGGEST/RANGE 

          IF (DEBUG) WRITE(6,1000) XSCAL,XMIN,XMAX

CC$doacross local(N, I,IDEB,IFIN,INB, IXPK)

          DO 150 N=1,NP

              IXPK =    ( N-1 ) * JNBR + 1
              IDEB =    ( N-1 ) * INBR + 1
              IFIN = MIN( N     * INBR, NWDS )
              INB  = IFIN-IDEB+1

              IF (NPACK.GT.4)                                  THEN

C                 * SCALE REALS INTO NBITS INTEGERS.

                  DO 100 I  = IDEB,IFIN
                      WORK(I) = NINT( XSCAL * (X(I) - XMIN) )
  100             CONTINUE

C                 * PACK INTEGER VALUES INTO NBITS. 

                  CALL SBYTESB( IXPAK(IXPK),WORK(IDEB),NBITS,INB )

              ELSE

C                 * DO BOTH OPERATIONS INTERNALLY.

                  IF (NPACK.EQ.1)
     +                CALL SBYTES1( IXPAK(IXPK),X(IDEB), NBITS,INB,
     +                                                   XSCAL,XMIN )
                  IF (NPACK.EQ.2)
     +                CALL SBYTES2( IXPAK(IXPK),X(IDEB), NBITS,INB,
     +                                                   XSCAL,XMIN )
                  IF (NPACK.EQ.3)
     +                CALL SBYTES3( IXPAK(IXPK),X(IDEB), NBITS,INB,
     +                                                   XSCAL,XMIN )
                  IF (NPACK.EQ.4)
     +                CALL SBYTES4( IXPAK(IXPK),X(IDEB), NBITS,INB,
     +                                                   XSCAL,XMIN )

              END IF

  150     CONTINUE

      ELSE

C ---------------------------------------------------------------------
C         * UNPACKING CASE. EXPAND EVERY NBITS OF IXPAK INTO WORD OF X.

          XSCALI = 1.0/XSCAL

CC$doacross local(N, IDEB,IFIN,INB, IXPK)

          DO 250 N=1,NP

              IXPK =    ( N-1 ) * JNBR + 1
              IDEB =    ( N-1 ) * INBR + 1
              IFIN = MIN( N     * INBR, NWDS )
              INB  = IFIN-IDEB+1

              IF (NPACK.GT.4)                                  THEN

                  CALL GBYTESB( IXPAK(IXPK),WORK(IDEB),NBITS,INB )

                  DO 200 I = IDEB,IFIN
                      X(I) = FLOAT( WORK(I) ) * XSCALI + XMIN
  200             CONTINUE

              ELSE

                  IF (NPACK.EQ.1)
     +                CALL GBYTES1( IXPAK(IXPK),X(IDEB), NBITS,INB,
     +                                                   XSCALI,XMIN )
                  IF (NPACK.EQ.2)
     +                CALL GBYTES2( IXPAK(IXPK),X(IDEB), NBITS,INB,
     +                                                   XSCALI,XMIN )
                  IF (NPACK.EQ.3)
     +                CALL GBYTES3( IXPAK(IXPK),X(IDEB), NBITS,INB,
     +                                                   XSCALI,XMIN )
                  IF (NPACK.EQ.4)
     +                CALL GBYTES4( IXPAK(IXPK),X(IDEB), NBITS,INB,
     +                                                   XSCALI,XMIN )

              END IF

  250     CONTINUE

          IF (DEBUG) WRITE(6,1001) XSCALI,XMIN

      END IF

C----------------------------------------------------------------------
CC$    Bidon = mpserv('BLOCK',Bidon)

      RETURN

C ------------------------------------------------------------------- 
 1000 FORMAT('*DEBUG:PACCRN XSCAL ,XMIN,XMAX=',3E22.14)
 1001 FORMAT('*DEBUG:PACCRN XSCALI,XMIN     =',2E22.14)
 1002 FORMAT('*DEBUG:PACCRN NP,NBITS,NPACK=',3I10)

      END 



