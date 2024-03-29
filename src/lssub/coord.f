*     $Log: coord.ftn,v $
*     Revision 3.487  2020/02/13 17:17  dugas
*     - Documenter la coordonnee SLEVE_HYBRID (5100).
*
*     Revision 3.47  2019/08/22 07:07  dugas
*     - Ajouter le support de kind=5100, 5999, 21001
*       et 21002 dans GETKINDC et SETKIND.
*
*     Revision 3.46  2019/04/15 07:07  dugas
*     - Correction du format 6001 de GETKINDC.
*
*     Revision 3.45  2017/11/19 20:21  dugas
*     - Renommer a routine GET_IP1_STRING a GET_IP_STRING (+ generique).
*       GET_IP1_STRING est maintenant un point d'entree a GET_IP_STRING
*
*     Revision 3.44  2016/10/26 16:17  dugas
*     - Ajouter la routine CONVHOUR (le pendant de CONVPR mais pour IP2)
*     - Ajouter KIND=1001,1003,2001,5003,5004 dans CONVIP1 et SETKINDI 
*     - Ajouter un message informatif dans MONVERT
*
*     Revision 3.43  2014/09/25 18:31:49  dugas
*     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
*
*     Revision 3.42  2014/03/12 14:37:34  dugas
*     Appeller diag_convip_plus au lieu de diag_convip_plus dans CONVIP1.
*
*     Revision 3.41  2013/10/08 01:01:28  bernard
*      - CONVIP1 fait mainenant appel a diag_convip_plus et TASSAD
*      - Ajouters le support des types 'hours' et 'integers' a SETKIND et GETKINDC
*        de meme que les type numeriques correspondants 10,15 et 31 a SETKINDI.
*
*     Revision 3.40  2013/07/17 21:48:24  bernard
*     Modifier les formats d'ecriture pour les plus grandes valeurs dans WRITLEV et CONVIP1.
*
*     Revision 3.39  2012/05/17 18:12:45  dugas
*     Info textuelle modifiee pour 10 000 < val <= 1 000 000 dans convip1.
*
*     Revision 3.38  2011/09/16 17:51:53  dugas
*     Ajouter l'option ET16 dans COORDAB.
*
*     Revision 3.37  2010/06/10 21:27:00  dugas
*      - Traitement des valeurs en dehors des intervals connus
*        comme valeurs arbitraires (M. Lepine - Mai 2010)
*
*     Revision 3.36  2010/05/10 16:34:41  dugas
*     Menage dans les messages d'erreurs.
*
*     Revision 3.35  2010/02/10 18:28:07  dugas
*     Ajouter le support de KIND=1002,5001,5002 dans CONVIP1 and co.
*
*     Revision 3.34  2009/09/08 18:58:49  dugas
*     Ajouter message d'erreur dans COORDAB, BASCAL et SIGLOC.
*
*     Revision 3.33  2008/11/24 21:23:34  dugas
*     - Synchronisation CONVIP1 de lssub avec le CONVIP de RMNLIB
*       (ce qui implique surtout des changements lorsque kind=21)
*
*     Revision 3.32  2008/04/25 20:41:19  dugas
*     Definir KINDS pour niveaux Gal-Chen dans CONVIP1.
*
*     Revision 3.31  2007/12/19 19:36:38  dugas
*     - Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
*     - LVDCODE utilise maintenant CONVPR avec mode=-2.
*     - WRITLEV/2 s'inspirent des sorties caracteres de CONVIP1.
*     - Nouvelles routine GET_IP1_STRING et fonction GETKINDC.
*     - CONVIP1 supporte coordonnees CCCma negatives en mode decode.
*     - SETKIND supporte des noms en anglais et en francais.
*
*     Revision 3.30  2007/09/07 17:38:26  dugas
*     Ajouter la routine SETKINDI.
*
*     Revision 3.29  2007/09/06 17:13:29  dugas
*     Corriger la mise-a-jour du 2006/09/19 suite a un commentaire de B.Denis.
*
*     Revision 3.28  2007/08/29 20:17:03  dugas
*     Utiliser NINT pour les messages de CONVPR et supporter les hauts niveaux CCC.
*
*     Revision 3.27  2006/09/19 18:11:01  dugas
*     Verifier que NLEV>1 dans MONVERT.
*
*     Revision 3.26  2006/04/26 16:15:15  dugas
*     Mise-a-jour de CONVIP : cette routine est maintenant en phase avec
*      son pendant de RMNLIB qui a ete implementee en decembre 2005 par MLP.
*
*     Revision 3.25  2005/07/28 17:02:08  dugas
*     - Ajouter "BLOCK DATA DATA_COORD", pour des raisons de conformite avec F90.
*     - MOdifier le code pour enlever les autres messages d'avertissement de F90.
*
*     Revision 3.24  2003/05/23 19:05:46  dugas
*     - Reconnaitre les noms partiels des differentes
*       coordonnees verticales dans SETKIND.
*     - Modifier le calcul de la variable "lev" dans
*       la routine CHKLVLC lorsque KIND=0,4,6 et 17.
*
*     Revision 3.23  2003/01/29 16:57:44  dugas
*     Corriger SETKIND pour les cas de coordonnee THETA
*
*     Revision 3.22  2002/08/20 18:47:57  dugas
*     Ajouter le support des coordonnees de type THETA, HYBRIDE et GALCHEN
*        dans CONVIP1 et WRITLEV2.
*     Ajouter des bornes aux valeurs traitees par CONVIP1 (max,min et zero).
*
*     Revision 3.21  2002/04/22 13:40:16  dugas
*     Ajouter le type KIND=4 (Hauteurs) dans WRITLEV2.
*     Faire la meme chose dans CONVIP1 et SETKIND.
*     Ajouter MODE=2 ou 3 dans CONVIP1.
*
*     Revision 3.20  2001/10/23 14:08:29  armnrbd
*     Augmenter la taille du champs temporaire "nom" dans SETKIND (bug).
*
*     Revision 3.19  2001/10/01 21:07:46  armnrbd
*     Verifier le type de coordonnees avec GETKIND dans WRITLEV2.
*
*     Revision 3.18  2001/08/31 10:54:21  armnrbd
*     Ajouter la routine WRITLEV2.
*
*     Revision 3.17  2001/05/01 15:51:56  armnrbd
*     Modifier CHKLVLC pour le type arbitraire de descripteur IP1.
*
*     Revision 3.16  2001/02/27 00:12:14  armnrbd
*     Ajouter la routine GENAB (calcul de A et B pour GEM hybride).
*
*     Revision 3.15  2000/08/29 12:59:57  armnrbd
*     Ajouter le code pour KIND=3 dans CONVPR et SETKIND.
*
*     Revision 3.14  1998/09/18 01:32:35  armnrbd
*     Ajouter la routine MONVERT.
*
C     Revision 3.13  1998/08/24  20:03:47  armnrbd
C     La fonction CHKLVLC ne fait rien pour un environnement CCC.
C
C     Revision 3.12  1998/07/03  20:17:50  armnrbd
C     Ajouter le code FLAG pour le nouveau mode dans CONVIP1.
C
C     Revision 3.11  1998/06/26  16:48:00  armnrbd
C     Initialiser VKIND dans CONVIP1.
C     Retourner 2 si VKIND=-1 dans CHKLVL.
C
C     Revision 3.10  1998/06/23  18:27:15  armnrbd
C     Enlever les espaces dans les options COORD.
C
C     Revision 3.9  1998/06/08  03:38:34  armnrbd
C     Ajouter le routines GETKIND et SETKIND.
C     Ajouter le traitement de ZZVKIND dans CONIP1.
C
C     Revision 3.8  1998/05/28  19:13:20  armnrbd
C     Remplacer CONVPR par le CONVIP1 modifie par MFV.
C     Modifier CHKLVLC en consequence.
C
C     Revision 3.7  1998/02/18  15:38:24  armnrbd
C     Ajouter la fonction CHKLVLC.
C
C     Revision 3.6  1997/06/02  13:48:35  armnrbd
C     Ajouter les routines LEVCAL2 et SIGCALH.
C
C     Revision 3.5  1996/04/17  15:03:41  armnrbd
C     Ajouter la routine CONVPR.
C
C     Revision 3.4  1996/04/02  15:11:56  armnrbd
C     Corriger une erreur dans LVCODE lorsque PR=(10.-Epsilon).
C
C     Revision 3.3  1995/11/03  03:02:11  armnrbd
C     Ajouter la routine SIGLOC.
C
C     Revision 3.2  1995/01/23  10:38:11  armnrbd
C     Modifier le traitement de IBUF(4)=1 ...
C
C     Revision 3.1  94/11/17  14:13:02  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:55:15  13:55:15  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.1  94/03/08  13:43:30  13:43:30  armnrbd (Bernard Dugas)
C     Tenir compte de LEV ou PR = 0.
C     
C     Revision 2.0  93/10/13  13:31:33  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.1  93/07/08  16:37:38  armnrbd
C     Ajouter la routine BASCL.
C     
*     Revision 1.0  92/02/21  11:31:51  armnrbd
*     Initial revision
*     

      SUBROUTINE coordab (A,B, NK,ETA,COORD,PTOIT)
  
