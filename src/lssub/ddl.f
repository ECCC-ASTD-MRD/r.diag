C     $Log: ddl.ftn,v $
C     Revision 3.2  2014/09/25 18:31:49  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.1  1994/11/17 14:13:03  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C
C     Revision 3.0  94/11/17  13:55:17  13:55:17  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.0  93/10/13  13:31:34  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.0  92/02/21  11:31:59  armnrbd
C     Initial revision
C     

      SUBROUTINE ddl ( A,AK, LA,LM,LSR)

C *** SUBROUTINE TO COMPUTE THE SPECTRAL LONGITUDE DERIVATIVE

      IMPLICIT REAL (A-H,O-Z), INTEGER(I-N)

      DIMENSION A(2,LA),AK(2,LA),LSR(2,1)

C-----------------------------------------------------------------------

CC$doacross local (M,N,NLI,NLF,XM)

      DO 10 M=0,LM-1
         NLI = LSR(1,M+1)
         NLF = LSR(1,M+2)-1
         XM  = FLOAT(M)
         DO 10 N=NLI,NLF
            AK(1,N) = -XM*A(2,N)
            AK(2,N) = +XM*A(1,N)
   10 CONTINUE

      RETURN
      END
