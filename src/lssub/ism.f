C     $Log: ism.ftn,v $
C     Revision 3.18  2014/10/16 12:00:40  dugas
C     Modifications commandees par la compilation avec GFORTRAN et IFORT.
C
C     Revision 3.17  2014/09/25 18:42:03  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.16  2013/11/28 21:15:57  dugas
C     Enlever toutes references a CALLED dans XXX_cmmm8 et XXX_fmmm8 (pour MISPAR).
C
C     Revision 3.15  2010/02/10 18:23:44  dugas
C     Forcer les calculs de variance a produire des resultats > 0.0
C
C     Revision 3.14  2007/12/19 18:54:43  dugas
C     Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
C
C     Revision 3.13  2006/07/04 16:41:08  dugas
C     - XXX_FMMM8 calcule maintenant les variances et tient compte
C       des valeurs manquantes (effectuant un appel a MISPAR).
C     - Ajouter XXX_CMMM8 qui fait le meme travail que XXX-FMMM8
C       mais pour les nombres complexes C16. Cette routine est
C       maintenant utilisee par le module GGSTAT.
C
C     Revision 3.12  2005/07/28 17:24:12  dugas
C     Modifier le code pour enlever les messages d'avertissement de F90.
C
C     Revision 3.11  2005/03/07 17:23:50  dugas
C     Correctement declarer les types de DISMAX8 et DISMIN8.
C
C     Revision 3.10  2003/12/05 17:46:31  dugas
C     - Mieux proteger FMMM2 lors du traitement de donnees REAL*8.
C     - La routine XXX_fmmm8 passe en mode I/O completement REAL*8.
C
C     Revision 3.9  2003/05/23 19:53:01  dugas
C     Ajouter le support de IO64B dans DISMIN/DISMAX
C
C     Revision 3.8  2002/04/22 15:49:09  dugas
C     Corriger une erreur d'alignement des mots REAL*8.
C
C     Revision 3.7  2002/02/02 00:20:31  dugas
C     Remplacer ISMIN/ISMAX par DISMIN/DISMAX
C
C     Revision 3.6  2001/02/13 20:46:27  armnrbd
C     Ajouter une routine interne pour les calculs REAL*8 dans FMMM2.
C
C     Revision 3.5  2000/09/28 15:48:43  armnrbd
C     Modifier les sequences d'appel a GETIO64.
C
C     Revision 3.4  1999/04/24 00:57:46  armnrbd
C     Corriger le mode 64 bits de FMMM2.
C
C     Revision 3.3  1999/04/08 19:24:56  armnrbd
C     Utiliser les appels INTRINSIC de MIN et MAX.
C
C     Revision 3.2  1997/02/17 03:50:04  armnrbd
C     Ajouter le mode I/O 64 bits.
C
C     Revision 3.1  1994/11/17  14:13:34  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C
C     Revision 3.0  94/11/17  13:55:41  13:55:41  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.1  94/10/10  22:41:27  armnrbd
C     Ajouter la routine CMMM2.
C     
C     Revision 2.0  93/10/13  13:31:50  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.3  93/01/07  16:11:00  armnrbd
C     Suite et fin du changement precedent.
C     
C     Revision 1.2  93/01/07  15:22:56  armnrbd
C     Ajouter le parametre INC a ISMIN et ISMAX.
C     
C     Revision 1.1  92/04/03  21:53:58  armnrbd
C     Accumulateur a 64 bits.
C     
C     Revision 1.0  92/02/21  11:33:27  armnrbd
C     Initial revision
C     

      INTEGER FUNCTION dismax (LENGTH,ARRAY,INC)

***    R.LAPRISE - APR 09/84.

***    FIND AND RETURN THE INDEX OF THE LARGEST ELEMENT OF AN ARRAY.

      INTEGER  LENGTH,INDEX,I,INC
      REAL     ARRAY(LENGTH)

      logical            info
      common   /zzverbo/ info

      INTEGER  DISMAX8
      LOGICAL  GETIO64,OK
      EXTERNAL DISMAX8,GETIO64