*     * JAN 30/91 - M.LAZARE. - ADD COORD='ET10' (R=1.0) OPTION. 
*     *                         FORCE ETOIT=0 FOR 'SIG' OPTION. 
*     * JAN 16/91 - M.LAZARE. - ADD COORD='ET15' (R=1.5) OPTION. 

*     * FEB 29/88 - R.LAPRISE.

*     * DEFINITION DES PARAMETRES A ET B DE LA DISCRETISATION VERTICALE
*     * A PARTIR D'UNE COLONNE DE VALEUR ETA POUR LE MODELE HYBRIDE.
*     * ICOORD CONTROLE LE TYPE DE COORDONNEES ( 'SIG' OU 'ETA').

      IMPLICIT REAL (A-H,O-Z), INTEGER (I-N)

      REAL        A(NK), B(NK), ETA(NK)
      CHARACTER*4 COORD
  
      logical              info
      common     /zzverbo/ info

      PARAMETER (P0 = 101320.0)

*---------------------------------------------------------------------
                          ETOIT = PTOIT/P0
      IF (COORD.EQ.'SIG') ETOIT = 0. 

  
      IF (COORD.EQ.'SIG' .OR. COORD.EQ.'ET10') THEN

*        * COORDONNEES SIGMA *
  
         DO 100 K=1,NK
            B(K)=(ETA(K)-ETOIT)/(1.0-ETOIT)
            A(K)=P0*(ETA(K)-B(K))
  100    CONTINUE
  
      ELSE IF (COORD.EQ.'ETA') THEN 

*        * COORDONNEES HYBRRIDE (ETA) *
  
         DO 200 K=1,NK 
            B(K)=((ETA(K)-ETOIT)/(1.-ETOIT))**2 
            A(K)=P0*(ETA(K)-B(K)) 
  200    CONTINUE 
 
      ELSE IF (COORD.EQ.'ET15') THEN 

*        * COORDONNEES HALF-HYBRRIDE (ET15) * 
 
         DO 300 K=1,NK 
            B(K)=((ETA(K)-ETOIT)/(1.-ETOIT))**1.5 
            A(K)=P0*(ETA(K)-B(K)) 
  300    CONTINUE 
 
      ELSE IF (COORD.EQ.'ET16') THEN 

*        * COORDONNEES "0.6" HYBRRIDE (ET16) * 
 
         DO 400 K=1,NK 
            B(K)=((ETA(K)-ETOIT)/(1.-ETOIT))**1.6 
            A(K)=P0*(ETA(K)-B(K)) 
  400    CONTINUE 
 
      ELSE

         if (info) write(6,6001) COORD
         CALL                                    XIT(' Coordab',-1)

      END IF
  
      RETURN
*---------------------------------------------------------------------

 6001 FORMAT(' Unsupported coordinate type ',A/)

      END 

      SUBROUTINE coorddb (DB,D2B, BG,BH, NK)
  
*     * FEB 29/88 - R.LAPRISE.
*     * DEFINITION DES PARAMETRES DB ET D2B DE LA DISCRETISATION
*     * VERTICALE, A PARTIR DE BG ET BH, POUR LE MODELE HYBRIDE.

      IMPLICIT REAL (A-H,O-Z), INTEGER (I-N)

      REAL BG  (NK),BH  (NK)
      REAL DB  (NK),D2B (NK)

*-----------------------------------------------------------------------
      DB (1) = BG(1)
      D2B(1) = 0.0

      DO 100 K=2,NK 
          DB (K) = BG(K  )-BG(K-1)
          D2B(K) = BH(K-1)-BG(K-1)
  100 CONTINUE
  
      RETURN
      END 
      SUBROUTINE bascal (SGB,SHB, SG,SH, NK,LAY)
  
***    JAN 25/93 - E.CHAN.  (CALL WRITLEV TO PRINT OUT LEVELS)
***    MAY 30/88 - M.LAZARE (MODIFY FORMAT STATEMENT TO HANDLE 50 LEVS)
***    JAN 29/88 - R.LAPRISE.

***   DESCRIPTION...

***    CALCUL DES BASES DES COUCHES A PARTIR DE
***    LA POSITION DES "MILIEUX".

***    SGB(K)    : BASES DES COUCHES DU VENT.
***    SHB(K)    : BASES DES COUCHES DE TEMPERATURE. 
***    SG(K)     : MILIEU DES COUCHES DU VENT. 
***    SH(K)     : MILIEU DES COUCHES DE TEMPERATURE.
***    NK        : NOMBRE DE COUCHES.

***   PARAMETRES...

***    LAY = TYPE D'ARRANGEMENT DES INTERFACES PAR RAPPORT 
***          AUX MILIEUX DE COUCHES. 
***        = 0, COMME LAY=2 POUR V ET LAY=4 POUR T,
***             POUR COMPATIBILITE AVEC VERSION ANTERIEURE DU GCM. 
***        = 1 / 2, INTERFACES DES COUCHES PLACEES A DISTANCE EGALE
***                 SIGMA / GEOMETRIQUE DU MILIEU DES COUCHES
***                 ADJACENTES.
***        = 3 / 4, BASES DES COUCHES EXTRAPOLEES EN MONTANT 
***                 DE SORTE QUE LES MILIEUX DES COUCHES SOIENT
***                 AU CENTRE SIGMA / GEOMETRIQUE DES COUCHES. 

***   NOTES:

***    UN DECOUPLAGE DE L'EPAISSEUR DES COUCHES PEUT RESULTER 
***    DE L'APPLICATION DE LAY=3 OU 4 (AUSSI =0 POUR T) SI LES
***    MILIEUX DE COUCHES NE SONT PAS DEFINIS DE FACON APPROPRIES.

      IMPLICIT none

      INTEGER  NK,LAY,K
      REAL     SGB(NK), SHB(NK) 
      REAL     SG(NK),  SH (NK) 

      logical              info
      common     /zzverbo/ info

      EXTERNAL WRITLEV

*-------------------------------------------------------------------- 
***    DEFINITION DES BASES DES COUCHES. 

      IF (LAY.EQ.0)                                            THEN 

          SGB(NK) = 1.0 
          SHB(NK) = 1.0
          DO  K=NK-1,1,-1 
              SGB(K) = SQRT(SG(K)*SG(K+1))
              SHB(K) = SH(K+1)**2/SHB(K+1)
          END DO 

      ELSE IF (LAY.EQ.1)                                       THEN 

          DO  K=1,NK-1
              SGB(K) = 0.5*(SG(K)+SG(K+1))
              SHB(K) = 0.5*(SH(K)+SH(K+1))
          END DO 
          SGB(NK) = 1.0
          SHB(NK) = 1.0

      ELSE IF (LAY.EQ.2)                                       THEN 

          DO  K=1,NK-1
              SGB(K)=SQRT(SG(K)*SG(K+1))
              SHB(K)=SQRT(SH(K)*SH(K+1))
          END DO 
          SGB(NK) = 1.0
          SHB(NK) = 1.0

      ELSE IF (LAY.EQ.3)                                       THEN 

          SGB(NK) = 1.0
          SHB(NK) = 1.0
          DO  K=NK-1,1,-1 
              SGB(K) = 2.*SG(K+1)-SGB(K+1)
              SHB(K) = 2.*SH(K+1)-SHB(K+1)
          END DO 

      ELSE IF (LAY.EQ.4)                                       THEN 

          SGB(NK) = 1.0
          SHB(NK) = 1.0
          DO  K=NK-1,1,-1 
              SGB(K) = SG(K+1)**2/SGB(K+1)
              SHB(K) = SH(K+1)**2/SHB(K+1)
          END DO  

      ELSE

          if (info) write(6,6001) LAY
          CALL                                     XIT(' Bascal ',-1 ) 

      END IF 

      CALL WRITLEV( SG, NK,' SG ' )
      CALL WRITLEV( SGB,NK,' SGB' )
      CALL WRITLEV( SH, NK,' SH ' )
      CALL WRITLEV( SHB,NK,' SHB' )

      RETURN
