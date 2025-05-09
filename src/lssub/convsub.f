#     if !defined (dimension_en_x)
#         define  dimension_en_x 1000
#     endif
#     if !defined (dimension_en_y)
#         define  dimension_en_y 1000
#     endif
#     if !defined (unite_io_maximale)
#         define  unite_io_maximale 99
#     endif
!     $Log: convsub.ftn,v $
!     Revision 3.135  2021/01/26  dugas
!     - Modifier le code qui identifie les intervals
!       verticaux dans IBUFILL i.e. accepter que le
!       statut de decode_ip puisse alors aussi
!       etre CONVERT_GOOD_GUESS
!     - Inverser l'ordre des appels a diag_convip_plus
!       et a decode_ip dans IBUFILL
!
!     Revision 3.134  2020/06/01  dugas
!     - Ajouter le point d'entree getUres a savUref
!
!     Revision 3.133  2020/05/27 et 28 14:14  dugas
!     - Modifier les formats de sorties de DecrireU
!       (en leur ajoutant des separateurs appropries)
!
!     Revision 3.132  2019/12/12 17:17  dugas
!     - Ajouter DecrireU a la collection de routines SavUref (-info)
!
!     Revision 3.131  2019/07/04 16:16  dugas
!     - Petites corrections aux formats #6100 et #6200 de PUSHYZ et PUSHU
!
!     Revision 3.130  2018/04/16 14:14  dugas
!     - Petite correction du format DEBUG #6102 de PARFILL
!
!     Revision 3.129  2018/02/01 13:13  dugas
!     - Initialiser la variable FoundIt dans savUref
!
!     Revision 3.128  2017/11/09 10:10  dugas
!     - Tous les prefixes de commentaires passent de 'C' a '!'
!     - Securiser les sorties debug 6101/2/3/4 dans IBUFILL
!     - Corriger le traitement 'eqvnomt' dans IBUFILL pour
!       laquelle la variable NOMA etait mal initialisee
!     - Modifier le format de sortie 6101 de IBUFILL
!       pour qu'on imprime la valeur decodee de IP3
!
!     Revision 3.127  2016/10/26 16:37  dugas
!     - Remplacerle macro dimension_en_x=131072 par la paire de macros
!       dimension_en_x=1000 et dimension_en_y=1000, ce qui permets le
!       support des grilles de type Y (i.e. le parametre MAZDIM dans
!       les routines GETZREF,OUVZREF2)
!     - Ajouter dans IBUFILL et PARFILL la reconnaissance des
!       intervals verticaux ou temporels codes dans les IP1/2/3
!     - Utiliser (en option) le codage en heures des IP2 dans PARFILL
!     - Dans SAVZREF, verifier les dimension en I et J lors de
!       la recherche des TicTacs dans le fichier ZCROCHETS
!     - Ajouter le point d'entree CLOZREF dans GETZREF
!     - Ajouter le point d'entree RMZREF dans OUVZREF2
!     - Ne pas faire appel a EQVNOMT si HIGHNAM est faux dans PARFILL
!     - Appels a OUVZREF2 plutot que OUVZREF: nouvel argument logique
!       REM qui indique de creer une nouveau fichier ZCROCHETS plutot
!       que d'utiliser un fichier pre-existant
!     - Modifications syntaxiques F77 --> F90
!
!     Revision 3.126  2014/09/25 18:31:49  dugas
!     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
!
!     Revision 3.125  2014/07/08 20:04:47  dugas
!     Le macro dimension_en_x passe de 65536 a 131072 (mots).
!
!     Revision 3.124  2014/03/08 01:37:07  bernard
!      - Introduire les points d'entree SAVZREF2, OUVZREF2 et MAKZREF2
!        pour ajouter l'option de repartir avec un fichier ZCROCHETS
!        frais, et au besoin effacer le precedent.
!
!     Revision 3.123  2014/02/05 19:56:32  dugas
!      - Correction du format 6001 de WritUref.
!      - Modifier les declaration des variables locales de PushU.
!
!     Revision 3.122  2014/01/28 18:23:19  dugas
!     Ajouter le point d'entree getUdesc a la routine savUref.
!
!     Revision 3.121  2014/01/22 22:05:51  dugas
!     Ajouter le point d'entree GETZTYP.
!
!     Revision 3.120  2013/11/28 22:15:03  dugas
!      - Appel a UNSET_MISPAR lorsque IAND(datyp,64)=0 dans IBUFILL.
!      - Tenir compte des enregistrements de renvois '^>' dans IBUFILL et READSTD.
!      - Tenir compte des grilles de type 'U' dans IBUFILL, PARFILL, READSTD et WRITSTD.
!      - Ne pas tenir compte de l'etiquette dans la recherche de TicTac dans Savzref.
!      - Modifier le contenu du common OUICEST dans GETZREF (y ajouter SAUVU).
!      - Ajouter les routines savUref (writUref) et pushU (findU).
!
!     Revision 3.119  2013/10/28 20:44:27  bernard
!     Permettre l'ecriture de mots complexes (datyp=8) en 64 bits.
!
!     Revision 3.118  2013/07/17 21:54:06  bernard
!     Modifier le traitement des DATYP. On ajoute aussi le support des valeurs manquantes pour fichier CMC/RPN dans IBUFILL et PARFILL.
!
!     Revision 3.117  2013/03/21 21:06:52  bernard
!     - Ajouter le point d'entree GETZIPX a GETZREF.
!     - Renommer GETZDES a GETZDES2 et changer son comportement lorsque
!       les arguments REFDIMX et REFDIMY sont non-nuls. Dans ce cas, on
!       cherche un jeux de TicTacs ayant ces dimensions. L'appel a GETZDES
!       fonctionne encore comme auparavant mais devient un cas particulier.
!     - Sauver et considerer les parametres TYPVAR et ETIKET des
!       jeux de TicTacs, y compros dans les fichiers zcrochets.
!
!     Revision 3.116  2013/02/07 21:43:05  bernard
!     - Initialiser la variable II dans SavZref.
!     - Continuer a mieux documenter et structurer ce bout de code.
!
!     Revision 3.115  2012/11/29 23:18:59  dugas
!     Ne plus supposer que les TicTacs sont ordonnes dans SavZref.
!
!     Revision 3.114  2012/09/07 20:14:42  dugas
!     - Ajouter le point d'entree SET_TURBO_COMPRESS a PARFILL.
!     - L'usage de la compression turbo est controle par la
!       variable logique TURBO_COMPRESS (=V, par defaut).
!
!     Revision 3.113  2012/08/29 15:05:05  dugas
!     - Traiter les TocToc (!!) comme les autres enregistrments de
!       renvois au debut de IBUFILL: Appel a LirToc et retour.
!
!     Revision 3.112  2012/07/20 19:55:37  dugas
!      - (Possiblement) Effectuer un appel a LirTOC
!        dans READSTD lorsqu'on trouve un IP1 code Hybride
!      - Re-organiser les declaratinos des routines READSTD et WRITSTD
!      - (Possiblement) Permettre un deuxieme essai de lecture dans GETZREF
!        avec un appel a MAKZREF pour chercher de nouveaux enregistrements
!        TicTac. Ceci eliminera en grande partie les erreurs GETZREF -2.
!      - Explicitement verifier que io=0 avant d'ouvrir zcrochets dans OUVZREF
!
!     Revision 3.111  2011/06/06 19:55:22  dugas
!     - Toujours recalculer NPAS si DATEO < TIME dans PARFILL.
!       Ceci force la coherence entre les differents parametres
!       temporels.
!     - Noms de fichiers a 512 caracteres max. dans OUVSTD/WRITSTD
!     - Traitement des noms de fichiers tout en majuscules dans OUVSTD:
!       Y ajouter le chemin d'acces pour tenter de prevenir la majusculisation
!       forcee par FNOM.
!
!     Revision 3.110  2010/10/23 16:22:41  dugas
!     Tenir compte des TocToc (\!\!) dans READSTD.
!
!     Revision 3.109  2010/06/10 21:24:03  dugas
!     Enlever les routines hybref_to_ig/ig_to_hybref.
!
!     Revision 3.108  2010/05/10 16:34:41  dugas
!     Menage dans les messages d'erreurs.
!
!     Revision 3.107  2010/03/19 18:25:24  dugas
!     Compression turbo IEEE-754 32 bits non supportee pour donnees ZONL.
!
!     Revision 3.106  2010/03/05 22:35:40  dugas
!     Activer la compression turbo pour les donnees IEEE-754 32 bits.
!
!     Revision 3.105  2010/02/12 22:49:34  dugas
!     - Support de DATYP=4 (signed integer) dans PARFILL.
!     - La routine WRITSTD supporte les enregistrements TocToc (!!).
!     - On supprime le traitement de KEEPDATEV dans la mesure ou IBUF(2)=datev.
!     - Les routines IBUFILL et PARFILL utilisent maintenant GET_DCF pour
!       definit leur DATE_CONVERSION_FACTOR.
!
!     Revision 3.104  2009/09/08 19:33:24  dugas
!     - Corriger la declaration de ZZZDATE dans IBUFILL (KEEPDATEV).
!     - Corriger le code d'appel SYSTEM/RM dans OUVSTD.
!
!     Revision 3.103  2009/01/23 22:47:06  dugas
!     - Corriger le code DEBUG dans READSTD/WRITSTD.
!     - Corriger les message DEBUG 6101/6104 dans LIRPT.
!
!     Revision 3.102  2008/11/24 21:19:56  dugas
!     - Implementer le mode "keep_datev" qui donne pre-seance dans
!       PARFILL a la date de validite plutot qu'a ce qui se trouve
!       dans IBUF(2).
!     - Support de NEWDATE en mode -5 (i.e. "back to the future").
!     - Traiter dans OUVSTD les fichiers "vides" au sens STDxx mais
!       qui ne le sont pas au sens de l'OS (les effacer pour vrai!).
!     - Verifier tous les TIC/TAC dans SAVZREF (nrc --> nrc+nre).
!     - Quelques modifs de formats de sortie en mode DEBUG.
!
!     Revision 3.101  2008/07/24 19:35:19  dugas
!     Initialiser IP1 a lev au debut de PARFILL.
!
!     Revision 3.100  2008/04/28 14:23:15  dugas
!     Ne plus tenir compte du cas non-SQ98.
!
!     Revision 3.99  2008/04/25 20:39:19  dugas
!     Corriger l'usage des macros pour r.gppf.
!
!     Revision 3.98  2007/12/19 19:32:09  dugas
!     - Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
!     - IBUFILL et PARFILL supportent LEV=IP1 pour les fichiers CMC/RPN.
!       En particulier, IBUFILL force LEV=IP1 NewStyle et ne fait plus
!       d'appel a PUTHIGH(IP1).
!
!     Revision 3.97  2007/08/29 20:56:15  dugas
!     - Mode 64 bits non supporte avec donnees complexes (datyp=8) et entieres (datyp=2).
!     - Ajouter le support de la compression TURBO pour IEEE-754 a 32 bits (datyp=133).
!     - Correction de la conversion de donnees spectales selon leur datyp.
!     - Definir PT_KIND=2 dans SETPT.
!
!     Revision 3.96  2006/09/19 18:19:28  dugas
!     - Inserer du code preventif au cas ou DATEO=0 dans IBUFILL.
!     - Tenir compte de ZTYPE lors de l'appel a FSTINFX dans READSTD."
!
!     Revision 3.95  2006/07/25 21:00:08  dugas
!     Ignorer passivement IG3 dans PARFILL pour les grilles de type Z.
!
!     Revision 3.94  2006/07/04 17:07:54  dugas
!     - Ajouter le supports des grilles de type #.
!     - Completer le support des donnees de type CMPL dans IBUFILL/PARFILL.
!     - Utiliser le nouveau format Z32 (DATYP=8) pour les donnees complexes
!       (i.e. type SPEC/FOUR/CMPL).
!     - Ne plus comparer IG3/IP3 dans GETZREF and co. Ceci libere IG3 pour
!       le traitement des series temporelles des grilles Y et Z. Celles-ci
!       sont maintenant definies comme les autres grilles supportees (avec
!       IG3/IG4). Les series temporelles de grilles de type L ne sont
!       toujours pas supportees.
!
!     Revision 3.93  2006/04/26 16:21:04  dugas
!     Ne plus forcer le format de lignes a 128 caracteres
!      pour les donnees de type CHAR dans les routines de
!      conversions PARFILL et IBUFILL.
!
!     Revision 3.92  2006/02/09 18:23:59  dugas
!     - Meilleur traitement des numeros d'unitees I/O.
!     - Nouveau point d'entree GET_RNDSTAT dans OUVSTD.
!
!     Revision 3.91  2005/11/22 18:41:43  dugas
!     Chercher le premier enregistrement crochet dans MAKZREF.
!
!     Revision 3.90  2005/07/28 17:40:02  dugas
!     Corriger le format 6013 de SAVZREF.
!
!     Revision 3.89  2005/07/28 17:00:22  dugas
!     - Ajouter "BLOCK DATA DATA_CONVSUB", pour des raisons de conformite avec F90.
!     - S'assurer que le DATYP de l'enregistrement HY est conserve.
!
!     Revision 3.88  2005/04/14 16:41:10  dugas
!     Proteger PT_NI,PT_NJ,PT_NK en cas d'echec de la lecture dans LIRPT.
!
!     Revision 3.87  2005/02/01 20:56:43  dugas
!     Modifier le comportement de READSTD en mode DEBUG
!
!     Revision 3.86  2004/11/26 15:35:27  dugas
!     Modifier les formats DEBUG 6110 et 6220 de GETZREF.
!
!     Revision 3.85  2004/11/08 20:41:04  dugas
!     Completer le support des donnees de type CHAR/datyp=3 et
!      tenir compte de noms purement numeriques dans la detection
!      de noms de fichiers qui sont seulement en majuscules dans
!      ouvSTD (probleme fonctionnel avec fnom).
!
!     Revision 3.84  2004/09/13 17:27:57  dugas
!     1) Ajouter le support des donnees de type CHAR/datyp=3
!        dans les routines PARFILL, IBUFILL et WRITSTD.
!     2) Ajouter l'ouverture en mode APPEND dans OUVSTD.
!
!     Revision 3.83  2004/04/30 16:03:56  dugas
!     Corriger le re-calcul d'un nouveau npas dans PARFILL.
!     Converver le TYPVAR des enregistrements HY (LIRPT).
!
!     Revision 3.82  2003/08/25 18:47:33  dugas
!     Pas de IP1=32767 lorsque nlev=1 dans PARFILL
!
!     Revision 3.81  2003/05/23 18:58:22  dugas
!      Modifier le calcul de la variable "lev" dans
!      la routine IBUFILL lorsque KIND=0,4,6 et 17.
!
!     Revision 3.80  2002/12/06 16:26:20  dugas
!     Correction de certains formats I/O en mode DEBUG
!
!     Revision 3.79  2002/08/20 18:42:38  dugas
!     Ajouter PUSHYZ/FINDYZ qui sont utilises dans WRITSTD
!        et WRIZREF, respectivement.
!     Corriger HYBREF_TO_IG et IG_TO_HYBREF selon V.Lee.
!     Ajouter le traitement de l'option KEEPIP2 dans PARFILL.
!     Ajouter IP2 dans le tampon HIGHBUF.
!
!     Revision 3.78  2002/04/22 15:47:21  dugas
!     Corriger/Modifier le support des grilles de
!     type Y et ajouter du code DEBUG un peu partout.
!
!     Revision 3.77  2002/01/14 13:53:42  dugas
!     Ajouter le support des enregistrements 'HY' dans IBUFILL et PARFILL
!     Ajouter la routine LIRPT et ses points d'entrees ECRPT, GETPT et SETPT.
!     Ajouter les routines ig_to_hybref et hybref_to_ig (emprunt de GEM/DM)
!     Ajouter un message informatif concernant les series temporelles pour
!      les grilles de type 'L' (elles ne sont pas supportees a ce jour)
!
!     Revision 3.76  2001/11/20 21:21:06  armnrbd
!     Corriger les conversions des IP1 dans le cas de niveaux
!     arbitraires dans les routines IBUFILL et PARFILL.
!
!     Revision 3.75  2001/10/03 14:34:00  armnrbd
!     Tenir compte des coordonnees de type hauteur (KIND=0) dans
!      les routines de conversions IBUFILL et PARFILL.
!
!     Revision 3.74  2001/08/31 10:58:44  armnrbd
!     IBUFILL va transferer la variable PKTYP dans HIGHBUFF.
!     Enlever le common ZZPKTYP de WRITSTD.
!
!     Revision 3.73  2001/05/01 15:53:12  armnrbd
!     Modifier le traitement des decripteurs IP1 de type
!     arbitraire dans IBUFILL et PARFILL.
!
!     Revision 3.72  2001/02/27 00:11:34  armnrbd
!     Remplacer les appels a PERROR par des appels a MESSYS.
!
!     Revision 3.71  2001/02/13 19:27:34  armnrbd
!     Ajouter l'usage de OLDIP! dans OUVSTD et PARFILL.
!     Verifier la presence d'enregistrements de renvois dans READSTD
!
!     Revision 3.70  2001/02/01 12:17:01  armnrbd
!     Utiliser DIMSUP1 et DIMSUP2 pour supporter les grilles 3D.
!     Corriger les formats des messages de type DEBUG.
!
!     Revision 3.69  2001/01/19 00:24:12  armnrbd
!     Ajouter des messages "DEBUG" dans GETZREF.
!
!     Revision 3.68  2000/11/24 12:56:40  armnrbd
!     Utiliser hignam dans IBUFILL et PARFILL.
!
!     Revision 3.67  2000/09/28 15:45:14  armnrbd
!     Modifier les message DEBUG dans PARFILL.
!     En ajouter dans READSTD et WRITSTD.
!     Ajouter un arret d'erreur dans WRITSTD dans le cas
!      de grille standard 1989 de plus de 500000 mots et
!      utilisant le mode X64.
!
!     Revision 3.66  2000/09/12 15:07:55  armnrbd
!     Corriger un effet de de bord de FIXNINJ,
!      i.e. s'assurer que ILG=LA dans IBUFILL
!      pour les champs de type spectraux.
!
!     Revision 3.65  2000/08/29 13:04:02  armnrbd
!     Utiliser le IP1 qu'on a sauve dans HIGHBUF pour
!     determiner le VKIND (lorsque c'est possible).
!
!     Revision 3.64  2000/07/24 20:49:52  armnrbd
!     Modifier le traitement des series temporelles par IBUFILL
!      et PARFILL dans le cas des fichiers standards 1998.
!     Sauver et recupere IP3 dans HIGHBUF (IBUFILL et PARFILL).
!
!     Revision 3.64  2000/07/24 20:43:07  armnrbd
!     Modifier le traitement des series temporelles par IBUFILL
!      et PARFILL dans le cas des fichiers standards 1998.
!
!     Revision 3.63  2000/05/29 19:38:22  armnrbd
!     Ajouter les IGx dans GETPARI.
!
!     Revision 3.62  2000/04/04 16:44:26  armnrbd
!     Modifier la definition de ZZZDATE dans IBUFILL.
!
!     Revision 3.61  2000/01/24 19:37:36  armnrbd
!     Ajouter du code DEBUG dans GETZREF et OUVZREF.
!     Modifier la creation de ZCROCHETS dans GETZREF et SAVZREF.
!
!     Revision 3.60  1999/11/17 18:03:41  armnrbd
!     Ajouter le point d'entree PUTZREF dans GETZREF.
!
!     Revision 3.59  1999/05/12 14:34:23  armnrbd
!     Ajouter les variables BIG_TMPDIR et USE_BIG_TMPDIR.
!
!     Revision 3.58  1999/05/07 00:36:02  armnrbd
!     Modifier la definition de ILG pour le cas spectral dans IBUFILL.
!
!     Revision 3.57  1999/04/27 18:19:39  armnrbd
!     Modifier le format 6101 de IBUFILL pour IP1.
!
!     Revision 3.56  1999/04/26 20:48:30  armnrbd
!     1) Ajouter deux arguments a GETZDES.
!     2) Faire appel a GETZDES dans IBUFILL pour
!        identifier les series temporelles SUBA.
!
!     Revision 3.55  1999/04/23 18:11:06  armnrbd
!     Corriger un probleme de recurrence avec les routines
!     de traitement des enregistrements crochets.
!
!     Revision 3.54  1999/04/08 20:19:25  armnrbd
!     Enlever la declaration de PRIS dans OUVZREF.
!
!     Revision 3.53  1999/04/08 19:37:51  armnrbd
!     Utiliser le comdeck MACHTYPE.CDK.
!     Corriger deux appels a FSTPRM dans SAVZREF.
!     Verification supp des variables lues dans SAVZREF.
!     Utiliser FNOM pour ouvrir le fichier zcrochets.
!
!     Revision 3.52  1999/02/18 19:40:43  armnrbd
!     Remplacer 01010100 par 1901010100 dans PARFILL.
!
!     Revision 3.51  1999/01/19  19:54:52  armnrbd
!     Modifier le grtyp des grilles de type FOUR.
!     Ajouter le support des champs de type COEF.
!     Separer TYPVAR et GRTYP dans le bloc highbuff.
!
!     Revision 3.50  1999/01/12  21:02:41  armnrbd
!     Re-assigner le GRTYP correspondant aux grilles FOUR.
!     L'ancien GRTYP est utilise par les grilles GRIB-Lambert.
!
!     Revision 3.49  1998/12/28  19:11:49  armnrbd
!     Definir IP2 dans PARFILL (ce n'etait pas toujours fait).
!     Corriger le format de DEBUG dans PARFILL.
!
!     Revision 3.48  1998/10/27  15:05:30  armnrbd
!     Corriger un bogue dans GETZREF concernant ^^.
!
!     Revision 3.47  1998/09/01  14:15:54  armnrbd
!     Modifier les appels "blind" a FSTPRM.
!
!     Revision 3.46  1998/07/13  19:49:33  armnrbd
!     S'assurer que le dernier jeux d'enregistrements de renvois
!      est sauve dans le champs POINTXY a la sortie de SAVZREF.
!
!     Revision 3.45  1998/07/07  14:31:20  armnrbd
!     Utiliser NEWDATE,DATMGP2 et IDATMG2 pour traiter le DATE-TIME STAMP.
!
!     Revision 3.44  1998/06/16  18:20:12  armnrbd
!     S'assurer de la position des fichiers SQ89 a la sortie de MAKZREF.
!
!     Revision 3.43  1998/06/13  02:46:07  armnrbd
!     Enlever tout le code de positionnement a la
!      sortie des routines SAVZREF et MAKZREF.
!
!     Revision 3.42  1998/06/08  02:43:15  armnrbd
!     Utiliser GETHIC et PUTHIC pour gerer les mots supplementaires
!      de IBUF et ce notamment pour NEWL.
!
!     Revision 3.41  1998/05/28  19:37:49  armnrbd
!     - Ajouter le comdeck HIGHBUF.
!     - Utiliser CONVPR/LVCODE/LVDCODE pour les conversions de/vers IP1.
!     - Ajouter le champs DATYP dans la section highbuf de IBUF.
!     - Ajouter le support pour le cas DATYP=2 (i.e. donnees entieres).
!     - La sequence d'appel de GETZREF a ete modifiee.
!     - GETZREF fait maintenant un appel a MAKZREF.
!     - Ajouter la routine MAKZREF qui force l'ecriture de ZCROCHETS.
!     - Ajouter un appel a CONVPR (MODE=0) dans OUVSTD si SQ98 est defini.
!     - Corriger l'ouverture de ZCROCHETS dans OUVZREF (probleme avec HPs).
!     - Modifier le sens des parametres d'entree de SAVZREF. Si NF est
!       negatif, ne pas repositionner le fichier d'entree avant de quitter.
!     - SAVZREF verifie toujours s'il existe deja une copie des enregistrements
!       de renvois dans le fichier ZCROCHETS dans le cas ou celui-ci etait non
!       vide au demarrage.
!
!     Revision 3.40  1998/04/15  15:20:06  armnrbd
!     Assurer l'initialisation de spec,data,four dans IBUFILL.
!
!     Revision 3.39  1998/04/15  02:23:00  armnrbd
!     Augmenter la taille d'ETIKET de 8 a 16 caracteres.
!     Le macro taille_entete passe de 20 a 22 mots.
!
!     Revision 3.38  1998/04/08  13:37:15  armnrbd
!     Ouvrir les fichiers selon leur type dans OUVSTD (mode STD98).
!     Ajouter de la protection et possiblement re-allouer le champ
!      BLOCLE dans la routine PRECLE (et ses points d'entrees).
!
!     Revision 3.37  1998/02/23  19:49:17  armnrbd
!     Ajouter un champs RCS pour afficher l'historiques des revisions.
!
      SUBROUTINE ibufill( NF, IBUF,KEY, OK )

***    This routine fills IBUF with the result of FSTPRM
***    in such a way that the first 8 words make sense to
***    the other R.DIAG programs and routines.

***    Note that IBUF is assumed to be long enough to hold
***    all the necessary parameters.

      use DIAG_TOC, only: LirTOC
      use diag_convert_ip123

      IMPLICIT    none

      LOGICAL     OK
      INTEGER     ibuf(*),KEY,NF

      integer,    parameter :: MAXBITS =  32
#     if defined (CRAY) || defined (NEC64)
      integer,    parameter :: BITSMOT = 64
#     else
      integer,    parameter :: BITSMOT = 32
#     endif

      REAL        pr
      CHARACTER*4 type,nom,newl
      CHARACTER*12 alev,alev2,alev3
      LOGICAL     spec,four,data,coef,char,cmpl
      INTEGER     time,lev,ilg,ilat,ihem,pack,ktr,err
      INTEGER     lsr, la,lr,lm,lrlmt,kind, i,j,k
      INTEGER*8   DATE_CONVERSION_FACTOR

      character   blk*16
      integer     dummy,dummy0,dummy1,dummy2, NBR_TOC

      type(FLOAT_IP) :: RP1,RP2,RP3
      integer     RANGE_KIND,k1,k2,k3,stat
      real        HIVAL,LOVAL

      REAL*8      ecoule
      INTEGER     aa,mm,jj,hh,datev
      EXTERNAL    incdatr,datmgp2

      LOGICAL     :: MVALUE
      REAL*8      :: RVALUE,REPSIL

      CHARACTER*4 getyp,pktyp
      EXTERNAL    getyp

      INTEGER     clrlmt
      EXTERNAL    clrlmt,dimgt2,lvcode,xit,leadblk,convpr

      LOGICAL     info,debug,cdate,keepip2
      INTEGER     datval
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/ debug
      COMMON     /ZZZDATE/ cdate,keepip2,datval

      INTEGER,    EXTERNAL :: FSTPRM
      EXTERNAL    SAVZREF,PUTHIGH,PUTHIC,PUTHIR,GETZDES

#     include    "fstparm.cdk"
*------------------------------------------------------------------------------

      spec = .false.
      four = .false.
      data = .false.
      coef = .false.
      char = .false.
      cmpl = .false.

      call GET_DCF( DATE_CONVERSION_FACTOR ) ! Different DATE format ?

      CLE = KEY

***    Aller seulement chercher le nom de la variable.

      ERR = FSTPRM( CLE, dummy0,dummy1,dummy2,
     +              dummy,dummy,dummy, dummy,dummy,
     +              dummy,dummy,dummy, blk,nom,blk,
     +              blk,dummy,dummy,dummy,dummy,
     +              swa,lng,dltf,ubc,
     +              extra1,extra2,extra3 )

      if (ERR.lt.0)                                            then
          OK = .false.
          return
      else
          OK = .true.
      end if

      if (nom.eq.'>>' .or.
     +    nom.eq.'^^' )                                        then

***        Traiter les enregistrements de renvois positionels
***        '>>' et '^^' pour les grilles de type Y et Z.

          read(nom,0004) ibuf(3)
          if (nf.gt.0) call savzref( nf,OK )
          KEY = CLE
          return

      else if (nom == '^>')                                    then

***        Traiter les enregistrements de renvois
***        positionnels pour les grilles de type U.

          read(nom,0004) ibuf(3)
          if (nf.gt.0) call savUref( nf,OK )
          KEY = CLE
          return

      else if (nom.eq.'HY')                                    then

***        Faire la meme chose pour l'enregistrement
***        PT qui peut contenir la description de la
***        coordonnee verticale hybride de GEM/DM.

          read(nom,0004) ibuf(3)
          call lirpt( nf )
          return

      else if (nom.eq.'!!')                                    then

***        Idem pour les TocToc (!!) de la version 4 de GEM qui
***        remplacent les enregistrements PT de la version 3.

          read(nom,0004) ibuf(3)
          call LirTOC( nf, nbr_toc )
          return

      end if

***    Aller chercher tous les parametres de l'enregistrement courant.

      ERR = FSTPRM( CLE,
     +              dateo,deet,npas, ni,nj,nk, nbits,datyp,
     +              ip1,ip2,ip3, typvar,nomvar,etiket,
     +              grtyp,ig1,ig2,ig3,ig4, swa,lng,dltf,ubc,
     +              extra1,extra2,extra3 )

***    Evaluer RANGE_KIND,HIVAL,LOVAL tout de suite.
***    Ils seront saives dans les mots 29,30,31 de IBUF.

      stat = diag_decode_ip( RP1,RP2,RP3,ip1,ip2,ip3 )

      if (debug .and. stat == CONVERT_ERROR)                   then
          write(6,6002) stat,ip1,ip2,ip3
          call                                     xit(' Ibufill',-2 )
      end if

      k1 = RP1%kind ; k2 = RP2%kind ; k3 = RP3%kind

***    Interval vertical ou de temps (avec combinaison des IP1/2/3) ?

      if (RP3%kind == -1 .and.
     +   (stat == CONVERT_OK .or. stat == CONVERT_GOOD_GUESS)) then

          if (RP1%hi /= RP1%lo) then   ! Interval vertical
              HIVAL = RP1%hi ; LOVAL = RP1%lo ; RANGE_KIND = k1
          else
     +    if (RP2%hi /= RP2%lo .and.
     +        stat == CONVERT_OK) then ! Interval de temps
          !!! Il est preferable de ne pas utiliser CONVERT_GOOD_GUESS
          !!! pour un interval de temps parce que ceci pourrait entrer
          !!! en conflit avec le codage precedent des IP2/IP3. On
          !!! utilisera alors explicetement GETSAMPLZ
              HIVAL = RP2%hi ; LOVAL = RP2%lo ; RANGE_KIND = k2
          else                         ! Aucun interval
              HIVAL = -1.0   ; LOVAL = -1.0   ; RANGE_KIND = -1
          end if

      else if (ip2*720_8 == nint( deet*dble( npas )/5,8 ))     then

          ! ip2 = npas*deet a 5 secondes pres ==>
          ! Codage "Old-Style". On suppose alors
          ! qu'on n'aura pas d'intervalles codes.

          call diag_convip_plus( ip1,RP1%hi,k1,-2,blk,.false. )

                         RP1%lo = RP1%hi
          RP2%hi = ip2 ; RP2%lo = RP2%hi ; k2 = KIND_HOURS
          RP2%hi = ip3 ; RP3%lo = RP3%hi ; k3 = KIND_SAMPLES

          stat = CONVERT_OK

      else                             ! Aucun interval
          HIVAL = -1.0   ; LOVAL = -1.0   ; RANGE_KIND = -1
      end if

      if (debug)                                               then
          call  get_ip_string( ip1,alev ) ;  call leadblk( alev )
          call  get_ip_string( ip2,alev2 ) ; call leadblk( alev2 )
          call  get_ip_string( ip3,alev3 ) ; call leadblk( alev3 )
          if (RANGE_KIND >= 0)                                 then
              if (RANGE_KIND == KIND_HOURS)                    then
                  write(6,6105) dateo,npas,deet, ni,nj,nk,nbits,ip1,
     +                  trim(alev),ig1,ig2,ig3,ig4
              else
                  write(6,6106) dateo,npas,deet, ni,nj,nk,nbits,
     +                  ip2,trim(alev2),ig1,ig2,ig3,ig4
              end if
          else
              write(6,6101) dateo,npas,deet, ni,nj,nk,nbits,ip1,
     +        trim(alev),ip2,trim(alev2),ip3,trim(alev3),ig1,ig2,ig3,ig4
          end if
          write(6,6102) grtyp,typvar,nomvar,etiket,datyp
          if (RANGE_KIND >= 0) write(6,6103) RANGE_KIND,HIVAL,LOVAL
      end if

***    Il n'y a ici aucune conversion de noms.

      nom = nomvar

***    Est-ce qu'on traite des champs contenant
***    autres choses que des grilles gaussiennes ?

      if      (grtyp.eq.'*')                                   then
          spec = .true.
      else if (grtyp.eq.'@')                                   then
          four = .true.
      else if (grtyp.eq.'&')                                   then
          coef = .true.
      else if (grtyp.eq.'X' .and.
     +         iand( datyp,3 ) == 3)                           then
          char = .true.
      else if (iand( datyp,8 ) == 8)                           then
          cmpl = .true.
      else if (grtyp.eq.'X' .or. grtyp.eq.'O')                 then
          data = .true.
      end if

***    Definit time a l'aide de dateo,npas et deet.

      if ((.not.cdate .and. npas /= 0 .and. deet == 0) .or.
     +     DATE_CONVERSION_FACTOR < 0)                         then

***       ****
          time = npas
***       ****

      else

          if (deet.ne.0)                                       then

              if (dateo.eq.0)                                  then
                  dateo = 101010101
                  if (debug) write(6,6104)
              end if

              ecoule = ( npas*( DBLE( deet )/ 60) )/60
              call incdatr( datev,dateo,ecoule )

          else

              datev = dateo

          end if

***       ****
          time    = datev
***       ****

      end if

***    La pression (de 10 a 1000) est conservee telle quelle,
***    les niveaux 'sigma' sont multiplies par 1000 et
***    la hauteurs sont en centaines de metres.

      newl = ' '

      if (ip1.eq.32767)                                        then

          newl = 'NEWL'
          lev  =  0
          
      else

          call convpr( ip1,pr, kind, -1 )

***        Forcer la definition de lev en mode NEWSTYLE.

          if (ip1.le.32767)                                    then
              call convpr( lev,pr, kind, +2 )
          else
              lev = ip1
          end if

      end if

***    Conversion de (ni/nj/nk) vers (type/ilg/ilat).

      if (.not.( spec .or. four .or. cmpl
     +    .or.   data .or. coef .or. char ))                   then

          if (nj.eq.1)                                         then
              type = 'ZONL'
              ilg  = ni
              ilat = nk
          else if (ni.eq.1)                                    then
              type = 'ZONL'
              ilg  = nj
              ilat = nk
          else if (nk.eq.1)                                    then
              type = 'GRID'
              ilg  = ni
              ilat = nj
          else

              type = 'DATA'
              ilg  = ni
              ilat = nj*nk

              call puthigh( nk,'DIMSUP1',ibuf )

          end if

***        Tenir compte des series temporelles de grilles.
***        IBUF(2) doit alors contenir npas et non pas la date.

          if (type   .eq.'ZONL' .and.
     +        ig3*ig4.ne. 0     )                              then
              time    =   npas
              if (ig3.ne. 1     .and.
     +            ig4.ne. 1     )
     +            type    = 'GRID'
          end if

      else if (spec .or. coef)                                 then

***        Cas spectral ou serie temporelle spectrale.

          if (spec) type = 'SPEC'
          if (coef) type = 'COEF'

          if (ig3.eq.2)                                        then
              ktr = 2
          else if (ig3.eq.1)                                   then
              ktr = 0
          end if

          lrlmt = clrlmt( ig1+1,ig2+1,ktr,.TRUE.)
          call dimgt2( lsr, la,lr,lm,ktr,lrlmt, ig4,-1 )

          if (spec)                                            then

              if (iand( datyp,8 ) == 8)                        then
                  ilg  =  ni*nj*nk
              else
                  ilg  =  ni*nj*nk/2
              end if

              if (ilg.ne.la)                                   then

***                Verifier si le ilg est le resultat d'un appel
***                prealable a fixninj. Si oui, s'y ajuster.

                  i = la
                  j = 1
                  k = 1

                  Call fixninj( i,j,k )

                  i = i * j * k
                  if (i.eq.ilg) ilg = la

              end if

          end if

***        LA peut etre plus petit que ILG = NI*NJ*NK si
***        les dimensions spectrales ont ete corrigees avec
***        la routine FIXNINJ. Par contre, si LA est plus
***        grand que ILG, on a probablement une serie de
***        fourier construite avec une serie temporelle de
***        coefficients spectraux. En bref, dans ce cas:
***        SPEC (timagg) ==> COEF (tsafc) ==> SPEC !

          if (coef) ilg  =  ni

          ilat =  1

      else if (four)                                           then

***        Cas fourier.

          type = 'FOUR'
          ilg  = ni*nj*nk
          ilat = 1

      else if (cmpl)                                           then

***        Cas donnees complexes.

          type = 'CMPL'

          ilg  = ni
          ilat = nj

          call puthigh( nk,'DIMSUP1',ibuf )

      else if (data)                                           then

***        Cas donnees brutes.

          type = 'DATA'

          ilg  = ni
          ilat = nj*nk

          call puthigh( nk,'DIMSUP1',ibuf )

      else if (char)                                           then

***        Cas donnees caracteres.

          type = 'CHAR'

          ilg  = (ni+3)/4
          ilat =  nj*nk

          call puthigh( nk,'DIMSUP1',ibuf )

      end if

***    Conversion de (grtyp/ig1/ig2/ig3/ig4) vers (ihem).

***    L'archivage ccrn ne fait aucune distinction entre
***    une grille  lat-long hemispherique et  une grille
***    polaire stereographique.  Cette information est
***    perdue lors de la transformation. Le tampon INFO
***    doit etre cree pour remedier a cette situation.

      if (grtyp.eq.'A' .or.
     +    grtyp.eq.'B' .or.
     +    grtyp.eq.'G' .or.
     +    grtyp.eq.'@' )                                       then

***        Cas lat-long ou fourier. Notons que l'inclusion de ig3
***        et ig4 assure ici le support des series temporelles.

          ihem = (ig3*1000+ig4)*10+ig1

      else if (data .or.char)                                  then

***        Donnees brutes ou de type caractere.

          ihem = 0

      else if (spec .or. coef)                                 then

***        Grille spectrale. Le calcul de
***        lrlmt a deja ete effectue.

          ihem = lrlmt

      else if (grtyp.eq.'L' .or.
     +         grtyp.eq.'N' .or.
     +         grtyp.eq.'S' .or.
     +         grtyp.eq."!" .or.
     +         grtyp.eq.'U' .or.
     +         grtyp.eq.'Y' .or.
     +         grtyp.eq.'Z' .or.
     +         grtyp.eq.'#')                                   then

***        Les grilles GEM de type Y, Z ou #, les grilles
***        lat-long ou bien les grilles polaires
***        stereographiques sont de type SUBA.

          if (.not.cmpl) type = 'SUBA'
          ihem =  0

***        Cas polaire-stereographique.

          if (grtyp.eq.'N')                                    then
              ihem = 1
          else if (grtyp.eq.'S')                               then
              ihem = 2
          end if

***        Traiter les series temporelles de grilles Y ou Z.

          if (ig3  .ne. 0 .and.
     +        ig4  .ne. 0 .and.
     +       (grtyp.eq.'Y' .or.
     +        grtyp.eq.'Z')) ihem = (ig3*1000+ig4)*10

      else

***        Grille de type non supporte.

          if (info) write(6,6003) grtyp
          call                                     xit(' Ibufill',-3 )

      end if

***   ******** Transfert de (nbits) vers (pack).
#     if defined (CRAY) || defined (NEC64)
      if (mod( BITSMOT,nbits ).eq.0)                           then
          pack = BITSMOT/nbits
          pack = min( pack, MAXBITS )
      else
          pack = -nbits
      end if
#     else
      pack = -nbits
#     endif
      if (char) pack = -32

      call MISPAR( MVALUE,RVALUE,REPSIL ) ! Check for missing data ?

      ! Try to turn on the missing value treatment ?
      if (IAND( datyp,64 ) > 0 .and. .not.MVALUE)              then
          call SET_MISPAR( RVALUE,REPSIL )
      else if(IAND( datyp,64 ) == 0)                           then
          call UNSET_MISPAR()
      end if

***    **************************************
***    Transfert de l'information vers ibuf.

      read(type,4) ibuf(1)
      read(nom ,4) ibuf(3)

      ibuf(2) = time
      ibuf(4) = lev          
      ibuf(5) = ilg
      ibuf(6) = ilat
      ibuf(7) = ihem
      ibuf(8) = pack

      call puthic( etiket(13:16),'ETIK4',ibuf )
      call puthic( etiket( 9:12),'ETIK3',ibuf )
      call puthic( etiket( 5: 8),'ETIK2',ibuf )
      call puthic( etiket( 1: 4),'ETIK1',ibuf )

      call puthic( nomvar,'NAME', ibuf )
      call puthic( newl,  'NEWL', ibuf )

!     call puthigh( ip1,  'IP1',  ibuf )
      call puthigh( ip2,  'IP2',  ibuf )
      call puthigh( ip3,  'IP3',  ibuf )
      call puthigh( datyp,'DATYP',ibuf )

      call puthigh( ig4,  'IG4',  ibuf )
      call puthigh( ig3,  'IG3',  ibuf )
      call puthigh( ig2,  'IG2',  ibuf )
      call puthigh( ig1,  'IG1',  ibuf )
      call puthigh( dateo,'DATEO',ibuf )
      call puthigh( npas, 'NPAS', ibuf )
      call puthigh( deet, 'DEET', ibuf )

      call puthic( grtyp, 'GRTYP' ,ibuf )
      call puthic( typvar,'TYPVAR',ibuf )

      pktyp = getyp( nf )
      call puthic( pktyp, 'PKTYP', ibuf )

      call puthigh( range_kind,'RKIND', ibuf )
      call puthir ( hival     ,'HIVAL', ibuf )
      call puthir ( loval     ,'LOVAL', ibuf )

      RETURN

*------------------------------------------------------------------------------
 0004 FORMAT(A4)

 6002 FORMAT(' Ibufill: decode_ip error=',I3,', IP1,IP2,IP3=',3I11)
 6003 FORMAT(' Ibufill: grtyp ',A,' not supported by r.diag.')

 6101 FORMAT('*DEBUG:IBUFILL (1) DATEO=',I12,', NPAS=',I9,
     +       ', DEET=',I5,', NI,NJ,NK=',3I5,', NBITS=',I5/
     +       '*DEBUG:IBUFILL (2) IP1,IP2,IP3=',3(I9,' ( ',A,' ) '),
     +       ', IG1,IG2,IG3,IG4=',4I6)
 6102 FORMAT('*DEBUG:IBUFILL (3) GRTYP=',A,', TYPVAR=',A,
     +       ', NOMVAR=',A,', ETIKET=',A,', DATYP=',I6)
 6103 FORMAT('*DEBUG:IBUFILL (4) RANGE_KIND=',I3,' HIVAL,LOVAL=',2E15.7)
 6104 FORMAT('*DEBUG:IBUFILL found DATEO=0, reset to 101010101')
 6105 FORMAT('*DEBUG:IBUFILL (1) DATEO=',I12,', NPAS=',I9,
     +       ', DEET=',I5,', NI,NJ,NK=',3I5,', NBITS=',I5/
     +       '*DEBUG:IBUFILL (2) IP1=',I9,' ( ',A,' ) ',14X,
     +       ', IG1,IG2,IG3,IG4=',4I6)
 6106 FORMAT('*DEBUG:IBUFILL (1) DATEO=',I12,', NPAS=',I9,
     +       ', DEET=',I5,', NI,NJ,NK=',3I5,', NBITS=',I5/
     +       '*DEBUG:IBUFILL (2) IP2=',I9,' ( ',A,' ) ',
     +       ', IG1,IG2,IG3,IG4=',4I6)

      END SUBROUTINE ibufill
      SUBROUTINE parfill( IBUF )

***    This routine fills the FSTPRM parametre block with
***    the first 8 words of IBUF and what already is in the
***    fstparm common block.

      IMPLICIT    none

      INTEGER     ibuf(*)

      integer,    parameter :: MAXBITS =  32
      integer,    parameter :: HEAD = taille_entete

      REAL        zero,hold
      REAL        pr1,pr2
      LOGICAL     ok,value
      REAL(8)     rip2,rdeet,pphinv
      CHARACTER(4) type,nom,hnewl,ibuf4,noma
      INTEGER     time,lev,ilg,ilat,ihem,pack
      LOGICAL     spec,four,data,coef,char,cmpl
      INTEGER     aa,mm,jj,nlev,BITSMOT, pas
      INTEGER     lsr,lr,lm,la,ktr,lrlmt,kind1,kind2
      INTEGER     dtpr,tmpr,datchek, ni0,nj0,nk0
      INTEGER(8)  DATE_CONVERSION_FACTOR

      LOGICAL,    save :: turbo_compress = .true.

      integer     range_kind
      real        hival,loval

      LOGICAL     :: MVALUE,Add64
      REAL(8)     :: RVALUE,REPSIL

      REAL,       EXTERNAL  :: gethir
      CHARACTER(4),EXTERNAL :: gethic
      INTEGER,    EXTERNAL  :: clrlmt,gethigh,newdate
      EXTERNAL    lvdcode,xit,eqvnomt,convhour
      EXTERNAL    dimgt2,difdatr,leadblk,convpr

#     include    "highbuf.cdk"
#     include    "zlabel.cdk"

      LOGICAL              info,   debug,  oldip1, e64out
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/         debug
      COMMON     /ZZ98IP1/                 oldip1
      COMMON     /ZZZE64O/                         e64out

      INTEGER                            datval
      LOGICAL              cdate,keepip2
      COMMON     /ZZZDATE/ cdate,keepip2,datval

#     include    "machtype.cdk"
#     include    "fstparm.cdk"

      logical,    save :: message_pas_donne
      data                message_pas_donne / .true. /
*------------------------------------------------------------------------------
      zero  = 0.0

      char  = .false.
      cmpl  = .false.
      coef  = .false.
      data  = .false.
      four  = .false.
      spec  = .false.

      if (debug)
     +    write(6,6100) (ibuf(jj),jj=1,8)
      if (debug .and. HEAD .ge. 9)                             then
          write(6,6101) (ibuf(jj),jj=9 ,MIN(16,HEAD))
          write(6,6102) (ibuf(jj),jj=17,MIN(24,HEAD))
          write(6,6103) (ibuf(jj),jj=25,MIN(28,HEAD))
          write(6,6104) HEAD ,(ibuf(jj),jj= 29,HEAD)
      end if

      call GET_DCF( DATE_CONVERSION_FACTOR ) ! Different DATE format ?

***    Separer IBUF en composantes individuelles.

      write(type,4) ibuf(1)
      write(nom ,4) ibuf(3)
      write(ibuf4,4) ibuf(4)

      time   =      ibuf(2)
      lev    =      ibuf(4)
      ilg    =      ibuf(5)
      ilat   =      ibuf(6)
      nlev   =      ilat
      ihem   =      ibuf(7)
      pack   =      ibuf(8)

      ip1    =      lev

      if (higheti)                                             then
          etiket(13:16)  = gethic('ETIK4' ,ibuf )
          etiket( 9:12)  = gethic('ETIK3' ,ibuf )
          etiket( 5: 8)  = gethic('ETIK2' ,ibuf )
          etiket( 1: 4)  = gethic('ETIK1' ,ibuf )
      end if

      if (highnam) noma  = gethic( 'NAME' ,ibuf )
                   hnewl = gethic( 'NEWL' ,ibuf )

      if (highip1) ip1   = gethigh('IP1',  ibuf )
      if (highip2) ip2   = gethigh('IP2',  ibuf )
      if (highip3) ip3   = gethigh('IP3',  ibuf )
      if (highdtp) datyp = gethigh('DATYP',ibuf )

      if (highigi)                                             then
          ig4 = gethigh('IG4',ibuf )
          ig3 = gethigh('IG3',ibuf )
          ig2 = gethigh('IG2',ibuf )
          ig1 = gethigh('IG1',ibuf )
      end if

      if (highdat) dateo  = gethigh('DATEO',ibuf )
      if (highpas) npas   = gethigh('NPAS', ibuf )
      if (highdel) deet   = gethigh('DEET', ibuf )

      if (hightyp) grtyp  = gethic('GRTYP' ,ibuf )
      if (highvar) typvar = gethic('TYPVAR',ibuf )

      if (highkin) range_kind = gethigh('RKIND',ibuf )
      if (highhiv) hival  = gethir('HIVAL',ibuf )
      if (highlov) loval  = gethir('LOVAL',ibuf )

*     if (deet .lt.     0 .or.
*    +    deet .gt. 32767 )
*    +    deet  =       0

      rdeet  = deet
      pphinv = (rdeet/60)/60

      call leadblk( type )
      call leadblk( nom  )

***    Verifier si les nom passe dans ibuf(3) et
***    celui contenu dans HIGHBUF sont equivalent.

      if (highnam .and. nom /= noma)                           then
          call eqvnomt( nom,noma, ok )
          if (ok) nom = noma
      end if

      if (ZLABEL .ne.' ') etiket =  ZLABEL

***    Il n'y a ici aucune conversion de nom.

      nomvar = nom

***    La variable time devrait deja contenir datev.
***    Transformer ceci en dateo,npas et deet. Si npas
***    et deet sont tous deux non-nuls, mettre ip2 
***    a-jour en meme temps.

      if (DATE_CONVERSION_FACTOR >= 0)                         then

***        verifier que time contient vraiment un
***        "DATE-TIME STAMP group" valide.

          datchek = newdate( time, dtpr,tmpr, -3 )

***        calculer npas,ip2 (ce dernier, ssi keepip2 est faux).

          if (deet.ne.0)                                       then

              if (datchek.eq.0)                                then

                  call difdatr( time,dateo,rip2 )

                  if (rip2 > 0.0_8)                            then
 
                      npas  = NINT( rip2 / pphinv )

***                    S'assurer de la coherence entre
***                    les parametres ip2, npas et deet.

                      if (.not. keepip2 
     +                    .and. (highip2 
     +                    .or.  range_kind >= 0))              then
                          hold = npas * pphinv
                          call convhour( ip2, hold, +2 )
                      end if

                  else

                      dateo = time
                      npas  = 0
                      deet  = 0

                  end if

              else if (time < 01 01 00 01 0) then

***                cette valeur est la plus petite associe
***                a un "DATE-TIME STAMP group" valide.

                  npas  = time
                  if (.not. keepip2 
     +                .and. (highip2 
     +                .or.  range_kind >= 0))                 then
                      hold = npas * pphinv
                      call convhour( ip2, hold, +2 )
                  end if

              end if

          else

              if (datchek.eq.0)                                then
                  dateo = time
                  npas  = 0
              else
                  npas  = time
              end if
             
              if (.not. keepip2 .and. highip2)
     +            call convhour( ip2, zero, +2 )

          end if

      else

***        time devrait contenir un pas de temps.

          npas = time

***        on tente tout de meme de mettre a jour IP2.

          if (.not. keepip2 .and. highip2)                     then
              if (deet /= 0)                                   then
                  hold = npas * pphinv
                  call convhour( ip2, hold, +2 )
              else
                  call convhour( ip2, zero, +2 )
              end if
          end if

      end if

***    Les champs de type complexe ne sont pas soutenus
***    mais les champs de coefficients spectraux le sont.

      if (type.eq.'SPEC' .or. type.eq.'COEF')                  then

          if (type.eq.'COEF') coef  = .true.
          if (type.eq.'SPEC') spec  = .true.
          datyp = 8
          lrlmt = ihem
          Call dimgt2( lsr, la,lr,lm,ktr,lrlmt, 0,-1 )

      else if (type.eq.'FOUR')                                 then

          four  = .true.
          datyp = 8

      else if (type.eq.'DATA')                                 then

          data  = .true.

      else if (type.eq.'CHAR')                                 then

          char  = .true.

      else if (type.eq.'CMPL')                                 then

          cmpl  = .true.
          datyp = 8

      end if

***    Verifier coherence du type de donnees complexes.

      if (datyp.eq. 8     .and.
     +    type .ne.'CMPL' .and.
     +    type .ne.'FOUR' .and.
     +    type .ne.'SPEC') datyp = 6

***    Conversion de (lev) vers (ip1).

      if (type .ne.'ZONL' .or.
     +    nlev .eq. 1     .or.
     +   (hnewl.ne.'NEWL' .and.
     +    ibuf4.ne.'NEWL' ) )                                  then

          pr1 = -1.

          if (ip1 .ne. lev)                                    then

              call convpr( ip1,pr1, kind1, -2 )
              call convpr( lev,pr2, kind2, -2 )

              if (.not.highip1     .and.
     +           (kind1 .ne. kind2 .or. 
     +            pr1   .ne. pr2   ))                          then
                  pr1   =    pr2
                  kind1 =    kind2
                  ip1   =    lev
              end if

          end if

          if (oldip1 .and. ip1.gt.32767)                       then
              if (pr1.eq.-1.)
     +        call convpr( ip1,pr1, kind1, -2 )
              call convpr( ip1,pr1, kind1, +3 )
          end if

      else

          ip1 = 32767

      end if

***    Conversion de (type/ilg/ilat) vers (ni/nj/nk).

      if (.not.( spec .or. four .or. data .or.
     +           cmpl .or. coef .or. char ))                   then

          if (type.eq.'ZONL')                                  then
              ni = 1
              nj = ilg
              nk = ilat
          else
              ni = ilg
              nj = ilat
              nk = 1
          end if

      else if (spec .or. four)                                 then

***        Cas spectral ou fourier.

          ni = ilg
          nj = 1
          nk = 1

      else if (cmpl)                                           then

***        Cas grilles complexes.

          ni = ilg
          nj = ilat
          nk = 1

          if (grtyp.eq.'L'  .or.
     +        grtyp.eq.'N'  .or.
     +        grtyp.eq.'S'  .or.
     +        grtyp.eq.'!'  .or.
     +        grtyp.eq.'U'  .or.
     +        grtyp.eq.'Y'  .or.
     +        grtyp.eq.'Z'  .or.
     +        grtyp.eq.'#') type = 'SUBA'

      else if (coef)                                           then

***        Cas serie temporelle spectrale.

          ni = ilg
          nj = 1
          nk = 1

      else if (data)                                           then

***        Cas donnees brutes.

          ni = ilg
          nk = max( 1, gethigh('DIMSUP1',ibuf ) )
          nj = max( 1, ilat/nk )

      else if (char)                                           then

***        Cas donnees caracteres.

          ni = 4*ilg
          nk = max( 1, gethigh('DIMSUP1',ibuf ) )
          nj = max( 1, ilat/nk )

      end if

***    Conversion de (ihem) vers (grtyp/ig1/ig2/ig3/ig4).

***    L'archivage ccrn ne fait aucune distinction entre
***    une grille lat-long hemispherique et une grille
***    polaire stereographique. Nous supposons donc
***    qu'une grille hemispherique est une grille
***    ps standard cmc centree au pole

      if (spec .or. coef)                                      then

***        Cas spectral '*' ou serie temporelle spectrale '&'.

          if (spec) grtyp  = '*'
          if (coef) grtyp  = '&'

          ig1    = lr-1
          ig2    = lm-1
          ig4    = 0

          if (ktr.eq.2)                                        then
              ig3 = 2
          else if (ktr.eq.0)                                   then
              ig3 = 1
          end if

      else if (char)                                           then

***        Cas de donnees caracteres.

          grtyp  = 'X'
          ig1    =  0
          ig2    =  0
          ig3    =  0
          ig4    =  0

      else if (data)                                           then

***        Cas de donnees brutes ou de cube 3D

          if (grtyp.ne.'G' .and.
     +        grtyp.ne.'Y')                                    then
              grtyp  = 'X'
              ig1    =  0
              ig2    =  0
              ig3    =  0
              ig4    =  0
          end if

      else if (type.eq.'SUBA')                                 then

***        GRTYP et les IGi ont ete definis explicitement
***        en utilisant les routines putparc et putxgi.

          if (grtyp.ne.'L' .and.
     +        grtyp.ne.'N' .and.
     +        grtyp.ne.'S' .and.
     +        grtyp.ne.'!' .and.
     +        grtyp.ne.'U' .and.
     +        grtyp.ne.'Y' .and.
     +        grtyp.ne.'Z' .and.
     +        grtyp.ne.'#')                                    then

              if (info) write(6,6001) grtyp
              if (info) write(6,6002) dateo,npas,deet, ni,nj,nk,nbits,
     +                                 ip1,ip2,ip3,ig1,ig2,ig3,ig4,datyp
              if (info) write(6,6003) typvar,nomvar,etiket
              call                                 xit(' Parfill',-1 )

          end if

***        Traiter les series temporelles de grilles Y ou Z.

          if (ihem.gt.2)                                       then
              if ((grtyp.eq.'Y' .or. grtyp.eq.'Z') .and.
     +           ((ig3  .eq. 0 .and. ig4  .eq. 0 ) .or.
     +            (ig3  .ne. 0 .and. ig4  .ne. 0 )))           then
                  ig3 =          ihem/10000              ! nombre de points en X
                  ig4 = ( ihem-( ihem/10000 )*10000 )/10 ! nombre de points en Y
              else
                  if (info) write(6,6004) ihem,grtyp,ig3,ig4
                  call                             xit(' Parfill',-2 )
              end if

          else if (grtyp.eq.'Y' .or. grtyp.eq.'Z')             then

!CC           ig3 = 0 ! Pour des raisons de compatibilite arriere...
              ig4 = 0
     
          end if

      else

***        Cas lat-long ou fourier.

          if (grtyp.ne.'A' .and.
     +        grtyp.ne.'B' .and.
     +        grtyp.ne.'G')
     +        grtyp =  'G'
          if (four)
     +        grtyp =  '@'

          ig1   = ihem
          if (ig2.ne.1)
     +    ig2   = 0
          ig3   = 0
          ig4   = 0

***        Traiter les series temporelles de grilles.

          if (ihem.gt.2)                                       then
              ig1 = mod( ihem,10 )
              ig3 =      ihem/10000
              ig4 =    ( ihem-( ihem/10000 )*10000 )/10
          end if

!         if (type.eq.'ZONL' .and.
!    +        newl.eq.'NEWL' .and.
!    +        nlev.ne. 1   )  ig2 = nlev

      end if

      BITSMOT = MAXBITS*( mod( machine,2 )+1 )

***    Transfert de (pack) vers (nbits) ou ce dernier
***    contient toujours le nombre de bits significatifs.

      if (pack.gt.0)                                           then
          nbits = -min( BITSMOT/pack,BITSMOT )
      else if (pack.lt.0)                                      then
          nbits =  max( pack,-BITSMOT*machine )
      end if

      if (IAND( datyp,64 ) > 0)                                then
          Add64 = .true.
          datyp = datyp-64
      else
          Add64 = .false.
      end if

      call MISPAR( MVALUE,RVALUE,REPSIL ) ! Check for missing data ?

      if (Add64 .and. .not.MVALUE)                             then
          ! Try to turn on the missing value treatment
          call SET_MISPAR( RVALUE,REPSIL )
          call MISPAR( MVALUE,RVALUE,REPSIL )
      end if

      if (char)                                                then

***        Forcer la compaction a 8 bits pour les donnees caracteres.

          datyp =  3
          nbits = -8

      else

***        Substituer le type R32 par du IEEE 32 bits. Par contre, on ne
***        veut pas ecrire de IEEE avec moins de 24 bits de precision.
***        Les donnees entieres sont limitees a un mot de precision.

          If (nbits.eq.-64)                                    then
              If (datyp.ne.2 .and.
     +            datyp.ne.4 .and.
     +            datyp.ne.8 )                                 then
                  If (     e64out) datyp = 5
                  If (.not.e64out) datyp = 0
              Else If (datyp == 2 .or. datyp == 4)             then
                  If (nbits.ne.-BITSMOT)                       then
                      nbits =-BITSMOT
                      if (pack.le.0) ibuf(8) = nbits
                      if (info .and. message_pas_donne)        then
                          write(6,6150) nbits
                          message_pas_donne = .false.
                      End If
                  End If
              End If
          Else If (nbits.ge.-16 .and.
     +            (datyp.eq.  6  .or.
     +             datyp.eq.129  .or.
     +             datyp.eq.133  .or.
     +             datyp.eq.134) )                             then
              If (turbo_compress)                              then
                  datyp = 134
              Else
                  datyp = 6
              End If
          Else
              If (datyp == 133 .and.
     +           (ni    <= 16  .or.  nj    <= 16)) datyp = 1
              If (datyp.eq.  8 .or.  datyp.eq.133) nbits =-32
              If (datyp.ne.  8 .and. datyp.ne.133
     +                         .and. datyp.ne. 2
     +                         .and. datyp.ne. 4 ) datyp = 1
              If (nbits == -32 .and. datyp == 1)               then
                  If (ni >  16 .and. nj    >  16)              then
                                                   datyp = 133
                  Else
                                                   datyp = 5
                  End If
              End If
              If (.not.turbo_compress .and.
     +            datyp.eq.133)                    datyp = 5
              If (nbits.ge.-24 .and. datyp.eq.5)   datyp = 1
          End If

      End If

      If (MVALUE) datyp = datyp+64

      RETURN

      ENTRY set_turbo_compress( value )

      turbo_compress = value

      RETURN

*------------------------------------------------------------------------------
 0004 FORMAT(A4)
 0016 FORMAT(4A4)

 6104 FORMAT('*DEBUG:PARFILL (4) Ibuf 29 a ',I2,' = ',I2,3(1x,Z8))
 6103 FORMAT('*DEBUG:PARFILL (4) Ibuf 25 a 28 =',1X,4A4)
 6102 FORMAT('*DEBUG:PARFILL (3) Ibuf 17 a 24 =',2I6,1X,Z8,3I11,2(1X,A))
 6101 FORMAT('*DEBUG:PARFILL (2) Ibuf  9 a 16 =',2(A4,1X),3I8,I12,2I6)
     +                                          
 6100 FORMAT('*DEBUG:PARFILL (1) Ibuf  1 a 8  =',A4,I12,1X,A4,1x,5I8)
 6150 FORMAT('Parfill: 64-bit output not supported with integer ',
     +       '(DATYP=2,4) data types...'/'         nbits reset to ',I3)

 6001 FORMAT('Parfill: SUBA type grid cannot have GRTYP=',A)
 6002 FORMAT('Parfill (1) DATEO=',I12,', NPAS=',I9,
     +       ', DEET=',I5,', NI,NJ,NK=',3I5,', NBITS=',I5/
     +       'Parfill (2) IP1,IP2,IP3=',I9,2I7,
     +       ', IG1,IG2,IG3,IG4=',4I6,', DATYP=',I6)
 6003 FORMAT('Parfill (3) TYPVAR=',A,', NOMVAR=',A,', ETIKET=',A)
 6004 FORMAT('Parfill cannot code IHEM=',I10,' into IG3,IG4 ',
     +       'for GRTYP=',A,', IG3,IG4=',2I6,' already in use.')

      END SUBROUTINE parfill
      INTEGER FUNCTION getpari( NAME )

      implicit          none
      character * ( * ) NAME

      character*8       nom

#     include          "fstparm.cdk"

      external          LOW2UP

*------------------------------------------------------------------------------
***    Convertir name en majuscules.

      nom = NAME
      call LOW2UP( nom,nom )

***    Est-ce un nom connu de variable entiere ?

      if (nom .EQ.'IP1')                                         THEN
          getpari = ip1
      else if (nom .EQ.'IP2')                                    THEN
          getpari = ip2
      else if (nom .EQ.'IP3')                                    THEN
          getpari = ip3
      else if (nom .EQ.'NI')                                     THEN
          getpari = ni
      else if (nom .EQ.'NJ')                                     THEN
          getpari = nj
      else if (nom .EQ.'NK')                                     THEN
          getpari = nk
      else if (nom .EQ.'IG1')                                    THEN
          getpari = ig1
      else if (nom .EQ.'IG2')                                    THEN
          getpari = ig2
      else if (nom .EQ.'IG3')                                    THEN
          getpari = ig3
      else if (nom .EQ.'IG4')                                    THEN
          getpari = ig4
      else if (nom .EQ.'DATEO')                                  THEN
          getpari = dateo
      else if (nom .EQ.'DEET')                                   THEN
          getpari = deet
      else if (nom .EQ.'NPAS')                                   THEN
          getpari = npas
      else if (nom .EQ.'DATYP')                                  THEN
          getpari = datyp
      else if (nom .EQ.'NBITS')                                  THEN
          getpari = nbits
      else if (nom .EQ.'CLE')                                    THEN
          getpari = cle
      else
          getpari = -1
      end if

      RETURN
*------------------------------------------------------------------------------

      END
      CHARACTER*128 FUNCTION getparc( name )

      implicit          none
      character * ( * ) NAME

      character*8       nom

#     include          "fstparm.cdk"

      external          LOW2UP

*------------------------------------------------------------------------------
***    Convertir name en majuscules.

      nom = name(1:len( NAME ))
      call LOW2UP( nom,nom )

***    Est-ce un nom connu de variable charactere ?

      if (nom .EQ.'TYPVAR')                                    THEN
          getparc = typvar
      else if (nom .EQ.'NOMVAR')                               THEN
          getparc = nomvar
      else if (nom .EQ.'ETIKET')                               THEN
          getparc = etiket
      else if (nom .EQ.'GRTYP')                                THEN
          getparc = grtyp
      else
          getparc = ' '
      end if

      RETURN
*------------------------------------------------------------------------------

      END
      SUBROUTINE getxgi( xg1,xg2,xg3,xg4 )

      implicit   none

      real       xg1,xg2,xg3,xg4

#     include   "fstparm.cdk"

      external   cigaxg
*------------------------------------------------------------------------------
      if (grtyp.eq.'L' .or.
     +    grtyp.eq.'N' .or.
     +    grtyp.eq.'S')                                        then
          call cigaxg( grtyp, xg1,xg2,xg3,xg4,
     +                        ig1,ig2,ig3,ig4 )
      else
          xg1 = ig1
          xg2 = ig2
          xg3 = ig3
          xg4 = ig4
      end if

      RETURN
*------------------------------------------------------------------------------

      END
      SUBROUTINE putpari( NAME,VALEUR )

      implicit          none

      character * ( * ) NAME

      character*256     nom
      integer           VALEUR

#     include          "highbuf.cdk"
#     include          "fstparm.cdk"

      external          LOW2UP

*------------------------------------------------------------------------------
***    Convertir name en majuscules.

      nom = NAME
      call LOW2UP( nom,nom )

***    Est-ce un nom connu de variable entiere ?

      if (nom .EQ.'DATEO')                                     THEN
          dateo   =  VALEUR
          highdat = .FALSE.
      else if (nom .EQ.'DEET')                                 THEN
          deet    =  VALEUR
          highdel = .FALSE.
      else if (nom .EQ.'NPAS')                                 THEN
          npas    =  VALEUR
          highpas = .FALSE.
      else if (nom .EQ.'DATYP')                                THEN
          datyp   = VALEUR
          highdtp = .FALSE.
      else if (nom .EQ.'IP1')                                  THEN
          ip1 = VALEUR
      else if (nom .EQ.'IP2')                                  THEN
          ip2 = VALEUR
      else if (nom .EQ.'IP3')                                  THEN
          ip3 = VALEUR
      else if (nom .EQ.'NI')                                   THEN
          ni = VALEUR
      else if (nom .EQ.'NJ')                                   THEN
          nj = VALEUR
      else if (nom .EQ.'NK')                                   THEN
          nk = VALEUR
      else if (nom .EQ.'NBITS')                                THEN
          nbits = VALEUR
      else if (nom .EQ.'CLE')                                  THEN
          cle = VALEUR
      end if

      RETURN
*------------------------------------------------------------------------------

      END
      SUBROUTINE putparc( NAME,VALUE )

      implicit          none

      character * ( * ) NAME,VALUE

      character*256     nom,valeur

#     include          "highbuf.cdk"
#     include          "fstparm.cdk"

      external          LOW2UP

*------------------------------------------------------------------------------
***    Convertir name,value en majuscules.

      nom    = NAME(1:len( NAME ))
      valeur = VALUE(1:len( VALUE ))

      call LOW2UP( nom,nom )
      call LOW2UP( valeur,valeur )

***    Est-ce un nom connu de variable charactere ?

      if (nom .EQ.'TYPVAR')                                    THEN
          typvar  = valeur
          highvar = .FALSE.
      else if (nom .EQ.'NOMVAR')                               THEN
          nomvar  = valeur
      else if (nom .EQ.'ETIKET')                               THEN
          etiket  = valeur
          higheti = .FALSE.
      else if (nom .EQ.'GRTYP')                                THEN
          grtyp   = valeur
          hightyp = .FALSE.
      end if

      RETURN
*------------------------------------------------------------------------------

      END
      SUBROUTINE putxgi( xg1,xg2,xg3,xg4 )

      implicit   none

      real       xg1,xg2,xg3,xg4

#     include   "highbuf.cdk"
#     include   "fstparm.cdk"

      external   cxgaig
*------------------------------------------------------------------------------
      if (grtyp.eq.'L' .or.
     +    grtyp.eq.'N' .or.
     +    grtyp.eq.'S')                                        then

          call cxgaig( grtyp, ig1,ig2,ig3,ig4,
     +                        xg1,xg2,xg3,xg4 )

      else

          ig1 = xg1
          ig2 = xg2
          ig3 = xg3
          ig4 = xg4

      end if

      highigi = .FALSE.

      RETURN
*------------------------------------------------------------------------------

      END
      SUBROUTINE readstd( NF, IBUF,LEN, OK )

      use DIAG_TOC, only: LirTOC

      Implicit    None

      Logical     OK
      Integer     NF,LEN,IBUF(LEN)

***    Cette routine lit un enregistrement dans un fichier
***    SQI. Le resultat decompacte est conserve dans IBUF.

***    Auteur: B.Dugas - 06 octobre 1994

#     include    "fstparm.cdk"
#     include    "zlabel.cdk"

      Integer     Lir,debut,Err,dtyp,cmpl

      Real        AMIN,AMAX,AMEAN

      logical     lOK
      character   nom*4,blk*16,gtyp
      integer,    save :: NbrTOC(unite_io_maximale)
      integer     dummy,dummy0,dummy1,dummy2, SKIPRENV
      integer     ip1_kind,lip1

      LOGICAL              info, DEBUG,HOLDio,SETio
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/       DEBUG

      Integer,    external :: fstprm,fstinfx,fstluk,Memoirc,get_ip1_kind
      Logical,    external :: GETio64,SETio64
      External    precle,clesui, FMMM2

      data        NbrTOC / unite_io_maximale*-1 /

*------------------------------------------------------------------------------
      debut    = 1 + taille_entete
      OK       = .false.
      SKIPRENV = 0

***    Touver le prochain enregistrement

      call precle( nf,cle,0 )
  050 cle = fstinfx( cle, nf, ni,nj,nk,
     +               -1,zlabel(1:12),-1,-1,-1,ztype,zname(1:4) )

      Err = fstprm( cle, dummy0,dummy1,dummy2,
     +              dummy,dummy,dummy, dummy,dtyp,
     +              lip1,dummy,dummy, blk,nom,blk,
     +              gtyp,dummy,dummy,dummy,dummy,
     +              swa,lng,dltf,ubc,
     +              extra1,extra2,extra3 )

      If (nom.eq.'>>' .or.
     +    nom.eq.'^^' .or.
     +    nom.eq.'^>' .or.
     +    nom.eq.'!!' .or.
     +    nom.eq.'HY' )                                        Then
          SKIPRENV = SKIPRENV+1
          call clesui( nf,cle )
          goto 050
      End If

      If (dtyp.eq.3)                                           Then
          If ((ni*nj+3)/4 + taille_entete .gt. LEN) Return
      Else
          If (ni*nj*nk + taille_entete .gt. LEN) Return
      End If

      call clesui( nf,cle )

***    Lire l'enregistrement courant

!CC   If (Debug)                                               Then
!CC       Print *,'*DEBUG:READSTD     Avant fstluk'
!CC       Err = Memoirc( 0 )
!CC   End If

      Lir = fstluk( IBUF(debut), cle, ni,nj,nk )

      If (Debug)                                               Then
          Err = memoirc( 0 )
          Print *,'*DEBUG:READSTD     Apres fstluk'
      End If

!CC   If (dtyp.eq.3) Then
!CC       Call hpcheck( err )
!CC       If (err.ne.0) stop
!CC   End If

      If (Lir .ge. 0) OK = .true.

      If (OK .and. NbrTOC(nf) < 0)                             Then
          ip1_kind = get_ip1_kind( lip1 )
          If (ip1_kind == 5) CALL LirTOC( nf,NbrTOC(nf) )
      End If

      If (gtyp == 'U') call SavUref( nf,lOK )

      If (DEBUG)                                               Then
          If (dtyp.ne.2
     +   .and.dtyp.ne.3
     +   .and.dtyp.ne.4)                                       Then
          cmpl = 1
          if (dtyp.eq.8) cmpl = 2
          HOLDio = GETio64( HOLDio )
          If (.not.HOLDio .and. nbits.gt.32) SETio = SETio64( .TRUE. )
          If (     HOLDio .and. nbits.le.32) SETio = SETio64( .FALSE. )
          CALL FMMM2( AMIN,AMAX,AMEAN, IBUF(debut),ni*nj*nk*cmpl )
          WRITE(6,6100) AMIN,AMAX,AMEAN, nbits
          HOLDio = SETio64( HOLDio )
          End If
          WRITE(6,6200) SKIPRENV
      End If

      RETURN
*------------------------------------------------------------------------------

!6001 FORMAT(' ReadSTD: Character data not supported with FST89 files.')

 6100 FORMAT('*DEBUG:READSTD',5X,'Min,Max,Mean =',3(1PE15.6),
     +       ' nbits = ',I3)
 6200 FORMAT('*DEBUG:READSTD',5X,'RENVOIS IGNORES =',I3)

      END SUBROUTINE readstd
      SUBROUTINE writstd( NF, IBUF,LEN, OK )

      use DIAG_TOC, only: SavTOC

      Implicit    None

      Logical     OK
      Integer     NF,LEN,IBUF(LEN)

***    Cette routine ecrit un enregistrement dans un fichier SQI.

***    Auteur: B.Dugas - 06 octobre 1994

#     include    "fstparm.cdk"

      Integer     debut,buffer

      Integer,    Parameter :: MAXUNIT = unite_io_maximale
      LOGICAL     SAUVD(MAXUNIT),SAUVE(MAXUNIT),SAUVY(MAXUNIT)
      LOGICAL     SAUVZ(MAXUNIT),SAUVU(MAXUNIT)
      COMMON     /OUICEST/ SAUVD, SAUVE, SAUVY, SAUVZ, SAUVU
     +                     

      LOGICAL              INFO,DEBUG,HOLDio,SETio
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZDEBUG/      DEBUG

      LOGICAL              SEQ
      COMMON     /ZZZSEQF/ SEQ

      Logical,    save :: rewrit=.false.,premier(MAXUNIT)

      Character   posit*6,statf*3,namef*512,PKTYP*4
      Integer     ifrm,iouv,iclos,inom,lenam
      Integer     ip1_kind,cmpl,iter
      Real        AMIN,AMAX,AMEAN

      Character,  external :: getyp*4
      Logical,    external :: GETio64,SETio64
      Integer,    external :: fstecr,get_ip1_kind
      Integer,    external :: fstfrm,fstouv,fnom,fclos
      External    fixninj,parfill, pushyz, FMMM2,
     +            getstat,getnam,xit,ecrpt

      Data        premier / unite_io_maximale*.true. /

*------------------------------------------------------------------------------
      OK = .false.

      debut = 1 + taille_entete

***    Decoder le tampon d'informations.

      call parfill( IBUF )

      If (datyp.eq.3)                                          Then
          If ( (ni*nj+3)/4 + taille_entete .gt. LEN) Return
      Else
          If ( ni*nj*nk + taille_entete .gt. LEN) Return
      End If

      PKTYP = getyp( NF )

      If (PKTYP.eq.'SQ89')
     +    Call fixninj( ni,nj,nk )

      If (premier(NF))                                         Then

***        Pour ne plus passer ici.

          premier(NF) = .false.

***        Verifier le statut du fichier a l'ouverture
***        pour s'assurer que toute information qui aurait
***        pu y etre sera detruite avant d'aller plus loin.

           Call getstat( NF,statf )
           Call getposit( NF,posit )

           Call getnam( NF,namef )
           lenam = index( namef // ' ' , ' ' )-1

           If (statf.eq.'OLD' .and. posit.ne.'APPEND')         Then

***             Fermer NF.

               ifrm  = fstfrm( NF )
               iclos = fclos( NF )

               If (iclos.lt.0 .or. ifrm.lt.0)                  Then
                   if (info)
     +             write(6,6001) namef(1:lenam),nf
                   CALL                            XIT(' WritSTD',-1 )
               End If

***             Effacer le fichier correspondant ...

               Call system( 'rm -rf '// namef(1:lenam) )

***             ... et l'ouvrir a nouveau.

               If (SEQ)                                        Then
                   inom = fnom( NF, '+'// namef(1:lenam),'STD+SEQ',0 )
                   iouv = fstouv( NF,'SEQ' )
               Else
                   inom = fnom( NF, '+'// namef(1:lenam),'STD+RND',0 )
                   iouv = fstouv( NF,'RND' )
               End If

               If (inom.lt.0 .or. iouv.lt.0)                   Then
                   if (info)
     +             write(6,6002) namef(1:lenam),nf
                   Call                            XIT(' WritSTD',-2 )
               End If

           End If

      End If

      If (DEBUG .and. datyp.ne.2
     +          .and. datyp.ne.3
     +          .and. datyp.ne.4)                              Then
          cmpl = 1
          if (datyp.eq.8) cmpl = 2
          HOLDio = GETio64( HOLDio )
          If (.not.HOLDio .and. nbits.lt.-32) SETio = SETio64( .TRUE. )
          If (     HOLDio .and. nbits.ge.-32) SETio = SETio64( .FALSE. )
          CALL FMMM2( AMIN,AMAX,AMEAN, IBUF(debut),ni*nj*nk*cmpl )
          WRITE(6,6100) AMIN,AMAX,AMEAN, nbits
          HOLDio = SETio64( HOLDio )
      End If

      iter = 0
      Do While (deet > 16777215) ! Taille limite de deet = 2**24 - 1
          ! On tente tout de meme de conserver la valeur de deet*npas
          ! Ce probleme peut survenir lors du calcul de moyennes
          ! temporelles sur de longs intervals mais avec un
          ! petit nombre d'echantillons
          If (mod( deet,60 ) == 0 .and. iter < 2)              Then
              deet = deet/60 ; npas = npas*60 ; iter = iter+1
          Else
              If (INFO) write(6,6004) deet,npas,iter
              Call                                 XIT(' WritSTD',-4 )
          End If
      End Do 

***    L'ecrire.

      cle = fstecr( IBUF(debut),buffer,
     +              nbits, NF, dateo,deet,npas,
     +              ni,nj,nk, ip1,ip2,ip3, typvar,nomvar,
     +              etiket,grtyp, ig1,ig2,ig3,ig4,
     +              datyp, rewrit )

      If (cle.ge.0) OK = .true.

      If (OK)                                                  Then

***        Prendre note si on vient de sauver un enregistrement
***        valide sur une coordonne hybride.

          ip1_kind = get_ip1_kind( ip1 )
          If (.NOT.sauve(NF) .and.
     +       (ip1_kind == 1  .or. ip1_kind == 5))              Then
              sauve(NF) = .true.
              CALL SavTOC( NF, ig1,ig2 )
          End If

***        Prendre note qu'on a sauve un enregistrement de type U.

          If (grtyp == 'U')                                    Then
              sauvU(NF) = .true.
              CALL pushU(  NF, ni,nj, ig1,ig2,ig3 )
          End If

***        Enregistrer qu'on a sauve un enregistrement de type #, Y ou Z.

          If (grtyp.eq.'#' .or.
     +        grtyp.eq.'Y' .or.
     +        grtyp.eq.'Z' )                                   Then
              If (grtyp.eq.'#') sauvd(NF) = .true.
              If (grtyp.eq.'Y') sauvy(NF) = .true.
              If (grtyp.eq.'Z') sauvz(NF) = .true.
              CALL pushyz( NF, ni,nj, ig1,ig2,ig3 )
          End If

***        Par contre, un seul des trois par fichier.

          If ((sauvd(NF) .and. sauvy(NF)) .or.
     +        (sauvd(NF) .and. sauvz(NF)) .or.
     +        (sauvy(NF) .and. sauvz(NF)))                     Then
              If (info) write(6,6003) NF
              CALL                                 XIT(' WritSTD',-3 )
          End If

      End If

      RETURN
*------------------------------------------------------------------------------
 6001 FORMAT(' WritSTD: unable to close file ',A,', unit ',I2)
 6002 FORMAT(' WritSTD: unable to open file ',A,', unit ',I2)
 6003 FORMAT(' WritSTD: unit ',I2,' contains more than one of #,',
     +       ' Y or Z grid types.')
 6004 format(' Problem with sizes of deet,npas=',2I10,', iter=',I1)

 6100 FORMAT('*DEBUG:WRITSTD',5X,'Min,Max,Mean =',3(1PE15.6),
     +       ' nbits = ',I3)

      END
      SUBROUTINE ouvstd (NF,NOM,PKTYP,STATF )

      IMPLICIT      none

      INTEGER       NF
      LOGICAL       STATL
      CHARACTER*(*) NOM,PKTYP,STATF
      INTEGER       ERR,ITYP,IP,KIND,LENNAM,ifrm,iclos
      REAL          P

      CHARACTER(len=512) NAME,UNAM, evalue
      CHARACTER*6   FTYP,POSIT,ATTRIB*32

      LOGICAL                INFO
      COMMON       /ZZVERBO/ INFO

      LOGICAL                SEQ
      COMMON       /ZZZSEQF/ SEQ

      INTEGER                RNDF
      COMMON       /ZZRNDFL/ RNDF(unite_io_maximale)

      LOGICAL                OLDIP1
      COMMON       /ZZ98IP1/ OLDIP1

      INTEGER,      external :: FNOM,FCLOS,FSTFRM,FSTOUV
      EXTERNAL      XIT,GETPOSIT,CONVPR,getenvc

*-------------------------------------------------------------------------------

      NAME = NOM(1:LEN( NOM ))

      UNAM = NAME
      CALL LOW2UP( UNAM,UNAM )

      IF (UNAM.EQ.NAME)                                        THEN

***        NAME IS EITHER ALL UPPER-CASE, OR HAS NO ALPHABETIC
***        CHARACTERS. NOW, CHECK FOR THE LATTER.

          CALL UP2LOW( UNAM,UNAM )

          IF (UNAM.NE.NAME)                                    THEN

***            Check if any pathname is provided.

              IF (INDEX( NAME, '/' ) == 0)                     THEN

***                No pathname. Try adding the current working
***                directory and redo the above tests.

                  call getenvc( 'PWD',evalue )
                  IF (EVALUE /= ' ') NAME = TRIM( evalue )//'/'//NAME
                  UNAM = NAME ; CALL LOW2UP( UNAM,UNAM )
                  IF (UNAM == NAME)                            THEN
                      CALL UP2LOW( UNAM,UNAM )
                      IF (UNAM /= NAME)                        THEN
                          IF (INFO)
     +                    WRITE(6,6004) TRIM( NAME )
                          CALL                     XIT(' OuvSTD ',-4 )
                      END IF
                  END IF

              ELSE
                  IF (INFO)
     +            WRITE(6,6004) TRIM( NAME )
                  CALL                             XIT(' OuvSTD ',-4 )
              END IF

          END IF

      END IF

      IF (NF.GT. unite_io_maximale)                            THEN
          IF (INFO)
     +        WRITE(6,6005) NF,TRIM( NAME )
          CALL                                     XIT(' OuvSTD ',-5 )
      END IF

      FTYP = PKTYP(1:LEN(PKTYP))

      CALL GETPOSIT( NF,POSIT )

      IF (.NOT.OLDIP1) CALL CONVPR( IP, P, KIND, 0 )

  100 IF (STATF(1:3).EQ.'OLD')                                 THEN
          READ(FTYP,'(4X,I2)') ITYP
      ELSE
          ITYP = 0
      END IF

      IF (ITYP.EQ.33 .OR. ITYP.EQ.39 .OR. RNDF(NF).GT.0 .OR.
     +   (STATF(1:3).EQ.'NEW' .AND. .NOT.SEQ))                 THEN
          ATTRIB = 'STD+RND'
          IF (STATF(1:3).EQ.'OLD')                             THEN
              IF (POSIT.NE.'APPEND')                           THEN
                  ATTRIB = 'STD+RND+R/O'
              ELSE
                  ATTRIB = 'STD+RND+APPEND'
              END IF
          END IF
      ELSE
          ATTRIB = 'STD+SEQ'
          IF (STATF(1:3).EQ.'OLD')                             THEN
              IF (POSIT.NE.'APPEND')                           THEN
                  ATTRIB = 'STD+SEQ+R/O'
              ELSE
                  ATTRIB = 'STD+SEQ+APPEND'
              END IF
          END IF
      END IF

      ERR  = FNOM( NF, '+' // TRIM( NAME ) , ATTRIB , 0 )
      FTYP = FTYP(1:4)

      IF (ERR.NE.0)                                            THEN

          IF (INFO)
     +        WRITE(6,6001) ERR,TRIM( NAME ),NF
          CALL                                     XIT(' OuvSTD ',-1 )

      ELSE

          IF (FTYP.NE.'SQ89' .AND.
     +        FTYP.NE.'SQ98' )                                 THEN

              IF (INFO)
     +        WRITE(6,6002) TRIM( NAME ),NF
              CALL                                 XIT(' OuvSTD ',-2 )

          ELSE

              IF (ITYP.EQ.33 .OR. ITYP.EQ.39 .OR. RNDF(NF).GT.0 .OR.
     +           (STATF(1:3).EQ.'NEW' .AND. .NOT.SEQ))         THEN

***                Fichier de type 'RND'.

                  ERR = FSTOUV( NF,'RND' )

                  IF (ERR.LT.0)                                THEN
                      IF (INFO)
     +                WRITE(6,6003) ERR,TRIM( NAME ),NF
                      CALL                         XIT(' OuvSTD ',-3 )
                  END IF
                  RNDF(NF) = ERR

                  IF (STATF(1:3) == 'OLD' .AND. RNDF(NF) < 1)  THEN

***                 On s'assure que ce fichier est VRAIMENT neuf.
***                 Fermer NF. Effacer le fichier correspondant
***                 ... et retourner au debut de la routine et
***                 et l'ouvrir en mode NEW.

                      STATF(1:3) = 'NEW'

                      IFRM  = FSTFRM( NF )
                      ICLOS = FCLOS ( NF )
                      IF (ICLOS < 0 .OR. IFRM < 0)             THEN
                          IF (INFO)
     +                    WRITE(6,6006) TRIM( NAME ),NF
                          CALL                     XIT(' OuvSTD ',-6 )
                      END IF

                      CALL SYSTEM( 'rm -rf '// TRIM( NAME ) )
                      GOTO 100

                  END IF

              ELSE 

***                Fichier de type 'SEQ'.

                  ERR = FSTOUV( NF,'SEQ' )

                  IF (ERR.NE.0)                                THEN
                      IF (INFO)
     +                WRITE(6,6003) ERR,TRIM( NAME ),NF
                      CALL                         XIT(' OuvSTD ',-3 )
                  END IF

              END IF

          END IF

      END IF

      RETURN

*-------------------------------------------------------------------------------
      ENTRY get_rndstat (NF,STATL)

      STATL = .FALSE.

      IF (NF.GT.unite_io_maximale) RETURN
      IF (RNDF(NF).gt.0) STATL = .TRUE.

      RETURN
*-------------------------------------------------------------------------------

 6001 FORMAT(' OuvSTD: fnom returns code ',I3,
     +       ' for  file ',A,', unit ',I2)
 6002 FORMAT(' OuvSTD: file ',A,', unit ',I3,' is not RPN STD.')
 6003 FORMAT(' OuvSTD: fstouv returns code ',I3,
     +       ' for  file ',A,', unit ',I2)
 6004 FORMAT(' OuvSTD: Illegal fully-specified upper-case file name ',A)
 6005 FORMAT(' OuvSTD: I/O unit number too large ',I4,'for file ',A)
 6006 FORMAT(' OuvSTD: unable to close file ',A,', unit ',I2)

      END
      SUBROUTINE fixninj (NI,NJ,NK)

***    ACCOUNTS FOR (possible) LIMITATIONS IN NI,NJ SIZES.

      IMPLICIT none

      INTEGER  NI,NJ,NK

  100 IF (NI .GT. 32767)                                       THEN
          NI = (NI+1)/2
          NJ =  NJ*2
          GOTO 100
      END IF

  200 IF (NJ.GT.32767)                                         THEN
          NJ = (NJ+1)/2
          NK =  NK*2
          GOTO 200
      END IF

      RETURN

      END
      SUBROUTINE getzref (nfin,nom,valeur)

      IMPLICIT none

***    Faire la gestion des enregistrements de renvois
***    definissant la geographie horizontale '^^' et '>>'.
***    Auteur: B. Dugas - 02 avril 1997

***    Parametres Input/Output de getzref.

      character*(*) nom
      real          valeur(*)

***    Parametres Input/Output de savzref,wrizref.
***    Notez que nfin peut etre negatif (savzref peut utiliser ceci).

      logical       gok,rem
      integer       nfin

***    Parametres Input de putzref et Output de getzdes, getztyp et getzipx.

      integer       refdimx,refdimy
      character*(*) reftyp,rectyp,refgrille
      real          valeurx(refdimx),valeury(refdimy)
      integer       refig1,refig2,refig3,refig4
      integer       refip1,refip2,refip3

***    Parametres locaux.

#     include      "fstparm.cdk"

      integer,      parameter :: MAZDIM = dimension_en_x * dimension_en_y
      integer,      parameter :: un = 1, cinq = 5

      character(7)  entnam
      integer       nre(2),nri(2)
      character     chaine*15,blk*16
      character(4)  tmp1,tmp2,nomloc
      character(4)  rtypv,ptypv,ptypg
      logical       initial(unite_io_maximale),existe
      logical       nouveau_zref,new,found,lok
      integer       non,non0,non1,nf,lautre
      integer       rdate,rdelt,rpas,dummy
      character(12) retik,petik
      integer       errno,i,ii,j,nrc,nrl,nrp,nv,na
      integer       pimx,pimy,dimz,timx,timy,try
      integer       tip1,tip2,tip3,pig1,pig2
      integer       pip1,pip2,pip3,pig3,pig4
      real          pointxy(MAZDIM,2),tempxy(MAZDIM,2)
      integer,      save :: dimx,dimy,rip1,rip2,rip3
      integer,      save :: rig1,rig2,rig3,rig4
      save          initial,pointxy

      character(4), save :: tgril = 'Z', rtypg
      integer,      save :: io = 0, nrf 
      logical,      save :: check_dimensions = .false.
      logical,      save :: remlocal = .false.

      integer       lir,err,kle
      integer,      external :: fstluk,fstprm,fstecr,
     +                          fstpos,fstinfx,fclos
      external      xit,messys,findyz,clesui,quit
      external      ouvzref,makzref,rmzref

      LOGICAL                info,debug
      COMMON       /ZZVERBO/ info
      COMMON       /ZZDEBUG/      debug

      Integer,      Parameter :: MAXUNIT = unite_io_maximale
      LOGICAL       SAUVD(MAXUNIT),SAUVE(MAXUNIT),SAUVY(MAXUNIT)
      LOGICAL       SAUVZ(MAXUNIT),SAUVU(MAXUNIT)
      COMMON       /OUICEST/ SAUVD, SAUVE, SAUVY, SAUVZ, SAUVU

      data          initial / unite_io_maximale*.true. /
*-------------------------------------------------------------------

      entnam = 'GETZREF'

      nf = abs( nfin )

      nouveau_zref=.false. ; try = 0

      if (initial(nf) .and. io.eq.0)                           THEN

***        Ouvrir le fichier zcrochet local.

          call ouvzref2( io,EXISTE,LOK,nrf, (io == 0) )

          if (EXISTE .and. .not.LOK)                           THEN

***            Le fichier est endommage.

              if (info) write(6,6001)
              call                                 xit(' Getzref',-1 )

          else if (.not.EXISTE)                                THEN

              if (debug) write(6,6100) io

***            Tenter d'en construire un nouveau.

              call makzref( nfin, LOK )

              if (.not.LOK)                                    THEN
                  if (info) write(6,6002)
                  call                             xit(' Getzref',-2 )
              else
                  nouveau_zref=.true.
              end if

          else

              initial(nf) = .false.

          end if

      else

          initial(nf) = .false.

      end if

***    Avons-nous deja le bon jeux d'enregistrements.

      if (ig1 .ne. rip1 .or.
     +    ig2 .ne. rip2 .or.
     +    ni  .ne. dimx .or.
     +    nj  .ne. dimy )                                      THEN

  050     continue

***        Non. Allons le chercher sur unite io. Notons que nrf est
***        le nombre d'enregistrements dans le fichier zcrochets.

          do  i=1,nrf

              chaine='READ_CURRENT'
              read( io,rec=i,err=999,iostat=errno )
     +                       timx,timy,tip1,tip2,tip3,rtypv,
     +                       retik,rtypg,rig1,rig2,rig3,rig4,
     +                       rdate,rdelt,rpas,tmp1,tempxy
              chaine=' '

              if (timx.eq.0 .or. timy.eq.0)                    THEN
                  if (info) write(6,6004) i,timx,timy
                  call                             xit(' Getzref',-4 )
              end if

              if (debug)
     +            write(6,6110) entnam,i,timx,timy,tip1,tip2,tip3,
     +                          rtypv,retik,rtypg,rig1,rig2,rig3,rig4,
     +                          rdate,rdelt,rpas,tmp1

              if (ig1 .eq. tip1 .and.
     +            ig2 .eq. tip2 .and.
     +            ni  .eq. timx .and.
     +            nj  .eq. timy )                              THEN
                  tgril = tmp1
                  do  j=1,MAZDIM*2
                      pointxy(j,1) = tempxy(j,1)
                  end do
                  rip1 = ig1
                  rip2 = ig2
                  rip3 = ig3
                  dimx = ni
                  dimy = nj
                  goto 100
              end if

          end do

***        On ne l'a pas trouve. Quitter.

          if (try > 0 .or. nouveau_zref) then
              if (info) write(6,6003) ig1,ig2,ig3,ip1,ip2,ip3
              call                                 xit(' Getzref',-2 )
          else
              initial(nf) = .true.
              call makzref( nfin, LOK ) ! Chercher sur nfin.
              if (LOK) then
                  try = 1 ; goto 050
              else
                  if (info) write(6,6003) ig1,ig2,ig3,ip1,ip2,ip3
                  call                             xit(' Getzref',-2 )
              endif
          end if

      end if

***    Oui on l'a. Transferons la partie demandee dans valeur.

  100 if (nom.eq.'>>')                                         THEN
          if (tgril.eq.'Z') timx = ni
          if (tgril.eq.'Y') timx = ni*nj
          do  i=1,timx
              valeur(i) = pointxy(i,1)
          end do
          if (debug) write(6,6120) ig1,ig2,ig3,timx
      else if (nom.eq.'^^')                                    THEN
          if (tgril.eq.'Z') timy =    nj
          if (tgril.eq.'Y') timy = ni*nj
          do  i=1,timy
              valeur(i) = pointxy(i,2)
          end do
          if (debug) write(6,6130) ig1,ig2,ig3,timy
      end if


      return
*-------------------------------------------------------------------
      Entry getzdes2 (reftyp, refig1,refig2,refig3,refig4,
     +                        refdimx,refdimy)

      if (refdimx > 0 .and. refdimy > 0) check_dimensions = .true.


      Entry getzdes (reftyp, refig1,refig2,refig3,refig4,
     +                       refdimx,refdimy)

      entnam = 'GETZDES'

      if (io == 0 .or. check_dimensions)                       THEN

          if (io == 0)                                         THEN
              call ouvzref2( io,EXISTE,LOK,nrf, (io == 0) )

              if (.not.(EXISTE .and. LOK))                     THEN
                  if (info) write(6,6001)
                  call                             xit(' Getzdes',-1 )
              end if
          end if

***        Lire le premier enregistrement (et peut-etre les suivants).

          i = 1

          chaine='READ_CURRENT'
  150     read( io,rec=i,err=999,iostat=errno )
     +                   dimx,dimy,rip1,rip2,rip3,rtypv,
     +                   retik,rtypg,rig1,rig2,rig3,rig4,
     +                   rdate,rdelt,rpas,tgril,pointxy
          chaine=' '

          if (dimx.eq.0 .or. dimy.eq.0)                        THEN
              if (info) write(6,6032) i,dimx,dimy
              call                                 xit(' Getzdes',-2 )
          end if

          if (debug)
     +        write(6,6110) entnam,i,dimx,dimy,rip1,rip2,tip3,
     +                      rtypv,retik,rtypg,rig1,rig2,rig3,rig4,
     +                      rdate,rdelt,rpas

          if (check_dimensions)                                THEN
              if (refdimx == -1  .and. refdimy == -1)          THEN
                  refdimx =  dimx  ;   refdimy =  dimy
              else
     +        if (refdimx /= dimx .or. refdimy /= dimy)        THEN
                  ! Tenter de lire le suivant.
                  i = i+1
                  read( io,rec=i,err=999,iostat=errno ) dummy
                  if (dummy == -i)                             THEN
                      ! Ceci est l'enregistrement de fin de fichier. 
                      if (info) write(6,6033) refdimx,refdimy
                      call                         xit(' Getzdes',-3 )
                  else
                      goto 150
                  end if
              end if
          end if

      end if

      reftyp = rtypg

      refig1 = rig1
      refig2 = rig2
      refig3 = rig3
      refig4 = rig4

      refdimx = dimx
      refdimy = dimy

      check_dimensions = .false.

      return
*-------------------------------------------------------------------
      Entry getzipx (refip1,refip2,refip3)

      entnam = 'GETZIPX'

      refip1 = -1
      refip2 = -1
      refip3 = -1

      if (io.eq. 0)                                            THEN

          call ouvzref2( io,EXISTE,LOK,nrf, (io == 0) )

          if (.not.(EXISTE .and. LOK))                         THEN
              if (info) write(6,6001)
              call                                 xit(' Getzipx',-1 )
          end if

***        Lire le premier enregistrement.

          i = 1

          chaine='READ_CURRENT'
          read( io,rec=i,err=999,iostat=errno )
     +                   dimx,dimy,rip1,rip2,rip3,rtypv,
     +                   retik,rtypg,rig1,rig2,rig3,rig4,
     +                   rdate,rdelt,rpas,tgril,pointxy
          chaine=' '

          if (dimx.eq.0 .or. dimy.eq.0)                        THEN
              if (info) write(6,6032) i,dimx,dimy
              call                                 xit(' Getzipx',-2 )
          end if

          if (debug)
     +        write(6,6110) entnam,i,dimx,dimy,rip1,rip2,tip3,
     +                      rtypv,retik,rtypg,rig1,rig2,rig3,rig4,
     +                      rdate,rdelt,rpas

      end if

      refip1 = rip1
      refip2 = rip2
      refip3 = rip3

      return
*-------------------------------------------------------------------
      Entry getztyp (refgrille)

      entnam = 'GETZTYP'

      refgrille = ' '

      if (io.eq. 0)                                            THEN

          call ouvzref2( io,EXISTE,LOK,nrf, (io == 0) )

          if (.not.(EXISTE .and. LOK))                         THEN
              if (info) write(6,6001)
              call                                 xit(' Getztyp',-1 )
          end if

***        Lire le premier enregistrement.

          i = 1

          chaine='READ_CURRENT'
          read( io,rec=i,err=999,iostat=errno )
     +                   dimx,dimy,rip1,rip2,rip3,rtypv,
     +                   retik,rtypg,rig1,rig2,rig3,rig4,
     +                   rdate,rdelt,rpas,tgril,pointxy
          chaine=' '

          if (dimx.eq.0 .or. dimy.eq.0)                        THEN
              if (info) write(6,6032) i,dimx,dimy
              call                                 xit(' Getztyp',-2 )
          end if

          if (debug)
     +        write(6,6110) entnam,i,dimx,dimy,rip1,rip2,tip3,
     +                      rtypv,retik,rtypg,rig1,rig2,rig3,rig4,
     +                      rdate,rdelt,rpas

      end if

      refgrille = tgril

      return
*-------------------------------------------------------------------
      Entry putzref (valeurx, valeury, rectyp,reftyp,
     +               refig1,refig2,refig3,refig4,
     +               refip1,refip2,refip3,
     +               refdimx,refdimy)

      entnam = 'PUTZREF'

***    Sauver un nouveau jeux d'enregistrements crochets sur zcrochets.

      if (io.eq. 0)                                            THEN

          call ouvzref2( io,EXISTE,LOK,nrf, (io == 0) )

          if (.not. LOK)                                       THEN
              if (info) write(6,6001)
              call                                 xit(' putzref',-1 )
          end if

      end if

      rtypv = typvar
      retik = etiket
      rtypg = typvar
      rdate = dateo
      rdelt = deet
      rpas  = npas

      LOK   =.FALSE.
      nrp   = nrf+1

      if (nrf.ne.0)                                            THEN

***        Le fichier zcrochets n'est pas vide. Verifier
***        que le 'nouveau' jeux n'a pas deja sauve.

          do  i=1,nrf

              chaine='READ_CURRENT'
              read( io,rec=i,err=999,iostat=errno )
     +                       timx,timy,tip1,tip2,tip3,rtypv,
     +                       retik,rtypg,rig1,rig2,rig3,rig4,
     +                       rdate,rdelt,rpas,tmp1,tempxy
              chaine=' '

              if (debug)
     +            write(6,6110) entnam,i,timx,timy,tip1,tip2,tip3,
     +                          rtypv,retik,rtypg,rig1,rig2,rig3,rig4,
     +                          rdate,rdelt,rpas

              tmp2 = rectyp

              if (refig1  .eq. rig1 .and.
     +            refig2  .eq. rig2 .and.
     +            refig3  .eq. rig3 .and.
     +            refig4  .eq. rig4 .and.
     +            refip1  .eq. tip1 .and.
     +            refip2  .eq. tip2 .and.
     +            refip3  .eq. tip3 .and.
     +            tmp1    .eq. tmp2 .and.
     +            refdimx .eq. timx .and.
     +            refdimy .eq. timy )                          THEN

                  LOK =.TRUE.
                  nrp = i

                  if (debug) write(6,6210)

                  goto 200

              end if

          end do

      end if

***    Utiliser les nouveaux descripteurs.

  200 dimx = refdimx
      dimy = refdimy

      if (rectyp.eq.'Y')                                       THEN
          do  i=1,dimx*dimy
              pointxy(i,1) = valeurx(i)
          end do
          do  i=1,dimx*dimy
              pointxy(i,2) = valeury(i)
          end do
      else if (rectyp.eq.'Z')                                  THEN
          do  i=1,dimx
              pointxy(i,1) = valeurx(i)
          end do
          do  i=1,dimy
              pointxy(i,2) = valeury(i)
          end do
      end if

      tgril = rectyp
      rtypg = reftyp

      rig1 = refig1
      rig2 = refig2
      rig3 = refig3
      rig4 = refig4

      rip1 = refip1
      rip2 = refip2
      rip3 = refip3

      chaine='WRITE_CURRENT'
      write( io, rec=nrp, err=999,iostat=errno )
     +                    dimx,dimy,rip1,rip2,rip3,rtypv,
     +                    retik, rtypg,rig1,rig2,rig3,rig4,
     +                    rdate,rdelt,rpas,tgril,pointxy
      chaine=' '

      if (debug .and. .NOT.LOK)
     +    write(6,6220) entnam,nrp,dimx,dimy,rip1,rip2,rip3,
     +                  rtypv,retik, rtypg,rig1,rig2,rig3,rig4,
     +                  rdate,rdelt,rpas,tgril

      if (.not.LOK)                                            THEN

           nrf = nrp ! On a ajouter un nouvel enregistrement.

***         Identifier le dernier enregistrement pour OUVZREF.

           chaine='WRITE_LAST'
           write( io, rec=nrf+1, err=999,iostat=errno ) -(nrf+1)
           chaine=' '

      end if

      return
*-------------------------------------------------------------------
      Entry savzref2 (nfin,gok,rem)

      remlocal = rem

      Entry savzref (nfin,gok)

      entnam = 'SAVZREF'

      nv  = 1
      nf  = abs( nfin )
      GOK = .true.

***    Creer ou ouvrir un fichier FTN pour lire et/ou ecrire
***    tous les enregistrements crochets du fichier source.

      if (initial(nf))                                         THEN

***        Pour ne plus repasser par ici...

          initial(nf) = .false.

          if (debug) write(6,6240) nf

          if (io.ne.0)                                         THEN

              nrc = nrf
              nrf = 0

          else

              call ouvzref2( io, EXISTE,LOK,nrc,remlocal )

***            Le fichier crochets est-il bien ouvert ?

              if (.not.lok)                                    THEN
                  if (info) write(6,6001)
                  call                             xit(' Savzref',-1 )


              end if

          end if

          err = fstprm( cle,
     +                  rdate,rdelt,rpas, timx,timy,dimz, non,non,
     +                  rip1,rip2,rip3, rtypv,nomloc,retik,rtypg,
     +                  rig1,rig2,rig3,rig4, swa,lng,dltf,ubc,
     +                  extra1,extra2,extra3 )

          rtypg(2:4) = ' ' ; rtypv(3:4) = ' '

          ii   = 0

          dimx = 0
          dimy = 0

***        Lire tous les jeux d'enregistrements crochets.

          nre = 0      ! enregistrements ecrits
          nri = 0      ! enregistrements ignores

          nrl = 0      ! enregistrements lus.
  300     nrl = nrl+1

          if (nrl.ne.1)                                        THEN

***            Identifier le prochain enregistrement.

              kle = fstinfx( kle, nf, timx,timy,dimz,
     +                       -1,' ',-1,-1,-1,' ',nomloc )

              if (kle.lt.0)                                    THEN

                  nrl = nrl-1

***                Il n'y a plus d'enregistrements a lire.

                  if (nre(nv) /= nrf)                          THEN

***                    Mais on n'en a pas lu assez.

                      if (info) write(6,6012)
                      call                         xit(' Savzref',-2 )

                  else if (nrl == 2*(nre(1)+nri(1)) .and.
     +                nre(2) == nre(1) .and. nri(2) == nri(1)) THEN

                      cle = fstinfx( cle, nf, na,na,na,
     +                            -1,' ',-1,-1,-1,' ',' ' )
                      nrf = nrc+nrf

***                    S'assurer que le dernier jeux traite est dans pointxy.

                      chaine='READ_LAST'
                      if (debug) write(6,6250) nrc+ii,io
                      read( io, rec=(nrc+ii), err=999,iostat=errno )
     +                                dimx,dimy,rip1,rip2,rip3,rtypv,
     +                                retik, rtypg,rig1,rig2,rig3,rig4,
     +                                rdate,rdelt,rpas,tgril,pointxy
                      chaine=' '
               
                      if (debug)
     +                write(6,6110) entnam,(nrc+ii),dimx,dimy,
     +                              rip1,rip2,rip3, rtypv,retik,rtypg,
     +                              rig1,rig2,rig3,rig4, rdate,rdelt,
     +                              rpas, tgril

                      remlocal = .false.

                      return

                  end if

                  if (nv.eq.1)                                 THEN

***                    Passer a l'autre variable.

                      nv = nv + 1

                      if (nomloc.eq.'>>')                      THEN
                          nomloc =  '^^'
                      else
                          nomloc =  '>>'
                      end if

                  else

***                    Probleme de lecture des enregistrements crochets.
                      
                      if (info) write(6,6013)
                      call                         xit(' Savzref',-3 )

                  end if

***                Rprendre la lecture du debut.

                  kle  = cle
                  goto 300

              end if

***            Qu'est-ce qu'on a lu ?

              err = fstprm( kle,
     +                      rdate,rdelt,rpas, timx,timy,dimz, non,non,
     +                      rip1,rip2,rip3, rtypv,blk,retik,rtypg,
     +                      rig1,rig2,rig3,rig4, swa,lng,dltf,ubc,
     +                      extra1,extra2,extra3 )

              rtypg(2:4) = ' ' ; rtypv(3:4) = ' '

          else

              kle  = cle

          end if

          If (timx*timy*dimz .gt. MAZDIM)                      THEN
              if (info) write(6,6014) timx*timy*dimz,MAZDIM
              call                                 xit(' Savzref',-4 )
          end if

          if (nomloc.eq.'>>')                                  THEN
              j    = 1
              dimx = timx
              if (timy.ne.1) tgril = 'Y'
          else if (nomloc.eq.'^^')                             THEN
              j    = 2
              dimy = timy
              if (timx.ne.1) tgril = 'Y'
          end if

          new = .true.

          do  i=1,nrc+nre(1)

***            Est-ce un nouveau enregistrement ?

              chaine='READ_PREVIOUS'
              read( io, rec=i, err=999,iostat=errno )
     +                         pimx,pimy,pip1,pip2,pip3,ptypv,
     +                         petik, ptypg,pig1,pig2,pig3,pig4
              chaine=' '
              
              if (ptypv.eq.rtypv .and.
!CC  +            petik.eq.retik .and.
     +            ptypg.eq.rtypg .and.
     +            pig1 .eq.rig1  .and.
     +            pig2 .eq.rig2  .and.
     +            pig3 .eq.rig3  .and.
     +            pig4 .eq.rig4  .and.
     +            pip1 .eq.rip1  .and.
     +            pip2 .eq.rip2  .and.
     +            pip3 .eq.rip3  .and.
     +            pimx .eq.timx  .and.
     +            pimy .eq.timy )                              THEN

                  if (nv == 1 .or.
     +               (nv == 2 .and. pimx*pimy > 0))            THEN

***                    1) Si nv=1, on incremente nri(1).
***                    2) Si nv=2 et pimx*pimy > 0, cela indique
***                       qu'on a deja traite les deux partie de
***                       cet enregistrement et qu'on peut ignorer
***                       celui qui vient d'etre lu.

                      nri(nv) = nri(nv)+1

***                    Et on l'ignore.

                      new = .false.

                      exit

                  end if

              end if
             
          end do

          if (new)                                             THEN

***            Ok, lire le prochain enregistrement.

              lir = fstluk( pointxy(1,j), kle, timx,timy,dimz )

              If (lir.lt.0)                                    THEN
                  if (info) write(6,6015) nomloc
                  call                             xit(' Savzref',-5 )
              end if

***            Incrementer nre(nv).

              nre(nv) = nre(nv)+1

              if (nrl /= nri(nv)+nre(nv))                      THEN

***                Relire les enregistrements partiels, puisqu'on
***                traite ici le second type (nv=2). Donc, nre(1)
***                doit contenir a ce point le nombre de nouveaux
***                enregistrements trouves du premier type (nv=1).
***                On cherche ou ecrire ce qu'on vient de lire.

                  do  ii=1,nre(1)

                      chaine='READ_PARTIAL'
                      read( io, rec=nrc+ii, err=999,iostat=errno )
     +                                 timx,timy,tip1,tip2,tip3,rtypv,
     +                                 retik,rtypg,rig1,rig2,rig3,rig4,
     +                                 rdate,rdelt,rpas,tmp1,tempxy
                      chaine=' '

                      if (timx > 0 .and. timy > 0) cycle ! Already complete !

                      if (debug)
     +                    write(6,6110) entnam,(nrc+ii),timx,timy,
     +                             rip1,rip2,rip3,rtypv,retik,rtypg,
     +                             rig1,rig2,rig3,rig4,rdate,rdelt,
     +                             rpas,tgril

***                    Verifier la concordance des deux.

                      if (tip1.ne.rip1  .or.
     +                    tip2.ne.rip2  .or.
     +                    tip3.ne.rip3) cycle ! Ce n'est pas le bon. Au suivant.

***                    Et le sauver dans pointxy.

                      lautre = mod(j,2)+1
                      do  i=1,MAZDIM
                          pointxy(i,lautre) = tempxy(i,lautre)
                      end do

                      if (nomloc.eq.'>>')                      THEN
                          dimy = timy
                      else if (nomloc.eq.'^^')                 THEN
                          dimx = timx
                      end if

                      exit ! On a trouve. Passons a l'ecriture.

                  end do

***                Verifier qu'on a trouve.

                  if (ii > nre(1))                             THEN
                      if (info) write(6,6016)
                      call                         xit(' Savzref',-6 )
                  end if

              else

                  ii = nre(nv) ! Ordinal de l'enregistrement a ecrire.

              end if

              if (nv == 2 .and. (dimx == 0 .or. dimy == 0))    THEN
                  if (info) write(6,6017) ii,nrl,dimx,dimy
                  call                             xit(' Savzref',-7 )
              end if

***            Et le sauver sur unite io.

              chaine='WRITE_CURRENT'
              write( io, rec=nrc+ii, err=999,iostat=errno )
     +                              dimx,dimy,rip1,rip2,rip3,rtypv,
     +                              retik,rtypg,rig1,rig2,rig3,rig4,
     +                              rdate,rdelt,rpas,tgril,pointxy
              chaine=' '

              if (debug)
     +            write(6,6220) entnam,(nrc+ii),dimx,dimy,
     +                          rip1,rip2,rip3,rtypv,retik,rtypg,rig1,
     +                          rig2,rig3,rig4,rdate,rdelt,rpas,tgril

          end if

***        Passer au prochain.

          if (nrl == nre(nv)+nri(nv))                          THEN

***            Il faut que nv=1 pour passer par ici...

              nrf = nre(nv) ! nouveaux jeux d'enregistrements a ce point.

***            Identifier le dernier enregistrement pour OUVZREF.

              chaine='WRITE_LAST'
              write( io, rec=nrc+nre(nv)+1, err=999,iostat=errno )
     +                     -(nrc+nre(nv)+1)
              chaine=' '

              if (debug)
     +            write(6,6230) entnam,(nrc+nre(nv)+1)

          end if

          goto 300

      end if

      remlocal = .false.

      return

*-------------------------------------------------------------------
      entry wrizref( nfin )

      entnam = 'WRIZREF'

      nf = abs( nfin )

      If (io.eq.0)                                             THEN
          call ouvzref2( io, EXISTE,LOK,nrf, (io == 0) )
          If (.not.(EXISTE .and. LOK))                         THEN
              If (info) write(6,6001)
              return
          End If
      End If

      Do  i=1,nrf

***        Lire le prochain jeux d'enregistrements de renvoi.

          chaine='READ_NEXT'
          read( io, rec=i,err=999,iostat=errno )
     +                    dimx,dimy,rip1,rip2,rip3,rtypv,
     +                    retik,rtypg,rig1,rig2,rig3,rig4,
     +                    rdate,rdelt,rpas,tgril,pointxy
          chaine=' '
          If (debug)
     +        write(6,6110) entnam,i,dimx,dimy,rip1,rip2,rip3,
     +                      rtypv,retik,rtypg,rig1,rig2,rig3,rig4,
     +                      rdate,rdelt,rpas,tgril

          Found = .false.

          If (sauvd(nf))                                       THEN

***            Grilles de type #. On sauve tous les >> et ^^.

              Found = .true.

          else

***            Verifier qu'il corresponds reellement a un
***            enregistrement qui aurait ete ecrit sur NF.

              Call findyz( nf, dimx,dimy, rip1,rip2,rip3, Found )

          End If

***        Et l'ecrire en deux parties.

          If (Found)                                           THEN

              If (sauvd(nf) .or. sauvz(nf))                    THEN

                  cle = fstecr( pointxy(1,1),tempxy,
     +                          -32, NF, rdate,rdelt,rpas,
     +                          dimx,un,un, rip1,rip2,rip3,
     +                          rtypv(1:2),'>>',retik,rtypg(1:1),
     +                          rig1,rig2,rig3,rig4,cinq, .true. )

                  If (debug)
     +                write(6,6140) '>>',NF


                  kle = fstecr( pointxy(1,2),tempxy,
     +                          -32, NF, rdate,rdelt,rpas,
     +                          un,dimy,un, rip1,rip2,rip3,
     +                          rtypv(1:2),'^^',retik,rtypg(1:1),
     +                          rig1,rig2,rig3,rig4,cinq, .true. )

                  If (debug)
     +                write(6,6140) '^^',NF

              Else
     +        If (sauvy(nf))                                   THEN

                  cle = fstecr( pointxy(1,1),tempxy,
     +                          -32, NF, rdate,rdelt,rpas,
     +                          dimx,dimy,un, rip1,rip2,rip3,
     +                          rtypv(1:2),'>>',retik,rtypg(1:1),
     +                          rig1,rig2,rig3,rig4,cinq, .true. )

                  If (debug)
     +                write(6,6140) '>>',NF


                  kle = fstecr( pointxy(1,2),tempxy,
     +                          -32, NF, rdate,rdelt,rpas,
     +                          dimx,dimy,un, rip1,rip2,rip3,
     +                          rtypv(1:2),'^^',retik,rtypg(1:1),
     +                          rig1,rig2,rig3,rig4,cinq, .true. )

                  If (debug)
     +                write(6,6140) '^^',NF

              End If

              If (cle.lt.0 .or. kle.lt.0)                      THEN
                  If (info) write(6,6022) i
                  If (info) write(6,6023) dimx,dimy,rip1,rip2,rip3,
     +                      rtypv,retik,rtypg,rig1,rig2,rig3,rig4
                  return
              End If

          End If

      End Do

      return
*-------------------------------------------------------------------

      entry clozref()

      ! Close/Remove the zcrochet file if it is open

      If (io /= 0)                                             THEN
          err = fclos( io )
          If (INFO)                                            THEN
              If (err < 0)                                     THEN
                  write(6,6260) err
              Else
                  write(6,6270)
              End If
          End IF
          call rmzref()
      End IF

      return

*-------------------------------------------------------------------
  999 IF (INFO)                     WRITE(6,6000) io,errno
      IF (INFO .and. chaine.ne.' ') WRITE(6,6005) chaine
      IF (INFO .and. errno .GT. 0 ) CALL MESSYS( 'In Getzref...' )
      call                                         xit(' Getzref',-3 )

      return
*-------------------------------------------------------------------

 6000 FORMAT('(GET/SAV)ZREF: Unit ',I3,' returns I/O error number ',I5)
 6001 format(' Cannot open "^^" and ">>" file.')
 6002 format(' Cannot make a new "^^" and ">>" file.')
 6003 format('GETZREF: Did not find referent to ',
     +       '"ig1,ig2,ig3,ip1,ip2,ip3"=',6I9)
 6004 format('GETZREF: NI,NJ for "^^" and ">>" record ',I2,' are ',2I7)
 6005 format('  ... While doing operation: ',A)
 6012 format('SAVZREF: Not the same number of "^^" as ">>" records.')
 6013 format('SAVZREF: Probleme de lecture des enregistrements',
     +       ' crochets.')
 6014 format('SAVZREF: Words in record=',I5,', MAXDIM=',I5)
 6015 format('SAVZREF: Unable to read ',A)
 6016 format('SAVZREF: "^^" and ">>" record mismatch.')
 6017 format('SAVZREF: NI,NJ for "^^" and ">>" record ',I2.2,'/',I2.2,
     +       ' are ',2I7)
 6022 format('WRIZREF: Unable to write YZ-ref record set no.',I5)
 6023 format('WRIZREF: NI,NJ,IP1,IP2,IP3,TYPVAR,ETIKET,GRTYP,',
     +       'IG1,IG2,IG3,IG4=', 5I7,3(1X,A),4I7)
 6032 format('GETZDES: NI,NJ for "^^" and ">>" record ',I2,' are ',2I7)
 6033 format('GETZDES: Unmatched dimensions ',2I5)

 6100 format('*DEBUG:GETZREF will make a new zcrochets, unit ',I2)
 6110 format('*DEBUG:',A7,' found in zcrochets record no. ',I3,' ...'/
     +       15x,'dimx,dimy,zip1,zip2,zip3=',5I6/
     +       15X,'Typvar=',A,', Etiket=',A/
     +       15x,'Ref type=',A,', rig1,rig2,rig3,rig4=',4I6/
     +       15x,'Rdate,Rdelt,Rpas=',3I11,', Grid type=',A)
 6120 format('*DEBUG:GETZREF retreived >>, ig1,ig2,ig3=',3I6,', ni=',I6)
 6130 format('*DEBUG:GETZREF retreived ^^, ig1,ig2,ig3=',3I6,', nj=',I6)
 6140 format('*DEBUG:WRIZREF ',A,' written to unit ',I3)
 6210 format('*DEBUG:PUTZREF replacing it with new values.')
 6220 format('*DEBUG:',A7,' writing record no. ',I3,' ...'/
     +       15x,'dimx,dimy,zip1,zip2,zip3=',5I6/
     +       15X,'Typvar=',A,', Etiket=',A/
     +       15x,'Ref type=',A,', rig1,rig2,rig3,rig4=',4I6/
     +       15x,'Rdate,Rdelt,Rpas=',3I11,', Grid type=',A)
 6230 format('*DEBUG:',A7,' writing end of file record no. ',I3)
 6240 format('*DEBUG:SAVZREF initializing from unit ',I3)
 6250 format('*DEBUG:SAVZREF reading record no. ',I3,' from unit ',I3)
 6260 format('CLOZREF: Error ',I3,' while ',
     +       ' attempting to close ZCROCHETS'/)
 6270 format('CLOZREF:  ZCROCHETS file was closed.')

      end SUBROUTINE getzref
      SUBROUTINE ouvzref2 (io,EXISTE,OK,nr,rem)

      IMPLICIT      none

***    Cette routine ouvre un fichier zcrochets.
***    Auteur: B. Dugas - 02 avril 1997

***    Parametre Output

      integer       io,nr
      logical       EXISTE,OK,rem

*      io     = unite I/O fortran qui a ete utilisee
*      nr     = nombre d'enregistrements dans le fichier ouvert
*      EXISTE = le fichier existait deja ...
*      OK     = ... et on a pu le lire
*      rem    = toujours retourner un nouveau fichier zcrochets

***    Auteur: B. Dugas - 02 avril 1997

      integer       MAZDIM
      parameter   ( MAZDIM = dimension_en_x * dimension_en_y )

      logical,      save :: remlocal = .false.
      character*256,save :: nomfich
      character*10, save :: CPID=' '
      character*256 evalue
      character*20  UZBIGT,TMPDIR,BIGTMP,status
      integer       lenam,errno,lonrec,dummy,kind
      integer       pid,getpid,i

      LOGICAL                info,debug
      COMMON       /ZZVERBO/ info
      COMMON       /ZZDEBUG/      debug

      logical,      external :: is_off,is_on
      integer,      external :: wkoffit,fnom

      data          UZBIGT / 'USE_BIG_TMPDIR' /,
     +              TMPDIR /    'TMPDIR'      /,
     +              BIGTMP /   'BIG_TMPDIR'   /

#include <rmn/clib_interface.cdk>

*-------------------------------------------------------------------
      remlocal = rem
*-------------------------------------------------------------------

      Entry ouvzref (io,EXISTE,OK,nr)

***    Initialiser certaines valeurs de sortie.

      EXISTE = .false.
      OK     = .false.
      nr     =  0

      ! Determiner le numero du processus en court.

      if (cpid == ' ')                                         THEN
          PID    = getpid() ; write(CPID,'(I10)') PID
          do i=1,10 ; if (CPID(i:i) /= ' ') exit ; end do
          if (i == 11)                                         THEN
              CPID = '0'
          else
              CPID = CPID(i:10)
          end if
      end if

      errno  =  0

***    A-t'on specifie un nom pour ce fichier ?

      call getenvc( 'CROCHETS_POUR_Z',evalue)
      if (evalue.ne.' ')                                       THEN

          nomfich = evalue
          kind    = wkoffit( '+' // trim( nomfich ) )

      else

***        Non ? Alors voici son nom par defaut.

          nomfich = 'zcrochets' // trim( CPID )

***        Est-ce que celui-ci existe dans le repertoire courant ?
***        Nous cherchons un fichier de type non-vide.

          kind = wkoffit( trim( nomfich ) )
          if (kind.le.-1)                                      THEN

***            Non. As-t'on un TMPDIR ?

***            WHICH TMPDIR DIRECTORY SHOULD WE USE? UNLESS
***            IT IS EXPLICITELY DISALLOWED, ALWAYS TRY FIRST
***            TO USE BIG_TMPDIR. OTHERWISE, TRY FOR TMPDIR.

              call getenvc( UZBIGT,evalue )

              if (is_off( evalue ))                            THEN
                  call getenvc( TMPDIR,evalue )
              else if(is_on( evalue ))                         THEN
                  call getenvc( BIGTMP,evalue )
              else
                  call getenvc( BIGTMP,evalue )
                  if (evalue.eq.' ')
     +            call getenvc( TMPDIR,evalue )
              end if

***            evalue has to be defined.

              if (evalue.eq.' ')                               THEN
                  if (info) write(6,6001)
                  call                             xit(' Ouvzref ',-1 )
              else

                  nomfich = trim( evalue ) // '/' // nomfich

***                Est-ce que fichier existe dans le TMPDIR ?

                  kind  = wkoffit( '+' // trim( nomfich ) )

              end if

          end if

      end if

      if (debug) write(6,6100) trim( nomfich )

***    Repartir avec un nouveau fichier ?

      if (remlocal .and. kind >= -1)                           THEN
          errno = clib_remove( TRIM( nomfich ) )
          if (errno /= CLIB_OK )                               THEN
              if (info) write(6,6002) TRIM( nomfich )
              call                                 xit(' Ouvzref ',-2 )
          end if
          if (debug) write(6,6101)
          kind  = -2
      end if

***    Caracteristiques du fichier.

      status = 'FTN+D77+UNF+R/W'

      if (kind.ge.-1)                                          THEN
          status = status // '+OLD'
          EXISTE = .true.
          if (info) write(6,6000) kind,trim( nomfich )
      else
          EXISTE = .false.
          if (kind.eq.-2) call system('rm -f ' // trim( nomfich ))
      end if

      if (debug) write(6,6102) EXISTE,status

***    Ouvrir le fichier zcrochets avec un numero I/O aleatoire.
***    Les enregistrements sont de longueurs lonrec mots.

      if (io == 0)                                             THEN

          lonrec = 2*MAZDIM+18

          errno  = fnom( io, '+' // trim( nomfich ), status, lonrec )

          if (debug) write(6,6103) errno,io

          if (errno.ne.0) goto 400

      end if

***    Combien y-a-t'il d'enregistrements dans ce fichier ?

      if (EXISTE)                                              THEN
  200     continue
              read( io, rec=nr+1,err=400,iostat=errno ) dummy
              if (debug) write(6,6104) nr+1,dummy
              if (dummy.eq.-(nr+1)) goto 300
              nr = nr+1
          goto 200
      end if

***    Fichier crochets ouvert.

  300 OK = .true.
  400 if (info .and. errno.GT.0) CALL MESSYS( 'In Ouvzref...' )

      if (debug) write(6,6105) EXISTE,OK

      remlocal = .false.

      return

*-------------------------------------------------------------------
      entry rmzref()

      errno = clib_remove( TRIM( nomfich ) )
      if (errno /= CLIB_OK )                                   THEN
          if (info) write(6,6003) TRIM( nomfich )
          call                                     xit(' Rmzref ',-1 )
      else if (debug)                                          THEN
          write(6,6106) TRIM( nomfich )
      end if

      return
*-------------------------------------------------------------------

 6000 FORMAT(' Ouvzref: WKOFFIT returns kind =',I3,' for ',A)
 6001 FORMAT(' Ouvzref: TMPDIR or BIG_TMPDIR not defined.'/)
 6002 FORMAT(' Ouvzref: Unable to remove old file ',A/)
 6003 FORMAT(' Rmzref:  Unable to remove old file ',A/)

 6100 FORMAT('*DEBUG:Ouvzref (1) Openning file ',A)
 6101 FORMAT('*DEBUG:Ouvzref (2) Removing previous ZCROCHETS file')
 6102 FORMAT('*DEBUG:Ouvzref (3) EXIST=',L1,' and status=',A)
 6103 FORMAT('*DEBUG:Ouvzref (4) fnom returns ',I3,' and io=',I3)
 6104 FORMAT('*DEBUG:Ouvzref (5) word #1 in rec=',I3,' is equal to ',I6)
 6105 FORMAT('*DEBUG:Ouvzref (6) EXISTE=',L1,' and OK=',L1)
 6106 FORMAT('*DEBUG:Rmzref  (1) Removing ZCROCHETS file ',A/)

      end SUBROUTINE ouvzref2
      SUBROUTINE makzref2 (nf, OK, rem)

      IMPLICIT    none

***    Force l'ecriture d'un fichier zcrochet.
***    Auteur: B. Dugas - 27 mai 1998

      integer     nf
      logical     OK,rem

      integer     clesav,na,nfa, cle1,cle2

#     include    "fstparm.cdk"

      logical,    save :: remlocal = .false.
      integer,    external :: fstinfx
      external    savzref

*-------------------------------------------------------------------

      remlocal = rem

*-------------------------------------------------------------------
      Entry makzref (nf, OK)

      clesav = cle
      OK     = .false.
      nfa    = abs( nf )

***    Commencer la recherche du debut du fichier.

      cle1 = fstinfx( 0, nfa, na,na,na,
     +               -1,' ',-1,-1,-1,' ','>>' )
      cle2 = fstinfx( 0, nfa, na,na,na,
     +               -1,' ',-1,-1,-1,' ','^^' )
      cle = min( cle1,cle2 )

      if (cle.lt.0) return

***    On sauve les enregistrements de renvoi.

      call savzref2( nfa, OK, remlocal )

***    Restaurer le fichier a sa position initiale.

      cle = clesav

      remlocal = .false.

      return
*-------------------------------------------------------------------

      end SUBROUTINE makzref2
      SUBROUTINE pushyz( NF, NI,NJ, IG1,IG2,IG3 )

      implicit    none

      logical     FOUND
      integer     NF, NI,NJ,IG1,IG2,IG3

***    Variables locales.

      integer,    parameter :: maxn = 16384

      integer     i,last,
     +            nfloc (0:maxn),niloc (0:maxn),njloc (0:maxn),
     +            ig1loc(0:maxn),ig2loc(0:maxn),ig3loc(0:maxn)

      save        last, nfloc, niloc,njloc, ig1loc,ig2loc,ig3loc

      LOGICAL              info,debug
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/      debug

      data        last      /  0 /,
     +            nfloc(0)  / -1 /,niloc(0)  / -1 /,njloc(0)  / -1 /,
     +            ig1loc(0) / -1 /,ig2loc(0) / -1 /,ig3loc(0) / -1 /

*-------------------------------------------------------------------
      do  i=1,last
          if (NF .eq. nfloc(i) .and.
     +        NI .eq. niloc(i) .and.
     +        NJ .eq. njloc(i) .and.
     +        IG1.eq.ig1loc(i) .and.
     +        IG2.eq.ig2loc(i)) return
!CCC +        IG3.eq.ig3loc(i)) return
      end do

      if (last.lt.maxn)                                        then
          last = last + 1
      else
          if (info) write(6,6001)
          call                                     xit(' Pushyz ',-1 )
      end if

      nfloc(last)  = NF
      niloc(last)  = NI
      njloc(last)  = NJ
      ig1loc(last) = IG1
      ig2loc(last) = IG2
      ig3loc(last) = IG3

      if (debug) write(6,6100) NF, NI,NJ, IG1,IG2,IG3

      return
*-------------------------------------------------------------------
      entry findyz( NF, NI,NJ, IG1,IG2,IG3, FOUND )

      FOUND = .false.

      do  i=1,last
          if (NF .eq. nfloc(i) .and.
     +        NI .eq. niloc(i) .and.
     +        NJ .eq. njloc(i) .and.
     +        IG1.eq.ig1loc(i) .and.
     +        IG2.eq.ig2loc(i) )                               then
!CCC +        IG3.eq.ig3loc(i) )                               then

              FOUND = .true.

              if (debug) write(6,6200) NF, NI,NJ, IG1,IG2,IG3

              return

          end if
      end do

      return
*-------------------------------------------------------------------

 6001 FORMAT('PUSHYZ:  Too many different reference sets.')
 6100 FORMAT('*DEBUG:pushyz  added nf,ni,nj,ig1,ig2,ig3= ',3I5,3I6)
 6200 FORMAT('*DEBUG:findyz  found nf,ni,nj,ig1,ig2,ig3= ',3I5,3I6)

      end SUBROUTINE pushyz
      SUBROUTINE precle( NF,cle,offset )

      implicit    none

      integer,    parameter :: MAXCLE = 16384, MAXIO = unite_io_maximale

      integer     NF,cle,offset,liste(*)

      LOGICAL              info
      COMMON     /ZZVERBO/ info

***    Variables locales.

      integer     i,j,ioffset,ier,io, i1,i2

***    Bloc de controle.

      logical     initial
      integer              poscle(MAXIO), filenum(MAXIO), NIO, NBPAGE
      save        initial, poscle       , filenum       , NIO, NBPAGE

      integer,    dimension(:), allocatable :: blocle,workle
      save                                     blocle

      data        poscle  / MAXIO*1 /,
     +            initial / .true.  /,
     +            NBPAGE  /   1     /
*-------------------------------------------------------------------

***    Cette routine fait un backspace pour les fichiers STD98
***    a partir de la position courante definie par poscle.

      if (initial)                                             then
          if (INFO)                                write(6,6001)
          call                                     XIT(' Precle ',-1 )
      end if

      ioffset = abs( offset )

***    Verifier la taille du parametre offset.

      if (ioffset.gt.MAXCLE*NBPAGE)                            then
          if (INFO)                                write(6,6002) offset
          call                                     XIT(' Precle ',-2 )
      end if

***    Nous connaissons ce numero I/O ?

      io = -1
      do  i=1,NIO
          if (NF.eq.filenum(i)) io = i
      end do

      if (io.eq.-1)                                            then
          if (INFO)                                write(6,6003) NF
          call                                     XIT(' Precle ',-3 )
      end if

***    Tout va bien, allons-y.

                             poscle( io ) = poscle( io )-ioffset
      if (poscle( io ).le.0) poscle( io ) = poscle( io )+MAXCLE*NBPAGE

      cle = blocle( poscle( io )+(io-1)*MAXCLE*NBPAGE )

      return

*-------------------------------------------------------------------
***    Cette routine sauve une cle STD98 en vue d'un eventuel backspace.
***    La position courante est egalement mise a jour dans poscle.

      entry clesui( NF,cle )

      if (initial)                                             then
          if (INFO)                                write(6,6001)
          call                                     XIT(' Clesui ',-1 )
      end if

***    Nous connaissons ce numero I/O ?

      io = -1
      do  i=1,NIO
          if (NF.eq.filenum(i)) io = i
      end do

      if (io.eq.-1)                                            then
          if (INFO)                                write(6,6022) NF
          call                                     XIT(' Clesui ',-2 )
      end if

      poscle( io ) = poscle( io )+1

***    Verifier que blocle est encore assez grand.

      if (poscle( io ).gt.MAXCLE*NBPAGE)                       then

***        Non, il ne l'est pas.

***        Allouons un champs de travail temporaire ...

          allocate( workle(MAXCLE*NBPAGE*NIO) )

***        ... et sauvons y blocle.

          workle(:) = blocle(:)
          
***        Maintenant, on alloue un nouveau blocle ...

          NBPAGE = NBPAGE+1

          deallocate( blocle )
            allocate( blocle(MAXCLE*NBPAGE*NIO) )

          blocle (:) = 0

***        ... et on y transfere workle.

          do  j=1,NIO
              i1 = (j-1)*MAXCLE* NBPAGE
              i2 = (j-1)*MAXCLE*(NBPAGE-1)
              do  i=1,MAXCLE*(NBPAGE-1)
                  blocle(i+i1) = workle(i+i2)
              end do
          end do

***        Enfin, desallouons workle.

          deallocate( workle )

      end if

***    Nous pouvons maintenant sauver la nouvelle cle.

      blocle( poscle( io )+(io-1)*MAXCLE*NBPAGE ) = cle

      return
*-------------------------------------------------------------------

***    Cette routine initialise/alloue blocle pour permettre
***    une simulation du traitement sequentiel des cles.

      entry inicle( NF,liste )

      NIO = min( NF,MAXIO )

***    Sauvons le numero I/O dans filenum.

      do  i=1,NIO
          io = liste(i)
          if (io.gt.MAXIO)                                     then
              if (INFO)                             write(6,6031) io
              call                                  XIT(' Inicle ',-1 )
          end if
          filenum(i) = io
      end do

***    Allouons/initialisons un premier blocle.

      allocate( blocle(MAXCLE*NIO) ) ; blocle(:) = 0

      initial = .false.

      return

*-------------------------------------------------------------------
 6001 format('PRECLE/CLESUI: Not initialized. Please call INICLE.'/)
 6002 FORMAT('PRECLE: requested offset ',I6,' too large...'/)
 6003 FORMAT('PRECLE: I/O Unit number ',I3,' unknown...'/)
 6022 FORMAT('CLESUI: I/O Unit number ',I3,' unknown...'/)
 6031 FORMAT('INICLE: I/O Unit number ',I3,' too large...'/)

      END SUBROUTINE precle
      SUBROUTINE lirpt (NFIN)

***    Reads the parametres defining the GEM/DM vertical
***    hybrid coordinate system (from v_2.3.1 onward).

      IMPLICIT    NONE

***    lirpt/ecrpt I/O declarations.

      INTEGER     NFIN,NFOUT

***    getpt/setpt I/O declarations.

      REAL        PTOP,PREF,RCOEF

***    fstparm comdeck (used by ecrpt).

#     include    "fstparm.cdk"

***    Local work variables.

      LOGICAL     REWRIT
      REAL        BUFFER,RDUM,
     +            WORK(1),PREFMB
      CHARACTER   BLK*16,NAME*256
      INTEGER     DUM,DUM0,DUM1,DUM2,
     +            PT_ERR,PT_CLE,NF

***    Private common shared by ECRPT/LIRP and GETPT/SETPT.

      CHARACTER   PT_GRTYP,PT_TYPVAR
      SAVE        PT_GRTYP,PT_TYPVAR

      INTEGER     PT_NI0,PT_NJ0,PT_NK0
      INTEGER     PT_IP1,PT_NI,PT_NJ,PT_NK,PT_SIZE,PT_KIND
      SAVE        PT_IP1,PT_NI,PT_NJ,PT_NK,PT_SIZE,PT_KIND

      LOGICAL     PT_READ(unite_io_maximale),PT_WRIT(unite_io_maximale)
      SAVE        PT_READ,     PT_WRIT

      INTEGER     PT_IG1,PT_IG2,PT_IG3,PT_IG4,PT_DATYP
      SAVE        PT_IG1,PT_IG2,PT_IG3,PT_IG4,PT_DATYP

      REAL        PT_PTOP(0:unite_io_maximale),PT_PREF(0:unite_io_maximale),PT_RCOEF(0:unite_io_maximale)
      SAVE        PT_PTOP,       PT_PREF,       PT_RCOEF

***    External declarations.

      LOGICAL              info,debug,na
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/      debug
      COMMON     /ZZABORT/            na

      INTEGER     hybref_to_ig,ig_to_hybref
      EXTERNAL    hybref_to_ig,ig_to_hybref
      INTEGER     FSTINFX,FSTPRM,FSTLUK,FSTECR
      EXTERNAL    FSTINFX,FSTPRM,FSTLUK,FSTECR,
     +            GETNAM,CONVPR

      DATA        PT_DATYP /  5 /
      DATA        PT_SIZE  / -1 /
      DATA        PT_GRTYP / 'X' /
      DATA        PT_TYPVAR/ 'X' /
      DATA        PT_NI,PT_NJ,PT_NK / 3*1 /
      DATA        PT_PTOP  / 100*    -1.0 /,
     +            PT_PREF  / 100* 80000.0 /,
     +            PT_RCOEF / 100*     1.0 /
      DATA        PT_READ  /  unite_io_maximale*.FALSE.  /,
     +            PT_WRIT  /  unite_io_maximale*.FALSE.  /
      DATA        REWRIT   /     .FALSE.  /
*-------------------------------------------------------------------

      NF = ABS( NFIN )

      IF (.NOT.PT_READ(NF))                                    THEN

          PT_READ(NF) = .TRUE.

          IF (INFO)                                            THEN
              CALL GETNAM( NF, NAME )
              WRITE(6,6000) TRIM( NAME )
          END IF

***        Attempt (ONCE) to find and read PTOP,PREF and
***        RCOEF from I/O unit NF. Please note that this
***        procedure aborts at the first error.

          PT_CLE = 0
          PT_ERR = FSTINFX( PT_CLE, NF, PT_NI0,PT_NJ0,PT_NK0,
     +                   -1,' ',-1,-1,-1,' ','HY' )

          IF (PT_ERR.LT.0)                                     THEN
              IF (DEBUG) WRITE(6,6101) PT_ERR
              GOTO 100
          END IF

          PT_CLE = PT_ERR
          PT_ERR = FSTPRM( PT_CLE, DUM0,DUM1,DUM2,
     +                  PT_NI0,PT_NJ0,PT_NK0, DUM,PT_DATYP,
     +                  PT_IP1,DUM,DUM, PT_TYPVAR,BLK,BLK,
     +                  PT_GRTYP,PT_IG1,PT_IG2,PT_IG3,PT_IG4,
     +                  SWA,LNG,DLTF,UBC,EXTRA1,EXTRA2,EXTRA3 )

          IF (PT_ERR.LT.0)                                     THEN
              IF (DEBUG) WRITE(6,6102) PT_ERR
              GOTO 100
          END IF

          CALL CONVPR( PT_IP1,PT_PTOP(NF), PT_KIND, -1 )

          PT_SIZE = PT_NI0*PT_NJ0*PT_NK0
          IF (PT_SIZE.NE.1)                                    THEN
              IF (INFO) WRITE(6,6001) PT_SIZE
              CALL                                 XIT('  LirPT ',-1 )
          END IF

          PT_ERR = FSTLUK( WORK, PT_CLE, PT_NI0, PT_NJ0, PT_NK0 )

          IF (PT_ERR.LT.0)                                     THEN
              IF (DEBUG) WRITE(6,6104) PT_ERR
              GOTO 100
          END IF

          PT_NI = PT_NI0
          PT_NJ = PT_NJ0
          PT_NK = PT_NK0

***        First, RCOEF and PREF may be coded inside of IG1 and IG2.

          IF (PT_GRTYP.EQ.'X' .AND.
     +          PT_NI .EQ. 1  .AND.
     +          PT_NJ .EQ. 1  .AND.
     +          PT_NK .EQ. 1  )                                THEN

              PT_ERR = ig_to_hybref( PT_IG1,PT_IG2,PT_IG3,PT_IG4,
     +                              PT_RCOEF(NF),PREFMB,RDUM,RDUM )

              PT_PREF (NF) = PREFMB*100.
!CC           PT_PREF (NF) = PT_IG1*100.
!CC           PT_RCOEF(NF) = PT_IG2/1000.0

              IF (PT_RCOEF(NF) .NE. PT_RCOEF(0) .OR.
     +            PT_PREF (NF) .NE. PT_PREF (0) )              THEN

                  IF (INFO) WRITE(6,6100) 
                  IF (INFO) WRITE(6,6200) PT_RCOEF(NF),PT_PREF(NF)

!CC               IF (.NOT.NA .AND. PT_PTOP(0).NE.-1.0)
!CC  +                CALL                         XIT('  LirPT ',-2 )
              END IF

              PT_RCOEF(0) = PT_RCOEF(NF)
              PT_PREF (0) = PT_PREF (NF)

          END IF

***        Finally, save PTOP, converting it from MBs to Pascals.
          
          IF (WORK(1).NE.0.0) PT_PTOP(NF) = 100.0 * WORK(1)

          IF (PT_PTOP(NF) .NE. PT_PTOP(0))                     THEN

!CC           IF (.NOT.NA .AND. PT_PTOP(0).NE.-1.0)
!CC  +            CALL                             XIT('  LirPT ',-3 )

              IF (INFO) WRITE(6,6300) PT_PTOP(NF)

              PT_PTOP(0) = PT_PTOP(NF)

          END IF

      END IF

  100 RETURN

*-------------------------------------------------------------------
      ENTRY ecrpt (NFOUT)

      NF = ABS( NFOUT )

***    Writes a record that defines the parametres
***    of the GEM/DM vertical hybrid coordinate system.

      IF (.NOT.PT_WRIT(NF) .AND. PT_PTOP(0).NE.-1.0)           THEN

***        We can only do this ONCE per I/O unit.

          PT_WRIT(NF) = .TRUE.

***        Write the data as it last read from input. We re-use
***        most of the parametres of the previous FST operation.

          WORK(1) = PT_PTOP(0)/100.

          CALL CONVPR( PT_IP1,WORK, PT_KIND, +1 )

          CLE = FSTECR( WORK,BUFFER,
     +                  -32, NF, DATEO,DEET,NPAS,
     +                  PT_NI,PT_NJ,PT_NK, PT_IP1,IP2,IP3,
     +                  PT_TYPVAR,'HY',ETIKET,
     +                  PT_GRTYP, PT_IG1,PT_IG2,PT_IG3,PT_IG4,
     +                  PT_DATYP, REWRIT )

          IF (INFO)                                            THEN
              CALL GETNAM( NF, NAME )
              WRITE(6,6400) PT_PTOP(0),PT_PREF(0),PT_RCOEF(0),
     +                      TRIM( NAME )
          END IF

      END IF

      RETURN
*-------------------------------------------------------------------

      ENTRY getpt (NFIN, PTOP,PREF,RCOEF)

      NF = ABS( NFIN )

***    Retrieves the parametres defining the
***    GEM/DM vertical hybrid coordinate system.

***    Gets the default parametres values.

      PTOP  = PT_PTOP(NF)
      PREF  = PT_PREF(NF)
      RCOEF = PT_RCOEF(NF)

      IF (INFO .AND. PTOP >= 0.) WRITE(6,6500) PTOP,PREF,RCOEF

      RETURN

*-------------------------------------------------------------------
      ENTRY setpt (PTOP,PREF,RCOEF)

***    Defines the parametres of the GEM/DM
***    vertical hybrid coordinate system.

      IF (PT_SIZE.EQ.-1)                                       THEN

          PT_SIZE = PT_NI*PT_NJ*PT_NK

      END IF

***    Sets the default parametres values. Note that defining
***    PTOP=-1.0 acts as an unsetting operation.

      PT_KIND     = 2

      PT_PTOP(0)  = PTOP
      PT_PREF(0)  = PREF
      PT_RCOEF(0) = RCOEF

      IF (PTOP.EQ.-1.0) RETURN

      DO  DUM=1,PT_SIZE
          WORK(DUM) = PTOP / 100.
      END DO

      RDUM   = 0.0
      PREFMB = PREF/100.

      PT_ERR = hybref_to_ig( PT_IG1,PT_IG2,PT_IG3,PT_IG4,
     +                       RCOEF, PREFMB,RDUM,  RDUM )

!CC   PT_IG1 = PREF/100.
!CC   PT_IG2 = RCOEF*1000.
!CC   PT_IG3 = RUM
!CC   PT_IG4 = RDUM

      IF (INFO) WRITE(6,6600) PT_PTOP(0),PT_PREF(0),PT_RCOEF(0)

      RETURN
*-------------------------------------------------------------------

 6000 FORMAT(' LirPT:   Attempt to find PTop on file...'/10X,A)

 6001 FORMAT(' LirPT:   HY record descriptor size=',I6)

 6101 FORMAT('*DEBUG: LirPT error ',I3,' in FSTINFX')
 6102 FORMAT('*DEBUG: LirPT error ',I3,' in FSTPRM')
 6104 FORMAT('*DEBUG: LirPT error ',I3,' in FSTLUK')  

 6100 FORMAT(' LirPT:   found a new set of parametres...')
 6200 FORMAT(' LirPT:   RCoef = ',F14.6,' and PRef = ',F14.6)

 6300 FORMAT(' LirPT:   PTop  = ',F14.6)
 6400 FORMAT(' EcrPT:   Writing PTop, PRef and RCoef = ',3F14.6,
     +                  ' to file...'/10X,A)

 6500 FORMAT(' GetPT:   PTop, PRef and RCoef = ',3F14.6)

 6600 FORMAT(' SetPT:   PTop, PRef and RCoef = ',3F14.6)

      END SUBROUTINE lirpt
      SUBROUTINE savUref( nf,OK )

      implicit    none

      ! Routines de gestion des enregistrements '^>'
      ! decrivant les grilles de type U (Yin/Yan)

      integer, intent(in)  :: nf
      logical, intent(out) :: ok
      integer, intent(out) :: refip1,refip2,refip3
      real(8), intent(out) :: DeltaX, DeltaY
      integer, intent(inout) :: ni,nj

      type :: U_descriptor
          character         :: gtyp='F'
          character(2)      :: typv='X'
          character(4)      :: nomv='^>'
          character(12)     :: etik=' '
          integer           :: ni,nj,nk,dateo
          integer           :: ip1,ip2,ip3,ig1,ig2,ig3,ig4
          real,allocatable  :: data(:)
      End type

      integer,  parameter  :: extras = 0 ! option extras = 4 ?
      integer,  parameter  :: un = 1, cinq = 5
      integer,  parameter  :: maxdesc = 20

      type(U_descriptor), save :: descu(maxdesc)

      INTEGER     U_NI,U_NJ,U_NK, U_ERR,U_CLE
      INTEGER     U_IP1,U_IP2,U_IP3,U_SIZE,U_NBITS, DUM
      INTEGER     U_IG1,U_IG2,U_IG3,U_IG4,U_DATYP,U_DATEO
      CHARACTER   U_GTYP,U_NOMV*4,U_TYPV*2,U_ETIK*12,BLK
      INTEGER     SWA,LNG,DLTF,UBC,EXTRA1,EXTRA2,EXTRA3
      INTEGER     mlt,ni1,nj1

      INTEGER,    save :: sindx=6
      INTEGER     nis,njs
      REAL        Rot(8), Posx(4), Posy(4)

      LOGICAL,    save :: U_READ(unite_io_maximale),U_WRIT(unite_io_maximale)

      logical     Found
      integer     nfa, i,FoundIt, tempU, ll
      integer,    save :: lastdesc=0

      LOGICAL              info,debug,na
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/      debug
      COMMON     /ZZABORT/            na

      DATA        U_READ  /  unite_io_maximale*.FALSE.  /,
     +            U_WRIT  /  unite_io_maximale*.FALSE.  /

      integer, external :: FSTINFX,FSTPRM,FSTLUK,FSTECR

*-------------------------------------------------------------------

      OK = .true. ; nfa = abs( nf ) ; ll = 0 ; FoundIt = 0

      If (.not. U_READ(nfa))                                   THEN

          U_READ(nfa) = .TRUE. ; U_CLE = 0

          ! Trouver le prochain descripteur ^>.

  100     U_ERR = FSTINFX( U_CLE, NFA, U_NI,U_NJ,U_NK,
     +                   -1,' ',-1,-1,-1,' ','^>' )

          If (U_ERR < 0)                                       THEN
              ! Il n'y a plus de descripteurs.
              If (ll == 0 .and. DEBUG) write(6,6101) U_ERR
              Return
          Else
              ll = ll+1
          End If

          ! Verifier le contenu de ce descripteur ^>.

          U_CLE = U_ERR
          U_ERR = FSTPRM( U_CLE, U_DATEO,DUM,DUM,
     +                U_NI,U_NJ,U_NK, U_NBITS,U_DATYP,
     +                U_IP1,U_IP2,U_IP3, U_TYPV,U_NOMV,U_ETIK,
     +                U_GTYP,U_IG1,U_IG2,U_IG3,U_IG4,
     +                SWA,LNG,DLTF,UBC,EXTRA1,EXTRA2,EXTRA3 )

          If (U_ERR < 0)                                       THEN
              If (DEBUG) write(6,6102) U_ERR
              Return
          End If

          ! Est-ce qu'on l'a deja sauve...

          Do  i=1,min(lastdesc,maxdesc)
              If (U_NI    == descu(i)%ni    .and.
     +            U_NJ    == descu(i)%nj    .and.
     +            U_NK    == descu(i)%nk    .and.
     +            U_IP1   == descu(i)%ip1   .and.
     +            U_IP2   == descu(i)%ip2   .and.
     +            U_IP3   == descu(i)%ip3   .and.
     +            U_IG1   == descu(i)%ig1   .and.
     +            U_IG2   == descu(i)%ig2   .and.
     +            U_IG3   == descu(i)%ig3   .and.
     +            U_IG4   == descu(i)%ig4   .and.
!CC  +            U_DATEO == descu(i)%dateo .and.
     +            U_GTYP  == descu(i)%gtyp  .and.
     +            U_TYPV  == descu(i)%typv  .and.
     +            U_NOMV  == descu(i)%nomv)                    THEN

                  FoundIt = i ; exit

              End If
          End Do

          If (FoundIt == 0 .and. lastdesc < maxdesc)           THEN

              ! Sauver ce nouveau descripteur ^>.

              lastdesc = lastdesc+1

              If (.not.allocated( descu(lastdesc)%data ))
     +             allocate( descu(lastdesc)%data(U_NI*U_NJ) )

              U_ERR = FSTLUK( descu(lastdesc)%data,U_CLE,U_NI,U_NJ,U_NK)

              If (U_ERR < 0)                                   THEN
                  If (DEBUG) write(6,6103) U_ERR
                  Goto 100
              Else If (INFO)                                   THEN
                  write(6,6104) lastdesc 
                  If (nint( descu(i)%data(3) ) /= 2)
     +                write(6,6106) descu(i)%data(3)
              End If

              descu(i)%ni    = U_NI
              descu(i)%nj    = U_NJ
              descu(i)%nk    = U_NK
              descu(i)%ip1   = U_IP1
              descu(i)%ip2   = U_IP2
              descu(i)%ip3   = U_IP3
              descu(i)%ig1   = U_IG1
              descu(i)%ig2   = U_IG2
              descu(i)%ig3   = U_IG3
              descu(i)%ig4   = U_IG4
              descu(i)%dateo = U_DATEO
              descu(i)%etik  = U_ETIK

              If (info) Call decrireU( )

          End If

          GOTO 100
          
      Else If (FoundIt == 0 .and. lastdesc == maxdesc)         THEN
 
          ! Trop de descripteurs ^>.

          If (DEBUG) WRITE(6,6105) U_ERR
 
      End If
    
      Return

*-------------------------------------------------------------------
      Entry getUdesc( refip1,refip2,refip3, ni,nj )

      ! Recuperer les ip1,ip2,ip3 associe a une grille U.

      ! Si ni et nj sont plus grand que zero, chercher un jeux
      ! de descripteurs correspondant a une grille ayant ces
      ! dimensions. Sinon, retourner les valeurs correspondants
      ! au premier jeux de descripteurs si celui-ci existe.

      refip1 = -1 ; refip2 = -1 ; refip3 = -1 ; i = 1

      If (ni > 0 .and. nj > 0)                                 THEN
          Do  i=1,lastdesc
              mlt = nint( descu(i)%data(3) )
              nis = nint( descu(i)%data(sindx  ) )
              njs = nint( descu(i)%data(sindx+1) )
              If ( nis+extras == ni .and. mlt*(njs+extras) == nj) exit
          End Do
      End If

      If (i > lastdesc) return

      If (ni <= 0 .or. nj <= 0)                                THEN
          mlt = nint(      descu(i)%data(3) )
          ni  = nint(      descu(i)%data(sindx  )+extras  )
          nj  = nint( mlt*(descu(i)%data(sindx+1)+extras) )
      End If

      refip1 = descu(i)%ip1
      refip2 = descu(i)%ip2
      refip3 = descu(i)%ip3

      Return
*-------------------------------------------------------------------

      Entry getUres( DeltaX,DeltaY, ni,nj )

      ! Recuperer la resolution associee
      ! a une grille U de taille ni x nj

      DeltaX = -1.0 ; DeltaY = -1.0

      Do  i=1,lastdesc
          mlt = nint( descu(i)%data(3) )
          nis = nint( descu(i)%data(sindx  ) )
          njs = nint( descu(i)%data(sindx+1) )
          If ( nis+extras == ni .and. mlt*(njs+extras) == nj) exit
      End Do

      If (i > lastdesc) return

      Posx(1) = descu(i)%data(sindx+2)
      Posx(2) = descu(i)%data(sindx+3)
      Posy(1) = descu(i)%data(sindx+4)
      Posy(2) = descu(i)%data(sindx+5)

      DeltaX  = DBLE(Posx(2)-Posx(1))/(nis-1)
      DeltaY  = DBLE(Posy(2)-Posy(1))/(njs-1)

      Return

*-------------------------------------------------------------------
      Entry writUref( nf )

      nfa = abs( nf )

      Do  i=1,lastdesc

          ! Verifier si des enregistrements U correspondants
          ! aux descripteurs qu'on a sauve ont ete ecrits sur NF.

          mlt = nint( descu(i)%data(3) ) ! Nombre de sous-grilles
          ni1 = nint( descu(i)%data(6) ) ! NI de la premiere sous-grille
          nj1 = nint( descu(i)%data(7) ) ! NJ de la premiere sous-grille

          If (5+mlt*(10+ni1+nj1) /= descu(i)%ni)               THEN
              If (info) write(6,6001) i, descu(i)%ni,
     +            descu(i)%data(3), descu(i)%data(6),descu(i)%data(7)
              Call                                 xit('writUref',-1 )
          End If

          Call findU( nfa,
     +                ni1,nj1*mlt,
     +                descu(i)%ip1,descu(i)%ip2,descu(i)%ip3,
     +                Found )
          
          ! Si oui, on les ecrit sur nf.

          If (Found)                                           THEN

              U_cle = fstecr( descu(i)%data, tempU,-32,NFA,
     +                        descu(i)%dateo, 0, 0,
     +                        descu(i)%ni,descu(i)%nj, un,
     +                        descu(i)%ip1,descu(i)%ip2,descu(i)%ip3,
     +                        descu(i)%typv,descu(i)%nomv,descu(i)%etik,
     +                        descu(i)%gtyp,descu(i)%ig1,descu(i)%ig2,
     +                        descu(i)%ig3,descu(i)%ig4,cinq, .true. )

              If (debug) write(6,6140) '^>',NF

              If (U_cle < 0)                                   THEN
                  If (info) write(6,6022) i
                  If (info) write(6,6023) descu(i)%ni,descu(i)%nj,
     +                     descu(i)%ip1,descu(i)%ip2,descu(i)%ip3,
     +                     descu(i)%typv,descu(i)%etik,descu(i)%gtyp,
     +                     descu(i)%ig1,descu(i)%ig2,
     +                     descu(i)%ig3,descu(i)%ig4
                  Return
              End If

          End If

      End Do

      Return
*-------------------------------------------------------------------

 6001 format('WRITUREF: For set ',i2,', descripancy between ',
     + 'internal descriptor words'/11x,I6,' not equal 5 +',I2,
     + ' * ( 10 + ',I4,' + ',I4,' )'/)
 6022 format('WRITUREF: Unable to write U-ref record no.',I5)
 6023 format('WRITUREF: NI,NJ,IP1,IP2,IP3,TYPVAR,ETIKET,GRTYP,',
     +       'IG1,IG2,IG3,IG4=', 5I7,3(1X,A),4I7)
 6101 FORMAT('*DEBUG: SavUref error ',I3,' in FSTINFX')
 6102 FORMAT('*DEBUG: SavUref error ',I3,' in FSTPRM')
 6103 FORMAT('*DEBUG: SavUref error ',I3,' in FSTLUK')  
 6104 FORMAT('*INFO:  SavUref saved ^> no. ',I2)
 6105 FORMAT('*DEBUG: SavUref too many descriptor records.')  
 6106 FORMAT('*INFO:  SavUref number of subgrids is ',I1,
     +       ' rather than 2...')
 6140 format('*DEBUG: WRITUREF ',A,' written to unit ',I3)
 
      CONTAINS

        Subroutine decrireU ()

      ! Imprimer les elements principaux du dernier descripteur U '>^'

          ! La routine out_href.F90 de gem 4.8+ decrit le contenu
          ! des U_NI*U_NJ*U_NK mots de cet enregistrment. Les dims
          ! nis et njs de la premiere sous-grille sont aux mots 6
          ! et 7. Ainsi ...
          !
          ! version_uencode    = 1
          ! familly_uencode_S = 'F'
          !
          ! niyy=5+2*(10+nis+njs)
          !
          ! yy(1 ) = iachar(familly_uencode_S)
          ! yy(2 ) = vesion_uencode
          ! yy(3 ) = 2          ! 2 grids (Yin & Yang), as assumed above for niyy
          ! yy(4 ) = 1          ! the 2 grids have same resolution
          ! yy(5 ) = 1          ! the 2 grids have same area extension
          !
          ! YIN
          ! sindx  = 6
          ! yy(sindx  ) = nis
          ! yy(sindx+1) = njs
          ! yy(sindx+2) = posx(Out_gridi0)
          ! yy(sindx+3) = posx(Out_gridi0+nis-1)
          ! yy(sindx+4) = posy(Out_gridj0)
          ! yy(sindx+5) = posy(Out_gridj0+njs-1)
          ! yy(sindx+6) = Out_rot(1)
          ! yy(sindx+7) = Out_rot(2)
          ! yy(sindx+8) = Out_rot(3)
          ! yy(sindx+9) = Out_rot(4)
          ! yy(sindx+10    :sindx+9+nis    )= &
          ! posx(Out_gridi0:Out_gridi0+nis-1)
          ! yy(sindx+10+nis:sindx+9+nis+njs)= &
          ! posy(Out_gridj0:Out_gridj0+njs-1)
          !
          ! YAN
          ! sindx2 = sindx+10+nis+njs
          ! yy(sindx2  ) = nis
          ! yy(sindx2+1) = njs
          ! yy(sindx2+2) = posx(Out_gridi0)
          ! yy(sindx2+3) = posx(Out_gridi0+nis-1)
          ! yy(sindx2+4) = posy(Out_gridj0)
          ! yy(sindx2+5) = posy(Out_gridj0+njs-1)
          ! yy(sindx2+6) = Out_rot(5)
          ! yy(sindx2+7) = Out_rot(6)
          ! yy(sindx2+8) = Out_rot(7)
          ! yy(sindx2+9) = Out_rot(8)
          ! yy(sindx2+10    :sindx2+9+nis    )= &
          ! posx(Out_gridi0:Out_gridi0+nis-1)
          ! yy(sindx2+10+nis:sindx2+9+nis+njs)= &
          ! posy(Out_gridj0:Out_gridj0+njs-1)

          integer sindx2,niso,njso
          real    Roto(8), Posxo(4), Posyo(4)
          real(8) DeltaXo, DeltaYo

          niso = nint(  descu(lastdesc)%data(sindx  ) )
          njso = nint(  descu(lastdesc)%data(sindx+1) )

          Posxo(1) = descu(lastdesc)%data(sindx+2)
          Posxo(2) = descu(lastdesc)%data(sindx+3)
          Posyo(1) = descu(lastdesc)%data(sindx+4)
          Posyo(2) = descu(lastdesc)%data(sindx+5)

          DeltaXo  = DBLE(Posxo(2)-Posxo(1))/(niso-1)
          DeltaYo  = DBLE(Posyo(2)-Posyo(1))/(njso-1)

          Roto(1)  = descu(lastdesc)%data(sindx+6)
          Roto(2)  = descu(lastdesc)%data(sindx+7)
          Roto(3)  = descu(lastdesc)%data(sindx+8)
          Roto(4)  = descu(lastdesc)%data(sindx+9)

          sindx2  = sindx+10+niso+njso

          Posxo(3) = descu(lastdesc)%data(sindx2+2)
          Posxo(4) = descu(lastdesc)%data(sindx2+3)
          Posyo(3) = descu(lastdesc)%data(sindx2+4)
          Posyo(4) = descu(lastdesc)%data(sindx2+5)

          Roto(5)  = descu(lastdesc)%data(sindx2+6)
          Roto(6)  = descu(lastdesc)%data(sindx2+7)
          Roto(7)  = descu(lastdesc)%data(sindx2+8)
          Roto(8)  = descu(lastdesc)%data(sindx2+9)

          write(6,1000) lastdesc, DeltaXo,DeltaYo,
     +                  niso,2*njso, U_IP1,U_IP2,U_IP3,
     +                  U_IG1,U_IG2,U_IG3,U_IG4,
     +                  niso,njso

          write(6,'(/"  Yin grid description...")')
          write(6,1001) Posxo(1),Posyo(1),Posxo(2),Posyo(2)
          write(6,1002) Roto(1:4)

          write(6,'( "  Yan grid description...")')
          write(6,1001) Posxo(3),Posyo(3),Posxo(4),Posyo(4)
          write(6,1002) Roto(5:8)

          Return

 1000     Format(/' U-grid descriptor ',I2,' contents ...'//
     +           '  Yin/Yan grid DeltaX, DeltaY= ',2(F13.9,',')/
     +           '   Full grid ni,nj = ',2(I5,',')/
     +           '   Full grid IPi = ',3(I6,',')/
     +           '   Full grid IGi = ',4(I6,',')/
     +           '   Sub grids ni,nj = ',I5,',',I5)
 1001     Format('   Lon/Lat From (',F8.3,' /',F8.3,' )',
     +                       ' to (',F8.3,' /',F8.3,' )')
 1002     Format('   Xgi (Lat/Lon pairs) = (',F8.3,' /',F8.3,' ),',
     +                                    '(',F8.3,' /',F8.3,' )'/)

        End Subroutine decrireU
*-------------------------------------------------------------------
      End Subroutine savUref

      subroutine pushU( NF, NI,NJ, IG1,IG2,IG3 )

      implicit    none

      logical     FOUND
      integer     NF, NI,NJ,IG1,IG2,IG3

***    Variables locales.

      integer,    parameter :: maxn = 16384
      integer,    save :: last,
     +            nfloc (0:maxn),niloc (0:maxn),njloc (0:maxn),
     +            ig1loc(0:maxn),ig2loc(0:maxn),ig3loc(0:maxn)
      integer     i

      LOGICAL              info,debug
      COMMON     /ZZVERBO/ info
      COMMON     /ZZDEBUG/      debug

      data        last      /  0 /,
     +            nfloc(0)  / -1 /,niloc(0)  / -1 /,njloc(0)  / -1 /,
     +            ig1loc(0) / -1 /,ig2loc(0) / -1 /,ig3loc(0) / -1 /

*-------------------------------------------------------------------
      do  i=1,last
          if (NF .eq. nfloc(i) .and.
     +        NI .eq. niloc(i) .and.
     +        NJ .eq. njloc(i) .and.
     +        IG1.eq.ig1loc(i) .and.
     +        IG2.eq.ig2loc(i) .and.
     +        IG3.eq.ig3loc(i)) return
      end do

      if (last < maxn)                                         then
          last = last + 1
      else
          if (info) write(6,6001)
          call                                     xit(' PushU ',-1 )
      end if

      nfloc(last)  = NF
      niloc(last)  = NI
      njloc(last)  = NJ
      ig1loc(last) = IG1
      ig2loc(last) = IG2
      ig3loc(last) = IG3

      if (debug) write(6,6100) NF, NI,NJ, IG1,IG2,IG3

      return
*-------------------------------------------------------------------
      entry findU( NF, NI,NJ, IG1,IG2,IG3, FOUND )

      FOUND = .false.

      do  i=1,last
          if (NF .eq. nfloc(i) .and.
     +        NI .eq. niloc(i) .and.
     +        NJ .eq. njloc(i) .and.
     +        IG1.eq.ig1loc(i) .and.
     +        IG2.eq.ig2loc(i) .and.
     +        IG3.eq.ig3loc(i) )                               then

              FOUND = .true.

              if (debug) write(6,6200) NF, NI,NJ, IG1,IG2,IG3

              return

          end if
      end do

      return
*-------------------------------------------------------------------

 6001 FORMAT('PUSHU:  Too many different reference sets.')
 6100 FORMAT('*DEBUG:pushU  added nf,ni,nj,ig1,ig2,ig3= ',3I5,3I6)
 6200 FORMAT('*DEBUG:findU  found nf,ni,nj,ig1,ig2,ig3= ',3I5,3I6)

      end subroutine pushU
      BLOCK DATA DATA_CONVSUB

*     Initialise variables of CONVSUB's COMMONs that need to be.

#     include    "highbuf.cdk"
      INTEGER              RNDF
      COMMON     /ZZRNDFL/ RNDF(unite_io_maximale)

      DATA        highdat,highpas,highdel,highigi / 4*.FALSE. /
      DATA        higheti,hightyp,highvar,highdtp / 4*.FALSE. /
      DATA        highip1,highip2,highip3,highnam / 4*.FALSE. /
      DATA        highkin,highhiv,highlov         / 3*.TRUE.  /

      DATA        RNDF / unite_io_maximale * 0 /

      END BLOCK DATA DATA_CONVSUB
