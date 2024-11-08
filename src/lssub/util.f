#     if !defined (unite_io_maximale)
#         define   unite_io_maximale 99
#     endif

C     $Log: util.ftn,v $
C     Revision 3.129  2020/02/26 15:15  dugas
C     Ajouter le point d'entree PUTVERB et modifier
C     le point d'entree GETVERB dans JCLPNT
C     
C     Revision 3.128  2019/12/03 17:17  dugas
C     Ajouter l'argument general '-h' (equivalent a '-help')
C
C     Revision 3.127  2019/04/15 07:08  dugas
C     Corriger l'indice initial de la premiere boucle de QQQDOC
C
C     Revision 3.126  2018/11/17 22:20  dugas
C     Ajouter le traitement de la variable FREE_FORMAT_LEVEL_IO
C
C     Revision 3.125  2018/02/20 10:10:10  dugas
C     Ajouter deux messages informatifs dans QQQDOC
C
C     Revision 3.124  2018/01/28 15:15:15  dugas
C     - Ajouter l'argument general '-version'
C     - Tenir compte des valeurs optionelles 'ALL',
C       'DAT' et 'REV' de l'argument general '-vers'
C
C     Revision 3.123  2018/01/18 14:14:14  dugas
c     Ajouter l'option DTM=4 dans SET_DTM
c
C     Revision 3.122  2016/10/26 15:15:24  dugas
C     - Explicitement desactiver tous les types de donnees
C       manquantes dans JCLPNT lorsque MValue est faux
C     - Ajouter appel a CLOZREF dans XIT
C     - Modifications syntaxiques F77 --> F90
C
C     Revision 3.121  2015/02/13 20:21:04  dugas
C     Mise-a-jour syntaxique F90 de QQQDOC.
C
C     Revision 3.120  2014/12/09 20:10:22  dugas
C     Arret (-98) pour cause config compilation non supportee.
C
C     Revision 3.119  2014/12/08 22:03:38  dugas
C     Deplacer CHKENDI, ME32O64 et INTEFLT vres util2.F90.
C
C     Revision 3.118  2014/12/04 03:02:40  dugas
C     Correction a ME32O64.
C
C     Revision 3.116  2014/09/25 18:42:04  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.115  2014/07/08 19:33:56  dugas
C      - Modifier le point d'entree UNSET_MISPAR pour le rendre inactif
C        lorsque la variable Mvalue_Read est definie a TRUE, i.e. l'argument
C        de ligne de commande -mvalue a ete invoque a l'appel avec une valeur
C
C     Revision 3.114  2014/02/12 22:18:12  dugas
C      - Ajouter la fonction logique IDNAN qui determine si une
C        variable a pour valeur NaN. Fonctionne pour des nombres
C        reels a 32 et 64 bits.
C      - Tenir compte de NOABORT (-na) dans InfNaN/InfNaN2.
C      - Corriger l'indice du debut de la seconde
C        boucle DO dans CNFNN8 et PNFNN8.
C
C     Revision 3.113  2013/12/11 22:16:28  dugas
C     Corriger le calcul de DATE8 lorsque le DCF=0 dans STAMP2DATE.
C
C     Revision 3.112  2013/12/10 22:10:50  dugas
C     Assurer la coherence entre Y2KDAT8 et STAMP2DATE lorsque DATE_CONVERSION_FACTOR=0.
C
C     Revision 3.111  2013/11/28 21:29:41  dugas
C      - Ajouter la variable logique SAUVU au common OUICEST.
C      - Tenir compte de SAUVU dans XIT pour faire un appel a WRITUREF.
C
C     Revision 3.110  2013/10/08 01:23:42  bernard
C      - Lorsque MValue_IS_OFF=T, faires deux appels a la routine
C        SET_MISSING_VALUE_MAPPING (pour les type REAL et REAL*8)
C        dans JCLPNT
C      - Y ajouter le point d'entree GET_INFOMOD qui retourne le
C        status de la variable logique ZZVERBO.
C      - Supporter la variable d'environnement DIAGNOSTIQUE en plus
C        de ARMNLIB dans QQQDOC (position documentation automatique)
C      - La fonction TASADR devient une sous-routine pour laquelle
C        la chaine d'entree peut etre plus longue que 4 caracteres.
C
C     Revision 3.109  2013/08/22 18:59:23  bernard
C      - Corriger l'initialisation de Vrai, Faux et MSGLVL dans JCLPNT
C      - Considerer la variable d'environnement $DIAGNOSTIQUE dans QQQDOC
C        en plus de $ARMNLIB pour la localisation possible  de man/pdoc
C
C     Revision 3.108  2013/07/17 21:04:41  bernard
C      - Ajouter le traitement automatise des valeurs manquantes pour fichiers CMC/RPN.
C        Le parametre de ligne de commande "-mvalue OFF" desactive ce mode. La valeur
C        ON de ce parametre force l'usage de valeurs de remplacements definis
C        par defaut.
C
C     Revision 3.107  2013/03/21 20:48:59  bernard
C     Corriger un commentaire dans la routine XIT.
C
C     Revision 3.106  2013/02/07 21:40:02  bernard
C     Modifications pour GFORTRAN.
C
C     Revision 3.105  2012/05/17 18:04:17  dugas
C     Verifier la variable d'environnement 'LEAP_YEAR_CONTROL' avant -bisect dans jclpnt
C
C     Revision 3.104  2011/11/22 19:12:28  dugas
C     Simplifier les calculs de usert,totalt dans XIT.
C
C     Revision 3.103  2011/06/06 19:49:48  dugas
C     - Les parametres a 512 octets, les cles a 16 octets dans JCLPNT.
C     - Noms de fichiers a 512 caracteres max. dans BURNF,XIT,QUIT,QQQDOC.
C     - Ajouter l'argument global -CENDIAN et le point d'entree GET_CENDIAN.
C       Les valeurs connues sont "BIG' et 'SMALL'. Voir RECPK2/REUP2.
C
C     Revision 3.102  2011/01/13 19:09:20  dugas
C     Corriger les definitions de DATE_CONVERSION_FACTOR dans SET_DTM.
C
C     Revision 3.101  2010/10/23 16:21:22  dugas
C     Forcer le traitement en vieux format si DATE_CONVERSION_FACTOR <= 1 dans DATE2STAMP.
C
C     Revision 3.100  2010/03/19 18:28:14  dugas
C     Ajouter l'option globale -BISECT pour le traitement
C     optionnel des annees bisecstyles (par defaut=actif).
C
C     Revision 3.99  2010/02/22 19:34:39  dugas
C     Imposer une limite inferieure a DATE8 dans DATE2STAMP.
C
C     Revision 3.98  2010/02/12 22:29:47  dugas
C      1) Appels a EcrToc dans XIT.
C      2) On supporte le traitement transparent des enregistrements
C         TocToc (!!) dans les routines PRECEDE et SUIVANT.
C      3) Enfin, dans JCLPNT
C         - Ajouter DATE_FORMAT et supprimer le traitement de KEEPDATEV.
C         - Correction a la procedure d'ouverture de vieux fichier FORTRAN
C           binaires ou formattes.
C         - Nouveaux points d'entrees: DATE2STAMP,STAMP2DATE et
C           SET_DTM,GET_DCF,SET_DCF.
C
C     Revision 3.97  2009/09/08 18:57:08  dugas
C     Verifier avec WKOFFIT les fichiers I/O formattes dans JCLPNT.
C
C     Revision 3.96  2009/01/23 22:42:44  dugas
C     Modifier MESSYS pour les compilateurs FORTRAN Intel.
C
C     Revision 3.95  2008/11/24 21:36:14  dugas
C     - Ajouter le support de la variable d'environnement "PRESERVE_DATEV".
C       Le common /ZZZDATE/ contient maintenant  une nouvelle variable,
C       KEEPDATEV, qui est utilisee pour transmettre ce signal a PARFILL.
C     - Utiliser systematiquement IS_ON et IS_OFF pour les comparaisons
C       logiques du type OUI/NON, vrai/faux, etc.
C     - Corriger un appel a OUVSTD dans JCLPNT.
C     - Corriger le point d'entree UNSET_MISPAR.
C     - Corriger la definition de la variable MULT dans ROWORD.
C
C     Revision 3.94  2008/07/24 19:40:47  dugas
C     - Enlever les modifs INTENT(IN)/OPTIONAL/PRESENT introduites a la version 3.91.
C     - Ajouter les points d'entree SET_MISPAR et UNSET_MISPAR a JCLPNT.
C     - Remplacer CALCEPS par CALCEPS8 (calculs en REAL*8).
C
C     Revision 3.93  2008/05/13 16:46:20  dugas
C     Les focntions IS_ON/IS_OFF ne modifient plus leur argument d'entree.
C
C     Revision 3.92  2008/04/28 21:38:53  dugas
C     Corriger l'usage des macros pour r.gppf (passe 2).
C
C     Revision 3.91  2008/04/25 21:03:10  dugas
C     - Corriger l'usage des macros pour r.gppf.
C     - Ne plus tenir compte du cas non-SQ98.
C     - Utiliser les concepts F90 INTENT(IN)/OPTIONAL/PRESENT
C       dans JCLPNT pour le traitement des # I/O.
C
C     Revision 3.90  2008/02/18 16:25:19  dugas
C     Initialiser DEFNAM a ' ' dans JCLPNT.
C
C     Revision 3.89  2007/08/29 21:17:19  dugas
C     - Deplacer RPBLOC et le traitement des cles locales vers LIRE_ARG.ftn.
C     - Appel a PROGRAM_VERSION plutot qu'a RDIAG_VERSION dans JCLPNT.
C     - L'appel a CCARD de JCLPNT est maintenant pris en charge par LIRE_ARG.
C     - Utiliser la variable DEF_PKTYP initialisee par LIRE_ARG pour definir PKTYP(0).
C     - Usage generalise de TRIM plutot que de la fonction INDEX lors des impressions.
C     - Les nom de fichiers sont maintenant sauves dans la permanente DEFNAM.
C     - Les noms passes a QUIT et XIT sont en *(*) plutot que *8.
C     - L'appel a LirePT se fait uniquement pour les fichier SQ* dans XIT.
C
C     Revision 3.88  2007/03/14 17:57:41  dugas
C     Utiliser la routine F90 SYSTEM_CLOCK pour definir le temps 'WALL'.
C
C     Revision 3.87  2006/10/19 22:53:38  dugas
C     Corriger l'initialisation de la variable mult dans ROWORD.
C
C     Revision 3.86  2006/09/19 18:23:32  dugas
C     - Initialiser ZTYPE=' ' dans JCLPNT.
C     - Tenir compte de ZTYPE lors de l'appel a FSTINFX dans PRECEDE et SUIVANT.
C
C     Revision 3.85  2006/07/13 21:32:51  dugas
C     Corriger la sequence d'appel a XDFOPT dans JCLPNT.
C
C     Revision 3.84  2006/07/04 16:52:18  dugas
C     - Ajouter le support des valeurs manquantes par le biais du
C       parametre "-mvalue" ou de la variable d'environnement
C       "MISSING_VALUE". La seconde a preseance sur le premier.
C     - Ajouter un point d'entree MISPAR pour passer cette information
C       aux autres routines/modules principaux.
C     - Ajouter un marqueur d'ecriture d'enregistrements # dans
C       le COMMON OUICEST. Ceci est utilise dans JCLPNT et XIT.
C
C     Revision 3.83  2006/03/13 22:08:49  dugas
C     Ajouter le support des fichiers FORTRAN binaires sequentiels (autres que
C      PK84 ou PK92) dans JCLPNT. Ajouter la routine SETFTNB pour definir cet
C      attribut avant l'appel a JCLPNT pour que celle-ci puisse ouvrir
C      correctement ces fichiers.
C
C     Revision 3.82  2006/02/09 18:18:45  dugas
C     - Augmenter le nombre de certains parametres: NAME + 6 (a 10) et KIND +2 (a 5).
C     - Nouveau code d'erreur 14 dans JCLPNT (numero I/O trop grand).
C     - Meilleur traitement des numeros d'unitees I/O.
C
C     Revision 3.81  2005/12/12 22:50:10  dugas
C     - Ajouter les messages informatifs de XDF (XDFOPT) avec mode -info.
C     - Corriger les appels a FSTOPC dans JCLPNT.
C
C     Revision 3.80  2005/07/28 17:27:13  dugas
C     Ajouter "BLOCK DATA DATA_UTIL", pour des raisons de conformite avec F90.
C
C     Revision 3.79  2005/05/06 18:36:48  dugas
C     Changements cosmetiques a RPBLOC.
C
C     Revision 3.78  2005/04/14 16:39:44  dugas
C     Re-ecriture de la fonction RPBLOC, utilisant NOMLOC.
C
C     Revision 3.77  2005/04/12 16:49:18  dugas
C     Tenter de lire l'enregistrement HY sur les fichiers d'entrees ouverts
C      si on doit l'ecrire dans XIT (mais ceci en mode SQ98 seulement).
C
C     Revision 3.76  2005/03/07 17:29:51  dugas
C     Ajouter KIND3, PLV3 et LV13 dans JCLPNT et RPBLOC.
C
C     Revision 3.75  2004/12/10 00:46:03  dugas
C     Modifier le COMMON DEXIT utilise dans JCLPNT et QUIT.
C
C     Revision 3.74  2004/11/12 19:16:21  dugas
C     Modifier l'appel a RDIAG_VERSION dans JCLPNT.
C
C     Revision 3.73  2004/11/10 19:05:51  dugas
C     Corriger deux messages d'erreurs de XIT.
C
C     Revision 3.72  2004/11/08 21:12:06  dugas
C     Ajouter du code DEBUG (OLDNAM) et initialiser MAXSWRD dans JCLPNT.
C
C     Revision 3.71  2004/09/13 17:24:55  dugas
C     Ajouter les points d'entrees GETPOSIT/PUTPOSIT dans LCLPNT.
C
C     Revision 3.70  2003/10/24 21:05:48  dugas
C     Implementer du code compatible RS6000
C
C     Revision 3.69  2003/07/04 01:19:42  dugas
C     Ajouter les routines GETRABT/SETRABT pour le traitement de RECABT.
C     Utiliser GETRABT/SETRABT dans MACSPE.
C
C     Revision 3.68  2003/05/23 19:20:59  dugas
C     Remplacer le dernier argumment des ISHFT qui se trouvent dans
C      les routines CNFNM8 et PNFNM8 (valant 52 ou 20, selon le cas)
C      par des variables qui ont les memes valeurs. Ceci pour eviter
C      un probleme de compilations sous F90 (IRIX R14000).
C     Ajouter les fonctions DISMAX8 et DISMIN8, qui sont appellees
C      par DISMAX et DISMIN (ISM).
C
C     Revision 3.67  2002/12/06 16:27:33  dugas
C     Modifications a CALCEPS, surtout pour des donnees REAL*8
C
C     Revision 3.66  2002/08/20 19:04:59  dugas
C     Ajouter la cle -keepip2 dans JCLPNT et modifier le common ZZZDATE
C
C     Revision 3.65  2002/04/22 15:49:57  dugas
C     Activer le code E64 dans JCLPNT
C
C     Revision 3.64  2002/01/14 13:57:06  dugas
C     Ajouter le support des enregistrements 'HY' dans PRECEDE, SUIVANT et XIT.
C
C     Revision 3.63  2001/11/28 15:58:23  dugas
C     Remplacer les .doc par des .txt dans QQQDOC
C
C     Revision 3.62  2001/10/09 18:01:01  armnrbd
C     Le nombre maximal d'unites d'I/O passe de 49 a 80 dans JCLPNT.
C
C     Revision 3.61  2001/05/01 15:54:19  armnrbd
C     ROWORDS devient un point d'entree de la routine ROWORD.
C     Cette dernier ne travaille que sur des entier et le
C     second argument (i.e. tampon) n'est plus utilise.
C
C     Revision 3.60  2001/03/13 22:38:27  armnrbd
C     Ajouter un message informatif dans JCLPNT lorsque
C     NF+1.LT.IPOS (a la sortie de CCARD). Ceci se produit
C     si le nombre de numero d'unite est inferieur au
C     nombre de fichiers mentionnes sur la ligne de
C     commande.
C
C     Revision 3.59  2001/02/27 00:11:34  armnrbd
C     Remplacer les appels a PERROR par des appels a MESSYS.
C
C     Revision 3.58  2001/02/26 22:48:48  armnrbd
C     Ajouter la routine PERROR (qui appelle GERROR).
C
C     Revision 3.57  2001/02/13 20:42:07  armnrbd
C     Ajouter le support de la variable d'environnement USE_OLD_STYLE_IP1.
C     Utiliser fnom pour ouvrir le fichier sequentiel caracteres dans JCLPNT.
C     Ajouter un message DEBUG concernant SKIPRENV dans PRECEDE.
C     Toujours faire un CLESUI apres une lecture FST dans SUIVANT.
C
C     Revision 3.56  2001/01/19 00:25:05  armnrbd
C     Ajouter des messages "DEBUG" dans SUIVANT.
C     Ne plus eviter les enregistrements >> et ^^
C     dans SUIVANT avec les fichiers de type CCC.
C
C     Revision 3.55  2000/11/24 12:46:32  armnrbd
C     Enlever la definition par defaut du macro taille_entete.
C     Ajouter le point d'entree EQVNOMT et modifier la
C     construction de la table d'equivalence des noms.
C
C     Revision 3.54  2000/09/28 15:48:43  armnrbd
C     Modifier les sequences d'appel a GETIO64.
C
C     Revision 3.53  2000/08/29 13:11:21  armnrbd
C     Modifier CALCEPS pour tenir compte de la taille
C     maximale des mantisses pour les nombres IEEE-754.
C
C     Revision 3.52  2000/07/27 18:31:24  armnrbd
C     Deplacer la definition de ZZZJCL dans JCLPNT.
C
C     Revision 3.51  2000/07/24 23:24:35  armnrbd
C     Corriger la derniere modif...
C
C     Revision 3.50  2000/07/24 20:34:50  armnrbd
C     Ajouter la routine EQVNOM et le point d'entree ININEQ.
C     Re-activer la cle "-ipktyp" comme valeur principale (overide).
C     Verifier que JCLPNT a ete appele avant tous ses points d'entree.
C
C     Revision 3.49  1900/05/30 17:02:57  armnrbd
C     Ajouter la routine MOV832 (d'apres le MOVE832 de rmnlib).
C
C     Revision 3.48  2000/04/04 16:45:09  armnrbd
C     Modifier la definition de ZZZDATE dans JCLPNT et Y2KDAT.
C     Tenir compte de f90 pour le positionnement des fichiers
C     sequentiels (mode APPEND) dans JCLPNT.
C
C     Revision 3.47  1999/11/10 21:03:26  armnrbd
C     Correctement initialiser VALUE dans RPBLOC.
C
C     Revision 3.46  1999/07/23 15:26:18  armnrbd
C     Deplacer la cle NA vers le groupe generique dans JCLPNT et
C     ajouter quatre autres cles a etre definies plutard. La valeur
C     de NA est maintenant conservee dans le common ZZABORT.
C
C     Revision 3.45  1999/06/23 20:56:57  armnrbd
C     Ajouter la routine WRDSWP et les six routines qui
C     peuvent etre utilisees pour chercher les NaNs.
C
C     Revision 3.44  1999/06/09 23:20:25  armnrbd
C     Initialiser LIRZXT dans JCLPNT.
C     Modifier PRECEDE pour les enregistrements '++'.
C
C     Revision 3.43  1999/05/14 20:50:27  armnrbd
C     Ajouter le point entree GETMPN dans JCLPNT.
C
C     Revision 3.42  1999/05/12 14:33:37  armnrbd
C     Ajouter les variables BIG_TMPDIR et USE_BIG_TMPDIR.
C
C     Revision 3.41  1999/04/13 15:45:47  armnrbd
C     Enlever une patch LINUX dans JCLPNT (concernant WKOFFIT).
C
C     Revision 3.40  1999/04/08 20:01:31  armnrbd
C     Utiliser le comdeck MACHTYPE.CDK.
C     Definir BIGENDI avec la fonction CHKENDI.
C     Ajouter les routines CHKENDI et SWAPA4.
C     Ajouter des valeurs multiples aux parametres
C     d'entrees I,J,K,L,M,N et LABEL (code RPBLOC).
C
C     Revision 3.39  1999/01/19 20:08:18  armnrbd
C     Renommer ABORT en DABORT (conflit avec la version systeme).
C
C     Revision 3.38  1998/11/09  20:36:07  armnrbd
C     Ajouter la cle generique "-vers".
C
C     Revision 3.37  1998/10/06  20:34:07  armnrbd
C     Ajouter la fonction entiere Y2KDAT.
C
C     Revision 3.36  1998/07/23  19:42:50  armnrbd
C     Ne pas appeller Mp_Set_NumThreads si NPs est <= 1.
C
C     Revision 3.35  1998/07/23  03:27:47  armnrbd
C     Transferer ROWORD de CONVERT et ajouter ROWORDS.
C
C     Revision 3.34  1998/06/26  17:16:37  armnrbd
C     Retourner avec OK=faux si FSTINF genere une erreur dans SUIVANT.
C
C     Revision 3.33  1998/06/10  21:24:24  armnrbd
C     Ajouter les routines TIMEDC et TDIGITS (etaient dans DIFTIM).
C
C     Revision 3.32  1998/06/08  03:27:42  armnrbd
C     Corriger le traitements de ++ pour les fichiers
C      standards RPN dans PRECEDE et SUIVANT.
C
C     Revision 3.31  1998/05/28  19:11:04  armnrbd
C     Tout arreter si INTSIZE n'est pas egal a un dans JCLPNT.
C
C     Revision 3.30  1998/05/06  17:48:16  armnrbd
C     Corriger le format du message d'erreur -1 de WRITEF.
C     Corriger le fomat du message d'erreur de SKIPREC.
C
C     Revision 3.29  1998/04/08  13:40:10  armnrbd
C     Modifier la sequence d'appel a OUVSTD dans JCLPNT.
C     Rendre l'appel a FSTRWD conditionel dans la routine PRECEDE.
C
C     Revision 3.28  1998/02/19  17:34:59  armnrbd
C     Passer de SQ97 a SQ98.
C
C     Revision 3.27  1998/02/18  15:20:46  armnrbd
C     Modifier le contenu du common OUICEST pour les grilles Y.
C
C     Revision 3.26  1998/01/21  16:03:00  armnrbd
C     Ajouter le point d'entree TYPSET dans JCLPNT.
C
C     Revision 3.25  1997/10/10  20:13:46  armnrbd
C     Modifier les modes INFO et DEBUG.
C     Faire la distinction entre la longueur du tampon I/O et
C       ce qu'il faut vraiment lire sur disque.
C
C     Revision 3.24  1997/09/04  18:45:37  armnrbd
C     Corriger le traitement de la cle OPKTYP dans JCLPNT.
C
C     Revision 3.23  1997/07/25  21:36:08  armnrbd
C     Modifier QUIT pour que les message informatifs soient imprimes.
C
C     Revision 3.22  1997/06/02  16:39:08  armnrbd
C     Ajouter la routine SPWCON7.
C     Appeller la routine SPWCON7 dans JCLPNT.
C
C     Revision 3.22  1997/06/02  14:30:29  armnrbd
C     Ajouter la routine SPWCON7.
C     Ajouter un appel a SPWCON7 dans JCLPNT.
C
C     Revision 3.21  1997/05/27  18:53:19  armnrbd
C     Premiere version compatible avec les fichiers standards 1997.
C
C     Revision 3.20  1997/04/10  14:04:17  armnrbd
C     Ajouter le support des grilles de type 'Z'. Les routines
C     SUIVANT, PRECEDE, JCLPNT et XIT on ete modifiees.
C
C     Revision 3.19  1997/03/12  14:37:07  armnrbd
C     Corriger les formats 6000 et 6100 de JCLPNT.
C
C     Revision 3.18  97/02/24  18:22:09  18:22:09  armnrbd (Bernard Dugas)
C     Modifier la convention de non-minusculisation JCLPNT.
C     Tenir compte de fichiers existants de longeur nulle pour OPEN.
C     
C     Revision 3.17  1997/02/20  11:37:06  armnrbd
C     Demander a WKOFFIT de ne jamais minusculiser dans JCLPNT.
C     Simplifier le calcul de LENNAM dans cette meme routine et
C     modifier les formats de sortie qui utilisaient cette variable.
C
C     Revision 3.16  1997/02/17  03:52:55  armnrbd
C     Ajouter le mode I/O 64 bits dans JCLPNT et EPSCAL.
C     Ajouter les fonctions logiques GETIO64 et SETIO64.
C     Ajouter le point d'entree GETVERB dans JCLPNT.
C     Modifier l'ecriture de la ligne de commande dans JCLPNT.
C
C     Revision 3.15  1996/12/10  18:17:21  armnrbd
C     Remplacer IOPEN par ZZZOPEN.
C
C     Revision 3.14  1996/09/11  01:42:24  armnrbd
C     Supporter un eventail plus large d'EOF dans BURNF.
C
C     Revision 3.13  1996/02/22  03:46:04  armnrbd
C     Ajouter l'option SINGLZ pour forcer la sortie des champs
C     de type zonaux dans des enregistrements a un seul niveau.
C
C     Revision 3.12  1996/02/01  22:00:39  armnrbd
C     Augmenter le nombre d'unite I/O a 49 dans JCLPNT.
C     Utiliser la meme methode que E. Chan pour cela.
C
C     Revision 3.11  1996/01/04  15:13:25  armnrbd
C     Corriger une declaration de CALCEPS.
C
C     Revision 3.10  1996/01/03  20:29:05  armnrbd
C     Modifier la sequence d'appel de la fonction CALCEPS.
C
C     Revision 3.9  1995/12/20  20:00:56  armnrbd
C     Ajouter la fonction CALCEPS.
C
C     Revision 3.8  1995/11/27  17:29:57  armnrbd
C     Modifier le traitement de la re-direction d'input utilisant
C     la cle '-INPUT' pour ne plus vider le fichier a la sortie.
C
C     Revision 3.7  1995/11/22  02:26:47  armnrbd
C     Ajouter le point d'entree GETSTAT dans la routine JCLPNT.
C
C     Revision 3.6  1995/11/13  17:36:06  armnrbd
C     Ajouter le point d'entree GETSTAT dans JCLPNT.
C
C     Revision 3.5  1995/06/13  14:58:06  armnrbd
C     Initialiser DEET et DATEO pour les fichiers SQI.
C
C     Revision 3.4  1995/04/06  14:29:24  armnrbd
C     Modifier PROCEDE dans le cas de fichiers SQIs.
C
C     Revision 3.3  1995/03/23  22:57:34  armnrbd
C     Modifier la procedure d'extraction du nom dans QQQDOC.
C
C     Revision 3.2  1995/01/23  10:56:58  armnrbd
C     Ajouter la cle DATE pour activer un mode DATE pour fichiers SQI.
C
C     Revision 3.1  94/11/17  14:14:12  14:14:12  armnrbd (Bernard Dugas)
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:56:17  13:56:17  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.10  94/09/20  09:33:51  armnrbd
C     Ajouter la cle "-na" aux parametres RPBLOC.
C     
C     Revision 2.9  94/06/17  15:11:59  armnrbd
C     Ne pas retourner le tampon IBUF dans le cas
C     d'enregistrements '++' dans la routine SUIVANT.
C     
C     Revision 2.8  94/06/16  15:56:16  armnrbd
C     Ajouter le point d'entree GETNAM dans JCLPNT.
C     
C     Revision 2.7  94/05/31  08:49:44  armnrbd
C     De-doubler les cles RPBLOC suivantes:
C      LON,LAT,NPL,LV1,KIND et NPG.
C     
C     Revision 2.6  94/05/24  15:05:02  armnrbd
C     Ajouter 5 valeurs possibles a T1,T2,T3 pour RPBLOC.
C     
C     Revision 2.5  94/02/18  21:34:07  armnrbd
C     Ignorer ++ dans la routine SUIVANT.
C     
C     Revision 2.4  94/02/16  13:52:30  armnrbd
C     Definir un defaut secondaire pour les cles -lon et -lat.
C     
C     Revision 2.3  94/01/12  09:56:55  armnrbd
C     Ajouter les routines QUIT et IS_ON.
C     
C     Revision 2.2  93/12/16  12:49:09  12:49:09  armnrbd (Bernard Dugas)
C     Modifier le traitement du mode "ECHO_JCL_COMMAND"
C     Modifier les messages d'erreurs.
C     
C     Revision 2.1  93/10/26  10:31:07  10:31:07  armnrbd (Bernard Dugas)
C     Implanter le support de la variable DEBUG_MODE.
C     
C     Revision 2.0  93/10/13  13:32:17  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.31  93/06/30  12:45:10  armnrbd
C     Ajouter JOB au message d'erreur de la routine XIT.
C     
C     Revision 1.30  93/06/29  15:32:09  armnrbd
C     Implanter le mechanisme de sortie utilisant DIAGNOSTIC_EXIT.
C     
C     Revision 1.29  93/06/25  16:36:47  armnrbd
C     Correction a la modification prededente.
C     
C     Revision 1.28  93/06/25  16:11:45  armnrbd
C     Remplacer Mp_NumThreads par Mp_Set_NumThread dans MPSERV.
C     
C     Revision 1.27  93/06/09  20:44:19  armnrbd
C     Restaurer le traitement differentiel de XIT
C     pour des valeurs de N plus petites que -100.
C     
C     Revision 1.26  93/06/02  17:08:56  armnrbd
C     Implanter ECHO_COMMAND_LINE dans JCLPNT
C     
C     Revision 1.25  93/05/31  13:45:10  armnrbd
C     Ajouter la cle OUTPUT dans JCLPNT et
C     Corriger l'implantation de la cle INPUT.
C     
C     Revision 1.24  93/05/30  00:00:19  armnrbd
C     Ajouter la cle INPUT dans JCLPNT.
C     
C     Revision 1.23  93/03/30  11:20:32  armnrbd
C     Remplacer la section cpp dans mpserv par une section
C     de compilation conditionnelle SGI avec "C$".
C     
C     Revision 1.22  93/03/12  09:06:51  armnrbd
C     Ajouter le support de PAGER dans QQQDOC.
C     
C     Revision 1.21  93/03/10  16:44:19  armnrbd
C     Utiliser un appel system a MORE dans QQQDOC.
C     
C     Revision 1.20  93/02/26  13:13:50  armnrbd
C     Ajouter la routine SUIVANT.
C     
C     Revision 1.19  93/01/26  14:13:49  armnrbd
C     Remplacer DEFAULTPACKINGTYPE par DEFAULT_PACKING_TYPE.
C     
C     Revision 1.18  93/01/25  23:00:32  armnrbd
C     Remplacer PK84 et PK92 par IPKTYP et OPKTYP dans JCLPNT.
C     
C     Revision 1.17  92/12/21  15:25:12  armnrbd
C     Ajouter valeur de defaut secondaire pour KUV,T1 et LV1.
C     
C     Revision 1.16  92/12/16  14:53:43  armnrbd
C     Enlever l'appel a LOW2UP dans JCLPNT.
C     
C     Revision 1.15  92/12/16  11:14:16  armnrbd
C     La taille des cle en equivalence passe de 16 a 128 caracteres.
C     Ajouter trois autres parametres "-name".
C     
C     Revision 1.14  92/12/11  18:00:05  armnrbd
C     Utiliser le nouveau CCARD (avec parametres positionel en partant).
C     
C     Revision 1.13  92/11/23  10:51:51  armnrbd
C     Verifier NLEV=0 dans la routine PRECEDE.
C     
C     Revision 1.12  92/11/19  16:07:45  armnrbd
C     Remplacer PRECEDE( NF ) par PRECEDE( NF,NLEV ).
C     
C     Revision 1.11  92/11/15  16:11:04  armnrbd
C     Troisieme iteration PKTYP.
C     
C     Revision 1.10  92/11/11  12:29:30  armnrbd
C     Deuxieme iteration de l'implantation de PKTYP.
C     
C     Revision 1.9  92/10/28  13:45:51  armnrbd
C     Premier jeux de modification pour l'implantation du PK92.
C     
C     Revision 1.8  92/06/04  09:40:08  armnrbd
C     Encore un BugFix a UNIT5.
C     
C     Revision 1.7  92/06/03  22:10:12  armnrbd
C     Autre BugFix pour UNIT5.
C     
C     Revision 1.6  92/06/03  22:02:25  armnrbd
C     Definir UNIT5 comme LOGICAL partout.
C     
C     Revision 1.5  92/05/01  13:52:42  armnrbd
C     Tenir compte de la longueur des lignes dans QQQDOC.
C     
C     Revision 1.4  92/03/13  11:48:07  armnrbd
C     Tenir compte de nom illegaux dans QQQDOC.
C     
C     Revision 1.3  92/03/12  15:19:14  armnrbd
C     Tenir compte de nom vide/nul dans QQQDOC.
C     
C     Revision 1.2  92/03/05  16:15:38  armnrbd
C     Correction a qqqdoc.
C     
C     Revision 1.1  92/03/04  16:02:01  armnrbd
C     Ajouter qqqdoc.
C     
C     Revision 1.0  92/02/24  11:47:21  armnrbd
C     Initial revision
C     

      SUBROUTINE dabort

***    NOV 17/82  - R.LAPRISE.

***    CAUSE ABORT (OR AT LEAST AN ERROR EXIT) WHENEVER CALLED.

      REAL     X,ZERO,ONE

      EXTERNAL QUIT

      DATA     ZERO / 0.0 /,
     +         ONE  / 1.0 /

*-----------------------------------------------------------------------
      X = ONE/ZERO

***    CERTAIN MACHINES ABORT ONLY WHEN TRYING TO MAKE USE OF
***    UNDEFINED/INFINITY VALUES.

      X = 2.*X

***    BUT THEN AGAIN, MACHINES SUPPORTING NANs (AS IN
***    IEEE-754 ARITHMETIC) WILL NOT. SO, IF WE ARE STILL 
***    RUNNING, INVOKE QUIT.

      CALL quit(' Dabort',-98 )

      RETURN
      END 

      SUBROUTINE burnf

***    Jan 18/91 - Bernard Dugas, RPN.

***    This routine burns an input section "/EOR" end-card if input 
***    re-direction (either through explicit re-definition  of tape5
***    or through the "INPUT" environment variable) has been detected.
***    It should do nothing to stdin.

      IMPLICIT       none

      CHARACTER*5    INPUT
      INTEGER        IO

      CHARACTER*512           UNIT5
      COMMON        /IODIRE/  UNIT5
      LOGICAL                 INFO
      COMMON        /ZZVERBO/ INFO

      EXTERNAL       UP2LOW,MESSYS

*---------------------------------------------------------------------
      IF (UNIT5.NE.' ')                                        THEN

***        LIRE LA CHAINE D'INPUT.

  050     READ( 5, '(A5)', END=101,ERR=100,IOSTAT=IO ) INPUT

              CALL UP2LOW( INPUT,INPUT )

***            VERIFIER LA PRESENCE D'UN TYPE D'EOR.

              IF (((INPUT(1:1).EQ.'/'      .or.
     +              INPUT(1:1).EQ.'*'    ) .and.
     +             (INPUT(2:5).EQ. 'eof '  .or.
     +              INPUT(2:5).EQ. 'eoi '  .or.
     +              INPUT(2:5).EQ. 'eor ')).or.
     +              INPUT     .EQ.'+   .'
     +            ) GOTO 101

          GOTO 050

***        BRANCHEMENT DE TRAITEMENT D'ERREUR.

  100     IF (IO.NE.0 .AND. INFO)                              THEN
              WRITE(6,6000) IO
              CALL MESSYS( 'In Burnf...' )
          END IF

      END IF

***    BRANCHEMENT DE FIN DE SECTION.

  101 RETURN

*---------------------------------------------------------------------
 6000 FORMAT('   Burnf on unit 5 returns I/O error number ',I5)

      END 
      LOGICAL FUNCTION getio64 (VALUE)

      IMPLICIT       none

***    Jan 14/96 - Bernard Dugas, RPN.

***    This routine will set/get the 64-bit I/O mode's value.

      LOGICAL        IO64B,VALUE,setio64
      SAVE           IO64B
*---------------------------------------------------------------------

      getio64 = IO64B
      RETURN
      
*---------------------------------------------------------------------
      ENTRY setio64 (VALUE)

      IO64B   = VALUE
      setio64 = IO64B

      RETURN
*---------------------------------------------------------------------

      END
      LOGICAL FUNCTION  GetFreeFormatLevelIO (VALUE)

      IMPLICIT       none

***    Nov 18/18 - Bernard Dugas, UQAM/ESCER.

***   This routine sets/retrieves the current status
***    of the Free Format Level input mode.

      LOGICAL        FreeFormatLevelIO,SetFreeFormatLevelIO,VALUE
      SAVE           FreeFormatLevelIO
*---------------------------------------------------------------------

      GetFreeFormatLevelIO = FreeFormatLevelIO
      
      RETURN
      
*---------------------------------------------------------------------
      ENTRY SetFreeFormatLevelIO (VALUE)

         FreeFormatLevelIO = VALUE
      SetFreeFormatLevelIO = FreeFormatLevelIO

      RETURN
*---------------------------------------------------------------------

      END
      LOGICAL FUNCTION is_on( VARIAB )

      IMPLICIT       none

      CHARACTER *(*) VARIAB
      EXTERNAL       UP2LOW

      CHARACTER LOCAL_VAR*4

      IS_ON = .FALSE.

      LOCAL_VAR = VARIAB

      IF (LOCAL_VAR.NE.' ')                                    THEN

          CALL UP2LOW( LOCAL_VAR,LOCAL_VAR )

          IF (LOCAL_VAR.EQ.'on'   .OR.
     +        LOCAL_VAR.EQ.'true' .OR.
     +        LOCAL_VAR.EQ.'vrai' .OR.
     +        LOCAL_VAR.EQ.'oui'  .OR.
     +        LOCAL_VAR.EQ.'yes'  )
     +        IS_ON = .TRUE.

      END IF

      RETURN

      END
      LOGICAL FUNCTION is_off( VARIAB )

      IMPLICIT       none

      CHARACTER *(*) VARIAB
      EXTERNAL       UP2LOW

      CHARACTER LOCAL_VAR*4

      IS_OFF = .FALSE.

      LOCAL_VAR = VARIAB

      IF (LOCAL_VAR.NE.' ')                                    THEN

          CALL UP2LOW( LOCAL_VAR,LOCAL_VAR )

          IF (LOCAL_VAR.EQ.'off'   .OR.
     +        LOCAL_VAR.EQ.'false' .OR.
     +        LOCAL_VAR.EQ.'faux'  .OR.
     +        LOCAL_VAR.EQ.'non'   .OR.
     +        LOCAL_VAR.EQ.'no'    )
     +        IS_OFF = .TRUE.

      END IF

      RETURN

      END
      SUBROUTINE jclpnt (NF,
     2           IU01,IU02,IU03,IU04,IU05,IU06,IU07,IU08,IU09,IU10,
     3           IU11,IU12,IU13,IU14,IU15,IU16,IU17,IU18,IU19,IU20,
     4           IU21,IU22,IU23,IU24,IU25,IU26,IU27,IU28,IU29,IU30,
     5           IU31,IU32,IU33,IU34,IU35,IU36,IU37,IU38,IU39,IU40,
     6           IU41,IU42,IU43,IU44,IU45,IU46,IU47,IU48,IU49,IU50,
     7           IU51,IU52,IU53,IU54,IU55,IU56,IU57,IU58,IU59,IU60,
     8           IU61,IU62,IU63,IU64,IU65,IU66,IU67,IU68,IU69,IU70,
     9           IU71,IU72,IU73,IU74,IU75,IU76,IU77,IU78,IU79,IU80 )

***    MODIFICATION HISTORY...

***    DECEMBRE  01/92 - B.Dugas : IMPLANTER LE BLOC PARAMETRE
***    NOVEMBRE  03/92 - B.Dugas : AJOUTER LES PKTYP(0:99).
***    MARS      03/92 - B.Dugas : AJOUTER LE TRAITEMENT DU BLOC SECOUR.
***    SEPTEMBRE 11/91 - B.Dugas : DANS CCLARGS, IPOS=1 PLUTOT QUE IPOS=-1.
***    JUILLET   25/91 - B.Dugas : UTILISER NOUVEAU CCLARGS.
***    MAI       10/91 - B.Dugas : GARDER UNE LISTE DES UNITE OUVERTES.
***    MARS      01/91 - B.Dugas : 1) UTILISER CCARD EN MODE POSITIONNEL
***                                2) PERMETTRE NF < 21, PLUTOT QUE 16.
***    JANUARY   22/91 - B.Dugas : 1) USE OF "TEMPDIR" EV AS A LOCATION
***                                   FOR THE CREATION OF NEW FILES.
***                                2) CHECK "XITVAL" FOR PREVIOUS
***                                   UNCLEARED ABORT CONDITIONS.
***    JANUARY   18/91 - B.Dugas : USE OF "INPUT" AND "OUTPUT" EV'S.
***    MARCH     22/90 - B.Dugas : MS/DOS AND SUN/OS VERSIONS.