*---------------------------------------------------------------------

 6001 FORMAT(' Unsupported layering type, LAY = ',I2/)

      END
      SUBROUTINE levcal2 (SGBJ,SHBJ, SGJ,SHJ, DSGJ,DSHJ, SHBJ1,
     1                    AG,BG,AH,BH, ACG,BCG,ACH,BCH, PSJ, 
     2                    NK,NK1, ILG,LON, JLAT, PTOIT)

***    DEC 15/92 - M.LAZARE. - VECTORIZE ON INNER LONGITUDE LOOPS.
***    JUL 15/88 - M.LAZARE. - REVERSE (NK,I) ARRAYS TO PROPER (I,NK). 
***                            SHTJ THEN BECOMES SHTJ(ILG) FOR TOP AND 
***                            SHBJ BECOMES SHBG(ILG,NK).
***    MAR 11/88 - R.LAPRISE.

***    CALCUL LA POSITION DES BASES ET CENTRES DE COUCHES POUR 
***    LA PHYSIQUE DE LA VERSION HYBRIDE A ELEMENTS FINIS CONSTANTS
***    DU GCM, A VARIABLES INTERCALEES OU NON. 
***    
***    PARAMETRES DE SORTIE: 
***    
***    SGJ (I,K)    : MILIEU DES COUCHES DU VENT.
***    SHJ (I,K)    : MILIEU DES COUCHES DE TEMPERATURE. 
***    SGBJ(I,K)    : BASES DES COUCHES DU VENT. 
***    SHBJ(I,K)    : BASES DES COUCHES DE TEMPERATURE.
***    DSGJ(I,K)    : EPAISSEURS SIGMA DES COUCHES DU VENT.
***    DSHJ(I,K)    : EPAISSEURS SIGMA DES COUCHES DE TEMPERATURE. 
***    SHTJ(I,K)    : DESSUS DES COUCHES DE TEMPERATURE, 
***    
***    PARAMETRES D'ENTREE:  
***    
***    AG ,BG ,AH ,BH (K): INFO. SUR POSITION DES BASES DE COUCHES.
***    ACG,BCG,ACH,BCH(K): INFO. SUR POSITION DES MILIEUX DE COUCHES.
***    NK         : NOMBRE DE COUCHES. 
***    NK1        : SIMPLEMENT  NK + 1.
***    ILG        : DIMENSION EN LONGITUDE.
***    LON        : NOMBRE DE LONGITUDES DISTINCTES. 
***    ALFMOD     : POIDS AU SOMMET. 
***    JLAT       : NUMERO DE CETTE LATITUDE (UTILISE POUR DEBUG)
***    PTOIT      : PRESSURE WHERE LID OF MODEL APPLIED. 
  
      IMPLICIT none

      INTEGER  ILG,LON,JLAT,NK,NK1
      REAL     PSJ (   ILG), PTOIT
      REAL     SGBJ(ILG,NK), SHBJ(ILG,NK), SHBJ1(ILG) 
      REAL     SGJ (ILG,NK), SHJ (ILG,NK) 
      REAL     DSGJ(ILG,NK), DSHJ(ILG,NK) 
      REAL     AG  (NK),BG  (NK),AH  (NK),BH  (NK)
      REAL     ACG (NK),BCG (NK),ACH (NK),BCH (NK)

***    LOCAL VARIABLES.

      INTEGER  I,K
      REAL     STOIT

*-------------------------------------------------------------------- 
***    DEFINITION DES MILIEUX ET BASES DE COUCHES.

*vdir novector  
      DO 100 K=1,NK 
      DO 100 I=1,LON 
          SGJ (I  ,K) =ACG(K)/PSJ(I)+BCG(K)
          SHJ (I  ,K) =ACH(K)/PSJ(I)+BCH(K)
          SGBJ(I  ,K) =AG (K)/PSJ(I)+BG (K) 
          SHBJ(I  ,K) =AH (K)/PSJ(I)+BH (K) 
  100 CONTINUE
  
***    CALCUL DES EPAISSEURS DES COUCHES.
***    STOIT IS THE LID OF THE MODEL. 

      DO 250 I=1,LON
          STOIT=PTOIT/PSJ(I)  
          DSGJ(I,1) = SGBJ(I,1) - STOIT 
          DSHJ(I,1) = SHBJ(I,1) - STOIT 
          SHBJ1(I)  = STOIT 
 250  CONTINUE  
  
      DO 300 K=2,NK 
      DO 300 I=1,LON
          DSGJ(I,K) = SGBJ(I,K)-SGBJ(I,K-1)
          DSHJ(I,K) = SHBJ(I,K)-SHBJ(I,K-1)
  300   CONTINUE
  
      RETURN
*-------------------------------------------------------------- 

      END
      SUBROUTINE lvacode (ICODE,IBUF4,NLEV) 

***    FEB 22/91 - E.CHAN. 

***    CONVERTS CODED LEVEL INFORMATION IN CCRN STANDARD LABELS
***    GENERATED BY SUBROUTINE LVCODE INTO ALTERNATE CODE THAT 
***    IS MONOTONICALLY INCREASING (A REQUIREMENT OF SOME PROGRAMS,
***    E.G. SELECT, SELECT2, ETC.).

***    IBUF4 = CODED LABEL FOR LEVEL IN THE FOLLOWING FORMS: 
***      1)  -XAAA = A.AA E-X     IF VC <  1 
***      2)   AAAA = AAAA         IF VC >= 1 
***                               WHERE VC = VERTICAL COORDINATE,
***                                          PRESSURE IN MB OR (ETA*1000)
***    ICODE = ALTERNATE CODE: 
***      1)  -XCCC = A.AA E-X     IF 0 < VC <  1   (CCC = 1000 - AAA)
***      2)  -10000               IF     VC =  0
***      3)   AAAA = AAAA         IF     VC >= 1 

      IMPLICIT none

      INTEGER  NLEV,IBUF4(NLEV),ICODE(NLEV)
      INTEGER  IX,L

*-----------------------------------------------------------------------
      DO  L = 1, NLEV

          IF (IBUF4(L) .LT. 0)                                 THEN 
              IX = IBUF4(L) / 1000
              ICODE(L) =  (2*IX-1)*1000 - IBUF4(L)
          ELSE IF (IBUF4(L).EQ.0)                              THEN
              ICODE(L) = -10000
          ELSE IF (IBUF4(L).EQ.1)                              THEN
              ICODE(L) =  1000
          ELSE
              ICODE(L) = IBUF4(L) 
          END IF 

      END DO
*-----------------------------------------------------------------------

      RETURN
      END 
      SUBROUTINE lvcode (IBUF4,ETA,NLEV) 

***    JAN 22/93 - E.CHAN. 

***    GENERATES CODED LEVEL INFORMATION TO BE INCLUDED IN CCRN
***    STANDARD LABELS.

***    ETA = ETA COORDINATE OR PRESSURE IN MB DIVIDED BY 1000. 
***    IBUF4 = CODED LABEL FOR LEVEL IN THE FOLLOWING FORMS: 
***      1)  -XAAA = A.AA E-X     IF ETA <  .010 
***      2)   AAAA = AAAA         IF ETA >= .010 OR ETA = 0

