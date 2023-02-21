C     $Log: eof.ftn,v $
C     Revision 3.2  2014/09/25 18:31:50  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.1  1994/11/17 14:13:08  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C
C     Revision 3.0  94/11/17  13:55:21  13:55:21  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.0  93/10/13  13:31:37  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.0  92/02/21  11:32:16  armnrbd
C     Initial revision
C     

      REAL FUNCTION eof (ARG)

C     * CECI EST UNE FONCTION BIDON.

      INTEGER ARG

      EOF = FLOAT(ARG)

      RETURN
      END