*-----------------------------------------------------------------------

      IF (INC.EQ.0) INC   = 1
                    INDEX = 1

      IF (GETIO64( OK ))                                       THEN

          DISMAX = DISMAX8( LENGTH,ARRAY,INC )

      ELSE

          DO  I=1,LENGTH,INC
              IF (ARRAY(I).GT.ARRAY(INDEX)) INDEX=I
          END DO

          DISMAX = INDEX

      END IF

      RETURN
      END 

      INTEGER FUNCTION dismin (LENGTH,ARRAY,INC)

***    R.LAPRISE - APR 09/84.

***    FIND AND RETURN THE INDEX OF THE SMALLEST ELEMENT OF AN ARRAY.

      INTEGER  LENGTH,INDEX,I,INC
      REAL     ARRAY(LENGTH)

      INTEGER  DISMIN8
      LOGICAL  GETIO64,OK
      EXTERNAL DISMIN8,GETIO64
*-----------------------------------------------------------------------

      IF (INC.EQ.0) INC   = 1
                    INDEX = 1

      IF (GETIO64( OK ))                                       THEN

          DISMIN = DISMIN8( LENGTH,ARRAY,INC )

      ELSE

          DO  I=1,LENGTH,INC
              IF (ARRAY(I).LT.ARRAY(INDEX)) INDEX=I
          END DO

          DISMIN = INDEX

      END IF

      RETURN

*-------------------------------------------------------------------- 
      END 

      SUBROUTINE fmmm2 (FMIN,FMAX,FMEAN,F,LA)

      IMPLICIT none

      INTEGER  LA
      REAL     F(LA),FMIN,FMAX,FMEAN

***    SEP 27/79 - J.D.HENDERSON

***    COMPUTES MIN,MAX,MEAN OF FIELD F(LA).

      LOGICAL  OK
      INTEGER  IER,I, LAW
      REAL(8)  DSUM,DVAR, GROS,PETIT, FMIN8,FMAX8,MEAN8

      REAL(8)      F8
      POINTER (IF8,F8(*))

      logical           info
      common  /zzverbo/ info

      LOGICAL, EXTERNAL :: GETIO64
      EXTERNAL XXX_FMMM8

      DATA     GROS / 1E+37 /, PETIT / 1E-37 /
*-------------------------------------------------------------------- 

      LAW = LA

      IF (GETIO64( OK ))                                       THEN

          IF8 = LOC( F(1) )

          CALL XXX_FMMM8( FMIN8,FMAX8,DSUM,DVAR, F8,LAW )

          IF (LAW.NE.0) MEAN8 = DSUM / DBLE( LAW )

          IF (ABS( FMIN8 ).GT.GROS)                            THEN
              IF (info) WRITE(6,6001) 'minimum',FMIN8
CCC           FMIN8 = GROS
              FMIN8 = 0.
          ELSE IF (ABS( FMIN8 ).LT.PETIT .AND. FMIN8.NE.0.)    THEN
              IF (info) WRITE(6,6002) 'minimum',FMIN8
CCC           FMIN8 = PETIT
              FMIN8 = 0.
          END IF

          IF (ABS( FMAX8 ).GT.GROS)                            THEN
              IF (info) WRITE(6,6001) 'maximum',FMAX8
CCC           FMAX8 = GROS
              FMAX8 = 0.
          ELSE IF (ABS( FMAX8 ).LT.PETIT .AND. FMAX8.NE.0.)    THEN
              IF (info) WRITE(6,6002) 'maximum',FMAX8
CCC           FMAX8 = PETIT
              FMAX8 = 0.
          END IF

          IF (ABS( MEAN8 ).GT.GROS)                            THEN
              IF (info) WRITE(6,6001) 'mean',MEAN8
CCC           DSUM = DBLE( LA )*GROS
              DSUM = 0.
          ELSE IF (ABS( MEAN8 ).LT.PETIT .AND. MEAN8.NE.0.)    THEN
              IF (info) WRITE(6,6002) 'mean',MEAN8
CCC           DSUM = DBLE( LA )*PETIT
              DSUM = 0.
          END IF

          FMAX = FMAX8
          FMIN = FMIN8

      ELSE

          DSUM = F(1)
          FMIN = F(1)
          FMAX = F(1)

          DO  I=2,LA 
              FMIN = MIN( F(I), FMIN )
              FMAX = MAX( F(I), FMAX )
              DSUM =      F(I)+ DSUM
          END DO

      END IF

      IF (LAW.EQ.0)                                            THEN
          FMEAN = DSUM
      ELSE
          FMEAN = DSUM/DBLE( LAW )
      END IF

      RETURN