***    USE SUBROUTINE LVDCODE FOR REVERSE OPERATION. 

      IMPLICIT  none

      CHARACTER STRING*9
      INTEGER   NLEV,IBUF4(NLEV), L,IX,IXP1,IAAA
      REAL      ETA(NLEV),VC

*-----------------------------------------------------------------------
      DO  L = 1, NLEV

***        CONVERT TO VERTICAL COORDINATE (PRESSURE IN MB OR ETA*1000).

          VC = 1000. * ETA(L)

          IF (VC .GE. 10.)                                     THEN 

***            CASE 1: VC >= 10

              IBUF4(L) = NINT( VC ) 

          ELSE IF ( VC .GT. 1.E-9 )                            THEN

***            CASE 2: 10 > VC > 1E-9

***            THE INTEGER EXPONENT IX AND MANTISSA IAAA ARE 
***            GENERATED FROM THE REAL NUMBER VC BY FIRST WRITING 
***            VC AS CHARACTER DATA INTO STRING. IX AND IAAA ARE 
***            THEN EXTRACTED FROM THE APPROPRIATE LOCATIONS 
***            IN STRING.

              WRITE (STRING,2000) VC 
              READ  (STRING,2010) IAAA, IXP1
              IX       = IXP1 - 1 

              IF (IX.LE.0)                                     THEN
                  IBUF4(L) = IX*1000 - IAAA 
              ELSE
                  IBUF4(L) = NINT( VC )
              END IF

          ELSE IF ( VC .GE. 1.E-11 )                           THEN

***            CASE 3: 1E-9 >= VC >= 1E-11

              IBUF4(L) = -9000 - NINT( VC*1.E11 )

          ELSE

***            CASE 4: 1E-11 > VC

              IBUF4(L) = 0

          END IF 

      END DO

      RETURN
*-----------------------------------------------------------------------

 2000 FORMAT (E9.3) 
 2010 FORMAT (2X,I3,1X,I3)

      END 
      SUBROUTINE lvdcode (VC,IBUF4,NLEV)

***    FEB 28/91 - E.CHAN. 

***    DECODES LEVEL INFORMATION IN CCRN STANDARD LABELS GENERATED 
***    BY SUBROUTINE LVCODE. 

***    VC = VERTICAL COORDINATE: PRESSURE IN MB OR (ETA*1000)
***    IBUF4 = CODED LABEL FOR LEVEL IN THE FOLLOWING FORMS: 
***      1)  -XAAA = A.AA E-X     IF VC <  1 
***      2)   AAAA = AAAA         IF VC >= 1 OR VC = 0

      IMPLICIT  none

      INTEGER   NLEV,IBUF4(NLEV), L,KIND
      REAL      VC(NLEV) 

*-----------------------------------------------------------------------
***    RECONSTITUTE THE REAL NUMBER VC FROM THE INTEGER EXPONENT IX AND
***    MANTISSA IAAA BY FIRST WRITING IX AND IAAA INTO STRING AS CHARACTER 
***    DATA. THE NUMBER IS THEN READ BACK INTO VC IN E-FORMAT. 
  
      DO  L = 1, NLEV

          CALL CONVPR( IBUF4(L),VC(L), KIND, -2 )
          IF (KIND.EQ.1 .OR. KIND.EQ.5) VC(L) = VC(L)*1000

      END DO

      RETURN
*-----------------------------------------------------------------------

      END 
      SUBROUTINE siglab2 (LSG,LSH,SG,SH,NLEV)

***    JAN 15/93 - E.CHAN (CALL LVCODE DO GENERATE LEVEL LABELS).   
***    DEC 03/87 - R.LAPRISE.

***    COMPUTES INTEGER LABEL VALUES OF ETA/SIGMA LEVELS FOR 
***    GENERAL STAGGERED OR NON-STAGGERED VERSIONS OF GCM.
***    SG  = SIGMA VALUES AT MID POINT OF MOMENTUM LAYERS. 
***    SH  = SIGMA VALUES AT MID POINT OF THERMODYNAMIC LAYERS.
***    LSG = 1000*SG.
***    LSH = 1000*SH.

      IMPLICIT  none

      INTEGER   NLEV
      REAL      SG(NLEV), SH(NLEV)
      INTEGER  LSG(NLEV),LSH(NLEV) 

*-----------------------------------------------------------------------
      CALL LVCODE( LSG,SG,NLEV )
      CALL LVCODE( LSH,SH,NLEV )
      RETURN
*-----------------------------------------------------------------------

      END
      SUBROUTINE sigcalh
     1                  (DSGJ,DSHJ,DLNSGJ,
     2                   D1SGJ,A1SGJ,B1SGJ, 
     3                   D2SGJ,A2SGJ,B2SGJ, 
     4                   NI2,NI,NK, 
     5                   PTOIT, 
     6                   PSJ,AG,BG,AH,BH,ALFMOD)

***    DEC 15/92 - M.LAZARE. REMOVE CK,DBK OUT OF INNER 1002 LOOP
***                          TO ENSURE VECTORIZATION ON LONGITUDES. 
***    MAR 15/88 - R.LAPRISE, CLAUDE GIRARD

***    CALCUL DES PARAMETRES DE LA DISCRETISATION VERTICALE  DU
***    MODELE SPECTRAL, SEMI-IMPLICITE, ELEMENTS FINIS CONSTANTS 
***    A VARIABLES INTERCALEES (OU NON). 
***    COUCHES D'EPAISSEURS VARIABLES, 
***    TANT DANS L'HORIZ. (COORD. HYB.) QUE DANS LA VERT.
***    UTILISATION DANS DYNCAL.
***    
***    ON CALCULE

***    DSGJ(I,K)    : EPAISSEURS SIGMA DES COUCHES DU VENT.
***    DSHJ(I,K)    : EPAISSEURS SIGMA DES COUCHES DE TEMPERATURE. 
***    DLNSGJ(I,K)  : EPAISSEURS LOGJ(SIGMA) DES COUCHES DE TEMPERATURE. 
***                   POUR CONVERSION DIAGNOSTIQUE T A PHI CONSISTANTE.
***    D1SGJ(I,K)   : EPAISSEURS SIGMA ENTRE HAUT DE COUCHE DU VENT
***                   ET BAS DE COUCHE DE TEMPERATURE. 
***    A1SGJ(I,K)   : POIDS DE LA S-COUCHE D1SGJ POUR LE CALCUL DU 
***                   GEOPOTENTIEL 
***    B1SGJ(I,K)   : POIDS DE LA S-COUCHE D1SGJ POUR LE CALCUL DU 
***                   GRADIENT DE PRESSION 
***    D2SGJ(I,K)   : EPAISSEURS SIGMA ENTRE BAS DE COUCHE DE
***                   TEMPERATURE ET BAS DE COUCHE DU VENT.
***    A2SGJ(I,K)   : POIDS DE LA S-COUCHE D2SGJ POUR LE CALCUL DU 
***                   GEOPOTENTIEL 
***    B2SGJ(I,K)   : POIDS DE LA S-COUCHE D2SGJ POUR LE CALCUL DU 
***                   GRADIENT DE PRESSION 
***    
***    DE DIMENSION
***    
***    NI2       : NOMBRE DE POSITIONS DE MEMOIRE PAR COUCHES. 
***    NI        : NOMBRE DE LONGITUDES. 
***    NK        : NOMBRE DE COUCHES.

***    A PARTIR DES PARAMETRES D'ENTREE: 
***    
***    PSJ(I)      : PRESSION DE SURFACE 
***    AG(K)       : PARAMETRE A DE LA COORDONNEE ETA POUR LE VENT.
***    BG(K)       : PARAMETRE B DE LA COORDONNEE ETA POUR LE VENT.
***    AH(K)       : PARAMETRE A DE LA COORDONNEE ETA POUR LA TEMP.
***    BH(K)       : PARAMETRE B DE LA COORDONNEE ETA POUR LA TEMP.
***    
***    N.B. LORSQUE LES COUCHES DE VENT ET TEMP. COINCIDENT
***         DSHJ=DSGJ ET D2SGJ=A2SGJ=B2SGJ=0.

      IMPLICIT none

      INTEGER  NI2,NI,NK
      REAL     DSGJ(NI2,NK),  DSHJ(NI2,NK),DLNSGJ(NI2,NK)
      REAL     D1SGJ(NI2,NK), A1SGJ(NI2,NK), B1SGJ(NI2,NK)
      REAL     D2SGJ(NI2,NK), A2SGJ(NI2,NK), B2SGJ(NI2,NK)

      REAL     PSJ(NI2) 

      REAL     PTOIT,ALFMOD
      REAL     AG(NK),BG(NK)
      REAL     AH(NK),BH(NK)

