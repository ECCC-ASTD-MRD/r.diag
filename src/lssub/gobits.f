C     $Log: gobits.ftn,v $
C     Revision 3.2  2014/09/25 18:42:03  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.1  1994/11/17 14:13:31  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C
C     Revision 3.0  94/11/17  13:55:39  13:55:39  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.0  93/10/13  13:31:48  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.0  92/02/21  11:33:19  armnrbd
C     Initial revision
C     

      Subroutine go4a8 (quatre, huit)

c     * Nov 07/90 - B. Dugas, RPN.

c     * Cette routine convertit un mot (Reel/4 octets)
c     * en (Reel/8 octets).

       real*4  quatre
       real*8  huit

       huit = quatre

       return
       end

      Subroutine go8a4 (huit, quatre)

c     * Nov 07/90 - B. Dugas, RPN.

c     * Cette routine convertit un mot (Reel/8 octets)
c     * en (Reel/4 octets).

       real*4  quatre
       real*8  huit

       quatre = huit

       return
       end







