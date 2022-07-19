
      SUBROUTINE inctdia

      implicit none

*Author
*          N. Brunet  (Jan91)

*Revision
* 001      B. Bilodeau (Nov 1995) - Change KARMAN to 0.40
* 002      B. Dugas (Mar 1999) - Rename from inctphy to inctdia

*Object
*          to initialize the variables in common block CTESDIA by
*          reading the file "thermoconsts", which should be somewhere
*          in the (CMC/RPN) environment, or the local file "constantes".

*Arguments
*          None.

*PARAMETRES
*     NBRE - NOMBRE DE CONSTANTES DANS LE FICHIER
      INTEGER NBRE
      PARAMETER(NBRE=31)
*
*IMPLICITES
#include "consdia.cdk"
      LOGICAL                INFO
      COMMON       /ZZVERBO/ INFO

*MODULES
      EXTERNAL CONSTNT,XIT

*----------------------------------------------------------------------
      INTEGER FLAG, I
      REAL TEMP1(NBRE)

      EQUIVALENCE (TEMP1(1),CPD)

      CHARACTER *10 NOM1(NBRE)

      DATA NOM1/ 'CPD', 'CPV', 'RGASD', 'RGASV', 'TRPL',
     $           'TCDK', 'RAUW', 'EPS1', 'EPS2', 'DELTA',
     $           'CAPPA', 'TGL', 'CONSOL', 'GRAV', 'RAYT',
     $           'STEFAN', 'PI', 'OMEGA',
     $           'KNAMS', 'STLO', 'KARMAN', 'RIC', 'CHLC', 'CHLF',
     $           'T1S', 'T2S', 'AW', 'BW', 'AI', 'BI', 'SLP'/
*----------------------------------------------------------------------

      DO 100 I=1,NBRE
          CALL CONSTNT( TEMP1(I),FLAG,NOM1(I), 0 )
          IF (FLAG.EQ.0)                                       THEN
              IF (INFO) WRITE(6,6001) NOM1(I)
              CALL                                 XIT(' Inctdia',-1 )
         END IF
  100 CONTINUE
 
 
***   DONNER A LA CONSTANTE "KARMAN" LA VALEUR 0.40
***   ---------------------------------------------
 
      CALL CONSTNT(0.40  ,FLAG,'KARMAN',3)
      CALL CONSTNT(KARMAN,FLAG,'KARMAN',0)

C**   WRITE(6,1000)
C**   WRITE(6,1010) 'The value of the constant KARMAN has been      *'
C**   WRITE(6,1010) '                          ------               *'
C**   WRITE(6,1010) 'changed to ', KARMAN,'   in s/r INCTDIA'
C**   WRITE(6,1000)
C**   PRINT *,' '

      INIT=.TRUE.

      RETURN

*----------------------------------------------------------------------
 1000 FORMAT ( '                                                     ',
     +       / ' ****************************************************',
     +       / '                                                     ')
*
 1010 FORMAT ( ' *   ',A,F4.2,A,'               *')

 6000 FORMAT(1X,'Valeur de',1X,A10,2X,'=',1X,E15.7)
 6001 FORMAT(/,5X,'La constante',2X,A10,1X,"n'existe pas.",/)

      END
      BLOCK DATA DATA_INCTDIA

*     Initialise variables of COORD's COMMONs that need to be.

#include "consdia.cdk"

      DATA INIT/ .FALSE. /

      END BLOCK DATA DATA_INCTDIA