***    LOCAL VARIABLES.

      INTEGER  I,K
      REAL     C1,DB1,CK,DBK,
     +         SGB1,SHB1,STOIT,
     +         SGBK,SGBKM,SHBK,SHBKM
*-------------------------------------------------------------------- 

      C1=-PTOIT*BG(1) 
      DB1=BG(1) 

***    CALCUL DES PARAMETRES.

      DO  I=1,NI
          STOIT      =PTOIT/PSJ(I)
          SGB1       =AG(1)/PSJ(I)+BG(1)
          SHB1       =AH(1)/PSJ(I)+BH(1)

          DSGJ(I,1)  =SGB1-STOIT
          DSHJ(I,1)  =SHB1-STOIT
          DLNSGJ(I,1)=LOG(SHB1/STOIT)

          D1SGJ(I,1) =SGB1-STOIT
          A1SGJ(I,1) =ALFMOD*D1SGJ(I,1) 
     +                          +SGB1*LOG(SHB1/SGB1)-STOIT*DLNSGJ(I,1) 
          B1SGJ(I,1) =(D1SGJ(I,1)*DB1+LOG(SGB1/STOIT)*C1/PSJ(I)) 
     +                                                 /DSGJ(I,1) 

          D2SGJ(I,1) =0.0 
          A2SGJ(I,1) =0.
          B2SGJ(I,1) =0.
      END DO

      DO  K=2,NK
        CK         =AG(K)*BG(K-1) -AG(K-1)*BG(K)
        DBK        =BG(K)-BG(K-1) 
        DO  I=1,NI
          SGBK       =AG(K)  /PSJ(I)+BG(K)
          SGBKM      =AG(K-1)/PSJ(I)+BG(K-1)
          SHBK       =AH(K)  /PSJ(I)+BH(K)
          SHBKM      =AH(K-1)/PSJ(I)+BH(K-1)

          DSGJ(I,K)  =SGBK-SGBKM
          DSHJ(I,K)  =SHBK-SHBKM
          DLNSGJ(I,K)=LOG(SHBK/SHBKM)

          D1SGJ(I,K)=SGBK-SHBKM 
          A1SGJ(I,K)=D1SGJ(I,K) +SGBK*LOG(SHBK/SGBK)-SGBKM*DLNSGJ(I,K) 
          B1SGJ(I,K)=(D1SGJ(I,K)*DBK +LOG(SGBK/SHBKM)*CK/PSJ(I)) 
     +                                                   /DSGJ(I,K) 

          D2SGJ(I,K)=SHBKM-SGBKM
          A2SGJ(I,K)= D2SGJ(I,K) -SGBKM*LOG(SHBKM/SGBKM) 
          B2SGJ(I,K)=(D2SGJ(I,K)*DBK   +LOG(SHBKM/SGBKM)*CK/PSJ(I))
     +                                                   /DSGJ(I,K) 
        END DO
      END DO

      RETURN
*-----------------------------------------------------------------------

      END
      SUBROUTINE sigloc (ACH,BCH,AH,BH,SH,SHB,NK,LAY,COORD,PTOIT)
  
***    OCT 25/88 - M.LAZARE. BASED ON MODEL SUBROUTINE BASCAL, 
***                          CALCULATES LOCAL SIGMA INFORMATION ARRAYS 
***                          ACH,BCH,AH,BH,SHB BASED ON INPUT ARRAY SH.
***                          ONLY HAS THERMODYNAMIC LEVEL INFORMATION
***                          FROM GCM HISTORY FILE, SO "SG" AND "SGB"
***                          ARRAYS FROM BASCAL NOT INCLUDED.

***    PARAMETERS: 

***    ACH,BCH(K)   : INFO. SUR POSITION DES MILIEUX DE COUCHES. 
***    AH ,BH (K)   : INFO. SUR POSITION DES BASES DE COUCHES. 
***    SH(K)        : MILIEU DES COUCHES DE TEMPERATURE. 
***    SHB(K)       : BASES DES COUCHES DE TEMPERATURE.
***    NK           : NOMBRE DE COUCHES. 

***    LAY = TYPE D'ARRANGEMENT DES INTERFACES PAR RAPPORT 
***          AUX MILIEUX DE COUCHES. 
***        = 0, COMME LAY=2 POUR V ET LAY=4 POUR T,
***             POUR COMPATIBILITE AVEC VERSION ANTERIEURE DU GCM. 
***        = 1 / 2, INTERFACES DES COUCHES PLACEES A DISTANCE EGALE
***                 SIGMA / GEOMETRIQUE DU MILIEU DES COUCHES
***                 ADJACENTES.
***        = 3 / 4, BASES DES COUCHES EXTRAPOLEES EN MONTANT 
***                 DE SORTE QUE LES MILIEUX DES COUCHES SOIENT
***                 AU CENTRE SIGMA / GEOMETRIQUE DES COUCHES. 

***    DECOUPLAGE DE L'EPAISSEUR DES COUCHES PEUT RESULTER 
***    DE L'APPLICATION DE LAY=3 OU 4 (AUSSI =0 POUR T) SI 
***    LES MILIEUX DE COUCHES NE SONT PAS DEFINIS DE FACON 
***    APPROPRIES. 

***    COORD        : COORDONNE VERTICALE ('ETA'OU 'SIG'). 
***    PTOIT        : TOIT DU MODELE (PASCALS).

      IMPLICIT  none

      CHARACTER COORD*4
      INTEGER   K,NK,LAY
      REAL      SH(NK),SHB(NK),ACH(NK),
     +          AH(NK),BH(NK), BCH(NK),PTOIT

      logical              info
      common     /zzverbo/ info

      EXTERNAL  COORDAB
*-------------------------------------------------------------------- 

***    DEFINITION DES BASES DES COUCHES. 

      IF (LAY.EQ.0)                                            THEN 
          SHB(NK) = 1. 
          DO  K=NK-1,1,-1 
              SHB(K) = SH(K+1)**2/SHB(K+1)
          END DO

      ELSE IF (LAY.EQ.1)                                       THEN 
          DO  K=1,NK-1
              SHB(K) = 0.5*(SH(K)+SH(K+1))
          END DO
          SHB(NK) = 1.0

      ELSE IF (LAY.EQ.2)                                       THEN 
          DO  K=1,NK-1
              SHB(K) = SQRT(SH(K)*SH(K+1))
          END DO
          SHB(NK) = 1.0

      ELSE IF (LAY.EQ.3)                                       THEN 
          SHB(NK)=1.0
          DO  K=NK-1,1,-1 
              SHB(K) = 2.*SH(K+1)-SHB(K+1)
          END DO 

      ELSE IF (LAY.EQ.4)                                       THEN 
          SHB(NK)=1.0
          DO  K=NK-1,1,-1 
              SHB(K) = SH(K+1)**2/SHB(K+1)
          END DO

      ELSE
          if (info) write(6,6001) LAY
          CALL                                     XIT(' Sigloc ',-1 ) 
      END IF 

      WRITE(6,6000) 'SH =',SH
      WRITE(6,6000) 'SHB=',SHB 

***    NOW CALCULATE "A" AND "B" ARRAYS. 

      CALL COORDAB( ACH,BCH, NK,SH ,COORD,PTOIT ) 
      CALL COORDAB( AH ,BH , NK,SHB,COORD,PTOIT ) 

      RETURN

*-------------------------------------------------------------- 
 6000 FORMAT(4X,A4,/,(8X,10F6.3)) 
 6001 FORMAT(' Unsupported layering type, LAY = ',I2/)

      END 
      SUBROUTINE writlev (ALEV,NLEV,LABEL)

      IMPLICIT    none

      INTEGER     NLEV
      REAL        ALEV(NLEV)
      CHARACTER *(*) LABEL