***    AUTEUR : NOV 28/84 - B.Dugas.

***    THIS ROUTINE DOES THE  UNIT ASSIGNATION FROM  THE INFORMATION
***    FOUND ON THE CONTROL CARD AND THAT PASSED BY THE CALLING PRO-
***    GRAM. THIS IS A) THE NAMES OF FILES FROM THE CONTROL CARD AND 
***    B) THEIR RESPECTIVE UNIT NUMBERS FROM THE CALLING PROGRAM.

***    THE MAXIMUM NUMBER OF UNITS (NF) IS CURRENTLY SET TO 20 UNITS 
***    AND JCLPNT ONLY RECOGNIZES THE STANDART SYSTEM SEPARATORS. NO 
***    ASSIGNATION IS DONE FOR BLANK NAMED UNITS. 

***    FINALY, ON RETURNING, NF CONTAINS THE NUMBER OF NON-BLANK NA-
***    MES. NOTE THAT UNITS 5 AND 6 ARE ALWAYS ASSIGNED  TO STANDART
***    INPUT AND OUTPUT  AND AS WELL, ARE NOT COUNTED  IN THE OUTPUT 
***    VALUE OF NF. ANY INPUT AND OUTPUT RE-DIRECTION SHOULD BE DONE 
***    WITH PIPES.  EACH PARAMETER HAS A MAXIMUM LENGTH OF 512  CHA-
***    RACTERS.

***    NEGATIVE UNIT NUMBERS SIGNAL  THE REQUEST TO ASSIGN FORMATTED
***    FILES RATHER THAN THE NORMAL UNFORMATTED ONES.

***    IF A "+" FILE NAME IS FOUND BY CCARD, JCLPNT SKIPS THE CORRES-
***    PONDING UNIT NUMBER.

***    THE ABSENCE OF ANY PARAMETRES OR THE PRESENCE OF A -help IN
***    THE INPUT LINE TOGGLES HELP MODE.

      IMPLICIT        none

      INTEGER,        PARAMETER :: NBRGEN = 18 , NBRUNT = 80
      INTEGER,        PARAMETER :: MAXUNIT = unite_io_maximale

      INTEGER         LISTE(NBRUNT)
      INTEGER,        SAVE :: U(NBRUNT)
      CHARACTER(4),   SAVE :: STATF(NBRUNT)
      CHARACTER(6),   SAVE :: POSITF(NBRUNT)
      CHARACTER(512), SAVE :: DEFNAM(NBRUNT)
      CHARACTER(512)  IONAM(NBRUNT+1)

      CHARACTER(16),  SAVE :: cles(NBRGEN)
      CHARACTER(512), SAVE :: nam(NBRGEN),def(NBRGEN)

      CHARACTER(4)    PKTP0,PKTP1
      CHARACTER(6)    POSITION,OUVTYP
      CHARACTER(16)   INFMOD,INFMODX
      CHARACTER(32)   COMMAND,FTYPC*2
      CHARACTER(512)  NAME,EVALUE
      CHARACTER(512), SAVE :: PROGRAM_NAME=' ',TMPDIRN

      CHARACTER*(*)   NAMEQ,NAMEV,POSITQ,STATQ,TMPVAL ! Entry arguments
      REAL            FVORT,PI ! SPWCON7 arguments

      INTEGER,        SAVE :: IPOS=1,INFMODI=-1
      INTEGER         I,J, LENNAM,LENTMP, NF,NFOUT, IOVAL,
     +                IO,NUM,IDEB,IFIN,IER,
     +                II,IONUM,IU,IUQ,FTYP

      INTEGER
     +                IU01,IU02,IU03,IU04,IU05,IU06,IU07,IU08,IU09,IU10,
     +                IU11,IU12,IU13,IU14,IU15,IU16,IU17,IU18,IU19,IU20,
     +                IU21,IU22,IU23,IU24,IU25,IU26,IU27,IU28,IU29,IU30,
     +                IU31,IU32,IU33,IU34,IU35,IU36,IU37,IU38,IU39,IU40,
     +                IU41,IU42,IU43,IU44,IU45,IU46,IU47,IU48,IU49,IU50,
     +                IU51,IU52,IU53,IU54,IU55,IU56,IU57,IU58,IU59,IU60,
     +                IU61,IU62,IU63,IU64,IU65,IU66,IU67,IU68,IU69,IU70,
     +                IU71,IU72,IU73,IU74,IU75,IU76,IU77,IU78,IU79,IU80

      LOGICAL         HELP, Done, EX, OP, LVALUE, OK, NotOK
      LOGICAL,        SAVE :: Vrai = .true. , Faux = .false.
      LOGICAL,        SAVE :: MSGLVL = .false., SETYP

      REAL(8)         RVALUE,REPSIL, init8
      LOGICAL,SAVE :: MValue=.false.,MValue_READ=.false.,
     +    MValue_IS_OFF=.false.
      REAL(8),SAVE :: MisFlag,Epsilon=1D-3

      real,           save :: misf=9.96921e+36                ! a very large float
      real    *8,     save :: misd=9.96921e+36                ! very large double
      integer,        save :: misi =transfer(Z'80000000',1_4) ! largest negative 32 bit integer
      integer,        save :: misui=transfer(Z'FFFFFFFF',1_4) ! largest 32 bit unsigned integer
      integer *2,     save :: misa =transfer(Z'8000'    ,1_2) ! largest negative 16 bit integer
      integer *2,     save :: misus=transfer(Z'FFFF'    ,1_2) ! largest 16 bit unsigned integer
      integer *1,     save :: misb =transfer(Z'80'      ,1_1) ! largest negative 8 bit integer
      integer *1,     save :: misub=transfer(Z'FF'      ,1_1) ! largest  8 bit unsigned integer

      INTEGER, EXTERNAL :: GET_MISSING_VALUE_FLAGS,MISSING_VALUE_USED

      INTEGER,SAVE :: CENDIAN = 1 ! Implies big endian treatment, 0 for small endian

#     include        "zlabel.cdk"

      CHARACTER   DIAGEXT*512
      LOGICAL     DEXIT,SET_DEXIT  ; COMMON /DEXIT/   
     +            DEXIT,SET_DEXIT,DIAGEXT
      INTEGER     KEY(0:MAXUNIT)   ; COMMON /DIAGKEY/ KEY
      CHARACTER   UNIT5*512        ; COMMON /IODIRE/  UNIT5
      INTEGER     INFMOT(0:MAXUNIT); COMMON /LIRZXL/  INFMOT
      INTEGER     MAXWRD           ; COMMON /MAXWRD/  MAXWRD
      INTEGER     MAXSWRD          ; COMMON /MAXSWRD/ MAXSWRD
      LOGICAL     SAUVD(MAXUNIT), SAUVE(MAXUNIT),
     +            SAUVU(MAXUNIT), SAUVY(MAXUNIT), SAUVZ(MAXUNIT)
      COMMON     /OUICEST/ SAUVD, SAUVE, SAUVY, SAUVZ, SAUVU
      INTEGER     STIMEI           ; COMMON /TIMER/   STIMEI

      LOGICAL     OLDIP1           ; COMMON /ZZ98IP1/ OLDIP1
      LOGICAL     NOABORT          ; COMMON /ZZABORT/ NOABORT
      LOGICAL     DEBUG            ; COMMON /ZZDEBUG/ DEBUG
      CHARACTER   DEF_PKTYP*4      ; COMMON /ZZDEFPK/ DEF_PKTYP
      LOGICAL     FORTB(MAXUNIT)   ; COMMON /ZZFORTB/ FORTB
      CHARACTER*4 PKTYP(0:MAXUNIT) ; COMMON /ZZPKTYP/ PKTYP
      LOGICAL     INFO             ; COMMON /ZZVERBO/ INFO
      INTEGER     DATVAL
      LOGICAL     DATE,KEEPIP2     ; COMMON /ZZZDATE/  
     +            DATE,KEEPIP2,DATVAL
      LOGICAL     E64OUT           ; COMMON /ZZZE64O/ E64OUT
      LOGICAL     LOPEN(MAXUNIT)   ; COMMON /ZZZOPEN/ LOPEN
      LOGICAL     SEQ              ; COMMON /ZZZSEQF/ SEQ   
      LOGICAL     SINGLZ           ; COMMON /ZZZSNGL/ SINGLZ

      INTEGER(8),     SAVE :: DATE_CONVERSION_FACTOR
      INTEGER         YYYYMMDD, HHMMSShh, DATE_TIME_STAMP, DTM,DUMMY,ERR
      INTEGER(8)      YYYYMMDD8,HHMMSShh8,DATE8,IOVAL8
      INTEGER(8),     SAVE ::   D8=1 00 00 00 00 _8,     UN8=1,
     +                          DA=1 00 00 00 00 00 _8,
     +                          DC=1 00 00 00 00 00 00 _8