*-------------------------------------------------------------------- 
 6001 FORMAT('FMMM2: ',A,' =',E14.3,' too large to fit in real number.')
 6002 FORMAT('FMMM2: ',A,' =',E14.3,' too small to fit in real number.')

      END 

      SUBROUTINE cmmm2 (CMIN,CMAX,CMEAN,C,LA)

***    OCT 10/94 - B.DUGAS

***    COMPUTES MIN,MAX ABSOLUTE VALUES AND COMPLEX MEAN OF FIELD C(LA).

      IMPLICIT none

      INTEGER  LA,I
      REAL*8   DSUM(2)
      REAL     C(2,LA),CMIN,CMAX,CMEAN(2),ABSO
*-------------------------------------------------------------------- 

      DSUM(1) = C(1,1)
      DSUM(2) = C(2,1)
      CMIN    = SQRT( C(1,1)*C(1,1)+C(2,1)*C(2,1) )
      CMAX    = CMIN

      DO 210 I=2,LA 
          ABSO    = SQRT( C(1,I)*C(1,I)+C(2,I)*C(2,I) )
          CMIN    = MIN( ABSO, CMIN )
          CMAX    = MAX( ABSO, CMAX )
          DSUM(1) = C(1,I)+ DSUM(1)
          DSUM(2) = C(2,I)+ DSUM(2)
  210 CONTINUE

      CMEAN(1) = DSUM(1)/DBLE( LA )
      CMEAN(2) = DSUM(2)/DBLE( LA )

      RETURN

*-------------------------------------------------------------------- 
      END 

      SUBROUTINE XXX_fmmm8 (FMIN,FMAX,DSUM,DVAR,F,LA)

      IMPLICIT none

***    COMPUTES MIN,MAX,MEAN OF FIELD F(LA).

      INTEGER  LA
      REAL*8   F(LA),FMIN,FMAX,DSUM,DVAR

***    LOCAL VARIABLES.

      LOGICAL  MVALUE
      REAL*8   MISFLAG,EPSILON
      SAVE     MVALUE,MISFLAG,EPSILON

      INTEGER  I,I0,MF

      EXTERNAL MISPAR

*-------------------------------------------------------------------- 

      CALL MISPAR( MVALUE,MISFLAG,EPSILON )
      IF (MVALUE) EPSILON = ABS( MISFLAG )*EPSILON

      IF (MVALUE)                                              THEN

          DSUM = MISFLAG
          DVAR = MISFLAG
          FMIN = MISFLAG
          FMAX = MISFLAG

          MF = 0
          I0 = 1
  100     IF (ABS( F(I0)-MISFLAG ).GE.EPSILON) GOTO 200

              MF = MF+1
              I0 = I0+1

              IF (I0.GT.LA)                                    THEN
                  LA = LA-MF
                  RETURN
              END IF

              GOTO 100

  200     DSUM = F(I0)
          DVAR = F(I0)*F(I0)
          FMIN = F(I0)
          FMAX = F(I0)

          DO  I=I0+1,LA 
              IF (ABS( F(I)-MISFLAG ).LT.EPSILON)              THEN
                  MF   = MF+1
              ELSE
                  FMIN = MIN( F(I), FMIN )
                  FMAX = MAX( F(I), FMAX )
                  DSUM =      F(I)+ DSUM
                  DVAR = F(I)*F(I)+ DVAR
              END IF
          END DO

          LA = LA-MF

      ELSE

          DSUM = F(1)
          DVAR = F(1)*F(1)
          FMIN = F(1)
          FMAX = F(1)

          DO  I=2,LA 
              FMIN = MIN( F(I), FMIN )
              FMAX = MAX( F(I), FMAX )
              DSUM =      F(I)+ DSUM
              DVAR = F(I)*F(I)+ DVAR
          END DO

      END IF

      DVAR = MAX( 0.0_8 , ( DVAR/LA ) - ( DSUM/LA )**2 )

      RETURN