***    JAN 22/93 - E.CHAN.   

***    PRINTS OUT LEVELS WITH FORMATS DEPENDING ON THE VALUE.
***    ** Cette version du code a ete emprumtee a CONVIP1 **

***    ALEV    = ARRAY OF LEVELS.
***    NLEV    = NUMBER OF LEVELS.
***    LABEL   = CHARACTER LABEL IDENTIFYING THE TYPE OF LEVEL
***              (E.G. LABL='ETA:').

      INTEGER      L
      REAL         ABS_P
      CHARACTER*12 STRING(NLEV)

*------------------------------------------------------------------
      IF (NLEV.LT.1) RETURN

      DO  L=1,NLEV

          ABS_P = ABS( ALEV(L) )

          if     (abs_p.eq. int(abs_p) .and.
     +            abs_p.lt. 10 000 000.)                       then
             write(string(L),'(i12)') nint( ALEV(L) )
          elseif (abs_p.ge. 1 000 000.)                        then
             write(string(L),'(1pe12.6)') ALEV(L)
          elseif (abs_p.ge. 100 000.)                          then
             write(string(L),'(f12.0)') ALEV(L)
          elseif (abs_p.ge. 10 000.)                           then
             write(string(L),'(f12.1)') ALEV(L)
          elseif (abs_p.ge. 1 000.)                            then
             write(string(L),'(f12.3)') ALEV(L)
          elseif (abs_p.ge. 100.)                              then
             write(string(L),'(f12.4)') ALEV(L)
          elseif (abs_p.ge. 10.)                               then
             write(string(L),'(f12.5)') ALEV(L)
          elseif (abs_p.ge. 1.)                                then
             write(string(L),'(f12.6)') ALEV(L)
          elseif (abs_p.ge. 0.1)                               then
             write(string(L),'(f12.7)') ALEV(L)
          elseif (abs_p.ge. 0.01)                              then
             write(string(L),'(f12.8)') ALEV(L)
          elseif (abs_p.ge. 0.001)                             then
             write(string(L),'(f12.9)') ALEV(L)
          else
             write(string(L),'(e12.6)') ALEV(L)
          endif

      END DO

***    PRINT OUT LEVELS.

      WRITE(6,6000)  NLEV,TRIM( LABEL )
      WRITE(6,6004) (STRING(L)(1:12),L=1,NLEV)

      WRITE(6,'(1X)')

      RETURN
*------------------------------------------------------------------

 6000 FORMAT (/I4,1X,A,' levels...'/)
 6004 FORMAT (6(1X,A))

      END
      SUBROUTINE writlev2 (LEV,NLEV, IBUF)

      IMPLICIT    none

      INTEGER     NLEV,LEV(NLEV),IBUF(1)

***    June 2001 - B. Dugas, RPN

***    PRINTS OUT LEVELS WITH FORMATS DEPENDING ON THE VALUE.

***    LEV     = ARRAY OF (POSSIBLY CODED) LEVELS.
***    NLEV    = NUMBER OF LEVELS.
***    IBUF    = BUFFER THAT WAS USED TO FIND OUT THE ALEV LEVELS.

***             VALUE                      FORMAT
***             -----                      ------

***              ALEV  <  .001              1PE9.2 
***        .01 > ALEV  >= .001                F9.5
***              ALEV  >= .01                 F9.3 

***    LOCAL ARRAYS.

      CHARACTER*13 LABEL*13
      CHARACTER*15 STRING(NLEV)
      REAL        PR(NLEV)
      INTEGER     L,KIND,NHI,NMID,NLOW,LL,IP1

      CHARACTER*4 GETHIC,PKTYP
      INTEGER     GETHIGH,GETKIND
      EXTERNAL    GETHIGH,GETKIND,GETHIC,LVDCODE,CONVPR

*------------------------------------------------------------------
      IF (NLEV.LT.1) RETURN

***    DETERMINE NUMBER OF LEVELS IN EACH OF THREE CATEGORIES.

      NHI   =  0
      NMID  =  0
      KIND  = -1

      LL    =  4
      LABEL = 'CCCma'

      PKTYP = GETHIC('PKTYP',IBUF )
      PKTYP = PKTYP(1:2)

      IF (PKTYP.EQ.'SQ')                                       THEN
          DO  L=1,NLEV
              CALL CONVIP1( LEV(L),PR(L), KIND, -2, STRING(L),.TRUE. )
          END DO
          IF (KIND.EQ.3 .AND. IP1.EQ.32767)
     +    KIND = GETKIND( )
      ELSE
          CALL LVDCODE( PR,LEV,NLEV )
      END IF

      IF (KIND.EQ.0)                                           THEN
          LABEL = 'HEIGHT'
      ELSE IF (KIND.EQ.1)                                      THEN
          LABEL = 'ETA'
      ELSE IF (KIND.EQ.2)                                      THEN
          LABEL = 'PRESSURE'
      ELSE IF (KIND.EQ.3)                                      THEN
          LABEL = 'ARBITRARY' 
      ELSE IF (KIND.EQ.4)                                      THEN
          LABEL = 'HEIGHTS' 
      ELSE IF (KIND.EQ.5)                                      THEN
          LABEL = 'HYBRID' 
      ELSE IF (KIND.EQ.6)                                      THEN
          LABEL = 'THETA'   
      ELSE IF (KIND.EQ.21)                                     THEN
          LABEL = 'HYBRID-HEIGHT'
      END IF

      DO  L=1,NLEV

          IF (PR(L) .LT. .001)                                 THEN 
              NHI  = NHI  + 1
          ELSE IF (PR(L) .LT. .01)                             THEN
              NMID = NMID + 1
          END IF

      END DO

      NLOW=NLEV-NHI-NMID

***    PRINT OUT LEVELS.

      WRITE(6,6000)  NLEV,TRIM( LABEL )

      IF (PKTYP.EQ.'SQ')                                        THEN
          WRITE(6,6004) (STRING(L)(1:12),L=1,NLEV)
      ELSE
          IF (NHI .GT.0) WRITE(6,6001)(PR(L),L=1,NHI)
          IF (NMID.GT.0) WRITE(6,6002) (PR(NHI+L),L=1,NMID)
          IF (NLOW.GT.0) WRITE(6,6003) (PR(NHI+NMID+L),L=1,NLOW)
      END IF

      WRITE(6,'(1X)')

      RETURN
*------------------------------------------------------------------

 6000 FORMAT (/I4,1X,A,' levels...'/)
 6001 FORMAT (4X,8(1PE12.5))
 6002 FORMAT (4X,8F12.8)
 6003 FORMAT (2X,8F12.6)
 6004 FORMAT (6(1X,A))

      END
      INTEGER function get_ip1_kind (ip)

      implicit  none

***    Arguments.

      integer   ip

***    Local variables.

      integer   kind, mode
      character string
      real      pr

*------------------------------------------------------------------
      mode = -2

      call  CONVIP1( ip, pr, kind, mode, string,.false. )

      get_ip1_kind = kind

      return
*------------------------------------------------------------------

      end
      subroutine get_ip_string (ip,string)

      implicit none

***    Arguments.

      integer ip
      character*(*) string

***    Local variables.

      integer kind, mode
      real pr

*------------------------------------------------------------------
      entry get_ip1_string (ip,string)

      mode = -2

      call CONVIP1( ip, pr, kind, mode, string,.true. )


      return
*------------------------------------------------------------------

      end
      SUBROUTINE convhour (ip2, dt, mode)

*     IP conversion for units of hours.

      implicit  none

***    Arguments.

      integer   ip2, mode
      real      dt

***    Local variables.

      integer   kind
      character string1 

      logical            info
      common   /zzverbo/ info

*------------------------------------------------------------------

      kind = -1 ; if (mode > 0) kind = 10

      call diag_convip_plus( ip2, dt, kind, mode, string1,.false. )

      
      if (mode < 0)                                            then
          ! Decoding
          if (ip2 < 0 .or. ip2 > 32767)                        then
              ! ip2 in NEW-STYLE coding
              if (kind /= 10)                                  then
                  if (info) write(6,6001) ip2,kind
                  call                             xit('Convhour',-1 )
              end if
          else if (IP2 >= 0)                                   then
              ! OLD-STYLE coding. HOURS coding not explicitely supported
              dt = ip2 ! so we do not use the output of diag_convip_plus
          end if
      end if

      return