#     include        "machtype.cdk"

      LOGICAL,EXTERNAL :: SetFreeFormatLevelIO
      LOGICAL,EXTERNAL :: IS_ON,IS_OFF,SETIO64
      INTEGER,EXTERNAL :: NEWDATE,ME32O64,INTEFLT,CHKENDI
      INTEGER,EXTERNAL :: FCLOS,FNOM,FSTNBR,FSTOPC,FSTFRM,XDFOPT
      INTEGER,EXTERNAL :: WKOFFIT,LONGUEUR
      EXTERNAL            XIT,GETENVC,CCARD,PROGRAM_VERSION,
     +                    LOW2UP,UP2LOW,QQQDOC,MESSYS,INICLE,
     +                    PUTPARC,PUTPARI,OUVSTD

      CHARACTER(20),SAVE :: ZZZJCL='JCLPNT PAS EXECUTE'

      CHARACTER(20)   BIGTMP,DATFMT,DEBUGM,ECHOJCL,INPUT,
     +                KDATEV,LEAPYR,MISVAL,OLDIP1V,OUTPUT,
     +                PKVAL,TMPDIR,UZBIGT,VRBOSE,XITVAL,
     +                FRLIFMT

      DATA            BIGTMP /       'BIG_TMPDIR'     /,
     +                DATFMT /      'DATE_FORMAT'     /,
     +                DEBUGM /       'DEBUG_MODE'     /,
     +                ECHOJCL/   'ECHO_COMMAND_LINE'  /,
     +                INPUT  /        'INPUT '        /,
     +                KDATEV /     'PRESERVE_DATEV'   /,
     +                LEAPYR /   'LEAP_YEAR_CONTROL'  /,
     +                MISVAL /     'MISSING_VALUE'    /,
     +                OLDIP1V/   'USE_OLD_STYLE_IP1'  /,
     +                OUTPUT /        'OUTPUT'        /,
     +                PKVAL  / 'DEFAULT_PACKING_TYPE' /,
     +                TMPDIR /        'TMPDIR'        /,
     +                UZBIGT /     'USE_BIG_TMPDIR'   /,
     +                VRBOSE /        'INFORM'        /,
     +                XITVAL /        'XITVAL'        /,
     +                FRLIFMT/ 'FREE_FORMAT_LEVEL_IO' /


      DATA cles(1) / 'HELP'   /,nam(1) / 'NON'  /,def(1) / 'OUI'  /,
     +     cles(2) / 'INFO'   /,nam(2) / 'NON'  /,def(2) / 'OUI'  /,
     +     cles(3) / 'IPKTYP' /,nam(3) / ' '    /,def(3) / ' '    /,
     +     cles(4) / 'OPKTYP' /,nam(4) / ' '    /,def(4) / ' '    /,
     +     cles(5) / 'INPUT.' /,nam(5) / '****' /,def(5) / '****' /,
     +     cles(6) / 'OUTPUT.'/,nam(6) / '****' /,def(6) / '****' /,
     +     cles(7) / 'DATE'   /,nam(7) / ' '    /,def(7) / '  -1' /,
     +     cles(8) / 'SINGLZ' /,nam(8) / ' '    /,def(8) / '  -1' /,
     +     cles(9) / 'SEQ'    /,nam(9) / 'RND'  /,def(9) / 'SEQ'  /,
     +     cles(10)/ 'VERS'   /,nam(10)/ 'NON'  /,def(10)/ 'OUI'  /,
     +     cles(11)/ 'NA'     /,nam(11)/ '****' /,def(11)/ '  -1' /,
     +     cles(12)/ 'KEEPIP2'/,nam(12)/ 'NON'  /,def(12)/ 'OUI'  /,
     +     cles(13)/ 'MVALUE' /,nam(13)/ 'NONE' /,def(13)/ 'OUI'  /,
     +     cles(14)/ 'MVALUE' /,nam(14)/ 'NONE' /,def(14)/ '  -1' /,
     +     cles(15)/ 'BISECT' /,nam(15)/ 'OUI'  /,def(15)/ 'NON'  /,
     +     cles(16)/ 'CENDIAN'/,nam(16)/ 'BIG'  /,def(16)/ 'SMALL'/,
     +     cles(17)/ 'VERSION'/,nam(17)/ 'NON'  /,def(17)/ 'OUI'  /,
     +     cles(18)/ 'H'      /,nam(18)/ 'NON'  /,def(17)/ 'OUI'  /

*----------------------------------------------------------------------
***    GET INITIAL SYSTEM TIME AND SAVE IT.

      CALL SYSTEM_CLOCK( STIMEI )

***    FIRST, CHECK FOR A NON-EMPTY DIAGNOSTIC_EXIT FILE.

          DEXIT = Faux
      SET_DEXIT = Faux

***    THE NAME OF THIS FILE COULD ALSO BE SPECIFIED
***    WITH THE DIAGNOSTIC_EXIT ENVIRONMENT VARIABLE.

      CALL GETENVC( DIAGEXT,EVALUE )

      IF (EVALUE.NE.' ')                                       THEN
          DIAGEXT   = EVALUE
          SET_DEXIT = Vrai
      END IF

      INQUIRE( FILE=DIAGEXT,ERR=099,IOSTAT=IO,EXIST=EX )

      IF (EX)                                                  THEN

***        THE FILE EXISTS.

          OPEN( UNIT=99, FILE=DIAGEXT, ERR=099,IOSTAT=IO,
     +                   STATUS='OLD', ACCESS='SEQUENTIAL',
     +                                 FORM='FORMATTED' )

***        ANY ABORT CODE WILL BE WRITTEN TO THIS FILE
***        RATHER THAN GENERATING A PHYSICAL ABORT CODE.

          DEXIT = Vrai

***        TRY READING THE FILE'S FIRST LINE TO SEE IF IT IS
***        EMPTY OR NOT. IF IT IS NOT EMPTY, QUIT IMMEDIATLY.

          READ(99,'(A32)',END=099,IOSTAT=IO) EVALUE(1:32)
          CLOSE ( 99 )

          IF (EVALUE(1:32).NE.' ') CALL qqexit( 0 )

      END IF

***    CLEARING ZZZJCL ASSURES US JCLPNT HAS BEEN CALLED.

  099 ZZZJCL = ' '

***    DETERMINE MACHINE TYPE.

      BIGENDI = CHKENDI( DUMMY )
      INTSIZE = INTEFLT( DUMMY )
      MACHINE = ME32O64( DUMMY )

      IF (INTSIZE /= 1 .or. MACHINE /= 2)                      THEN
          print *,' Aborting ...'
          IF (INTSIZE /= 1)
     +    print *,' Default integer and real sizes are different' 
          IF (MACHINE /= 2)
     +    PRINT *,' Default integers 64-bit rather than 32-bit.'
          CALL                                     XIT(' Jclpnt ',-98)
      END IF

      IF (MACHINE.EQ.1) EX = SETIO64( Vrai )
      IF (MACHINE.EQ.2) EX = SETIO64( Faux )

***    DEFINE LOGICAL SWITCHES FOUND IN COMMON.

      HELP    = Faux
      INFO    = Faux
      DEBUG   = Faux
      SETYP   = Faux
      NOABORT = Faux
      KEEPIP2 = Faux

      E64OUT  = Vrai

      DO  I=1,MAXUNIT
          LOPEN (I) = Faux
          SAUVD (I) = Faux
          SAUVE (I) = Faux
          SAUVY (I) = Faux
          SAUVZ (I) = Faux
          SAUVU (I) = Faux
          KEY   (I) = -2
      END DO
      DO  I=1,NBRUNT
          STATF (I) = 'NONE'
          POSITF(I) = 'DEF'
          DEFNAM(I) = ' '
      END DO

***    STANDART INPUT I/O UNIT NAME IS BLANCK.

      UNIT5 = ' '

***    INITIALIZE MAXIMUM NUMBER OF REAL WORDS TO -1
***    FOR GETSIZ/2 AND RECGET (MAXSPE DOES THE SAME).
***    DO THE SAME FOR THE MAXIMUM SIZE OF RECORDS THAT
***    FILEV MAY SKIP AUTOMATICALLY (LABL OR CHAR).

      MAXWRD  = -1
      MAXSWRD = -1

      IF (INTSIZE.NE.1)                                        THEN
          WRITE(6,6009)
          CALL                                     XIT(' Jclpnt ',-9 )
      END IF

***    CHECK FOR PREVIOUS UNCLEARED ABORT CONDITIONS.

      CALL GETENVC( XITVAL,EVALUE )

      IF (EVALUE.NE.' ' .AND. EVALUE.NE.'0')                   THEN
          READ(EVALUE,'(BN,I4)') NUM
          IF (NUM.LT.100 .AND. NUM.GT.0)                       THEN
              WRITE(6,6099) -NUM
              CALL                                 XIT(' Jclpnt ',-99)
          END IF
      END IF

***    CHECK FOR "VERBOSE" ENVIRONMENT VARIABLE.

      CALL GETENVC( VRBOSE,EVALUE )
      IF (IS_ON( EVALUE )) INFO = Vrai

***    CHECK FOR "DEBUGM" ENVIRONMENT VARIABLE.

      CALL GETENVC( DEBUGM,EVALUE )

      IF (EVALUE.NE.' ')                                       THEN
          IF (IS_ON( EVALUE )) DEBUG   = Vrai
          IF (DEBUG)           INFO    = Vrai
          IF (DEBUG)           INFMODI = 4
      END IF

***    RETRIEVE COMMAND-LINE PARAMETERS.

      CALL lire_arg( CLES,DEF,NAM,NBRGEN,IONAM,IPOS,NBRUNT )

      PROGRAM_NAME = IONAM(1)

***    IPOS.EQ.1 TOGGLES HELP MODE (ONLY PROGRAM NAME FOUND)

      IF (IPOS.EQ.1 .AND. NF.NE.2) HELP = Vrai

***    CHECK THE KEYWORD PARAMETERS. THIS COULD BE A HELP
***    REQUEST ("-HELP"), A PARTICULAR PACKING INPUT TYPE 
***    ("-IPKTYP") OR A MORE VERBOSE WORKING MODE ("-INFO").

      IF (NAM(2).EQ.'DEBUGS')       NAM(2)  = 'DEBUG'

      IF (     IS_ON ( NAM(1) ) ! "-HELP" OR "-H" arguments found ?
     +    .OR. IS_ON ( NAM(18)))    HELP    = Vrai

      IF (.not.IS_OFF( NAM(2) ))                               THEN
                                    INFO    = Vrai
          IF (NAM(2).EQ.'CATAST')   INFMODI = MAX(-1,INFMODI ) ! CATAST
          IF (NAM(2).EQ.'SYSTEM')   INFMODI = MAX( 0,INFMODI ) ! SYSTEM
          IF (NAM(2).EQ.'FATALE'
     +   .OR. NAM(2).EQ.'ERRFATAL') INFMODI = MAX( 1,INFMODI ) ! FATALE or ERRFATAL
          IF (NAM(2).EQ.'ERRORS'
     +   .OR. NAM(2).EQ.'ERROR')    INFMODI = MAX( 2,INFMODI ) ! ERRORS or ERROR
          IF (IS_ON( NAM(2) )
     +   .OR. NAM(2).EQ.'WARNIN'
     +   .OR. NAM(2).EQ.'WARNING')  INFMODI = MAX( 3,INFMODI ) ! WARNIN or WARNING
          IF (NAM(2).EQ.'INFORM')   INFMODI = MAX( 4,INFMODI ) ! INFORM
          IF (NAM(2).EQ.'DEBUG'
     +   .OR. NAM(2).EQ.'TRIVIAL')  INFMODI = MAX( 5,INFMODI ) ! DEBUG  or TRIVIAL
      END IF

      IF (INFMODI.GE. 4)            DEBUG   = Vrai

***    DEFINE FSTD MESSAGE LEVEL.

      IF (INFMODI.EQ.-1)            INFMOD  = 'CATAST'
      IF (INFMODI.EQ. 0)            INFMOD  = 'SYSTEM'
      IF (INFMODI.EQ. 1)            INFMOD  = 'FATALE'
      IF (INFMODI.EQ. 2)            INFMOD  = 'ERRORS'
      IF (INFMODI.EQ. 3)            INFMOD  = 'WARNIN'
      IF (INFMODI.EQ. 4)            INFMOD  = 'INFORM'
      IF (INFMODI.EQ. 5)            INFMOD  = 'DEBUG' 

***    DEFINE XDF (LOWEST-LEVEL FSTD ROUTINES) MESSAGE LEVEL.

      IF (INFMODI.LE. 0)            INFMODX = 'SYSTEM  '
      IF (INFMODI.EQ. 1)            INFMODX = 'ERRFATAL'
      IF (INFMODI.EQ. 2)            INFMODX = 'ERROR   '
      IF (INFMODI.EQ. 3)            INFMODX = 'WARNING '
      IF (INFMODI.EQ. 4)            INFMODX = 'INFORM  '
      IF (INFMODI.EQ. 5)            INFMODX = 'TRIVIAL '

***    Check for the "-vers" or "-version" arguments.

      IF (INFO .OR. IS_ON( NAM(10) )
     +         .OR. IS_ON( NAM(17) ))                          THEN
          CALL program_version('OUI')
      ELSE
          CALL LOW2UP( NAM(10),NAM(10) )
          IF (NAM(10) == 'ALL'
     +   .OR. NAM(10) == 'DAT'
     +   .OR. NAM(10) == 'REV')                                THEN
              CALL program_version( NAM(10) )
          END IF
      END IF

      IF (INFO)                                                THEN
          IF (BIGENDI == 0) EVALUE = ' Little Endian machine'
          IF (BIGENDI == 1) EVALUE = ' Big Endian machine'
          WRITE(6,'(/A/)') TRIM( EVALUE )
      END IF

***    Setup NOMVAR equivalence table.

      CALL ININEQ( Done )

***    CHECK THE "-IPKTYP" KEY AND DEFINE PKTP0 ACCORDINGLY.

      IF (     NAM(3).EQ.'PK92')                               THEN
               PKTP0  =  '    '
      ELSE IF (NAM(3).EQ.'PK84')                               THEN
               PKTP0  =  'PK84'
      ELSE IF (NAM(3).EQ.'SQ98')                               THEN
               PKTP0  =  'SQ98'
      ELSE IF (NAM(3).EQ.'SQ89')                               THEN
               PKTP0  =  'SQ89'
      ELSE
               PKTP0   =  '****'
      END IF

***    CHECK THE "-OPKTYP" KEY. TREAT LATER.

      IF (     NAM(4).EQ.'PK92' .OR.
     +         NAM(4).EQ.'SQ89' .OR.
     +         NAM(4).EQ.'SQ98' .OR.
     +         NAM(4).EQ.'PK84') SETYP = Vrai

      IF (     NAM(4).EQ.'PK92')                               THEN
               NAM(4) =  '    '
      ELSE IF (NAM(4).EQ.'SQ89')                               THEN
               NAM(4) =  'SQ98'
      ELSE IF (NAM(4).NE.'PK84' .AND.
     +         NAM(4).NE.'SQ98')                               THEN
               NAM(4) =  '****'
      END IF

***    PROCESS A HELP REQUEST.

      IF (HELP)                                                THEN
          CALL QQQDOC( )
          CALL                                     XIT('  Help  ', 0 )
      END IF

***    DEFINE PKTYP FOR ALL I/O UNITS. DO NOT DEFINE PKTYP(0) YET.

      DO  I=1,MAXUNIT
          PKTYP(I) = PKTP0
      END DO

***    1) CHECK FOR "DEFAULTPACKINGTYPE" ENVIRONMENT VARIABLE. 
***    2) CHECK FOR THE "-OPKTYP" CCARD KEY VALUE. THE DEFAULT 
***       PACKING IS SET BY PRIMARILY DETERMINED BY THIS VALUE 
***       AND, SECONDARILY, BY THE PREVIOUS VARIABLE.
***    3) DEFINE PKTYP(0), WHICH WILL HOLD THE DEFAULT.

      CALL GETENVC( PKVAL,PKTP1 )
      CALL LOW2UP(  PKTP1,PKTP1 )

      IF (     PKTP1 .EQ.'PK92' .OR.
     +         PKTP1 .EQ.'SQ89' .OR.
     +         PKTP1 .EQ.'SQ98' .OR.
     +         PKTP1 .EQ.'PK84') SETYP = Vrai

      IF (     PKTP1 .EQ.'PK92')                               THEN
               PKTP1  =  '    '
      ELSE IF (PKTP1 .EQ.'SQ89')                               THEN
               PKTP1  =  'SQ98'
      ELSE IF (PKTP1 .NE.'PK84')                               THEN
               PKTP1  =  '****'
      END IF

      IF (     NAM(4).EQ.'    ' 
     +    .OR. NAM(4).EQ.'SQ98'
     +    .OR. NAM(4).EQ.'PK84')                               THEN
                                  PKTYP(0) =  NAM(4)
      ELSE IF (PKTP1 .EQ.'    ' 
     +    .OR. PKTP1 .EQ.'SQ98'
     +    .OR. PKTP1 .EQ.'PK84')                               THEN
                                  PKTYP(0) =  PKTP1
      ELSE
          IF (MACHINE.EQ.1)       PKTYP(0) = '    '
          IF (MACHINE.EQ.2)       PKTYP(0) = DEF_PKTYP
      END IF

***    IF ONE OF PKTP0, PKTP1 OR PKTYP(0) IS EQUAL TO 'SQ98',
***    ALL NEW UNITS HAVE TO BE OF THIS TYPE. OLDER 'SQ89' ARE
***    STILL SUPPORTED ON INPUT BUT OTHERWISE, MIXING IS NOT
***    ALLOWED.

      IF (PKTP0   .EQ.'SQ98' .OR.
     +    PKTP1   .EQ.'SQ98' .OR.
     +    PKTYP(0).EQ.'SQ98' )                                 THEN

          PKTYP(0) =  'SQ98'
          DO  I=1,MAXUNIT
              PKTYP(I) = 'SQ98'
          END DO
          IF (DEBUG .OR. INFO)                                 THEN
                  ERR = XDFOPT('MSGLVL', INFMODX, 0 )
                  ERR = FSTOPC('MSGLVL', INFMOD , 0 )
                  ERR = FSTOPC('MSGLVL', INFMOD , 1 )
          ELSE
                  ERR = XDFOPT('MSGLVL','ERROR' , 0 )
                  ERR = FSTOPC('MSGLVL','ERRORS', 0 )
          END IF

          MSGLVL = Vrai

      END IF

***    DATE PROCESSING DEFAULT.

      IF (NAM(7).EQ.'    ')                                    THEN
          DATE = Faux
      ELSE
          DATE = Vrai
          READ( NAM(7),'(BN,I8)') DATVAL
      END IF

***    SINGLE ZONAL LEVEL RECORD PROCESSING DEFAULT.

      IF (NAM(8).EQ.'  -1')                                    THEN
          SINGLZ = Vrai
      ELSE IF (NAM(8).EQ.'    ')                               THEN
          SINGLZ = Faux
      END IF

***    DEFAULT STD FILE TYPE ON INPUT/OUTPUT.

      IF (NAM(9).EQ.'SEQ')                                     THEN
          SEQ = Vrai
      ELSE IF (NAM(9).EQ.'RND')                                THEN
          SEQ = Faux
      ELSE
          NAME = NAM(9)
          IF (INFO) WRITE(6,6008) TRIM( NAME )
          CALL                                     XIT(' Jclpnt ',-8 )
      END IF

***    WHICH TMPDIR DIRECTORY SHOULD WE USE? UNLESS
***    IT IS EXPLICITELY DISALLOWED, ALWAYS TRY FIRST
***    TO USE BIG_TMPDIR. OTHERWISE, TRY FOR TMPDIR.

      CALL GETENVC( UZBIGT,EVALUE )

      IF (IS_OFF( EVALUE ))                                    THEN
          CALL GETENVC( TMPDIR,EVALUE )
      ELSE IF(IS_ON( EVALUE ))                                 THEN
          CALL GETENVC( BIGTMP,EVALUE )
      ELSE
          CALL GETENVC( BIGTMP,EVALUE )
          IF (EVALUE.EQ.' ')
     +    CALL GETENVC( TMPDIR,EVALUE )
      END IF

      TMPDIRN = EVALUE

***    TMPDIRN HAS TO BE DEFINED.

      IF (TMPDIRN.EQ.' ')                                      THEN
          IF (INFO) WRITE(6,6010)
          CALL                                     XIT(' Jclpnt ',-10 )
      END IF

***    CHECK THAT THERE IS NO LEFT-OVER zcrochets FILES
***    IN THE TEMPORARY DIRECTORY. OTHERWISE, REMOVE IT.

      NAME = TRIM( TMPDIRN ) // '/zcrochets'
      COMMAND = 'INQUIRE' ; IU = -1
      INQUIRE( FILE=NAME,ERR=999,IOSTAT=IO,EXIST=EX )

      IF (EX)                                                  THEN
          NAME = 'rm -rf ' // TRIM( NAME )
          CALL SYSTEM( TRIM( NAME ) )
          NAME = ' '
      END IF

***    CHECK TO SEE IF THE "NA" (GENERIC NO ABORT)
***    COMMAND PARAMETRE HAS BEEN SPECIFIED.

      IF (NAM(11).EQ.'  -1') NOABORT = Vrai

***    CHECK WETHER OLD STYLE IP1 CODING HAS BEEN TURNED ON.

      CALL GETENVC( OLDIP1V,EVALUE )
      OLDIP1 = IS_ON( EVALUE )

***    SHOULD WE MODIFY IP2 ?

      IF (IS_ON( NAM(12) )) KEEPIP2 = Vrai

***    IS MISSING-VALUE MODE ACTIVE ? THIS CAN BE DONE EITHER
***    VIA THE "MISSINFG_VALUE=MisFlag" ENVIRONMENT VARIABLE OR
***    THE "-mvalue MisFlag" COMMAND-LINE SYNTAX. MisFlag IS
***    THEN THE ACTUAL REAL NUMBER TO CHECK AGAINST.

***    An empty or IS_ON MisFlag value will also activate the
***    missing value treatment, but default values of MisFlag
***    and Epsilon will then be defined. An IS_OFF MisFlag
***    value will prevent any missing value treatment.

      MisFlag = misd ; Epsilon = 0.001 ! Default values

      CALL GETENVC( MISVAL,EVALUE )

      IF (EVALUE.NE.' ')                                       THEN
          MValue = Vrai
      ELSE IF (NAM(13).NE.'NONE' )                             THEN
          MValue = Vrai
          EVALUE = NAM(13)
      END IF

      IF (IS_OFF( EVALUE )) MValue_IS_OFF = Vrai
      IF (MValue_IS_OFF)    MValue        = Faux

      IF (MValue .and. .not.IS_ON( EVALUE )) Mvalue_READ = Vrai

      IF (MValue .and. MValue_READ)
     +    READ( EVALUE,'(BN,E20.0)',ERR=916,IOSTAT=IO) MisFlag

      IF (NAM(14).NE.'NONE' .and. MValue_READ)
     +    READ( NAM(14),'(BN,E20.0)',ERR=916,IOSTAT=IO) Epsilon 