*-------------------------------------------------------------------- 
      END

      SUBROUTINE XXX_cmmm8 (CMIN,CMAX,CMEAN,CVAR,C,LA)

***    OCT 10/94 - B.DUGAS

***    COMPUTES MIN,MAX ABSOLUTE VALUES AND COMPLEX MEAN OF FIELD C(LA).

      IMPLICIT none

      INTEGER  LA
      REAL*8   C(2,LA),CMIN,CMAX,CMEAN(2),CVAR

      INTEGER  I,I0,MF
      LOGICAL  MVALUE
      REAL*8   DSUM(2),MISFLAG,EPSILON,ABSO
      SAVE     MVALUE,MISFLAG,EPSILON

      EXTERNAL MISPAR
*-------------------------------------------------------------------- 

      CALL MISPAR( MVALUE,MISFLAG,EPSILON )
      IF (MVALUE) EPSILON = ABS( MISFLAG )*EPSILON

      IF (MVALUE)                                              THEN

          DSUM(1) = MISFLAG
          DSUM(2) = MISFLAG
          CVAR    = MISFLAG
          CMIN    = MISFLAG
          CMAX    = MISFLAG

          MF = 0
          I0 = 1
  100     IF (ABS( C(1,I0)-MISFLAG ).GE.EPSILON .AND.
     +        ABS( C(2,I0)-MISFLAG ).GE.EPSILON) GOTO 200

              MF = MF+1
              I0 = I0+1

              IF (I0.GT.LA)                                    THEN
                  LA = LA-MF
                  RETURN
              END IF

              GOTO 100

  200     DSUM(1) = C(1,I0)
          DSUM(2) = C(2,I0)
          CVAR    = C(1,I0)*C(1,I0)+C(2,I0)*C(2,I0)
          CMIN    = SQRT( CVAR )
          CMAX    = CMIN

          DO  I=I0+1,LA 
              IF (ABS( C(1,I)-MISFLAG ).LT.EPSILON .OR.
     +            ABS( C(2,I)-MISFLAG ).LT.EPSILON)            THEN
                  MF   = MF+1
              ELSE
                  ABSO    = C(1,I)*C(1,I)+C(2,I)*C(2,I)
                  CVAR    = CVAR+ ABSO
                  ABSO    = SQRT( ABSO )
                  CMIN    = MIN ( ABSO, CMIN )
                  CMAX    = MAX ( ABSO, CMAX )
                  DSUM(1) = C(1,I)+ DSUM(1)
                  DSUM(2) = C(2,I)+ DSUM(2)
              END IF
          END DO

          LA = LA-MF

          CMEAN(1) = DSUM(1)/LA
          CMEAN(2) = DSUM(2)/LA

          CVAR     = MAX( 0.0_8 , (CVAR/LA) - 
     +    (CMEAN(1)*CMEAN(1) + CMEAN(2)*CMEAN(2)) )

      ELSE

          DSUM(1) = C(1,1)
          DSUM(2) = C(2,1)
          CVAR    = C(1,1)*C(1,1)+C(2,1)*C(2,1)
          CMIN    = SQRT( CVAR )
          CMAX    = CMIN

          DO  I=2,LA 
              ABSO    = C(1,I)*C(1,I)+C(2,I)*C(2,I)
              CVAR    = CVAR+ ABSO
              ABSO    = SQRT( ABSO )
              CMIN    = MIN ( ABSO, CMIN )
              CMAX    = MAX ( ABSO, CMAX )
              DSUM(1) = C(1,I)+ DSUM(1)
              DSUM(2) = C(2,I)+ DSUM(2)
          END DO

          CMEAN(1) = DSUM(1)/LA
          CMEAN(2) = DSUM(2)/LA

          CVAR     = MAX( 0.0_8 , (CVAR/LA) - 
     +     (CMEAN(1)*CMEAN(1) + CMEAN(2)*CMEAN(2)) )

      END IF

      RETURN

*-------------------------------------------------------------------- 
      END 

      SUBROUTINE ismov (GIN,GOUT,N)

      INTEGER N,GIN(N),GOUT(N)
      INTEGER I
*-------------------------------------------------------------------- 

      DO  I=1,N
          GOUT(I) = GIN(I)
      END DO

      RETURN

*-------------------------------------------------------------------- 
      END