*------------------------------------------------------------------

 6001 format(' In convhour: IP2,KIND =',2I10,' is not in hours.')

      end

      
      SUBROUTINE convpr (ip1, pr, kind, mode)

      implicit none

***    Arguments.

      integer ip1, kind, mode
      real pr

***    Local variable.

      character string1 

*------------------------------------------------------------------
      call CONVIP1( ip1, pr, kind, mode, string1,.false. )


      return
*------------------------------------------------------------------

      end
      SUBROUTINE convip1 (IP, P, KINDP, MODE, STRING, FLAG)

      implicit       none

      real           P
      logical        FLAG
      integer        IP, KINDP, MODE
      character *(*) STRING 

      call diag_convip_plus (IP, P, KINDP, MODE, STRING, FLAG)
      if (FLAG) call tasadr( STRING,STRING )

      return
**********************************************************************

      end
      INTEGER FUNCTION getkind ()

      integer  local
      integer           vkind
      common  /zzvkind/ vkind

*------------------------------------------------------------------------------
                       local = vkind
      if (vkind.eq.-1) local = 2

      getkind  = local

      return
*------------------------------------------------------------------------------

      end
      CHARACTER*16 FUNCTION getkindc (kind)

      integer      kind

      character*16 arbitrary,
     +             eta,
     +             height,
     +             heights,
     +             hybrid,
     +             sleve_hybrid,
     +             hybrid_heights,
     +             pressure,
     +             theta,
     +             hours,
     +             integers

      data         arbitrary      / 'ARBITRARY'      /,
     +             eta            / 'ETA'            /,
     +             height         / 'HEIGHT'         /,
     +             heights        / 'HEIGHTS'        /,
     +             hybrid         / 'HYBRID'         /,
     +             sleve_hybrid   / 'SLEVE-HYBRID'   /,
     +             hybrid_heights / 'HYBRID-HEIGHTS' /,
     +             pressure       / 'PRESSURE'       /,
     +             theta          / 'THETA'          /,
     +             hours          / 'HOURS'          /,
     +             integers       / 'INTEGERS'       /
*------------------------------------------------------------------------------

      If (kind.eq.00)                                          Then
          getkindc  = height
      Else
     +If (kind.eq.01  .or.
     +    kind.eq.1001.or.
     +    kind.eq.1002.or.
     +    kind.eq.1003)                                        Then
          getkindc  = eta
      Else
     +If (kind.eq.02  .or.
     +    kind.eq.2001)                                        Then
          getkindc  = pressure
      Else
     +If (kind.eq.03)                                          Then
          getkindc  = arbitrary
      Else
     +If (kind.eq.04)                                          Then
          getkindc  = heights
      Else
     +If (kind.eq.05  .or.
     +    kind.eq.5001.or.
     +    kind.eq.5002.or.
     +    kind.eq.5003.or.
     +    kind.eq.5004.or.
     +    kind.eq.5005.or.
     +    kind.eq.5999)                                        Then
          getkindc  = hybrid
      Else
     +If (kind == 5100)                                        THen
          getkindc = sleve_hybrid
      Else
     +If (kind.eq.06)                                          Then
          getkindc  = theta
      Else
     +If (kind.eq.10)                                          Then
          getkindc  = hours
      Else
     +If (kind.eq.15  .or.
     +    kind.eq.31)                                          Then
          getkindc  = integers
      Else
     +If (kind.eq.21   .or.
     +    kind.eq.21001.or.
     +    kind.eq.21002)                                       Then
          getkindc  = hybrid_heights
      Else
          WRITE(6,6001) kind
          Call                                     Xit('GetkindC',-1 )
      End If

      return
*------------------------------------------------------------------------------

 6001 format(' In getkindc: vertical coordinate =',I2,
     +       ' not recognized.')

      end
      SUBROUTINE setkindi (kind)

      integer   kind

***    Local variables.

      character getyp*4,deftyp*2
      external  getyp

      logical            info
      common   /zzverbo/ info

      integer            vkind
      common   /zzvkind/ vkind

*------------------------------------------------------------------------------
      deftyp = getyp( 0 )
      if (deftyp.ne.'SQ') return

      if (kind.eq.00
     +.or.kind.eq.01 .or. kind.eq.1001  .or. kind.eq.1002
     +               .or. kind.eq.1003
     +.or.kind.eq.02 .or. kind.eq.2001
     +.or.kind.eq.03
     +.or.kind.eq.04
     +.or.kind.eq.05 .or. kind.eq.5001  .or. kind.eq.5002
     +               .or. kind.eq.5003  .or. kind.eq.5004
     +               .or. kind.eq.5005  .or. kind.eq.5100
     +               .or. kind.eq.5999
     +.or.kind.eq.06
     +.or.kind.eq.10
     +.or.kind.eq.15
     +.or.kind.eq.21 .or. kind.eq.21001 .or. kind.eq.21002
     +.or.kind.eq.31)                                          then
         vkind = kind
      else
          if (info) write(6,6001) kind
          call                                     xit(' Setkindi',-1 )
      end if
     
      return
*------------------------------------------------------------------------------

 6001 format(' In setkindi: vertical coordinate =',I2,
     +       ' not recognized.')

      end
      SUBROUTINE setkind (coord)

      implicit          none

      character * ( * ) coord

#     include          "highbuf.cdk"

      logical                    info
      common           /zzverbo/ info

      integer                    vkind
      common           /zzvkind/ vkind

      character*2       deftyp,nom*16

      character*4       getyp
      external          getyp,LOW2UP

      integer           lon
      character*16      arbitraire,arbitrary,
     +                  eta,sigma,
     +                  galchen,
     +                  hauteur,height,
     +                  hauteurs,heights,
     +                  hybride,hauteurs_hybride,
     +                  hybrid,hybrid_heights,
     +                  sleve_hybrid,sleve_hybride,
     +                  pression,pressure,
     +                  theta,
     +                  heures,hours,
     +                  entiers,integers

      data              arbitraire      / 'ARBITRAIRE'      /,
     +                  arbitrary       / 'ARBITRARY'       /,
     +                  eta             / 'ETA'             /,
     +                  sigma           / 'SIGMA'           /,
     +                  galchen         / 'GALCHEN'         /,
     +                  hauteur         / 'HAUTEUR'         /,
     +                  height          / 'HEIGHT'          /,
     +                  hauteurs        / 'HAUTEURS'        /,
     +                  heights         / 'HEIGHTS'         /,
     +                  hybrid          / 'HYBRID'          /,
     +                  hybride         / 'HYBRIDE'         /,
     +                  sleve_hybrid    / 'SLEVE-HYBRID'    /,
     +                  sleve_hybride   / 'SLEVE-HYBRIDE'   /,
     +                  hauteurs_hybride/ 'HAUTEURS-HYBRIDE'/,
     +                  hybrid_heights  / 'HYBRID-HEIGHTS'  /,
     +                  pression        / 'PRESSION'        /,
     +                  pressure        / 'PRESSURE'        /,
     +                  theta           / 'THETA'           /,
     +                  heures          / 'HEURES'          /,
     +                  hours           / 'HOURS'           /,
     +                  entiers         / 'ENTIERS'         /,
     +                  integers        / 'INTEGERS'        / 