***    Check for leap-year support.

      CALL GETENVC( LEAPYR,EVALUE )

      if (EVALUE /= ' ')                                       THEN
          if (IS_ON( EVALUE ))                                 THEN
              call Accept_LeapYear()
          else if (IS_OFF( EVALUE ))                           THEN
              call Ignore_LeapYear()
          end if
      else if (IS_ON( NAM(15) ))                               THEN
          call Accept_LeapYear()
      else if (IS_OFF( NAM(15) ))                              THEN
          call Ignore_LeapYear()
      end if

***    Check for character string endianness ?

      IF (NAM(16) == 'BIG')                                    THEN
          CENDIAN = 1
      else if (NAM(16) == 'SMALL')                             THEN
          CENDIAN = 0
      end if

***    SHOULD WE ECHO THE COMMAND LINE ?

      CALL GETENVC( ECHOJCL,EVALUE )

      IF (IS_ON( EVALUE ))                                     THEN
          NUM    = 0
          EVALUE = IONAM(1)
          IDEB   = LEN_TRIM( EVALUE )
          DO  I=2,IPOS
              NAME = IONAM(I)
              IFIN = LEN_TRIM( NAME )
              IF (IDEB+IFIN+1.GT.512)                          THEN
                  IF (NUM.EQ.0)                                THEN
                      WRITE(6,6000) TRIM( EVALUE )
                  ELSE
                      WRITE(6,6100) TRIM( EVALUE )
                  END IF
                  IDEB   = 0
                  EVALUE = ' '
                  NUM    = NUM+1
              END IF
              EVALUE = TRIM( EVALUE ) // ' ' // TRIM( NAME )
              IDEB   = IDEB+IFIN+1
          END DO
          IF (NUM.EQ.0)                                        THEN
              WRITE(6,6000) TRIM( EVALUE )
          ELSE
              WRITE(6,6100) TRIM( EVALUE )
          END IF
          WRITE(6,'(A1)') ' '
      END IF

***    IS FREE FORMAT LEVEL INPUT REQUESTED ?

      CALL GETENVC( FRLIFMT,EVALUE )

      If (EVALUE /= ' ')                                       THEN
          If (IS_ON( EVALUE )) OK = SetFreeFormatLevelIO( Vrai )
      Else
          NotOK = SetFreeFormatLevelIO( Faux )
      End If

***    IF NF.GT.NBRUNT ABORT.

      IF (NF.GT.NBRUNT)                                        THEN
          IF (INFO) WRITE(6,6001) NF,NBRUNT
          CALL                                     XIT(' Jclpnt ',-1 )
      ELSE IF (INFO .AND. NF+1.LT.IPOS)                        THEN
          WRITE(6,6300) TRIM( PROGRAM_NAME )
          DO  I=NF+2,IPOS
              NAME = IONAM(I)
              WRITE(6,'(10X,A)') trim( NAME )
          END DO
      END IF

***    PUT THE UNIT INFORMATION INTO IU AND TEST FOR NF.

      GOTO
     + (80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,
     +  60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,
     +  40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,
     +  20,19,18,17,16,15,14,13,12,11,10,09,08,07,06,05,04,03,02,01), NF

   01 U(80) = IU80
   02 U(79) = IU79
   03 U(78) = IU78
   04 U(77) = IU77
   05 U(76) = IU76
   06 U(75) = IU75
   07 U(74) = IU74
   08 U(73) = IU73
   09 U(72) = IU72
   10 U(71) = IU71

   11 U(70) = IU70
   12 U(69) = IU69
   13 U(68) = IU68
   14 U(67) = IU67
   15 U(66) = IU66
   16 U(65) = IU65
   17 U(64) = IU64
   18 U(63) = IU63
   19 U(62) = IU62
   20 U(61) = IU61

   21 U(60) = IU60
   22 U(59) = IU59
   23 U(58) = IU58
   24 U(57) = IU57
   25 U(56) = IU56
   26 U(55) = IU55
   27 U(54) = IU54
   28 U(53) = IU53
   29 U(52) = IU52
   30 U(51) = IU51

   31 U(50) = IU50
   32 U(49) = IU49
   33 U(48) = IU48
   34 U(47) = IU47
   35 U(46) = IU46
   36 U(45) = IU45
   37 U(44) = IU44
   38 U(43) = IU43
   39 U(42) = IU42
   40 U(41) = IU41

   41 U(40) = IU40
   42 U(39) = IU39
   43 U(38) = IU38
   44 U(37) = IU37
   45 U(36) = IU36
   46 U(35) = IU35
   47 U(34) = IU34
   48 U(33) = IU33
   49 U(32) = IU32
   50 U(31) = IU31

   51 U(30) = IU30
   52 U(29) = IU29
   53 U(28) = IU28
   54 U(27) = IU27
   55 U(26) = IU26
   56 U(25) = IU25
   57 U(24) = IU24
   58 U(23) = IU23
   59 U(22) = IU22
   60 U(21) = IU21

   61 U(20) = IU20
   62 U(19) = IU19
   63 U(18) = IU18
   64 U(17) = IU17
   65 U(16) = IU16
   66 U(15) = IU15
   67 U(14) = IU14
   68 U(13) = IU13
   69 U(12) = IU12
   70 U(11) = IU11

   71 U(10) = IU10
   72 U(09) = IU09
   73 U(08) = IU08
   74 U(07) = IU07
   75 U(06) = IU06
   76 U(05) = IU05
   77 U(04) = IU04
   78 U(03) = IU03
   79 U(02) = IU02
   80 U(01) = IU01

***    CONSIDER ALL POSITIONAL PARAMETERS (EXCEPT THE FIRST
***    WHICH CONTAINS THE PROGRAM NAME AND IS IGNORED HERE) 
***    AND PUT THEM INTO NAME.

      IONUM = 0
      NFOUT = 0
      IPOS  = MIN( NF+1,IPOS )
      DO 200 I=1,IPOS-1

***        GET NEXT FILE NAME.

          NAME = IONAM(I+1)

***         DETERMINE NAME LENGTH.

          LENNAM = LEN_TRIM( NAME )

***        IS THE NAME BLANK, I.E. NO MORE ARGUMENTS?
***        CKECK FOR I/O RE-DIRECTION REQUESTS.

          IF ( NAME.EQ.'+' .OR.
     +        (NAME.EQ.' ' .AND. (U(I).NE.5 .AND. U(I).NE.6)) 
     +       ) GOTO 200

  100     IU = U(I)

          IF (IU.GT.MAXUNIT)                                   THEN
              IF (INFO) WRITE(6,6014) IU,TRIM( NAME )
              CALL                                 XIT(' Jclpnt ',-14)
          END IF

          COMMAND = '?EXIST_FILE?'
          INQUIRE( FILE=NAME,ERR=999,IOSTAT=IO,EXIST=EX )

          IF (EX)                                              THEN

***            THE FILE EXIST.
***            IS IT ALREADY OPENED?

              COMMAND = '?OPENED_FILE?'
              INQUIRE( FILE=NAME, ERR=999,IOSTAT=IO,
     +                            OPENED=OP,NUMBER=NUM )

              IF (OP) CLOSE( NUM )

***            OPEN OLD FILE.

              STATF(I) = 'OLD'

          ELSE

***            OPEN NEW FILE.

              STATF(I) = 'NEW'

***            CHECK FOR EXPLICIT OR IMPLICIT DIRECTORY RESIDENCE
***            (THROUGH THE "TEMPDIR" EV). EXCEPT FOR TAPE5/TAPE6.

              IF (IU.NE.5 .AND. IU.NE.6)                   THEN

***                IF NAME CONTAINS A "/" DO NOT USE "TMPDIR".
***                (...EXPLICIT DIRECTORY RESIDENCE REQUESTED)

                  J = INDEX( NAME,'/' )
                  IF (J.NE.0) GOTO 150

***                DETERMINE TMPDIR LENGTH (COULD BE ONE).

                  LENTMP = LEN_TRIM( TMPDIRN )

                  IF (LENTMP.EQ. 0) GOTO 150
                  IF (LENNAM+LENTMP.GT.512) CALL   XIT(' Jclpnt ',-2 )

***                BUILD NEW NAME FROM TMPDIR AND NAME. CHECK
***                FOR FILE EXISTENCE IN "TMPDIR" DIRECTORY.

                  NAME   = TRIM( TMPDIRN ) // '/' // TRIM( NAME )

                  COMMAND = '?FILE_EXIST_IN_TMPDIR?'
                  INQUIRE( FILE=NAME,ERR=999,IOSTAT=IO, EXIST=EX )

                  IF (EX) STATF(I) = 'OLD'
                 
              END IF

          END IF


  150     IF (IU.GT.0 .AND. (IU.NE.5 .AND. IU.NE.6))           THEN

              IF (.NOT.FORTB(IU))                              THEN

***            NORMAL CASES. 