*------------------------------------------------------------------------------

      deftyp = getyp( 0 )
      if (deftyp.ne.'SQ') return

      nom = coord
      call LOW2UP( nom,nom )

      lon = len_trim( nom )

      if (lon.lt.3)                                            then
          if (info) write(6,6001) nom
          call                                     xit(' Setkind',-1 )
      end if

      if      (index( hauteur         ,nom(1:lon) ).eq.1
     +   .OR.  index( height          ,nom(1:lon) ).eq.1)      then
                                                        vkind = 0
      else if (index( eta             ,nom(1:lon) ).eq.1
     +   .OR.  index( sigma           ,nom(1:lon) ).eq.1)      then
                                                        vkind = 1
      else if (index( pression        ,nom(1:lon) ).eq.1
     +   .OR.  index( pressure        ,nom(1:lon) ).eq.1)      then
                                                        vkind = 2
      else if (index( arbitraire      ,nom(1:lon) ).eq.1
     +   .OR.  index( arbitrary       ,nom(1:lon) ).eq.1)      then
                                                        vkind = 3
      else if (index( hauteurs        ,nom(1:lon) ).eq.1
     +   .OR.  index( heights         ,nom(1:lon) ).eq.1)      then
                                                        vkind = 4
      else if (index( hybrid          ,nom(1:lon) ).eq.1
     +   .OR.  index( hybride         ,nom(1:lon) ).eq.1
     +   .OR.  index( sleve_hybrid    ,nom(1:lon) ).eq.1
     +   .OR.  index( sleve_hybride   ,nom(1:lon) ).eq.1)      then
                                                        vkind = 5
      else if (index( theta           ,nom(1:lon) ).eq.1)      then
                                                        vkind = 6
      else if (index( heures          ,nom(1:lon) ).eq.1
     +   .OR.  index( hours           ,nom(1:lon) ).eq.1)      then
                                                        vkind = 10
      else if (index( entiers         ,nom(1:lon) ).eq.1
     +   .OR.  index( integers        ,nom(1:lon) ).eq.1)      then
                                                        vkind = 15
      else if (index( galchen         ,nom(1:lon) ).eq.1
     +   .OR.  index( hybrid_heights  ,nom(1:lon) ).eq.1
     +   .OR.  index( hauteurs_hybride,nom(1:lon) ).eq.1)      then
                                                        vkind = 21
      else
          if (info) write(6,6001) nom
          call                                     xit(' Setkind',-1 )
      end if

      highip1 = .false.

      return

*------------------------------------------------------------------------------

 6001 format(' In setkind: vertical coordinate =',A,' not recognized.')

      end
      INTEGER function chklvlc (ip1)

      implicit    none

      integer     ip1

***    Author: B Dugas - RPN, Feb 1998

***    This routine checks for the RPN coding convention used to 
***    input pressure level information above 10 mb with respect
***    to that of CCCMA. The routine is used with input streams.

***    Note that it will only do this when working with RPN files.
***    As of now, it will abort if it receives a height coordinate.

      integer     lev(1),kind
      real        pres(1)

      logical              info
      common     /zzverbo/ info

      character*4 getyp,pktyp
      external    getyp,convpr

**********************************************************************
      PKTYP = GETYP( 0 )
      PKTYP = PKTYP(1:2)
      
      if (pktyp  .eq.'SQ' .and.
     +   (     0 .le. ip1 .or.
     +   (-10000 .le. ip1 .and. ip1 .lt. -99 )))               then 

          if (ip1.eq.32767)                                    then
              chklvlc = 0
              return
          end if

          call convpr( ip1, pres(1), kind,-2 )

          if (kind.eq.0 .or.
     +        kind.eq.3 .or.
     +        kind.eq.4 .or.
     +        kind.eq.6 .or.
     +        kind.eq.21)                                      then
              lev = nint( pres )
              if (lev(1).lt.0)                                 then
                  if (info) write(6,6001) ip1
                  call                             xit('  chklvlc',-1 )
              end if
          end if

          call convpr( chklvlc, pres(1), kind,+2 )

      else

***        Bypass CCC upper-level coding convention.

          chklvlc = ip1

      end if

      return
**********************************************************************

 6001 format(' In chklvlc: illegal (negative) height value =',I12)

      end
      subroutine monvert( coord,nlev, top,bot,inc, monoton )

      implicit  none

***    Description...
***    Cette routine determine si le vecteur coord est
***    croissant ou decroissant, et ce de facon monotone.

***    Auteur...
***    Bernard Dugas, septembre 1998

      integer   nlev,top,bot,inc,l
      logical   monoton,increas
      real      coord(nlev)

      logical              info
      common     /zzverbo/ info

*------------------------------------------------------------------------------
      monoton = .FALSE.

      If (nlev    .lt.      2)                                 Then
          top = 1 ; bot = 1
          inc = 1 ; monoton = .TRUE.
          return
      Else
     +If (coord(1).lt.coord(2))                                Then
          increas = .TRUE.
      Else
     +If (coord(1).gt.coord(2))                                Then
          increas = .FALSE.
      Else
          RETURN
      End If

      Do  l=3,nlev
          If ((     increas .And. (coord(l).Le.coord(l-1)) )
     +   .Or. (.Not.increas .And. (coord(l).Ge.coord(l-1)) ))  Then 

              If (info)                                        Then
                  If (increas)                                 Then
                      write(6,6001) l,l-1,coord(l),coord(l-1)
                  Else
                      write(6,6002) l,l-1,coord(l),coord(l-1)
                  End If
              End If

              RETURN

          End If
      End Do

      monoton = .TRUE.

      If (increas)                                             Then
          top =  1
          bot =  nlev
          inc =  1
      Else
          top =  nlev
          bot =  1
          inc = -1
      End If

      Return
*------------------------------------------------------------------------------

 6001 Format('In monvert: COORD(1) < COORD(2) but COORD(',I3.3,')',
     +       ' and COORD(',I3.3,') are equal to ',2E15.7/)
 6002 Format('In monvert: COORD(1) > COORD(2) but COORD(',I3.3,')',
     +       ' and COORD(',I3.3,') are equal to ',2E15.7/)

      End
      subroutine genab( pia, pib, eta,
     +                  ptop,pref,coef, nk )

      implicit none

***    author s gravel  - rpn - nov 1998

***    revision
***     v1_03 - s edouard    -  correction d'une erreur ds la def de PIB
***     v2_2x - b dugas      -  adaptation pour R.DIAG

***    language: fortran 77

***    object(genab)
***     Using Laprise & Girard, generates de A and B of the GEM hybrid
***     coordinate. see: Laprise & Girard, 1990, J. of Climate, eq. 5.1

***    arguments

      integer nk
      real    pia(nk), pib(nk), eta(nk), ptop,pref,coef

***    local variables

      integer k
      real    etatop,pr1

***    BEWARE
***     if coef is greater than 1., pref is subject
***     to restriction for stability reasons.

*------------------------------------------------------------------------------
      etatop = ptop/pref
      pr1    = 1./(1. - etatop)

      do  k = 1,nk
          pib(k)  = ( ( eta(k) - etatop ) * pr1 ) ** coef
          pia(k)  = pref * ( eta(k) - pib(k) )
      enddo
*
      return
*------------------------------------------------------------------------------

      end
      subroutine GEM23_SANITY_CHECK( coord, etatop,pref,ptoit )

      IMPLICIT NONE

      CHARACTER(LEN=4) coord
      REAL etatop,pref,ptoit

      real ll
*------------------------------------------------------------------------------

      IF (PTOIT > 0. .and.
     +   (COORD == 'GEM2' .OR. COORD == 'GEM3'))               THEN

***        GEM2/GEM3 COORDINATE SANITY CHECKS.
 
          ll = (ETATOP*PREF - PTOIT) / PTOIT

          ! Check for ETATOP = PTOIT/PREF
          IF (COORD == 'GEM3' .AND. ABS( ll ) < 0.001)         THEN
              COORD = 'GEM2' ! Found actual denormalized top value
              WRITE(6,'(/A/)') " *** Correcting: GEM3 ==> GEM2 ...***"
          END IF

          ! Check for ETATOP < PTOIT/PREF
          IF (COORD == 'GEM2' .AND. ll < -0.001)               THEN
              COORD = 'GEM3' ! Found value smaller than denormalized top
              WRITE(6,'(/A/)') " *** Correcting: GEM2 ==> GEM3 ... ***"
          END IF

      END IF

      RETURN

*------------------------------------------------------------------------------
      END

      BLOCK DATA DATA_COORD

*     Initialise variables of COORD's COMMONs that need to be.

      integer    vkind
      common  /zzvkind/ vkind

      data       vkind/ -1 /

      END BLOCK DATA DATA_COORD