***                WE FIRST ATTEMPT TO DETERMINE THE FILE
***                TYPE IF THE FILE IS KNOW TO EXIST.

                  IF (PKTP0.EQ.'****')                         THEN
                      FTYP = WKOFFIT( '+' // TRIM( NAME ) )
                      WRITE(FTYPC,'(I2.2)') FTYP
                  ELSE IF (PKTP0.EQ.'SQ89')                    THEN
                      FTYPC = '02'
                      FTYP  =   2
                  ELSE IF (PKTP0.EQ.'    ')                    THEN
                      FTYPC = '04'
                      FTYP  =   4
                  ELSE IF (PKTP0.EQ.'PK84')                    THEN
                      FTYPC = '05'
                      FTYP  =   5
                  ELSE IF (PKTP0.EQ.'SQ98')                    THEN
                      IF (.NOT.SEQ)                            THEN
                          FTYPC = '33'
                          FTYP  =  33
                      ELSE
                          FTYPC = '34'
                         FTYP  =  34
                      END IF
                  END IF

                  IF (FTYP.EQ.-3 .OR. FTYP.EQ.-2)              THEN
                      PKTYP(IU) = PKTYP(0)
                      STATF(I)    = 'NEW'
                  ELSE IF (FTYP.EQ.-1)                         THEN
                      IF (INFO) WRITE(6,6005) TRIM( NAME )
                      CALL                         XIT(' Jclpnt ',-5 )
                  ELSE IF (FTYP.EQ.2  .OR.
     +                 FTYP.EQ.33 .OR.
     +                 FTYP.EQ.34 .OR.
     +                 FTYP.EQ.39 )                            THEN
                      PKTYP(0) = 'SQ98'

                      IF (.NOT.MSGLVL)                         THEN

***                        INITIALIZE MESSAGE LEVEL (once).

                          MSGLVL = Vrai

                          IF (DEBUG .OR. INFO)                 THEN
                                 ERR = FSTOPC('MSGLVL', INFMOD ,Faux )
                                 ERR = FSTOPC('MSGLVL','INFORM',Vrai )
                          ELSE
                                 ERR = FSTOPC('MSGLVL','ERRORS',Faux )
                          END IF

                      END IF

                      DO  J=1,I-1
                          IF (PKTYP( U(J)).NE.'FMT' .AND.
     +                        PKTYP( U(J)).NE.'FTN' )          THEN
                              IF (PKTYP( U(J)).NE.'SQ89' .AND.
     +                            PKTYP( U(J)).NE.'SQ98')      THEN
                                 IF (STATF(J ).EQ.'NEW'  )     THEN
                                    IF (DEBUG)                 THEN
                                       WRITE(6,7000)
     +                                         TRIM( DEFNAM(J) ),
     +                                         U(J),PKTYP(0),'NEW'
                                    END IF
                                    CLOSE( U(J) )
                                    CALL OUVSTD( U(J),
     +                                           DEFNAM(J),
     +                                           PKTYP(0),STATF(J) )
                                 ELSE IF (STATF(J ).EQ.'OLD')  THEN
                                 IF (INFO)
     +                              WRITE(6,6007) PKTYP(IU),PKTYP(0)
                                    CALL           XIT(' Jclpnt ',-7 )
                                 END IF
                              END IF
                          END IF
                      END DO

                      DO  J=1,MAXUNIT
                          IF (PKTYP(J).NE.'SQ89' .AND.
     +                        PKTYP(J).NE.'SQ98' )
     +                        PKTYP(J) = PKTYP(0)
                      END DO

                      IF (FTYP.EQ.2)                           THEN
                          PKTYP(IU) = 'SQ89'
                      ELSE
                          PKTYP(IU) = 'SQ98'
                      END IF

                  ELSE IF (FTYP.EQ.4)                          THEN

                      IF (PKTYP(IU).EQ.'SQ89' .OR.
     +                    PKTYP(IU).EQ.'SQ98')                 THEN
                          IF (INFO)
     +                    WRITE(6,6007) PKTYP(IU),'PK92'
                          CALL                     XIT(' Jclpnt ',-7 )
                      END IF
                      IF (PKTYP(IU).NE.'****' .AND.
     +                    PKTYP(IU).NE.'    ' .AND. INFO)
     +                    WRITE(6,6007) PKTYP(IU),'PK92'
                      PKTYP(IU) = ' '

                  ELSE IF (FTYP.EQ.5)                          THEN

                      IF (PKTYP(IU).EQ.'SQ89' .OR.
     +                    PKTYP(IU).EQ.'SQ98')                 THEN
                          IF (INFO)
     +                    WRITE(6,6007) PKTYP(IU),'PK84'
                          CALL                     XIT(' Jclpnt ',-7 )
                      END IF
                      IF (PKTYP(IU).NE.'****' .AND.
     +                    PKTYP(IU).NE.'PK84' .AND. INFO)
     +                    WRITE(6,6007) PKTYP(IU),'PK84'
                      PKTYP(IU) = 'PK84'

                  ELSE IF (FTYP.EQ.1 .OR. FTYP.EQ.3
     +                               .OR. FTYP.GT.5)           THEN
                      IF (INFO) WRITE(6,6006) FTYP,TRIM( NAME )
                      CALL                         XIT(' Jclpnt ',-6 )
                  END IF

                  IF (PKTYP(IU).NE.'SQ89' .AND.
     +                PKTYP(IU).NE.'SQ98' )                    THEN

***                    FORTRAN UNFORMATTED OR ...

                      IF (DEBUG) WRITE(6,7000) TRIM( NAME ),IU,
     +                                         PKTYP(IU),STATF(I)

                      CLOSE( IU )
                      COMMAND = '!OPEN_SEQ_UNF!'

                      IF (FTYP.EQ.-2)                          THEN
                          OPEN( UNIT=IU, FILE=NAME,
     +                                   ERR=999,IOSTAT=IO,
     +                                   STATUS='OLD',
     +                                   ACCESS='SEQUENTIAL',
     +                                   FORM='UNFORMATTED' )
                      ELSE
                          OPEN( UNIT=IU, FILE=NAME,
     +                                   ERR=999,IOSTAT=IO,
     +                                   STATUS=STATF(I),
     +                                   ACCESS='SEQUENTIAL',
     +                                   FORM='UNFORMATTED' )
                      END IF

                  ELSE

***                    ... RPN/CMC STANDARD FILES.

                      IF (DEBUG) WRITE(6,7000) TRIM( NAME ),IU,
     +                                  PKTYP(IU)//FTYPC,STATF(I)

                      OUVTYP = PKTYP(IU)//FTYPC
                      CALL OUVSTD( IU,NAME,OUVTYP,STATF(I) )

                      CALL PUTPARI( 'DEET' , 0 )
                      CALL PUTPARI( 'DATEO', 0 )

                  END IF

              ELSE

***                BINARY FORTRAN REQUESTED (OTHER THAN PK84 OR PK92).
 
                  COMMAND = '!OPEN_FORT_BIN!'

                  IF (STATF(I) == 'OLD')                       THEN

                      FTYP = WKOFFIT( '+' // TRIM( NAME ) )

                      IF (FTYP.NE.10)                          THEN
                          IF (INFO) WRITE(6,6015) FTYP,TRIM( NAME )
                          CALL                     XIT(' Jclpnt ',-15)
                      END IF

                  END IF

                  IF (STATF(I).EQ.'NEW')                       THEN
                      ERR = fnom( IU,NAME,'FTN',0 )
                  ELSE IF (STATF(I).EQ.'OLD')                  THEN
                      ERR = fnom( IU,NAME,'FTN+OLD',0 )
                  END IF

                  PKTYP(IU) = 'FTN'

                  IF (ERR.NE.0) GOTO 999

              END IF

          ELSE

***            FORMATTED I/O REQUESTED.

              U(I) = ABS( U(I) )
              IU   =      U(I)

              IF (IU.EQ.6)                                     THEN

                  IONUM   = IONUM+6
                  COMMAND = '!OPEN_APPEND_FORM!'
#                 if defined (F77)
                  OPEN( UNIT=IU, FILE=NAME,
     +                           ERR=999,IOSTAT=IO,
     +                           STATUS=STATF(I),
     +                           ACCESS='APPEND',
     +                           FORM='FORMATTED' )
#                 else
                  OPEN( UNIT=IU, FILE=NAME,
     +                           ERR=999,IOSTAT=IO,
     +                           STATUS=STATF(I),
     +                           ACCESS='SEQUENTIAL',
     +                           POSITION='APPEND',
     +                           FORM='FORMATTED' )
#                 endif
              ELSE

                  IF (IU.NE.5)                                 THEN

                      IF (STATF(I) == 'OLD')                   THEN

                          ERR = WKOFFIT( '+' // TRIM( NAME ) )
                          IF (ERR < -1) THEN
                              IF (INFO) WRITE(6,6017) TRIM( NAME )
                              CALL                 XIT(' Jclpnt ',-17)
                          END IF

                      END IF

                      INQUIRE( UNIT=IU,OPENED=OP )
                      IF (OP) ERR = fclos( IU )

                  ELSE

                      IF (STATF(I).EQ.'NEW')                   THEN

***                        STDIN MUST EXIST AT THE ONSET.

                          IF (INFO) WRITE(6,6003) I,TRIM( NAME )
                          CALL                     XIT(' Jclpnt ',-3 )

                      ELSE

                          IONUM = IONUM+5

                      END IF

                  END IF

                  COMMAND = '!OPEN_SEQ_FORM!'

                  IF (STATF(I).EQ.'NEW')                       THEN
                      ERR = fnom( IU,NAME,'FTN+FMT',0 )
                  ELSE IF (STATF(I).EQ.'OLD')                  THEN
                      ERR = fnom( IU,NAME,'FTN+FMT+OLD',0 )
                  END IF

                  PKTYP(IU) = 'FMT'

                  IF (ERR.NE.0) GOTO 999

C                 OPEN( UNIT=IU, FILE=NAME, 
C    +                             ERR=999,IOSTAT=IO,
C    +                             STATUS=STATF(I),
C    +                             ACCESS='SEQUENTIAL',
C    +                             FORM='FORMATTED' )

              END IF

          END IF

***        TAPE5/TAPE6 ARE NOT COUNTED IN NFOUT. ALTERNATIVELY,
***        DEFINE UNIT5 RE-DIRECTION FLAG IN BLOCK /IODIRE/.
      
  199     IF (IU.NE.5 .AND. IU.NE.6)                       THEN
              NFOUT       =  NFOUT+1
              LOPEN(IU) = Vrai
          ELSE IF (IU.EQ.5)                                  THEN
              UNIT5 = NAME
          END IF

***        SAVE FULL PATHNAME IN ARRAY
***        DEF FOR ENTRY POINT GETNAM.

          DEFNAM(I) = NAME

  200 CONTINUE

***    CONSIDER THE CASE WHERE THE TWO I/O FILES HAVE NOT BEEN
***    OPENNED AND THERE IS A REQUEST FOR I/O RE-DIRECTION.

      IF (IONUM.NE.11)                                         THEN

          IF (IONUM.NE.5)                                      THEN

***            CHECK FOR NAMED INPUT FILES.

              NAME = ' '

              IF (NAM(5).NE.'****')                            THEN

***                STDIN RE-DIRECTION THROUGH "INPUT" KEY.

                  NAME  = NAM(5)
                  UNIT5 = 'NE RIEN Y FAIRE'

              ELSE

***                STDIN RE-DIRECTION THROUGH "INPUT" EV?

                  CALL GETENVC( INPUT,EVALUE )
                  IF (EVALUE.NE.' ') NAME  = EVALUE

              END IF
              IF (NAME.NE.' ')                                 THEN

***                STDIN MUST EXIST BEFORE OPENNING.

                  IU      =  5
                  COMMAND = '?EXIST_STDIN?'
                  INQUIRE( FILE=NAME,ERR=999,IOSTAT=IO,EXIST=EX )

                  IF (EX)                                      THEN
                      IU      =  5
                      COMMAND = '!OPEN_STDIN!'
                      OPEN( UNIT=5, FILE=NAME, ERR=999,IOSTAT=IO,
     +                              STATUS='OLD', ACCESS='SEQUENTIAL',
     +                              FORM='FORMATTED' )
                      IF (UNIT5.NE.'NE RIEN Y FAIRE')
     +                    UNIT5 = NAME
                  END IF

                  IF (UNIT5.EQ.'NE RIEN Y FAIRE')
     +                UNIT5 = ' '

              END IF

         END IF
         IF (IONUM.NE.6)                                       THEN

***            NOW CONSIDER POSSIBLE OUTPUT FILES.

             NAME = ' '

             IF (NAM(6).NE.'****')                             THEN

***               STDOUT RE-DIRECTION THROUGH "OUTPUT" KEY.

                 NAME = NAM(6)

             ELSE

***               STDOUT RE-DIRECTION THROUGH "OUTPUT" EV?

                 CALL GETENVC( OUTPUT,EVALUE )
                 IF (EVALUE.NE.' ') NAME  = EVALUE

              END IF
              IF (NAME.NE.' ')                                 THEN

***                STDOUT COULD EXIST BEFORE OPENNING.

                  IU      =  6
                  COMMAND = '?EXIST_STDOUT?'
                  INQUIRE( FILE=NAME,ERR=999,IOSTAT=IO,EXIST=EX )

                  IF (EX)                                      THEN
                      STATF(I) = 'OLD'
                  ELSE
                      STATF(I) = 'NEW'
                  END IF

                  IU      =  6
                  COMMAND = '!OPEN_STDOUT!'
#                 if defined (F77)
                  OPEN( UNIT=6, FILE=NAME, ERR=999,IOSTAT=IO,
     +                          STATUS=STATF(I), FORM='FORMATTED',
     +                          ACCESS='APPEND' )
#                 else
                  OPEN( UNIT=6, FILE=NAME, ERR=999,IOSTAT=IO,
     +                          STATUS=STATF(I), FORM='FORMATTED',
     +                          ACCESS='SEQUENTIAL',POSITION='APPEND' )
#                 endif
              END IF

          END IF

      END IF

      IF (INFO)                                                THEN

***        ANNOUNCE FILE TYPE

          WRITE(6,'(A1)') ' '
          DO  I=1,NFOUT
              EVALUE = PKTYP(U(I))

              IF (EVALUE.NE.'****' .AND. EVALUE.NE.'SQ98'
     +                             .AND. EVALUE.NE.'SQ89')     THEN

                  NAME = DEFNAM(I)
                  IF (EVALUE.EQ.'    ') WRITE(6,6200) U(I),TRIM( NAME )
                  IF (EVALUE.EQ.'PK84') WRITE(6,6201) U(I),TRIM( NAME )
                  IF (EVALUE.EQ.'FTN ') WRITE(6,6202) U(I),TRIM( NAME )
                  IF (EVALUE.EQ.'FMT ') WRITE(6,6203) U(I),TRIM( NAME )
              END IF
          END DO
          WRITE(6,'(A1)') ' '
              
      END IF

***    CHECK THE "DATFMT" ENVIRONMENT VARIABLE AND
***    SET DATE_CONVERSION_FACTOR CORRESPONDINGLY.

      CALL GETENVC( DATFMT,EVALUE )

      IF (EVALUE /= ' ') CALL LOW2UP(  EVALUE,EVALUE )

      IF (EVALUE == ' ')                                       THEN

          IF (PKTYP(0)(1:2).EQ.'SQ')
     +    DATE_CONVERSION_FACTOR = 1 00 00 00 ! DEFAULT FACTOR CMC/RPN

          IF (PKTYP(0)(1:2).EQ.'PK')
     +    DATE_CONVERSION_FACTOR = 00         ! DEFAULT FACTOR CCC

      END IF

      IF      (EVALUE == 'YYYYMMDDHHMMSS')                     THEN
          DATE_CONVERSION_FACTOR = 1 00
      ELSE IF (EVALUE == 'YYYYMMDDHHMM'  )                     THEN
          DATE_CONVERSION_FACTOR = 1 00 00
      ELSE IF (EVALUE == 'YYYYMMDDHH'    )                     THEN
          DATE_CONVERSION_FACTOR = 1 00 00 00 
      ELSE IF (EVALUE == 'YYYYMMDD'      )                     THEN
          DATE_CONVERSION_FACTOR = D8
      ELSE IF (EVALUE == 'YYYYMM'        )                     THEN
          DATE_CONVERSION_FACTOR = DA
      ELSE IF (EVALUE == 'YYYYMM'        )                     THEN
          DATE_CONVERSION_FACTOR = DC
      ELSE IF (EVALUE(1:8) == 'TIMESTEP' )                     THEN
          DATE_CONVERSION_FACTOR = -1
      ELSE IF (EVALUE /= ' '             )                     THEN
          IF (INFO) WRITE(6,6450) TRIM( EVALUE )
          DATE_CONVERSION_FACTOR = 1
      END IF

***    INITALIZE THE CCCMA GCM'S CONSTANT COMMONS.

      CALL SPWCON7( FVORT,PI )

      IF (PKTYP(0).EQ.'SQ98')                                  THEN

***        CHECK FOR THE CMC/RPN MISSING VALUE PACKAGE.

          IF (MValue_IS_OFF)                                   THEN
              ! Explicitely turn off the missing value
              ! decoder for all supported datatypes.
              call set_missing_value_mapping( 11, 1, DUMMY, 0,0,0 ) ! real(4)
              call set_missing_value_mapping( 11, 1, DUMMY, 0,0,1 ) ! real(8)
              call set_missing_value_mapping( 11, 2, DUMMY, 0,0,0 ) ! unsigned integer(4)
              call set_missing_value_mapping( 11, 2, DUMMY, 0,1,0 ) ! unsigned integer(2)
              call set_missing_value_mapping( 11, 2, DUMMY, 1,0,0 ) ! unsigned integer(1)
              call set_missing_value_mapping( 11, 4, DUMMY, 0,0,0 ) ! integer(4)
              call set_missing_value_mapping( 11, 4, DUMMY, 0,1,0 ) ! integer(2)
              call set_missing_value_mapping( 11, 4, DUMMY, 1,0,0 ) ! integer(1)
          ELSE IF (MISSING_VALUE_USED() == 1)                  THEN
              ! Means that the environment variable
              ! MISSING_VALUE_FLAGS was set. To what ?
              IER = GET_MISSING_VALUE_FLAGS(
     +              misf, misi, misui, misd, misa, misus, misb, misub )
              IF (MValue .and. MValue_READ)                    THEN
                  misf = MisFlag
                  misd = MisFlag
                  CALL SET_MISSING_VALUE_FLAGS(
     +              misf, misi, misui, misd, misa, misus, misb, misub )
              ELSE IF (.not.MValue_IS_OFF)                     THEN
                  MValue = Vrai ; MisFlag = misd
              END IF
          ELSE IF (MValue)                                     THEN
              IF (MValue_READ)                                 THEN
                  misf = MisFlag
                  misd = MisFlag
              ELSE
                  MisFlag = misd
              END IF
              CALL SET_MISSING_VALUE_FLAGS(
     +             misf, misi, misui, misd, misa, misus, misb, misub )
          END IF

      ELSE IF (MValue)                                         THEN
          IF (MValue_READ)                                 THEN
              misf = MisFlag
              misd = MisFlag
          ELSE
              MisFlag = misd
          END IF
      END IF

      IF (MValue .AND. INFO) 
     +    WRITE(6,6400) MisFlag,Epsilon

      IF (PKTYP(0).EQ.'SQ98')                                  THEN

***       INITIALIZE TYPE AND ETIKET IN THE CMC/RPN CASE.

          ZLABEL = ' '
          ZNAME  = ' '
          ZTYPE  = ' '
          CALL PUTPARC( 'TYPVAR','P' )
          CALL PUTPARC( 'ETIKET','RPNSQI' )
      END IF

      IF (PKTYP(0).EQ.'SQ98')                                  THEN

***        SAVE THE "LISTE" ARRAY FOR POSSIBLE STD98 ACCESS.

          J = 0
          DO  I=1,IPOS-1
CCC           IF (STATF(I).EQ.'OLD')                           THEN
                  LISTE(J+1) = U(I)
                  J          = J+1
CCC           END IF
          END DO

          CALL INICLE( J,LISTE )

      END IF

***    RETURN THE NUMBER OF FILES OPENED.

      NF = NFOUT

      RETURN

***    I/O ERRORS OTHER THAN INQUIRE/OPEN.

  916 IF (INFO) WRITE(6,6016) IO
      CALL MESSYS( 'In Jclpnt...' )
      CALL                                         XIT(' Jclpnt ',-16)

      RETURN

***    INQUIRE/OPEN ERROR PROCESSING.

  999 IF (INFO) WRITE(6,6004) IU,IO,COMMAND,TRIM( NAME )
      CALL MESSYS( 'In Jclpnt...' )
      CALL                                         XIT(' Jclpnt ',-4 )

      RETURN
*----------------------------------------------------------------------

***    GETNAM ENTRY POINT

      ENTRY GETNAM( IUQ,NAMEQ )

***   PARAMETERS...
***    IUQ   = THE I/O UNIT FOR WHICH THE FILE NAME IS SOUGHT.
***            JCLPNT HAS TO HAVE BEEN CALLED PRIOR TO THIS.
***    NAMEQ = THE RETURNING FILE NAME. GETNAM WILL RETURN
***            A BLANK VALUE IF NOT SUCCESSFULL.

      IF (ZZZJCL.NE.' ')                                       THEN
          IF (INFO) WRITE(6,6011) 'GetNam'
          CALL                                     XIT(' Jclpnt ',-11 )
      END IF

      IF (IPOS.GT.1)                                           THEN

***        CHECK ALL VALID UNIT NUMBERS/NAMES.

          DO  250 I=1,IPOS-1

              IF (IUQ.EQ.U(I))                                 THEN

                  NAMEQ = DEFNAM(I)
                  GOTO 300
              END IF

  250     CONTINUE

      END IF

***    EITHER JCLPNT HAS NOT BEEN CALLED OR 
***    NO POSITIONAL PARAMETERS WHERE FOUND.

      IF (INFO) WRITE(6,6150) ' GetNam  '
      NAMEQ = ' '

  300 RETURN

*----------------------------------------------------------------------
***    GETPOSIT ENTRY POINT

      ENTRY GETPOSIT( IUQ,POSITQ )

***   PARAMETERS...
***    IUQ    = THE I/O UNIT FOR WHICH THE FILE POSITIONING IS SOUGHT.
***             JCLPNT HAS TO HAVE BEEN CALLED PRIOR TO THIS.
***    POSITQ = THE RETURNING FILE POSITIONING. THE VALUES RECOGNIZED
***             ARE 'DEF', 'OVER' AND 'APPEND'. THE FIRST TWO OPTIONS
***             IMPLY THAT THE ORIGINAL DATA IS TO BE OVERWRITTEN. THE
***             THIRD IMPLIES THAT NEW DATA IS TO BE APPENDED TO ANY
***             OF THE OLD. UNKNOWN IUQ RETURN BLANK POSIF.

      IF (ZZZJCL.NE.' ')                                       THEN
          IF (INFO) WRITE(6,6011) 'GetPosit'
          CALL                                     XIT(' Jclpnt ',-11 )
      END IF

      IF (IPOS.GT.1)                                           THEN

***        CHECK ALL VALID UNIT NUMBERS/STATES.

          DO  350 I=1,IPOS-1

              IF (IUQ.EQ.U(I))                                 THEN
                  POSITQ = POSITF(I)
                  GOTO 400
              END IF

  350     CONTINUE

      END IF

***    EITHER JCLPNT HAS NOT BEEN CALLED OR 
***    NO POSITIONAL PARAMETERS WHERE FOUND.

      IF (INFO) WRITE(6,6150) ' GetPosit'
      POSITQ = ' '

  400 RETURN
*----------------------------------------------------------------------

***    GETSTAT ENTRY POINT

      ENTRY GETSTAT( IUQ,STATQ )

***   PARAMETERS...
***    IUQ   = THE I/O UNIT FOR WHICH THE FILE STATE IS SOUGHT.
***            JCLPNT HAS TO HAVE BEEN CALLED PRIOR TO THIS.
***    STATQ = THE RETURNING FILE STATE. GETSTAT WILL RETURN
***            A BLANK VALUE IF NOT SUCCESSFULL.

      IF (ZZZJCL.NE.' ')                                       THEN
          IF (INFO) WRITE(6,6011) 'GetStat'
          CALL                                     XIT(' Jclpnt ',-11 )
      END IF

      IF (IPOS.GT.1)                                           THEN

***        CHECK ALL VALID UNIT NUMBERS/STATES.

          DO  450 I=1,IPOS-1

              IF (IUQ.EQ.U(I))                                 THEN
                  STATQ = STATF(I)
                  GOTO 500
              END IF

  450     CONTINUE

      END IF

***    EITHER JCLPNT HAS NOT BEEN CALLED OR 
***    NO POSITIONAL PARAMETERS WHERE FOUND.

      IF (INFO) WRITE(6,6150) ' GetStat '
      STATQ = ' '

  500 RETURN

*----------------------------------------------------------------------
***    GETTMPN ENTRY POINT

      ENTRY GETMPN( TMPVAL )

***   PARAMETERS...
***    TMPVAL = THE RETURNING VERB GETTMPN WILL RETURN
***             THE CURRENT TEMPORARY DIRECTORY NAME.

      IF (ZZZJCL.NE.' ')                                       THEN
          IF (INFO) WRITE(6,6011) 'GeTMPN'
          CALL                                     XIT(' Jclpnt ',-11 )
      END IF

      TMPVAL = TMPDIRN

      RETURN
*----------------------------------------------------------------------

***    GETVERB/PUTVERB ENTRY POINTS

      ENTRY GETVERB( NAMEV )

***   PARAMETER...
***    NAMEV = THE RETURNING VERB GETNAM WILL RETURN
***            A BLANK VALUE IF NOT SUCCESSFULL.

      NAMEV = ' '

      IF (PROGRAM_NAME == ' ')                                 THEN

         ! EITHER JCLPNT HAS NOT BEEN CALLED OR 
         ! NO POSITIONAL PARAMETERS WHERE FOUND.
         ! USE GET_COMMAND_ARGUMENT TO FIND THE
         ! ACTUAL COMMAND NAME.

          CALL GET_COMMAND_ARGUMENT( 0, PROGRAM_NAME )

          J = LEN( PROGRAM_NAME ) ; EVALUE = PROGRAM_NAME

          ! Strip any (leading) directory info
          DO  I=J,1,-1
              IF (PROGRAM_NAME(I:I) == '/') EXIT
          END DO

          PROGRAM_NAME = PROGRAM_NAME(I+1:J) ; J = J-I

          ! Strip any name extensions (starting with
          !   a period). Stop at the first blank
          DO  I=1,J
             IF (PROGRAM_NAME(I:I) == '.'   .OR.
     +           PROGRAM_NAME(I:I) == ' ' ) EXIT
          END DO

          PROGRAM_NAME = PROGRAM_NAME(1:I-1)

          IF (PROGRAM_NAME == ' ')                             THEN
              WRITE(6,6250) TRIM( EVALUE )
              CALL                                 XIT(' Jclpnt ',-11 )
          ELSE IF (INFO)                                       THEN
              WRITE(6,6251) TRIM( PROGRAM_NAME )
          END IF

      END IF

      NAMEV = PROGRAM_NAME

      RETURN

      ENTRY PUTVERB( NAMEV )

***   PARAMETER...
***    NAMEV = THE CALLING VERB NAME. CANNOT BE EMPTY.

      IF (NAMEV /= ' ') PROGRAM_NAME = NAMEV

      RETURN

*----------------------------------------------------------------------
***    MISPAR ENTRY POINT

      ENTRY MISPAR( LVALUE,RVALUE,REPSIL )

***   OUTPUT PARAMETERS...
***    LVALUE = RETURNS THE MISSING VALUE ACTIVE STATE (MValue).
***    RVALUE = VALUE TO CHECK FOR (MisFlag).
***    REPSIL = EPSILON VALUE

      LVALUE = MValue
      RVALUE = MisFlag
      REPSIL = Epsilon

      RETURN
*----------------------------------------------------------------------

      ENTRY SET_MISPAR( RVALUE,REPSIL )

***    SETS MValue TO TRUE AND DEFINES THE OTHER "MISSING VALUE" VARIABLES.
***    ALSO SETS UP THE CMC/RPN MISSING VALUE PACKAGE ACCORDINGLY.

***   INPUT PARAMETERS...
***    RVALUE = REAL VALUE TO CHECK FOR (MisFlag).
***    REPSIL = REAL EPSILON VALUE

      IF (MValue_IS_OFF) return

      MisFlag = RVALUE
      Epsilon = REPSIL

      IF (.not.MValue .AND. INFO) 
     +    WRITE(6,6400) MisFlag,Epsilon

      MValue  = Vrai

      IF (PKTYP(0).EQ.'SQ98')                                  THEN
          misf = MisFlag
          misd = MisFlag
          CALL SET_MISSING_VALUE_FLAGS(
     +         misf, misi, misui, misd, misa, misus, misb, misub )
      END IF

      RETURN
*----------------------------------------------------------------------

      ENTRY UNSET_MISPAR( )

***    SETS MVALUE TO FALSE (BUT ONLY IN AUTOMATIC MODE).

      IF (.NOT.Mvalue_READ)                                    THEN

          IF (MValue .AND. INFO) WRITE(6,6401)

          MVALUE  = Faux

      END IF

      RETURN
*----------------------------------------------------------------------

***    PUTPOSIT ENTRY POINT

      ENTRY PUTPOSIT( IUQ,POSITQ )

***   PARAMETERS...
***    IUQ    = THE I/O UNIT FOR WHICH THE FILE POSITIONING IS TO
***             BE SET. JCLPNT HAS TO HAVE BEEN CALLED PRIOR TO THIS.
***    POSITQ = THE DESIRED FILE POSITIONING. THE VALUES RECOGNIZED
***             ARE 'DEF', 'OVER' AND 'APPEND'. THE FIRST TWO OPTIONS
***             IMPLY THAT THE ORIGINAL DATA IS TO BE OVERWRITTEN. THE
***             THIRD IMPLIES THAT NEW DATA IS TO BE APPENDED TO ANY
***             OF THE OLD.

      IU       = IUQ
      POSITION = POSITQ
      CALL LOW2UP( POSITION,POSITION )

      IF (ZZZJCL.NE.' ')                                       THEN
          IF (INFO) WRITE(6,6011) 'PutPosit'
          CALL                                     XIT(' Jclpnt ',-11 )
      ELSE IF (POSITION.NE.'DEF'    .AND.
     +         POSITION.NE.'OVER'   .AND.
     +         POSITION.NE.'APPEND')                           THEN
          IF (INFO) WRITE(6,6012) POSITQ
          CALL                                     XIT(' Jclpnt ',-12 )
      ELSE IF (IUQ.EQ.5 .OR. IUQ.EQ.6)                         THEN
          IF (INFO) WRITE(6,6350) IUQ
          RETURN
      END IF

      IF (IPOS.GT.1)                                           THEN

***        CHECK ALL VALID UNIT NUMBERS/STATES.

          DO  600 I=1,IPOS-1

              IF (IU.EQ.U(I))                                  THEN

***                CLOSE UNIT AND RE-OPPEN WITH NEW POSITIONING INFO.

                  POSITF(I) = POSITION

                  NAME      = DEFNAM(I)

                  IF (PKTYP(U(I)).NE.'SQ89' .AND.
     +                PKTYP(U(I)).NE.'SQ98' )                  THEN

***                    DO IT FOR CCC (PK92) OR CCC/RPN (PK84) FILES.

                      CLOSE( U(I) )

                      IF (POSITION.EQ.'DEF'  .OR.
     +                    POSITION.EQ.'OVER' .OR.
     +                    STATF(I).EQ.'NEW'  )                 THEN

                          COMMAND = '!OPEN_SEQ_UNF!'

                          OPEN( UNIT=U(I), FILE=NAME,
     +                                     ERR=999,IOSTAT=IO,
     +                                     STATUS=STATF(I),
     +                                     ACCESS='SEQUENTIAL',
     +                                     FORM='UNFORMATTED' )

                      ELSE IF (POSITION.EQ.'APPEND')           THEN

                          COMMAND = '!OPEN_APPEND_UNF!'
#                         if defined (F77)
                          OPEN( UNIT=U(I), FILE=NAME,
     +                                     ERR=999,IOSTAT=IO,
     +                                     STATUS=STATF(I),
     +                                     ACCESS='APPEND',
     +                                     FORM='UNFORMATTED' )
#                         else
                          OPEN( UNIT=U(I), FILE=NAME,
     +                                     ERR=999,IOSTAT=IO,
     +                                     STATUS=STATF(I),
     +                                     ACCESS='SEQUENTIAL',
     +                                     POSITION='APPEND',
     +                                     FORM='UNFORMATTED' )
#                         endif
                      END IF

                  ELSE

***                    DO IT FOR RPN STD FILES.

                      ERR = FSTFRM( IU )

                      IF (ERR.EQ.0)                            THEN

                          ERR = fclos( IU )

                          IF (ERR.EQ.0)                        THEN

                              CALL OUVSTD( IU, NAME,PKTYP(IU),STATF(I) )

                          ELSE

                              IF (INFO)
     +                        WRITE(6,6013) POSITQ,TRIM( NAME )
                              CALL                 XIT(' Jclpnt ',-13 )

                          END IF

                      ELSE

                          IF (INFO)
     +                    WRITE(6,6013) POSITQ,TRIM( NAME )
                          CALL                     XIT(' Jclpnt ',-13 )

                      END IF

                  END IF

                  GOTO 650

              END IF

  600     CONTINUE

      END IF

***    EITHER JCLPNT HAS NOT BEEN CALLED OR 
***    NO POSITIONAL PARAMETERS WHERE FOUND.

      IF (INFO) WRITE(6,6150) ' PutPosit'

  650 RETURN
*----------------------------------------------------------------------

***    TYPSET ENTRY POINT

      ENTRY TYPSET ( LVALUE )

***   PARAMETERS...
***    LVALUE = LOGICAL VALUE INDICATING WETHER THE OUTPUT FILE
***             TYPE WAS SET USING THE "DEFAULT_PACKING_TYPE" ENV
***             VARIABLE OR USING THE "-opktyp" COMMAND PARAMETER.

      IF (ZZZJCL.NE.' ')                                       THEN
          IF (INFO) WRITE(6,6011) 'TypSet'
          CALL                                     XIT(' Jclpnt ',-11 )
      END IF

      LVALUE = SETYP

      RETURN

*----------------------------------------------------------------------
***    DATE2STAMP ENTRY POINT

      ENTRY DATE2STAMP ( DATE8,DATE_TIME_STAMP )

***   PARAMETERS...
***    DATE8           = INPUT "PRINTABLE" DATE
***    DATE_TIME_STAMP = OUTPUT CMC/RPN DATE-TIME-STAMP

      IF (DATE_CONVERSION_FACTOR <= 1 .AND.
     +    DATE8 < 123 200 000_8)                               THEN

***        CECI EST SOIT UN DATE_TIME_STAMP EN
***        VIEUX FORMAT, OU UN PAS DE TEMPS, OU...

          DATE_TIME_STAMP = INT( DATE8,8 )
          RETURN

      END IF

      IF (DATE_CONVERSION_FACTOR >= UN8)                       THEN

          YYYYMMDD8 =      (DATE_CONVERSION_FACTOR*DATE8)/D8  
          HHMMSShh8 = MOD( (DATE_CONVERSION_FACTOR*DATE8),D8 )
          YYYYMMDD = YYYYMMDD8 ; HHMMSShh = HHMMSShh8

          ERR = NEWDATE( DATE_TIME_STAMP, YYYYMMDD,HHMMSShh, +3 )

      ELSE

          ERR = 1

      END IF

      IF (ERR /= 0) DATE_TIME_STAMP = DATE8


      RETURN
*----------------------------------------------------------------------

***    STAMP2DATE ENTRY POINT

      ENTRY STAMP2DATE ( DATE_TIME_STAMP,DATE8 )

***   PARAMETERS...
***    DATE_TIME_STAMP = INPUT 32-BIT CMC/RPN DATE-TIME-STAMP.
***    DATE8           = CORRESPONDING OUTPUT "PRINTABLE" DATE

      IF (DATE_CONVERSION_FACTOR >= 0_8)                       THEN
          ERR = NEWDATE( DATE_TIME_STAMP, YYYYMMDD,HHMMSShh, -3 )
      ELSE
          ERR = 1
      END IF

      IF (ERR == 0)                                            THEN
          YYYYMMDD8 = YYYYMMDD ; HHMMSShh8 = HHMMSShh
          IF (DATE_CONVERSION_FACTOR > 0_8)                    THEN
              DATE8 = ( YYYYMMDD8 * D8 + HHMMSShh8 )
     +                  / DATE_CONVERSION_FACTOR
          ELSE
              DATE8 = YYYYMMDD8 * 1 00_8 + (HHMMSShh8 / 1 00 00 00_8)
          END IF
      ELSE
          DATE8 = DATE_TIME_STAMP
      END IF

      RETURN

*----------------------------------------------------------------------

***    SET_DTM ENTRY POINT

      ENTRY SET_DTM ( DTM )

***   PARAMETERS...
*      DTM = FLAG TO INDICATE METHOD OF TIME MEASUREMENT IN CCC FILES
*          = 0 ==> TIME IN UNITS OF TIME STEPS.
*          = 1 ==> TIME IN YYYYMMDDHH FORMAT, NO LEAP YEARS.
*          = 2 ==> TIME IN YYYYMMDDHHMM FORMAT AND AGAIN, NO LEAP YEARS.
*          = 3 ==> TIME IN YYYYMMDDHH FORMAT, LEAP YEARS ACCOUNTED FOR.
*          = 4 ==> TIME IN YYYYMMDDHHMM FORMAT AND AGAIN, LEAP YEARS ACCOUNTED FOR.

      IF (DTM == 0)                                            THEN
          DATE_CONVERSION_FACTOR = 0
      ELSE IF (DTM == 1)                                       THEN
          DATE_CONVERSION_FACTOR = 1 00 00 00
          CALL Ignore_LeapYear()
      ELSE IF (DTM == 2)                                       THEN
          DATE_CONVERSION_FACTOR = 1 00 00
          CALL Ignore_LeapYear()
      ELSE IF (DTM == 3)                                       THEN
          DATE_CONVERSION_FACTOR = 1 00 00 00
          CALL Accept_LeapYear()
      ELSE IF (DTM == 4)                                       THEN
          DATE_CONVERSION_FACTOR = 1 00 00
          CALL Accept_LeapYear()
      END IF

      RETURN

*----------------------------------------------------------------------

***    GET_DCF ENTRY POINT

      ENTRY GET_DCF ( IOVAL8 )

***   PARAMETERS...
*      IOVAL8 = RETURNS THE VALUE OF DATE_CONVERSION_FACTOR

      IOVAL8 = DATE_CONVERSION_FACTOR

      RETURN

*----------------------------------------------------------------------

***    SET_DCF ENTRY POINT

      ENTRY SET_DCF ( IOVAL8 )

***   PARAMETERS...
*      IOVAL8 = THE NEW VALUE OF DATE_CONVERSION_FACTOR

      DATE_CONVERSION_FACTOR = IOVAL8

      RETURN

*----------------------------------------------------------------------

***    GET_CENDIAN ENTRY POINT

      ENTRY GET_CENDIAN ( IOVAL )

***   OUTPUT PARAMETER...
*      IOVAL = 0, TREAT CHARACTERS AS LITTLE ENDIANS OBJECTS
*              1, TREAT CHARACTERS AS BIG ENDIANS (DEFAULT)

      IOVAL = CENDIAN

      RETURN

*----------------------------------------------------------------------
***    GET_INFOMOD ENTRY POINT

      ENTRY GET_INFOMOD ( LVALUE )

***   OUTPUT PARAMETER...
*      LVALUE = RETURNS THE VALUE OF THE INFO (ZZVERBO) GLOBAL FLAG

      LVALUE = INFO

      RETURN

*----------------------------------------------------------------------

 6000 format('0*** ',A)
 6001 format(' JCLPNT received NF=',I3,'. maximum value is ',I3)
 6003 format(' JCLPNT error openning stdin. file index ',I2.2,
     +       ', name ',A/)
 6004 format(' JCLPNT on unit ',I3,' returns I/O error number ',I3/
     +       ' with command ',A32/' with file ',A/ )
 6005 format(' JCLPNT is unable to detemine the file type for ',A/)
 6006 format(' JCLPNT does not support the file type ',I2,' of ',A/)
 6007 format(' JCLPNT: Requested type ',A4,', found type ',A4/)
 6008 format(' JCLPNT: Unknow value for SEQ parameter: ',A/)
 6009 format(' JCLPNT: Integer and real words have different sizes.',/)
 6010 format(' JCLPNT: Tmpdir or big_tmpdir not defined.'/)
 6011 format(' JCLPNT: Please call JCLPNT before calling ',A/)
 6012 format(' JCLPNT: Unknown positioning option ',A,/)
 6013 format(' JCLPNT: Cannot define positioning ',A,' for file ',A/)
 6014 FORMAT(' JCLPNT: I/O unit number too large ',I4,' for file ',A/)
 6015 FORMAT(' JCLPNT: Assumed binary FTN, type =',I3,' for file ',A/)
 6016 format(' JCLPNT: Error no.',I4,' while reading parametre'/)
 6017 FORMAT(' JCLPNT: File ',A,' does not exist'/)

 6099 format(' *** Detected previous xit abort value ',I3,' ***')

 6100 format('     ',A)
 6150 format(A,': Either JCLPNT has not yet been called or'/
     + '          the positional I/O unit number was not found.')
 6200 format(' Unit ',I2,', file ',A,' is open as type ccrn (blank',
     +       ' or PK92).')
 6201 format(' Unit ',I2,', file ',A,' is open as type ccrn-rpn',
     +       ' (PK84).')
 6202 format(' Unit ',I2,', file ',A,' is open as type FTN binary.')
 6203 format(' Unit ',I2,', file ',A,' is open as type FTN formatted.')
 6250 format(' GETVERB: Unable to identify the command name in'/
     +             10X,'the following string...'/10X,A/)
 6251 format(' GETVERB: Found command name ',A/)
 6300 format(' JCLPNT: In program ',A,
     +       ' the following file names were not assigned: ')
 6350 format(' JCLPNT: Will not reset unit ',I1,' positioning.')
 6400 format(/' JCLPNT/SET_MISFLAG: Missing value mode ON; Misflag =',
     +       G20.10,', Epsilon =',G20.10/)
 6401 format(/' UNSET_MISPAR: Missing value mode OFF '/)
 6450 format(' JCPNT: Unrecognized date format = ',A//
     +       ' Please set the DATE_FORMAT environment variable'/
     +       ' to something like YYYYMMDDHHMMSS or YYYYMMDDHH')

 7000 format('*DEBUG:JCLPNT openning file ',A,', I/O unit = ',i2,
     +       ', pktyp = ',A,', status = ',A)

      end

      SUBROUTINE macspe (HEAD,ZERO)

***    NOV 28/90  - B.DUGAS, RPN.

***    SETS CERTAINS MACHINE SPECIFIC VALUES. 
***    A FEW OF THESE ARE AS WELL RETURNED.

      IMPLICIT  none

      REAL      ZERO
      INTEGER   HEAD,DUMMY

      CHARACTER          RECABT*4

      COMMON   /MAXWRD/  MAXWRD
      INTEGER            MAXWRD

#     include  "machtype.cdk"

      INTEGER   ME32O64,INTEFLT,CHKENDI
      EXTERNAL  ME32O64,INTEFLT,CHKENDI

      EXTERNAL GETRABT,SETRABT
*-----------------------------------------------------------------------
***     INITIALISE COMMON BLOCK MACHTYP.

      MACHINE = ME32O64( DUMMY )
      INTSIZE = INTEFLT( DUMMY )
      BIGENDI = CHKENDI( DUMMY )

***    'ZERO' PROVIDES THE CALLING ROUTINE WITH A BINARY
***     REPRESENTATION OF A FLOATING POINT ZERO.

      ZERO = 0.0

***    INITIALIZE MAXIMUM NUMBER OF REAL WORDS TO -1
***    FOR GETSIZ/2 AND RECGET (JCLPNT DOES THE SAME).

      MAXWRD = -1

***    'HEAD' IS THE PHYSICAL LENGHT IN MACHINE WORDS OF
***     THE IBUF ARRAY IN MEMORY. THIS IS NOT THE SAME AS
***     THE STORAGE SIZE, WHICH IS OBVIOUSLY DEPENDANT ON
***     THE HOST'S MACHINE WORD. ON A MIPS R2000/R3000 OR
***     ON MOST WORKSTATIONS, THIS LAST IS 16 AND ON A CRAY,
***     IT IS 8. THE 'HEAD' IS ALSO USED BY THE PROGRAMS
***     TO STORE DYNAMIC INFORMATION ON THE RECORDS
***     THEMSELVES.

      HEAD = taille_entete

***     RECABT IS A FLAG THAT SIGNALS THE REC*** ROUTINES TO ABORT
***     ON ERROR CONDITIONS. CERTAIN PROGRAMS MAY NOT WANT THIS TO
***     BE TRUE (SUCH AS GGSTAT, INVNTRY AND XFIND...). THE DEFAULT
***     IS TO ABORT.

      CALL GETRABT( RECABT )
      IF (RECABT.NE.'&NON') CALL SETRABT( '&OUI' )

*-----------------------------------------------------------------------
      RETURN
      END 

      INTEGER FUNCTION mpserv (SERVICE,number)

***    FEV 22/91 - B.Dugas, RPN.

***    Cette routine sert de concentrateur a tous les appels de
***    services multi-taches sur les machines Silicon Graphics.

***    Valeurs d'input:
***     SERVICE = Chaine de caracteres denotant le service requis.
***     NUMBER  = Parametre optionnel a passer aux services.

***    Valeurs de retour: (DANS mpserv)
***      = 0, denote un probleme.
***      > 0, correspondent au nombre de ficelles permises.
***      < 0, indiquent le code de service rendu.

***    Valeurs de retour: (DANS number)
***      Aucune, sauf si SERVICE=THREADNUM. Alors seulement,
***      number contient le numero de la ficelle d'execution.

***    Les paires de valeurs reconnues sont: -1 ==> BLOCK
***         (INPUT/OUTPUT)                   -2 ==> UNBLOCK
***                                          -3 ==> DESTROY
***                                          -4 ==> CREATE
***                                          -5 ==> BLOCKTIME
***                                          -6 ==> THREADNUM

      IMPLICIT      none

      COMMON       /ZZTHRDS/ Check, NPs

      CHARACTER*8   Check
      CHARACTER*(*) SERVICE
      INTEGER       number, NPs

      LOGICAL                INFO
      COMMON       /ZZVERBO/ INFO

!!    CHARACTER     EVAL*8
!!    INTEGER       Mp_My_ThreadNum
!!    EXTERNAL      Mp_My_ThreadNum, Mp_Set_NumThreads,
!!   +              Mp_Block,        Mp_UnBlock,
!!   +              Mp_Destroy,      Mp_Create,
!!   +              Mp_BlockTime,    GETENVC
C
*------------------------------------------------------------------
!!    IF (SERVICE.EQ.'THREADS')                                THEN
C
!!        IF (Check.NE.'Mp_Check')                             THEN
!!            CALL GETENVC('MP_SET_NUMTHREADS',EVAL )
!!            READ(EVAL,'(BN,I4)') NPs
!!            NPs =  MIN( NUMBER, MAX( 1, NPs ) )
!!            IF (NPs.GT.1) CALL Mp_Set_NumThreads( NPs )
!!            Check   = 'Mp_Check'
!!        ELSE IF (NUMBER.GT.1)                                THEN
!!            NPs     =  MIN( NUMBER, NPs )
!!        END IF
!!        mpserv      =  NPs
C
!!    ELSE IF (SERVICE.EQ.'BLOCK')                             THEN
C
!!        IF (NPs.GT.1) CALL Mp_Block()
!!        mpserv = -1
C
!!    ELSE IF (SERVICE.EQ.'UNBLOCK')                           THEN
C
!!        IF (NPs.GT.1) CALL Mp_UnBlock()
!!        mpserv = -2
C
!!    ELSE IF (SERVICE.EQ.'DESTROY')                           THEN
C
!!        IF (NPs.GT.1) CALL Mp_Destroy()
!!        mpserv = -3
C
!!    ELSE IF (SERVICE.EQ.'CREATE')                            THEN
C
!!        IF (NPs.GT.1) CALL Mp_Create( NUMBER )
!!        mpserv = -4
C
!!    ELSE IF (SERVICE.EQ.'BLOCKTIME')                         THEN
C
!!        IF (NPs.GT.1) CALL Mp_BlockTime( NUMBER )
!!        mpserv = -5
C
!!    ELSE IF (SERVICE.EQ.'THREADNUM')                         THEN
C
!!        NUMBER = Mp_My_ThreadNum()
!!        mpserv = -6
C
!!    ELSE
C
!!        IF (INFO) WRITE(6,6000) SERVICE
!!        mpserv =  0
C
!!    END IF
C
!!    RETURN
C
*------------------------------------------------------------------
      IF (SERVICE.EQ.'THREADS')                                THEN

          IF (Check.NE.'Mp_Check')                             THEN
              NPs   =  1
              Check = 'Mp_Check'
          ELSE IF (NUMBER.GT.0)                                THEN
              NPs   =  MIN( NUMBER, NPs )
          END IF
          mpserv    =  NPs

      ELSE IF (SERVICE.EQ.'BLOCK')                             THEN

          mpserv = -1

      ELSE IF (SERVICE.EQ.'UNBLOCK')                           THEN

          mpserv = -2

      ELSE IF (SERVICE.EQ.'DESTROY')                           THEN

          mpserv = -3

      ELSE IF (SERVICE.EQ.'CREATE')                            THEN

          mpserv = -4

      ELSE IF (SERVICE.EQ.'BLOCKTIME')                         THEN

          mpserv = -5

      ELSE IF (SERVICE.EQ.'THREADNUM')                         THEN

          mpserv = -6

      ELSE

          IF (INFO) WRITE(6,6000) SERVICE
          mpserv =  0

      END IF
 
      RETURN
*-------------------------------------------------------------------

 6000 FORMAT(' Service non-reconnu: ',A)

      END
      SUBROUTINE quit (NAME,STATUS)

      character*(*) name
      integer       status

      INTEGER       IO
      LOGICAL       OP
      CHARACTER*8   JOB

      LOGICAL                INFO
      COMMON       /ZZVERBO/ INFO

      CHARACTER*512                            DIAGEXT
      LOGICAL                DEXIT, SET_DEXIT
      COMMON       /DEXIT/   DEXIT, SET_DEXIT, DIAGEXT

      EXTERNAL      GETENVC,QQEXIT
*-------------------------------------------------------------------

      INQUIRE( UNIT=99, OPENED=OP )
      IF (OP) CLOSE( 99 )

      JOB = ' '
      CALL GETENVC( 'JOB',JOB )

      IF (STATUS.NE.0)                                         THEN

          IF (DEXIT)                                           THEN
              OPEN( UNIT=99, FILE=DIAGEXT, ERR=100,IOSTAT=IO,
     +                       STATUS='OLD', ACCESS='SEQUENTIAL',
     +                                     FORM='FORMATTED' )
          ELSE IF (SET_DEXIT)                                  THEN
              OPEN( UNIT=99, FILE=DIAGEXT, ERR=100,IOSTAT=IO,
     +                       STATUS='NEW', ACCESS='SEQUENTIAL',
     +                                     FORM='FORMATTED' )
          END IF

          IF (INFO) WRITE(6,6000) STATUS,trim( NAME ),JOB

          IF (DEXIT .OR. SET_DEXIT)                            THEN

              WRITE( 99,6000, ERR=100,IOSTAT=IO )STATUS,trim( NAME ),JOB
              CLOSE ( 99 )

              CALL qqexit( 0 )

          ELSE

              CALL qqexit( STATUS )

          END IF

      END IF

 100  IF (INFO) WRITE(6,6000) STATUS,trim( NAME ),JOB
      CALL QQEXIT( STATUS )

      RETURN

*-------------------------------------------------------------------
 6000 format('*** Exit code abort ',I3,' in routine ',A,'_',A,' ***')

      END
      SUBROUTINE xit (NAME,N)

***    MAR 10/92 - B.DUGAS, RPN. (AJOUTER APPEL A MEMOIRC)
***    MAI 10/91 - B.DUGAS, RPN. (UTILISER UNE LISTE DES UNITE OUVERTES)
***    JAN 22/91 - B.DUGAS, RPN. (/EOR CONTROL AND "XITVAL" EV STRING)
***    NOV 21/90 - B.DUGAS, RPN. (PORT TO CY920/IRIX F77)

***    AUTHOR: NOV 24/82 - R.LAPRISE, CCRN.

***    TERMINATE A PROGRAM 'NAME', CLEANUP, ETC.  FOR N=... 

***    N.GE.0          OK        STOP   N   DASHED LINE.
***    N.LT.-100       WARNING   STOP  -N   LINE OF STARS.
***    -100.LT.N.LT.0  FATAL     ABORT -N  LINE OF STARS.

      use DIAG_TOC, only: EcrTOC

      IMPLICIT      none

      character*(*) name
      integer       n

      INTEGER,      PARAMETER :: MAXUNIT = unite_io_maximale

      LOGICAL       SAUVER_HY
      REAL          PTOP0,PREF0,RCOEF0,STIME
      CHARACTER*4   CHAR,DASH,STAR,PKTYP(0:MAXUNIT)
      CHARACTER*8   EVALUE*11,LIGNE*132,UNIT5*512
      LOGICAL       SAUVD(MAXUNIT),SAUVE(MAXUNIT),LOPEN(MAXUNIT),
     +              SAUVY(MAXUNIT),SAUVZ(MAXUNIT),SAUVU(MAXUNIT),OP
      INTEGER       I,IO,N99, STATUS, memoirc
      INTEGER       STIMEI,STIMEF,IRATE

CCC   external      etime
      real          totalt,usert,systt,ra(2)
!!!   equivalence  (ra(1),usert),(ra(2),systt)
      
      COMMON       /TIMER/   STIMEI
      COMMON       /IODIRE/  UNIT5
      COMMON       /ZZZOPEN/ LOPEN
      COMMON       /ZZPKTYP/ PKTYP
      COMMON       /OUICEST/ SAUVD,SAUVE,SAUVY,SAUVZ,SAUVU

      EXTERNAL      memoirc,QUIT

      INTEGER       FSTFRM,ERR
      EXTERNAL      FSTFRM,WRIZREF,ECRPT,GETPT,LIRPT,CLOZREF

      DATA          DASH/ '----' /, 
     +              STAR/ '****' /

*-----------------------------------------------------------------------
***    CHECK FOR I/O RE-DIRECTION. SAVE ONLY WHAT HAS NOT
***    BEEN READ YET.

      IF (UNIT5.NE.' ')                                        THEN

          INQUIRE( UNIT=99, OPENED=OP )
          IF (OP) CLOSE( 99 )

          N99 = 0
          OPEN (99,FORM='FORMATTED',STATUS='SCRATCH')

  050     READ(5,5000,END=100) LIGNE

              IF ((LIGNE(2:2).EQ.'E' .OR. LIGNE(2:2).EQ.'e') .AND. 
     +            (LIGNE(3:3).EQ.'O' .OR. LIGNE(3:3).EQ.'o') .AND.
     +            (LIGNE(4:4).EQ.'I' .OR. LIGNE(4:4).EQ.'i') .AND.
     +             LIGNE(5:5).EQ.' '                       )  
     +             GOTO 100

              WRITE(99,5000) LIGNE
              N99 = N99+1

          GOTO 050

  100     REWIND 99

***        DE-ASSIGN UNIT5. OPEN SAME FILE NAME UNDER ANOTHER UNIT.

          CLOSE( 5 )

          IF (LOPEN( 1 ))                                      THEN

              IF (PKTYP(1).NE.'SQ89' .AND. PKTYP(1).NE.'SQ98') THEN
                  CLOSE( 1 )
              ELSE
                  ERR = FSTFRM( I )
              END IF

          ELSE
              PKTYP(1)   = ' '
              LOPEN( 1 ) = .TRUE.
          END IF

          OPEN( UNIT=1, FILE=UNIT5,   ERR=200,IOSTAT=IO,
     +                  STATUS='OLD', ACCESS='SEQUENTIAL',
     +                                FORM='FORMATTED' )

          IF (N99.NE.0)                                        THEN

***            COPY SCRATCH UNIT CONTENT ONTO FILE UNIT5.

  150         READ(99,5000,END=200) LIGNE
              WRITE(1,5000) LIGNE
              GOTO 150

          ELSE

***            FILE IS AT EOI.

              WRITE(1,'("*EOI")')

          END IF

          CLOSE( 99 )

      END IF

***    VERIFIER L'INTEGRITE DU TAS (UTILISEE POUR 
***    L'ALLOCATION/DESALLOCATION DE MEMOIRE).

  200 I = MEMOIRC( 0 )

***    CHECK FOR AVAILABLE HY RECORDS ONE LAST
***    TIME IF THERE IS A NEED FOR ONE.

      SAUVER_HY = .FALSE.
      DO  I=1,MAXUNIT
          IF (LOPEN(I) .AND. SAUVE(I))                         THEN
              SAUVER_HY = .TRUE.
              GOTO 300
          END IF
      END DO

  300 IF (SAUVER_HY)                                           THEN

***        YES, WE NEED ONE.

          I = 0

  400     CALL getpt( 0, PTOP0,PREF0,RCOEF0 )

          IF (PTOP0.LT.0 .AND. I.LE.MAXUNIT)                   THEN

***            NO HY RECORD FOUND YET. SCAN OPEN INPUT FILES.

  500         I = I+1

              IF (PKTYP(I).EQ.'SQ89' .OR. PKTYP(I).EQ.'SQ98')  THEN
                  IF (LOPEN(I) .AND. .NOT.SAUVE(I))            THEN
                      CALL LIRPT( I )
                      GOTO 400
                  ENDIF
              ELSE IF (I.LT.MAXUNIT-1)                         THEN
                  GOTO 500
              END IF

          END IF

      END IF

***    CLOSE OPEN FILES.

      DO  I=1,MAXUNIT
          IF (LOPEN(I))                                        THEN

              IF (PKTYP(I).NE.'SQ89' .AND. PKTYP(I).NE.'SQ98') THEN
                  CLOSE( I )
              ELSE
                  IF (SAUVD(I) .OR. SAUVY(I) .OR. SAUVZ(I))    THEN
***                    SAUVER LE CONTENU DE ZCROCHETS.
                      CALL WRIZREF( I )
                  END IF
                  IF (SAUVU(I)) CALL WRITUREF(I)
                  IF (SAUVE(I)) CALL ECRPT( I )
                  CALL EcrTOC( I )
                  ERR = FSTFRM( I )
              END IF
          END IF
      END DO

      CALL CLOZREF()

***    GET TOTAL ELAPSED SYSTEM TIME AS WELL AS USER TIME.
#     if defined (AIX)
      CALL SETRTEOPTS('cpu_time_type=total_usertime')
      CALL CPU_TIME( usert )
#     else
      call etime( ra,totalt ) ; usert = ra(1) ; systt = ra(2)
#     endif
      CALL SYSTEM_CLOCK( STIMEF,IRATE )
      totalt = (STIMEF-STIMEI)/float( IRATE )

      CHAR = DASH
      IF (N.LT.0) CHAR=STAR

      WRITE(6,6010) CHAR, trim( NAME ),usert,totalt, (CHAR,I=1,4), N
      WRITE(EVALUE,'("XITVAL=",I4.3)') N

***    EXIT.

      IF (    N .GE.  0
     +   .OR. N .LT.-100)                                      THEN
          IF (N .LT.-100)
     +        WRITE(6,6020)
     +       ' ...ABNORMAL TERMINATION, ATTEMPTING TO CONTINUE...'
          CALL QUIT( NAME,0 )
      ELSE 
          STATUS = -N
          WRITE(6,6020)
     +   ' ...ABNORMAL TERMINATION.'
          CALL QUIT( NAME,STATUS )
      END IF

      RETURN

*-----------------------------------------------------------------------
 5000 FORMAT(A132)
 6010 FORMAT('0',A4,'  END  ',A,' AFTER (',f7.2,'u, ',F7.2,
     +              'w) SECONDS',2X,4A4,I5)
 6020 FORMAT(A)

      END 

      SUBROUTINE readf ( NF, F, NWDS,OK)

***    NOV 19/90 - B.DUGAS, RPN.

***    readf LIT (SEQUENTIELLEMENT) UN BLOC COMPLET DE F.

      IMPLICIT none

      INTEGER  IO,NF,NWDS,F(NWDS)
      LOGICAL  OK

      LOGICAL           INFO
      COMMON  /ZZVERBO/ INFO

      EXTERNAL MESSYS,XIT
*--------------------------------------------------------------------

***    OK EST FAUX AU DEPART. IL EST VRAI APRES UNE LECTURE CORRECTE.

      OK = .FALSE.

      READ( NF, ERR=100,END=101,IOSTAT=IO) F

      OK = .TRUE.

***    BRANCHEMENT D'ERREUR OU DE FIN DE FICHIER.

  100 IF (IO.NE.0)                                             THEN
          IF (INFO) WRITE(6,6000) NF, IO
          CALL MESSYS( 'In Readf...' )
      END IF

  101 RETURN

*---------------------------------------------------------------------
 6000 FORMAT('   Readf on unit ',I3,' returns I/O error number ',I3)

      END

      SUBROUTINE precede( NF,NLEV )

***    NOV 08/92  - B.Dugas, RPN.

***    precede RETOURNE AU DEBUT D'UN TAMPON D'INFORMATION PRECEDENT.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      LOGICAL     OK
      INTEGER     NF,NLEV,IBUF(HEAD),I,ILEV, SKIPRENV
      CHARACTER*4 PKTYP,TYPE,NAME

#     include    "zlabel.cdk"

      INTEGER     KLE,ERR,ERR0,NI,NJ,NK

      CHARACTER(4),EXTERNAL :: GETYP 
      INTEGER,     EXTERNAL :: FSTINFX,FSTRWD
      EXTERNAL     PRECLE,CLESUI,XIT,GETBUF2

      INTEGER              RNDF
      COMMON     /ZZRNDFL/ RNDF(unite_io_maximale)

      LOGICAL              DEBUG
      COMMON     /ZZDEBUG/ DEBUG

*--------------------------------------------------------------------
      SKIPRENV = 0
      IF (DEBUG) WRITE(6,6000) NF,NLEV

      IF (NLEV.EQ.0)                                           THEN

***        NE RIEN FAIRE SI NLEV EST TROP PETIT.

          RETURN

      ELSE

          PKTYP = GETYP( NF )
          ILEV  = NLEV

          IF (ILEV.LT.0)                                       THEN

              IF (PKTYP.NE.'SQ89' .AND. PKTYP.NE.'SQ98')       THEN

***                REPOSITIONNER LE FICHIER FORTRAN AU DEBUT.

                  REWIND NF

              ELSE

***                REPOSITIONNER LE FICHIER RPN-SEQ AU DEBUT.

                  IF (RNDF(NF).LE.0) ERR = FSTRWD( NF )

                  CALL CLESUI( NF,0 )
                  CALL CLESUI( NF,0 )
                  CALL CLESUI( NF,0 )

              END IF

          ELSE

***            REVENIR A L'ENREGISTREMENT PRECEDENT.

              IF (PKTYP.NE.'SQ89' .AND. PKTYP.NE.'SQ98')       THEN

  100                               BACKSPACE NF
                  IF (PKTYP.EQ.' ') BACKSPACE NF

                  IF (ILEV.GT.1)                               THEN

***                    VERIFIER LE TYPE D'ENREGISTREMENT.

                      CALL GETBUF2( -NF, IBUF,HEAD, OK )

                      WRITE(TYPE,0004) IBUF(1)
                      WRITE(NAME,0004) IBUF(3)

                      IF (NAME.EQ.'++' )                       THEN

***                        ENREGISTREMENTS DE RENVOIS.

                          SKIPRENV = SKIPRENV+1

                          GOTO 100

                      ELSE IF (TYPE.EQ.'ZONL' .AND.
     +                         IBUF(6).GT.1)                   THEN

***                        ENREGISTREMENT MULTI-NIVEAUX.
             
                          IF (ILEV.LE.IBUF(6))                 THEN
                              RETURN
                          ELSE IF (ILEV.GT.IBUF(6))            THEN
                              ILEV = ILEV-IBUF(6)
                              GOTO 100
                          END IF

                      ELSE
              
***                        ENREGISTREMENT SIMPLE-NIVEAUX.

                          DO  I=1,ILEV-1
                                                BACKSPACE NF
                              IF (PKTYP.EQ.' ') BACKSPACE NF
                          END DO

                      END IF

                  END IF

              ELSE

                  ERR0 = -1

***                NK CONTIENT LE NOMBRE DE NIVEAU
***                DANS L'ENREGISTREMENT PRECEDENT

                  CALL PRECLE( NF,ERR,1 )
  200             ERR = FSTINFX( ERR,NF, NI,NJ,NK,
     +                   -1,ZLABEL(1:12),-1,-1,-1,ZTYPE,ZNAME(1:4) )
                  KLE = ERR

                  IF (ERR.LT.0)                                THEN
                      IF (DEBUG) WRITE(6,6001) ERR
                      CALL                         XIT(' Precede',-1 )
                  END IF

***                REMPLIR IBUF.

                  CALL IBUFILL( -NF, IBUF, ERR,OK )

                  WRITE(TYPE,0004) IBUF(1)
                  WRITE(NAME,0004) IBUF(3)

                  IF (NAME.EQ.'++' .OR.
     +                NAME.EQ.'>>' .OR.
     +                NAME.EQ.'^^' .OR.
     +                NAME.EQ.'^>' .OR.
     +                NAME.EQ.'!!' .OR.
     +                NAME.EQ.'HY')                            THEN

                      IF (ERR.NE.ERR0)                         THEN

                          SKIPRENV = SKIPRENV+1

                          ERR0     = ERR

                          CALL PRECLE( NF,ERR,1 )
                          GOTO 200

                      ELSE IF (NAME.EQ.'++')                   THEN

***                        ON EST DEJA AU DEBUT DU FICHIER.

                          IF (DEBUG) WRITE(6,6002)
                          CALL                     XIT(' Precede',-2 )

                      END IF
                  ELSE 

                      ILEV = ILEV-NK

                      IF (ILEV.GT. 0 .AND. ERR.NE.ERR0)        THEN

                          ERR0 = ERR

***                        ON N'A PAS ENCORE ASSEZ RECULE.

                          CALL PRECLE( NF,ERR,1 )
                          GOTO 200

                      END IF

                  END IF

              END IF

              IF (DEBUG) WRITE(6,6003) SKIPRENV

          END IF

      END IF

      RETURN
*--------------------------------------------------------------------

 0004 FORMAT(A4)

 6000 FORMAT('*DEBUG:PRECEDE     NF =',I5,', NR =',I5)
 6001 FORMAT('*DEBUG:PRECEDE     ERR =',I5)
 6002 FORMAT('*DEBUG:PRECEDE     Misplaced vertical reference record.')
 6003 FORMAT('*DEBUG:PRECEDE     RENVOIS IGNORES =',I3)

      END
      SUBROUTINE suivant ( NF, IBUF,ERROR,OK )

***    FEV 24/93 - B.DUGAS, RPN.

***    Suivant saute un enregistrement logique, ne
***    retournant que la valeur du tampon saute.
***    les enregistrements de type ++ sont
***    ignores.

      use DIAG_TOC, only: LirTOC

      IMPLICIT     none

      INTEGER,     PARAMETER :: HEAD = taille_entete

      CHARACTER(4) NAME,PKTYP
      INTEGER      IO,NF,INF,IBUF(HEAD),JBUF(HEAD),I,
     +             ERR,NI,NJ,NK, SKIPRENV, NBR_TOC,KLE
      LOGICAL      ERROR,OK

#     include     "zlabel.cdk"

      LOGICAL               INFO,DEBUG
      COMMON      /ZZVERBO/ INFO
      COMMON      /ZZDEBUG/      DEBUG


      CHARACTER(4),EXTERNAL :: GETYP
      INTEGER,     EXTERNAL :: FSTINFX
      EXTERNAL     GETBUF2,IBUFILL,SKIPREC,MESSYS,
     +             PRECLE,CLESUI,LIRPT
*--------------------------------------------------------------------
      SKIPRENV =  0

***    Initialiser les drapeaux logiques ERROR et OK.

      IO    =  0
      ERROR = .FALSE.
      OK    = .FALSE.

***    Determiner le type de compaction.

      INF   = ABS( NF )
      PKTYP = GETYP( INF )

      IF (PKTYP.NE.'SQ89' .AND. PKTYP.NE.'SQ98')               THEN

***        Lire le tampon d'information.

  100     CALL GETBUF2( INF, JBUF,HEAD, OK )

          IF (.NOT.OK) goto 999

          WRITE(NAME,4) JBUF(3)

          IF (PKTYP.EQ.' ')                                    THEN

***            Sauter par-dessus la section de donnee.

              CALL SKIPREC( NF, 1, ERROR )
              ERROR = .NOT.ERROR

CCC           ERROR = .TRUE.
CCC           READ( INF, END=999,ERR=999,IOSTAT=IO )
CCC           ERROR = .FALSE.

          END IF

***        Ignorer les enregistrements de renvois.

          IF (NAME.EQ.'++')                                    THEN
              SKIPRENV = SKIPRENV+1
              GOTO 100
          END IF

      ELSE

***        Positionner le fichier SEQ au prochain enregistrement.

          CALL PRECLE( NF,KLE,0 )
  200     ERR = FSTINFX( KLE, NF, NI,NJ,NK,
     +                   -1,ZLABEL(1:12),-1,-1,-1,ZTYPE,ZNAME(1:4) )

          KLE = ERR

          IF (ERR.LT.00)                                       THEN
              OK = .FALSE.
              GOTO 999
          END IF

***        Remplir JBUF.

          CALL IBUFILL( INF, JBUF, ERR,OK )

          IF (.NOT.OK) GOTO 999

          WRITE(NAME,4) JBUF(3)

          IF (ERR .LT. 00 ) GOTO 999

***        Re-definir la cle courante.

          IF (OK .AND. ERR.GE.00)                              THEN
              OK      = .TRUE.
              CALL CLESUI( NF,KLE )
          END IF

***        Ignorer les enregistrements descripteurs.

          IF (NAME.EQ.'++' .OR.
     +        NAME.EQ.'>>' .OR.
     +        NAME.EQ.'^^' .OR.
     +        NAME.EQ.'^>' .OR.
     +        NAME.EQ.'!!' .OR.
     +        NAME.EQ.'HY')                                    THEN
              IF (NAME.EQ.'HY')
     +            CALL LIRPT( NF )
              IF (NAME.EQ.'!!')
     +            CALL LirTOC( NF,NBR_TOC )
              SKIPRENV = SKIPRENV+1
              GOTO 200
          END IF

      END IF

***    Transferer JBUF dans IBUF.

  300 CONTINUE

      IF (.NOT.ERROR)                                          THEN
          DO  I=1,HEAD
              IBUF(I) = JBUF(I)
          END DO
      END IF

  999 IF (IO.NE.0)                                             THEN
          IF (INFO) WRITE(6,6000) INF,IO
          IF (IO.GT.0) CALL MESSYS( 'In Suivant...' )
      END IF

      IF (DEBUG) WRITE(6,6001) NF,ERROR,OK,NAME,SKIPRENV

      RETURN
*--------------------------------------------------------------------

    4 FORMAT(A4)

 6000 FORMAT('   Suivant on unit ',I3,' returns I/O error number ',I5)
 6001 FORMAT('*DEBUG:SUIVANT     NF =',I5,', ERROR =',L1,', OK =',L1,
     +       ', NOM =',A,', RENVOIS IGNORES =',I3)

      END
      SUBROUTINE writef ( NF, F, NWDS)

***    NOV 19/90 - B.DUGAS, RPN.

***    writef ECRIT (SEQUENTIELLEMENT) UN BLOC COMPLET DE F.

      IMPLICIT none

      INTEGER  IO,NF,NWDS,F(NWDS)

      LOGICAL           INFO
      COMMON  /ZZVERBO/ INFO

      EXTERNAL MESSYS,XIT
*--------------------------------------------------------------------

      WRITE( NF, ERR=100,IOSTAT=IO) F

***    BRANCHEMENT D'ERREUR.

  100 IF (IO.NE.0)                                             THEN
          IF (INFO) WRITE(6,6000) NF,IO
          CALL MESSYS( 'In Writef...' )
          CALL                                     XIT(' Writef ',-1 )
      END IF

      RETURN

*---------------------------------------------------------------------
 6000 FORMAT('   Writef on unit ',I3,' returns I/O error number ',I3)

      END

*     Les trois routines suivantes sont des routines de type
*     passthru dont le seul but est d'empecher la conversion 
*     de type automatique par le compilateur fortran.

      REAL*8 FUNCTION double( NOMBRE,len )

      INTEGER  len
      REAL*8   NOMBRE(0:len+1)
      double = NOMBRE(len)

      RETURN
      END
      SUBROUTINE real82d( DESTIN,SOURCE )

      REAL*8    SOURCE
      REAL      DESTIN
      DESTIN  = SOURCE

      RETURN
      END
      SUBROUTINE reald28( SOURCE,DESTIN )

      REAL      SOURCE
      REAL*8    DESTIN
      DESTIN  = SOURCE

      RETURN
      END

      SUBROUTINE QQQDOC()

      IMPLICIT      none

*     AUTEUR: B.Dugas, RPN - 04 mars 1992.

*     13 mars 1992 - B.Dugas, RPN (verifier le contenu de nom a l'entree)

*     DESCRIPTION: AFFICHE LE CONTENU DU FICHIER "NOM.TXT" OU NOM EST
*                  EXTRAIT DE LA CHAINE RCS "Source" (avec $'s). ON
*                  SUPPOSE DES CARACTERES ASCII.

*- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      INTEGER,      PARAMETER :: stderr = 0

*     LOGICAL       op
      LOGICAL       checked_ARMNLIB
      INTEGER       i,j,err
*     INTEGER       IO,l,iun
      CHARACTER*512 path,docs,pager
*     CHARACTER*80  strings

      CHARACTER*256          nom
      COMMON       /PROGNAM/ nom

      LOGICAL                INFO,DEBUG
      COMMON       /ZZVERBO/ INFO
      COMMON       /ZZDEBUG/      DEBUG

      EXTERNAL      getenvc,messys

#include <rmn/clib_interface.cdk>
*- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
***    account for blank or empty/null strings.

      if (nom.eq.' ' .or. nom(1:1).lt.' ' .or.
     +                    nom(1:1).gt.'~' )                 then
          write( 6,6000 )
          return
      end if

***    isolate the program basename.

      do i=256,1,-1
         if (nom(i:i) .eq. '/' .or. nom(i:i).eq.':') goto 100
      end do

***    strip any extension.

  100 if (i.ne.0)                                              then
          if (nom(i:i) .eq. ':')                               then
  101         continue
              if (nom(i+1:i+1) .eq. ' ')                       then
                  i = i+1
                  goto 101
              end if
          end if
      end if

      i = i+1

      do j=i,255
         if (nom(j+1:j+1) .eq. '.') goto 200
      end do

***    retreive docs path. defaults to current directory.

  200 checked_ARMNLIB = .false.
      call getenvc( 'DIAGNOSTIQUE',path )

  250 if (path == ' ')                                         then
          call getenv( 'ARMNLIB',path )
          checked_ARMNLIB = .true.
      end if

      if (path == ' ')                                         then
          docs = './' // nom(i:j) // '.txt'
          if (DEBUG)                                           then
              write(6,'(/A )')
     +       'QQQDOC: Since $ARMNLIB and $DIAGNOSTIQUE are undefined...'
              write(6,'(/A )') 'QQQDOC: Trying to use local directory'
          end if
      else
          err = clib_isdir( trim( path ) // '/man/pdoc/' )
          if (err == CLIB_OK ) then
              docs = trim( path ) // '/man/pdoc/' // nom(i:j) // '.txt'
              if (DEBUG)                                       then
                  if (checked_ARMNLIB)                         then
                      write(6,'(/A/)')
     +               'QQQDOC: Using man/pdoc under $ARMNLIB'
                  else
                      write(6,'(/A/)')
     +               'QQQDOC: Using man/pdoc under $DIAGNOSTIQUE'
                  end if
              end if
          else
              err = clib_isdir( trim( path ) // '/pdoc/' )
              if (err == CLIB_OK ) then
                  docs = trim( path ) // '/pdoc/' //
     +                       nom(i:j) // '.txt'
                  if (DEBUG)                                   then
                      if (checked_ARMNLIB)                     then
                          write(6,'(/A/)')
     +                   'QQQDOC: Using pdoc under $ARMNLIB'
                      else
                          write(6,'(/A/)')
     +                   'QQQDOC: Using pdoc under $DIAGNOSTIQUE'
                      end if
                  end if
              else if (.not.checked_ARMNLIB)                   then
                  path = ' '
                  goto 250
              else
                  if (DEBUG)
     +            write(6,'(/A/)') 'Unable to find directories ' //
     +           'man/pdoc or pdoc under $DIAGNOSTIQUE or $ARMNLIB'
                  return
              end if
          end if
      end if

      err = clib_isfile( trim( docs ) )

      if (err /= CLIB_OK )                                     then
          if (checked_ARMNLIB)                                 then
              if (DEBUG) write(6,'(/A/)')
     +           'Unable to find ' // trim( docs )
              return
          end if
          path = ' '
          goto 250
      end if

***    check for PAGER environment variable. defaults to "more".

      call getenvc( 'PAGER',pager )
      if (pager == ' ') pager = 'more'

***    do it...

      if (INFO)                                                then
          write(6,'(/"QQQDOC issuing command line ..."/A/)')
     +              trim( pager ) // ' ' // trim( docs ) 
      end if

  400 call system( trim( pager ) // ' ' // trim( docs ) )

***    open docs and read/write till EOF.
***    unit number corresponds to stderr.
*
*     iun = 0
*
*     op = .false.
*     call low2up( docs,docs )
*     IO = fnom( iun, docs,'FTN+FMT+OLD+R/O',0 )
*
*     if (IO.ne.0) goto 1000
*
*     op = .true.
*
* 400 read( iun,8000, end=1000, err=999, iostat=IO ) strings
*
*        do 500 l=80,2,-1
*            if (strings(l:l).ne.' ') goto 600
* 500    continue
* 600    write( stderr,8001 ) (strings(k:k),k=1,l)
*
*     goto 400
*
***    check for errors. no help available.
*
* 999 if (IO.ne.0)                                             then
*         write( stderr,6001 ) IO
*         call messys(' ')
*     end if
*
*1000 if (op) close( iun )

      return

*- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 6000 format(3x,"Documentation indisponible...")
 6001 format(3X,"I/O error no.",I6/)

 8000 format(A80)
 8001 format(80A1)

      end

!      INTEGER FUNCTION INTEFLT(IDUMMY)     
!      Moved to util2.F90 on Nov 5, 2014

!      INTEGER FUNCTION ME32O64(IDUMMY)
!      Moved to util2.F90 on Nov 5, 2014

!      INTEGER FUNCTION CHKENDI( DUMMY )
!      Moved to util2.F90 on Nov 5, 2014

      SUBROUTINE SWAPA4( A4 )

      CHARACTER*4 A4,HOLD4

***    Swap the first four characters in A4.
***    April 07, 1999 - B. Dugas, RPN

*-------------------------------------------------------------------------------
      HOLD4(1:1) = A4(4:4)
      HOLD4(2:2) = A4(3:3)
      HOLD4(3:3) = A4(2:2)
      HOLD4(4:4) = A4(1:1)

      A4 = HOLD4

      RETURN
*-------------------------------------------------------------------------------

      END

      SUBROUTINE TASADR( CHAINEaG,CHAINEaD )

***    CETTE ROUTINE TASSE A DROITE UNE CHAINE DE CARACTERES.

***    AUTEUR: Bernard Dugas, 20 octobre 1994 - RPN

      CHARACTER * ( * ), INTENT(IN)  :: CHAINEaG
      CHARACTER * ( * ), INTENT(OUT) :: CHAINEaD

      CHARACTER(len=1), allocatable, dimension(:) :: VALEUR
      INTEGER I,J, LENG,LEND

      LENG = LEN( CHAINEaG ) ; LEND = LEN( CHAINEaD )
      ALLOCATE( VALEUR( 1:MAX(LENG,LEND) ) )

      DO  I=1,LENG
          VALEUR(I) = CHAINEaG(I:I)
      END DO

      J = LENG
      DO  I=LENG,1,-1
          IF (VALEUR(I).NE.' ') GOTO 100
          J = J-1
      END DO

  100 IF (LEND-J > 0)                                          THEN
          DO  I=J,1,-1
              VALEUR(I+LEND-J) = VALEUR(I)
              VALEUR(I) = ' '
          END DO
      END IF

      DO  I=1,LEND
          CHAINEaD(I:I) = VALEUR(I)
      END DO

      DEALLOCATE( VALEUR )

      RETURN
      END
      SUBROUTINE skiprec (NF,NREC,OK)

***    This routines SKIPs physical records in a file

      Logical OK
      Integer NF,NREC

      Integer count,io

      logical           INFO
      common  /ZZVERBO/ INFO

      external messys
*-------------------------------------------------------------------------------
      OK    = .false.
      count = 0

***    Read NREC null records.

  100 count = count+1
      if (count.le.NREC)                                       then
          read( NF,end=200,err=200,iostat=io)
          goto 100
      end if

      OK = .true.

***    Error or EOF branching.

  200 if (io.ne.0)                                             then
          IF (INFO) WRITE(6,6000) NF,IO
          CALL MESSYS( 'In Skiprec...' )
      end if

      return
*-------------------------------------------------------------------------------

 6000 FORMAT('   Skiprec on unit ',I3,' returns I/O error number ',I3)

      end
      CHARACTER*4 FUNCTION setnam (NF,NAME)

      INTEGER       NF
      CHARACTER*(*) NAME

      INTEGER       LONGN
      CHARACTER*4   PKTYP,GETYP,NOM,ANNEE*2

      EXTERNAL      GETYP

*-------------------------------------------------------------------------------
      PKTYP = GETYP( NF )
      ANNEE = PKTYP(3:4)
      PKTYP = PKTYP(1:2)

***    RETAIN ONLY THE SIGNIFICANT CHARACTERS FOR THE NAME SEARCH.

      NOM = NAME(1:LEN( NAME ))

      IF (PKTYP.EQ.'SQ' .AND. ANNEE.EQ.'89')                   THEN
          LONGN = 2
      ELSE
          LONGN = 4
      END IF

      SETNAM = NOM(1:LONGN)

      RETURN
*-------------------------------------------------------------------------------

      END
      REAL*8 FUNCTION CALCEPS8 (A,NLON,PACK)

      IMPLICIT  none

***    Evaluer l'ordre de grandeur du bruit (CALCEPS8)
***    associe a une operation I/O avec compaction.

***    NBW  = Taille des mots (en bits)
***    PACK = Facteur de compaction

      INTEGER   NLON,NBW,PACK,BITS
      REAL      A(NLON),AMINS,AMAXS,AMEANS
      REAL*8    SCALE,AMIN,AMAX,AMEAN,AVAR

#     include  "machtype.cdk"

      LOGICAL   IO64B,GETIO64
      EXTERNAL  FMMM2,GETIO64

*-------------------------------------------------------------------------
      IO64B = GETIO64( IO64B )

***    BITS PER WORD.

      IF (IO64B .OR. MACHINE.EQ.1)                             THEN
          NBW = 64
      ELSE IF (MACHINE.EQ.2)                                   THEN
          NBW = 32
      END IF

      IF (PACK.LT.0)                                           THEN
          BITS = -PACK
      ELSE
          BITS = NBW/PACK
      END IF

***    USE THE IEEE-754 MANTISSA SIZES AS LIMITS.

      IF (IO64B .OR. MACHINE.EQ.1)                             THEN
          BITS = MIN( BITS,52 )
      ELSE IF (MACHINE.EQ.2)                                   THEN
          BITS = MIN( BITS,23 )
      END IF

***    COMPUTE THE MIN,MAX AND MEAN.

      IF (IO64B)                                               THEN
          CALL XXX_fmmm8( AMIN,AMAX,AMEAN,AVAR, A,NLON )
      ELSE
          CALL FMMM2( AMINS,AMAXS,AMEANS, A,NLON )
          AMIN = AMINS ; AMAX = AMAXS ; AMEAN = AMEANS
      END IF

      SCALE = (AMAX-AMIN)/(2.D0**BITS-1.0)

      CALCEPS8 = 2.0*SCALE

***    THE FOLLOWING CODE IS AN ATTEMPT TO INSURE THAT
***    COMPARING THE SQUARED VALUES STILL MAKES SENSE.

      IF (
     +    (.NOT.IO64B .AND.
     +    (ABS( AMIN ) .LE. 1.E-3*ABS( AMAX )))
     +
     +                 .OR.
     +
     +    (     IO64B .AND.
     +    (ABS( AMIN ) .LE. 1.E-7*ABS( AMAX ))))
     +
     +    CALCEPS8 = MAX( CALCEPS8 , ABS( AMIN )+SCALE )

      RETURN
*-------------------------------------------------------------------------

      END
      SUBROUTINE spwcon7 (FVORT,PI) 

***    DEC 04/90 - M.LAZARE. - T2S NOW -40C INSTEAD OF -15C. 
***    JAN 30/89 - M.LAZARE. - INCLUDE PARAMETERS USED IN ICE-PHASE AND
***                            MOISTURE CONSERVATION CALCULATIONS. 
***    MAR 15/88 - R.LAPRISE.  ORIGINAL VERSION SPWCONH FOR GCM3H. 
  
***    SETS CONSTANTS FOR THE GCM7.
***    ILEVM = JUST ILEV-1.
***     LEVS = THE NUMBER OF PROGNOSTIC MOISTURE LEVELS. 
***       SH = SIGMA VALUE AT MID POINT OF THERMO. LAYERS. 
***      SHB = SIGMA VALUE AT BASE OF THERMO. LAYERS.
***       WW = EARTH ROTATION RATE (1/SEC).
***        A = EARTH RADIUS (M). 
***     GRAV = GRAVITY ACCELERATION (M/SEC**2).
***     RGAS = DRY AIR GAS CONSTANT (JOULE/(KG*DEG)).
***    RGOCP = RGAS/(DRY AIR SPECIFIC HEAT)
***    FVORT = VORTICITY OF EARTH ROTATION.

      IMPLICIT     REAL (A-H,O-Z), INTEGER (I-N)

***    PARAMETERS USED IN THERMODYNAMICS AND DYNAMICS. 

      COMMON /PARAMS/ WW,TW,RAYON,ASQ,GRAV,RGAS,RGOCP,RGOASQ,CPRES
      COMMON /PARAMS/ RGASV,CPRESV

***    PARAMETERS USED BY  FUNCTION  HTVOCP. 

      COMMON /HTCP/   T1S,T2S,AI,BI,AW,BW,SLP 

***    PARAMETERS USED BY  FUNCTIONS  DEWPNT,  SPCHUM,  DELTAQ.

      COMMON /EPS/    A,B,EPS1,EPS2 

***    PARAMETERS USED BY  FUNCTION  GAMSAT. 

      COMMON /GAMS/   EPSS,CAPA 

***    PARAMETERS USED IN MOIST CONVECTIVE ADJUSTMENT. 

      COMMON /ADJPCP/ HC,HF,HM,AA,DEPTH,LHEAT,MOIADJ,MOIFLX 

***    PARAMETERS USED IN ICE PHASE PHYSICS CALCULATIONS.

      COMMON /EPSICE/ AICE,BICE,TICE,QMIN 
*-----------------------------------------------------------------------
      WW     =7.292E-5
      TW     =WW+WW 
      RAYON  =6.37122E06
      ASQ    =RAYON*RAYON 
      GRAV   =9.80616 
      RGAS   =287.04
      RGOCP  =2./7. 
      RGOASQ =RGAS/ASQ
      CPRES  =RGAS/RGOCP
      CPRESV =1870. 
      RGASV  =461.50
      PI     =3.1415926535897 
      FVORT  =TW*SQRT(2./3.)

      RAUW   =1.E+3 
      GRAV   =9.80616 
      DEPTH  = 1./(RAUW*GRAV) 
      CP     =1004.5
      CAPA   =RGOCP 
      T1S    =273.16
      T2S    =233.16
      AW     =3.15213E+6/CP 
      BW     =2.38E+3/CP
      AI     =2.88053E+6/CP 
      BI     =0.167E+3/CP 
      A      =21.656
      B      =5418. 
      AICE   =24.292
      BICE   =6141. 
      TICE   =233.16
      SLP    =1./(T1S-T2S)
      QMIN   =1.E-20
      EPS1   =0.622 
      EPS2   =0.378 
      EPSS   =EPS1

      HC     =.95 
      HF     =.95 
      HM     =.95 
      LHEAT  =1 
      MOIADJ =1 
      MOIFLX =1 
      AA     =0.0 
      IF (HM.LT.1.)
     +AA     =1./(6.*(1.-HM)**2) 

      RETURN
*-----------------------------------------------------------------------

      END
      SUBROUTINE TIMEDC(SEC,TIME)

***    80-1-29, J.R. GILLESPIE.

***    CONVERTS FGGE TIME CODE (I.E. YYMMDDHH FORMAT) TO THE NUMBER
***    OF SECONDS AFTER A REFERENCE TIME (THE BEGINNING OF 1950).

      IMPLICIT none

      INTEGER  ID(8), SEC,TIME, NY(12,2), YR,MO,DY,HR,
     +                CURYR,LEAP,COUNT,DAYS,HOURS

      EXTERNAL TDIGITS

      DATA     NY / 0,31,59,90,120,151,181,212,243,273,304,334,
     +              0,31,60,91,121,152,182,213,244,274,305,335 /
*-----------------------------------------------------------------------

***    UNPACK THE YEAR, MONTH, DAY AND HOUR GROUPS FROM THE TIME CODE.

      CALL TDIGITS( ID,8,TIME )
      YR = 10*ID(8)+ID(7)+1900
      MO = 10*ID(6)+ID(5)
      DY = 10*ID(4)+ID(3)
      HR = 10*ID(2)+ID(1)

*       ************************************************************
*       * COMPUTE THE NUMBER OF DAYS SINCE THE BEGINNING OF 1 B.C. *
*       *              (ALGORITHM BY S.J. LAMBERT.)                *
*       ************************************************************

***    FIRST GET THE NUMBER OF DAYS FROM 1 B.C. UP TO THE START OF THE
***    CURRENT YEAR.

      CURYR = 365*(YR-1)+(YR-1)/4-(YR-1)/100+(YR-1)/400

***    DECIDE WHETHER THE CURRENT YEAR IS A LEAP YEAR.

                                     LEAP = 0
      IF ( (MOD(YR,  4).EQ.0  .AND. 
     +      MOD(YR,100).NE.0) .OR.
     +      MOD(YR,400).EQ.0 )       LEAP = 1

***    ADD ON THE NUMBER OF DAYS FROM THE START OF THE CURRENT YEAR.

      COUNT = CURYR+NY(MO,LEAP+1)+DY-1

***    NOW SUBTRACT THE NUMBER OF DAYS FROM 1 B.C. TO 1950 A.D.

      DAYS = COUNT-711857

***    CONVERT DAYS TO HOURS AND ADD THE EXTRA HOURS FROM THE TIME CODE

      HOURS = 24*DAYS+HR

***    CONVERT TO SECONDS.

      SEC = 3600*HOURS

      RETURN
*-----------------------------------------------------------------------
      END
      SUBROUTINE TDIGITS(ID,N,NUM)

***    JUN 20/78 - J.D.HENDERSON
***    RETURNS IN ID THE N LOWEST ORDER DIGITS OF NUM.
***    ALL DIGITS RETURNED ARE POSITIVE.

      IMPLICIT none

      INTEGER  N,ID(N),NUM, NA,K
*--------------------------------------------------------------------

      NA = IABS( NUM )

      DO 210 K=1,N
          ID(K) = NA-NA/10*10
          NA    = NA/10
  210 CONTINUE

      RETURN

      END
      Subroutine roword (champs,dummy,ni,nj)

      implicit     none

      integer      champs(*),dummy,ni,nj

***    Auteur: B.Dugas - RPN, le 25 septembre 1990

***    Objet(roword):
*         - Inverser l'ordre des ligne que l'on trouve dans champs.
*           Les objets a inverser sont des mots reels pouvant
*           occuper un ou deux mots entiers.
***    Objet(rowords):
*         - Inverser l'ordre des ligne que l'on trouve dans champs.
*           La taille des objets traites est d'un seul mot entier.

***    Arguments:
*         in     - ni     -  longueur d'une ligne dans champs.
*         in     - nj     -  nombre de ligne dans champs.
*         in/out - champs -  chaine d'objets reels.
*         in     - dummy  -  tampon (inutilise).

      character    mode*5
      integer      i,j, ij,ijinv
      integer      hold, mult

#     include     "machtype.cdk"

      logical      getio64,bidon
      external     getio64
*----------------------------------------------------------------------

      mode = 'roword'

      entry rowords (champs,dummy,ni,nj)

          mult = 1
      if (mode    == 'roword' .and.
     +   (intsize ==    2     .or.
     +   (machine ==    2     .and.
     +    getio64( bidon ) ) ) )
     +    mult = 2

***    Transferer une ligne a la fois.

      ij    = -mult*ni
      ijinv =  mult*ni*nj

      do  j=1,nj/2

          ij    = ij   +mult*ni
          ijinv = ijinv-mult*ni

          do  i=1,mult*ni
              hold                = champs( i + ij    )
              champs( i + ij    ) = champs( i + ijinv )
              champs( i + ijinv ) = hold
          end do

      end do

      return

      end
      INTEGER(8) FUNCTION y2kdat8 ( VALUE8 )

      implicit    none

      integer*8   VALUE8

***    Auteur: B.Dugas - RPN, le 10 septembre 2009

***    Objet(y2kdat8):
*         - Verifier que le format de la date est conforme Y2K.

***    Arguments:
*         - VALUE8 -  valeur de la date (en entier 64 bits) a verifier.

      INTEGER(8) :: DATE_CONVERSION_FACTOR

      INTEGER                            DATVAL
      LOGICAL              CDATE,KEEPIP2
      COMMON     /ZZZDATE/ CDATE,KEEPIP2,DATVAL

      INTEGER(8) :: BASDAT8=1900 00 00 00,UnMillion=1 00 00 00
      INTEGER(8) :: MinDat8=  30 01 01 00,DCF,
     +              MaxDat8= 100 00 00 00
*----------------------------------------------------------------------

      y2kdat8 = VALUE8

      CALL GET_DCF( DATE_CONVERSION_FACTOR )

      IF (DATE_CONVERSION_FACTOR > 0)                          THEN

          DCF = ( UnMillion * UnMillion ) / DATE_CONVERSION_FACTOR
          IF (CDATE .and. DATVAL >= 0) BASDAT8 = DATVAL * DCF

          IF (CDATE                                                .OR.
     +       (VALUE8 >= (MinDat8*UnMillion)/DATE_CONVERSION_FACTOR .AND.
     +        VALUE8 <  (MaxDat8*UnMillion)/DATE_CONVERSION_FACTOR ) )
     +        y2kdat8 = VALUE8 + BASDAT8

      ELSE IF (DATE_CONVERSION_FACTOR == 0)                    THEN

          IF (CDATE .and. DATVAL >= 0) BASDAT8 = DATVAL * UnMillion

          IF (CDATE .OR. (VALUE8 >= MinDat8 .AND. VALUE8 < MaxDat8))
     +        y2kdat8 = VALUE8 + BASDAT8

      END IF

      return

*----------------------------------------------------------------------
      end
      SUBROUTINE WRDSWP( LCM,NWDS )

      INTEGER NWDS,LCM(2,NWDS)
      INTEGER HOLD,I

      DO  I=1,NWDS
          HOLD     = LCM(1,I)
          LCM(1,I) = LCM(2,I)
          LCM(2,I) = HOLD
      END DO

      RETURN

      END
*
*      Les sept routines suivantes cherchent
*      les valeurs Inf ou NaN (IEEE-754)
*
***   Auteurs: M.Valin et B.Dugas, RPN, 8 et 21 juin 1999
*
      subroutine infnan( f,n, ibuf, io64b )

      implicit  none

***    Arguments:

***    f     champs de longueur n
***    n     dimension de f
***    ibuf  decripteur approprie
***    io64b cle logique pour traitement 64 bits

      logical   io64b
      integer   n,f(n),ibuf(1)

      logical            noabort, info
      common   /zzabort/ noabort
      common   /zzverbo/          info

***    local variables.

      logical,  save :: message_initial = .true.

      logical,  save :: pibuf = .false.
      integer   i,NaN

      logical   ibm,cray,ieee
      save      ibm,cray,ieee

      integer,  external :: cnfnn,cnfnn8
      external  pnfnn,pnfnn8, getmach,xit

*--------------------------------------------------------------------
      pibuf = .true.
*--------------------------------------------------------------------

      entry infnan2( f,n, io64b )

      if (.not. (ibm.or.cray.or.ieee))
     +    call getmach( ibm,cray,ieee )

      if (.not.ieee) return

      if (io64b)                                               then

          NaN = cnfnn8( f,n ) 

          if (NaN.ne.0)                                        then
              if (info .and. message_initial)                  then
                  write(6,6001) NaN
                  call pnfnn8( f,n )
                  if (pibuf) call prtlab( ibuf )
                  message_initial = .false.
              end if
              if (.not.noabort) call               xit(' InfNaN ',-1 )
          end if

      else

          NaN = cnfnn( f,n ) 

          if (NaN.ne.0)                                        then
              if (info .and. message_initial)                  then
                  write(6,6001) NaN
                  call pnfnn( f,n )
                  if (pibuf) call prtlab( ibuf )
                  message_initial = .false.
              end if
              if (.not.noabort) call               xit(' InfNaN ',-1 )
          end if

      end if

      pibuf = .false.

      return
*--------------------------------------------------------------------

 6001 FORMAT('   Infnan found ',I6,' illegal data (Infinite or NaN)')

      end
      integer function cnfnn( f,n )

      implicit  none

      integer   n,f(n)
      integer   i,count

      logical   ibm,cray,ieee
      save      ibm,cray,ieee

      external  getmach

*--------------------------------------------------------------------
      if (.not. (ibm.or.cray.or.ieee))
     +    call getmach( ibm,cray,ieee )

      count = 0

      if (ieee)                                                then
          do  i=1,n
              count = count+ishft(1+(iand(255,ishft(f(i),-23))),-8)
          end do
      end if

      cnfnn = count

      return
*--------------------------------------------------------------------

      end
      integer function cnfnn8( f,n )

      implicit  none

      integer   n,f(n),sh
      integer   i,count
#     include  "machtype.cdk" 
      logical   ibm,cray,ieee
      save      ibm,cray,ieee

      external  getmach

*--------------------------------------------------------------------
      if (.not. (ibm.or.cray.or.ieee))
     +    call getmach( ibm,cray,ieee )

      count = 0

      if (ieee)                                                then
          if (MACHINE.eq.1)                                    then
              sh = -52
              do  i=1,n
                  count = count
     +                  + ishft(1+(iand(2047,ishft(f(i),sh))),-11)
              end do
          else
              sh = -20
              do  i=mod(BIGENDI+1,2)+1,2*n,2
                  count = count
     +                  + ishft(1+(iand(2047,ishft(f(i),sh))),-11)
              end do
          end if
      end if

      cnfnn8 = count

      return
*--------------------------------------------------------------------

      end
      subroutine pnfnn( f,n )

      implicit  none

      integer   n,f(n)
      integer   i,indice,ipos(100)

      logical   ibm,cray,ieee
      save      ibm,cray,ieee

      external  getmach

*--------------------------------------------------------------------
      if (.not. (ibm.or.cray.or.ieee))
     +    call getmach( ibm,cray,ieee )

      if (.not.ieee) return

      indice = 0

      do  i=1,n
          if (ishft(1+(iand(255,ishft(f(i),-23))),-8).eq.1)    then
              indice = indice+1
              if (indice.le.100) ipos(indice) = i
          end if
      end do

      if (indice.gt.100) write(6,6000)
      if (indice.ne. 0 ) write(6,6100) (ipos(i),i=1,min(indice,100))

      return
*--------------------------------------------------------------------

 6000 format(3X,'Showing only the first 100')
 6100 format(3X,'Infinite or NaN at position...'/(4x,10I10))

      end
      subroutine pnfnn8( f,n )

      implicit  none

      integer   n,f(n),sh
      integer   i,indice,ipos(100)
#     include  "machtype.cdk" 
      logical   ibm,cray,ieee
      save      ibm,cray,ieee

      external  getmach

*--------------------------------------------------------------------
      if (.not. (ibm.or.cray.or.ieee))
     +    call getmach( ibm,cray,ieee )

      if (.not.ieee) return

      indice = 0

      if (MACHINE.eq.1)                                        then
          sh = -52
          do  i=1,n
              if (ishft(
     +            1 + ( iand(
     +            2047 , ishft( f(i) ,sh ) ) ),-11 ).eq.1)    then
                  indice = indice+1
                  if (indice.le.100) ipos(indice) = i
              end if
          end do
      else
          sh = -20
          do  i=mod(BIGENDI+1,2)+1,2*n,2
              if (ishft(
     +            1 + ( iand(
     +            2047 , ishft( f(i) ,sh ) ) ),-11 ).eq.1)    then
                  indice = indice+1
                  if (indice.le.100) ipos(indice) = (i-BIGENDI+1)/2 + 1
              end if
          end do
      end if

      if (indice.gt.100) write(6,6000)
      if (indice.ne. 0 ) write(6,6100) (ipos(i),i=1,min(indice,100))

      return
*--------------------------------------------------------------------

 6000 format(3X,'Showing only the first 100')
 6100 format(3X,'Infinite or NaN at position...'/(4x,10I10))

      end

!     Ceci est la version traitant un mot a la fois.

      logical function idnan( f,real64b )

      implicit  none

      integer   f(*)
      logical   real64b

#     include  "machtype.cdk" 
      logical,  save :: ibm,cray,ieee
      integer   i,sh
      logical   oui

      external  getmach

*--------------------------------------------------------------------
      if (.not. (ibm.or.cray.or.ieee))
     +    call getmach( ibm,cray,ieee )

      oui = .false.

      if (real64b)                                             then
          if (ieee)                                            then
              if (MACHINE == 1)                                then
                  sh=-52 ; i=1 ; oui =
     +           (ishft(1+(iand(2047,ishft(f(i),sh))),-11) .eq. 1)
              else
                  sh=-20 ; i=mod( BIGENDI+1,2 )+1 ; oui =
     +           (ishft(1+(iand(2047,ishft(f(i),sh))),-11) .eq. 1)
              end if
          end if
      else
          if (ieee)                                                then
              sh=-23 ; i=1 ; oui =
     +       (ishft(1+(iand(255,ishft(f(i),sh))),-8) .eq. 1)
          end if
      end if

      idnan = oui

      return
*--------------------------------------------------------------------

      end
      subroutine mov832( A,B, N )

      IMPLICIT none

      INTEGER  N,A(N),B(N)
*
*AUTEUR   M.Lepine DRPN 1999
*
*LANGAGE fortran
*
*OBJECT(MOV832)
*      COPIER A DANS B (EN INVERSANT LES CARACTERES)
*
*ARGUMENTS
*        A     TABLEAU DE DEPART
*        B     TABLEAU DE DESTINATION
*        N     NOMBRE DE MOTS A COPIER DE A A B
**

      INTEGER  I
!!!   INTEGER  LITEND
!!!   DATA     LITEND /1/
!!!   INTEGER *2   LITTLE(2)
!!!   EQUIVALENCE (LITTLE(1),LITEND)

#     include        "machtype.cdk"

!!!   IF (LITTLE(1) == 1)                                      THEN
      IF (BIGENDI == 0)                                        THEN

*         PRINT *,'DEBUG THIS COMPUTER IS LITTLE ENDIAN'

          DO  I=1,N
              B(I) = IOR(IOR(IOR(ISHFT(IAND(A(I),255),24),
     %                           IAND(ISHFT(A(I),8),16711680)),
     %                           IAND(ISHFT(A(I),-8),65280)),
     %                           IAND(ISHFT(A(I),-24),255))
          END DO

      ELSE

*         PRINT *,'DEBUG THIS COMPUTER IS BIG ENDIAN'

         DO  I=1,N
             B(I) = A(I)
         END DO

      END IF

      RETURN

      END
      subroutine eqvnom( NOM1,NOM2 )
      
      IMPLICIT      none

      LOGICAL       DONE,EQVL
      CHARACTER*(*) NOM1,NOM2

      INTEGER,      PARAMETER :: MAXNAM = 200

      INTEGER       INDEX
      CHARACTER*4   TABLE(2,MAXNAM), NAME1,NAME2
      SAVE          TABLE,INDEX

      LOGICAL       EX
      INTEGER       I,IO
      CHARACTER*512 EVALUE

      LOGICAL                INFO
      COMMON       /ZZVERBO/ INFO

      EXTERNAL      GETENVC
*-------------------------------------------------------------------
*      CHECK TABLE TO FIND AN EQUIVALENT NAME TO NOM1.

      IF (NOM1.EQ.' ') RETURN

      DO  I=1,INDEX
          IF (NOM1.EQ.TABLE(1,I))                              THEN
              NOM2  = TABLE(2,I)
              RETURN
          END IF
      END DO

      RETURN
*-------------------------------------------------------------------
*      CHECK TABLE TO SEE IF NOM1 AND NOM2 ARE EQUIVALENT. 

      ENTRY eqvnomt( NOM1,NOM2,EQVL )

      EQVL = .FALSE.

      IF (NOM1.EQ.' ' .OR.
     +    NOM2.EQ.' ' ) RETURN

      DO  I=1,INDEX
          IF (NOM1.EQ.TABLE(1,I) .AND.
     +        NOM2.EQ.TABLE(2,I) )                             THEN
              EQVL = .TRUE.
              RETURN
          END IF
      END DO

      RETURN
*-------------------------------------------------------------------
***    READ NAME EQUIVALENCE TABLE.

      ENTRY inineq( DONE )

      DONE = .FALSE.

      CALL GETENVC( 'NOMVAR_EQUIVALENCE_TABLE',EVALUE )
      IF (EVALUE.EQ.' ') EVALUE = '/users/dor/armn/rbd/.table_nomvar'

      INDEX = 0

      INQUIRE( FILE=EVALUE,ERR=150,IOSTAT=IO,EXIST=EX )

      IF (EX)                                                  THEN

          OPEN( UNIT=99, FILE=EVALUE,  ERR=150,IOSTAT=IO,
     +                   STATUS='OLD', ACCESS='SEQUENTIAL',
     +                                 FORM='FORMATTED' )

  050     READ( 99,'(2(1X,A4))',END=100,ERR=100,IOSTAT=IO) NAME1,NAME2

              IF (INDEX.GE.MAXNAM)                             THEN

                  IF (INFO) WRITE(6,6001) MAXNAM
                  GOTO 100

              ELSE

                  IF (NAME1.EQ.' ' .OR.
     +                NAME2.EQ.' ' ) GOTO 100

                  INDEX          = INDEX+1

                  CALL    LEADBLK( NAME1 ) 
                  CALL    LEADBLK( NAME2 ) 

                  TABLE(1,INDEX) = NAME1
                  TABLE(2,INDEX) = NAME2

                  INDEX          = INDEX+1

                  TABLE(1,INDEX) = NAME2
                  TABLE(2,INDEX) = NAME1

              END IF
 
              IF (INFO) WRITE(6,6000) NAME1,NAME2

          GOTO 050

  100     CLOSE( 99 )
          IF (INDEX.NE.0) DONE = .TRUE.

          RETURN

      END IF

  150 IF (INFO) WRITE(6,6002)

      RETURN

*-------------------------------------------------------------------
 6000 FORMAT('*INFO :ININEQ',6X,A4,' = ',A4)
 6001 FORMAT('*INFO :ININEQ',6X,'Maximum number of entries in NOMVAR',
     +       ' equivalence table reached, i.e. ',I4)
 6002 FORMAT('*INFO :ININEQ',6X,'NOMVAR equivalence table not active.')

      END

      INTEGER FUNCTION dismax8 (LENGTH,ARRAY,INC)

***    R.LAPRISE - APR 09/84.

***    FIND AND RETURN THE INDEX OF THE LARGEST ELEMENT OF AN ARRAY.

      INTEGER LENGTH,INDEX,I,INC
      REAL*8  ARRAY(LENGTH)
*-----------------------------------------------------------------------

      IF (INC.EQ.0) INC   = 1
                    INDEX = 1

      DO  I=1,LENGTH,INC
          IF (ARRAY(I).GT.ARRAY(INDEX)) INDEX=I
      END DO

      DISMAX8 = INDEX

      RETURN
      END 

      INTEGER FUNCTION dismin8 (LENGTH,ARRAY,INC)

***    R.LAPRISE - APR 09/84.

***    FIND AND RETURN THE INDEX OF THE SMALLEST ELEMENT OF AN ARRAY.

      INTEGER LENGTH,INDEX,I,INC
      REAL*8  ARRAY(LENGTH)
*-----------------------------------------------------------------------

      IF (INC.EQ.0) INC   = 1
                    INDEX = 1

      DO  I=1,LENGTH,INC
          IF (ARRAY(I).LT.ARRAY(INDEX)) INDEX=I
      END DO

      DISMIN8 = INDEX

      RETURN

*-------------------------------------------------------------------- 
      END 
      SUBROUTINE getrabt (CHAINE)

***    RECABT HANDLER CODE FOR DYNAMIC MEMORY I/O BUFFER

      CHARACTER*(*) CHAINE
      CHARACTER*4  RECABT

      SAVE RECABT

      DATA RECABT / '&OUI' /
*-------------------------------------------------------------------- 

      CHAINE = RECABT

      RETURN

*-------------------------------------------------------------------- 
      ENTRY setrabt (CHAINE)

      RECABT = CHAINE

      RETURN
*-------------------------------------------------------------------- 

      END
      SUBROUTINE setftnb (IOUNIT)

      IMPLICIT  none

      INTEGER   IOUNIT

***    TOGGLES FORTRAN BINARY MODE FOR A SPECIFIC I/O UNIT.

      LOGICAL            FORTB(unite_io_maximale)
      COMMON   /ZZFORTB/ FORTB

*-------------------------------------------------------------------- 
      IF (IOUNIT.GT.unite_io_maximale)                         THEN
          WRITE(6,6001) IOUNIT
          CALL                                     XIT(' Setftnb',-1 )
      END IF

      FORTB(IOUNIT) = .TRUE.

      RETURN
*-------------------------------------------------------------------- 

 6001 format(' SETFTNB unable to set fortran binary mode for unit ',I5/)

      END
       BLOCK DATA DATA_UTIL

*     Initialise variables of UTIL's COMMONs that need to be.

      LOGICAL                  DEXIT,SET_DEXIT
      CHARACTER*512                            DIAGEXT
      COMMON         /DEXIT/   DEXIT,SET_DEXIT,DIAGEXT

      INTEGER                  INFMOT(0:unite_io_maximale)
      COMMON         /LIRZXL/  INFMOT

      LOGICAL                  FORTB(unite_io_maximale)
      COMMON         /ZZFORTB/ FORTB

      LOGICAL                  INFO            
      COMMON         /ZZVERBO/ INFO

      DATA            INFMOT /  unite_io_maximale * -1 , -1 /
      DATA            DIAGEXT/ 'DIAGNOSTIC_EXIT' /
      DATA            FORTB  /  unite_io_maximale * .FALSE. /
      DATA            INFO   / .FALSE. /

      END BLOCK DATA DATA_UTIL

