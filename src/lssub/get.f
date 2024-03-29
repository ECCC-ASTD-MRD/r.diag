#     if !defined (taille_entete_io)
#         define   taille_entete_io 16
#     endif
#     if !defined (donnee_minimale)
#         define   donnee_minimale 128
#     endif
#     if !defined (unite_io_maximale)
#         define   unite_io_maximale 99
#     endif

C     $Log: get.ftn,v $
C     Revision 3.101 2019/07/03 15:15  dugas
C     Ajouter des appels a MakZref dans GetSiz3 et GetSiz4 lorsqu'on
C      detecte la presence des grilles de type 'Z'. Ceci complete la
C      modification introduite en 20161026 au traitement du fichier
C      ZCROCHETS dans CONVSUB. Sans ces nouvelles modifications, les
C      TicTacs ne sont jamais rencontres par les modules utilisant
C      les routines GetSiz(3/4), et le fichier ZCROCHETS n'est donc
C      jamais ecrit...
C
C     Revision 3.100 2018/07/31 14:14  dugas
C     Deplacer les appels a GETIO64 dans les routines
C      GETMSET* et GETSET2 hors de la boucle temporelle
C
C     Revision 3.99  2018/04/16 13:13  dugas
C     Tenir compte des TYPVAR utilises par le programme de
C      moyennes temporelles de MFV dans la routine GETSAMPLZ.
C
C     Revision 3.98  2017/11/02 02:02  dugas
C     Tenir compte des differentes signatures d'operations temporelles
C      qui pourraient se retrouver dans le deuxieme caracteres du TYPVAR
C      lors du traitement de la routine GETSAMPLZ. Ces signatures sont
C      fournies via le nouveau module stats_signatures
C
C     Revision 3.97  2016/10/26 15:32  dugas
C     - La variable HEAD passe de 28 a 32
C     - Modifications syntaxiques de type F77 --> F90
C     - Ajouter les arguments RKIND,HIVAL et LOVAL a GETMSET3 qui utilise
C       maintenant GETSAMPLZ pour trouver la taille des echantillons
C     - Ajouter RKIND aux variables traitees par GETHIGH
C     - Ajouter la routine GETHIR pour recuperer des variables reelles
C       dans la section haute de IBUF (HIVAL et LOVAL en ce moment)
C     - Ajouter la routine GETSAMPLZ qui determine la taille des echantillons
C       de moyennes temporelles selon les differents formats supportes
C
C     Revision 3.96  2014/12/03 23:24:37  dugas
C     Enlever les enonces EQUIVALENCE.
C
C     Revision 3.95  2014/10/16 12:08:10  dugas
C     Modifications commandees par la compilation avec GFORTRAN et IFORT.
C
C     Revision 3.94  2014/09/25 18:42:02  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.93  2013/12/10 22:08:45  dugas
C      - Initialiser ENTIER8 dans GETBUF2 pour MACHINE=2.
C      - Et s'assurer que YYYYMMDD et HHMMSSHH le sont aussi.
C
C     Revision 3.92  2013/11/28 21:23:52  dugas
C      - Tenir compte des enregistrement '^>' dans GETBUF2, GETSET2 et GETZX2.
C      - Tenir compte des valeurs manquantes dans GETMSET( ,2,3), GETSET2 et GETZX2 via des appels a MISPAR/SET_MISPAR.
C
C     Revision 3.91  2012/11/15 20:44:23  dugas
C     Corriger le traitement des coupes zonales multi-niveaux dans GETMSET3.
C
C     Revision 3.90  2012/08/03 22:12:38  dugas
C     Renommer les variables GETWRD,GETSWRD a GETWRD0,GETSWRD0.
C
C     Revision 3.89  2011/11/22 18:58:56  dugas
C     La variable TYPE passe de 8 a 12 caracteres dans GETFLD2.
C
C     Revision 3.88  2010/05/21 19:33:33  dugas
C     Verifier la taille des enregistrements de type LABL dans GETSIZ.
C
C     Revision 3.87  2010/02/12 22:39:36  dugas
C     - La routine GETBUF2 convertit les IBUF(2) externes au format DATETIMESTAMP.
C     - GETLEV sauve les niveaux lus et peut ainsi toujours repondre a une requete.
C     - GETMSET3 effectue une meilleure comparaison des niveaux lus en entree.
C     - Ajouter le support des TocToc (!!) dans GETZX2 et GETSET2 et corriger
C       l'ecriture du message d'erreur -1 dans ces routines.
C
C     Revision 3.86  2009/09/08 19:36:04  dugas
C     - Ajouter GETMSET3 (tenant compte des IP3).
C     - Utiliser PRTLAB2 pour les message d'erreurs dans GETMSET/2 et GETSET2.
C     - Corriger le traitement de MAXWRD dans GETSIZ4.
C
C     Revision 3.85  2008/04/28 21:38:53  dugas
C     Corriger l'usage des macros pour r.gppf (passe 2).
C
C     Revision 3.84  2008/04/28 14:23:15  dugas
C     Ne plus tenir compte du cas non-SQ98.
C
C     Revision 3.83  2008/04/25 20:48:58  dugas
C     Simplifier les 'define's dans GETBUF2.
C
C     Revision 3.82  2008/02/18 16:24:24  dugas
C     Corriger les messages d'erreurs de GETSIZ3/4 pour la verticale.
C
C     Revision 3.81  2008/01/15 16:50:47  dugas
C     Appeller SWAPA4 dans GETYP lorsque BIGENDI=0.
C
C     Revision 3.80  2007/12/19 19:28:47  dugas
C     - Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
C     - GETLEV, GETSIZ4 et GETZX2 supportent LEV=IP1 pour les fichiers CMC/RPN.
C     - Utiliser SETKINDI plutot que SETKIND.
C
C     Revision 3.79  2007/09/07 17:37:39  dugas
C     Ajouter un appel a SETKINDI a la sortie de GETSET2.
C
C     Revision 3.78  2006/10/19 22:51:48  dugas
C     Corriger un probleme avec l'initalisation de RETRY et BACKUP dans GETLEV.
C
C     Revision 3.77  2006/09/19 18:13:51  dugas
C     Tenir conpte de ZTYPE dans GETBUF2 et GETLEV.
C
C     Revision 3.76  2006/04/26 16:11:16  dugas
C     Les nombres de bits utilises dans IBUF(19) pour DATYP et DIMSUP2
C      passent de 6 et 13, a 9 et 10, respectivement, dans les routines
C      GETHIGH et PUTHIGH.
C
C     Revision 3.75  2006/02/09 18:20:32  dugas
C     Meilleur traitement des numeros d'unitees I/O.
C
C     Revision 3.74  2005/11/22 18:34:23  dugas
C     Definir IP1 pour les fichier CCCma dans GETSIZ4.
C
C     Revision 3.73  2005/07/28 17:19:30  dugas
C     Modifier le code pour enlever les messages d'avertissement de F90.
C
C     Revision 3.72  2005/07/05 18:37:28  dugas
C     Ajouter du code DEBUG dans les fonctions GETSIZx.
C
C     Revision 3.71  2005/04/12 16:36:00  dugas
C     Ne plus considere les enregistrements caracteres dans GETSIZ4, sauf
C      s'ils sont au debut. Dans ce cas, ils seront les seuls consideres.
C
C     Revision 3.70  2005/03/07 17:25:03  dugas
C     Ajouter EXTERNAL RECGET dans GETMSET et GETMSET2.
C
C     Revision 3.69  2005/02/23 18:58:19  dugas
C     S'assurer que le contenu de retour de IBUF est correct dans GETMSET et GETMSET2.
C
C     Revision 3.68  2005/02/01 20:59:19  dugas
C     Ajouter du code DEBUG dans GETSIZ/2/3/4.
C
C     Revision 3.67  2004/11/08 20:47:42  dugas
C     Ajouter le support des donnees de type CHAR/datyp=3.
C
C     Revision 3.66  2003/12/05 16:02:09  dugas
C     Valeur de retour de IBUF definie seulement lorsque la
C      lecture des niveaux verticaux a ete reussie dans GETSIZ3.
C
C     Revision 3.65  2003/11/26 22:37:56  dugas
C     Corriger la calcul de la valeur de retour de GETSIZ3:
C      Utiliser la nouvelle variable interne MAXLEN.
C
C     Revision 3.64  2003/11/26 17:57:56  dugas
C     Corriger la calcul de la valeur de retour de GETSIZ4:
C      Utiliser la nouvelle variable interne MAXLEN.
C     Corriger la verification des noms/niveaux lorsqu'on
C      cherche a identifier un jeux de donnees.
C
C     Revision 3.63  2003/10/24 21:05:48  dugas
C     Implementer du code compatible RS6000
C
C     Revision 3.62  2003/08/25 18:45:58  dugas
C     GetLev preserve le DATYP original
C
C     Revision 3.61  2003/07/04 01:20:56  dugas
C     Utiliser GETRABT pour definir RECABT.
C
C     Revision 3.60  2003/06/23 14:27:50  dugas
C     Reactiver le traitement de TYP1/2 dans GETFLD2.
C
C     Revision 3.59  2003/05/23 19:47:06  dugas
C     Faire en sorte que la condition "NF < 0" a l'entree de GETLEV
C      force l'usage des donnees qui se trouvent deja dans le tampon
C      de travail IBUF, plutot que d'aller en lire d'autres.
C     Verifier le valeur de VKIND pour determiner le debut d'un
C      nouveau jeux de donnees dans les routines GETSET2 et GETZX2.
C
C     Revision 3.58  2002/12/06 16:29:36  dugas
C     Utiliser le type du niveau initial (tel que rapporte par
C      CONVIP) pour definir l'etendue d'un ensemble de donnees.
C
C     Revision 3.57  2002/09/17 14:57:49  dugas
C     Augmenter la taille minimale rapportee par les fonctions GETSIZ* de 26 a 128.
C     Ne faire la verification de la presence de champs ">>", "^^" ou "HY" que pour
C       les fichiers de type SQ** dans GETSET2 (a des fins de "bypass".
C
C     Revision 3.56  2002/08/20 18:57:13  dugas
C     Ajouter le support  des coordonnees HHYBRIDE/THETA/GALCHEN dans GETLEV.
C     Ajouter IP2 dans HIGHBUF et modifier GETHIGH/GETHIC pour en tenir compte.
C
C     Revision 3.55  2002/04/22 13:34:34  dugas
C     Ajouter le type KIND=4 (Hauterus) dans GETLEV.
C
C     Revision 3.54  2002/01/14 13:44:00  dugas
C     Ajouter le traitement de HY dans GETBUF2 et GETSET2
C     Modifier le format des messages informatifs dasn GETSIZ4
C
C     Revision 3.53  2001/11/20 21:18:31  armnrbd
C     Forcer le type 3 (arbitraire) dans GETZX2 si la routine
C     GETLEV est incapable de lire un enregistrement de type ++.
C
C     Revision 3.52  2001/11/05 13:15:57  armnrbd
C     Tenir compte de l'ETIKET dans la recherche des jeux
C     de variables dans GETMSET2 en mode SINGLZ ou DATA.
C     Modifier le code de verification de l'ETIKET dans GETSET2.
C
C     Revision 3.51  2001/10/23 14:10:44  armnrbd
C      Tenir compte de l'ETIKET dans la recherche des jeux de variables (GETSET2).
C
C     Revision 3.50  2001/10/11 11:17:41  armnrbd
C     Tenir compte des etiquettes dans GETSIZ4 et GETMSET2.
C
C     Revision 3.49  2001/10/03 14:32:00  armnrbd
C     Ne pas faire appel a LVCODE si KIND=0 dans GETLEV.
C
C     Revision 3.48  2001/10/01 21:06:46  armnrbd
C     Ajouter des appels a SETKIND dans GETLEV2 (mode STD RPN).
C
C     Revision 3.47  2001/09/24 14:30:28  armnrbd
C     Tenter de forcer la lecture d'un enregistrement ++ dans GETLEV en mode SQ98.
C
C     Revision 3.46  2001/08/31 11:10:34  armnrbd
C     Ajouter la routine GETMSET2 et la fonction GETSIZ4.
C
C     Revision 3.45  2001/03/22 21:03:42  armnrbd
C     Modifier les valeurs par defauts de LEV dans GETZX2.
C
C     Revision 3.44  2001/02/28 02:03:53  armnrbd
C     Ajouter un mode de fonctionnement simplifie dans GETMSET
C     pour les donnees de type 'DATA' ou lorsque la cle SINGLZ
C     est specifiee.
C     Faire le meme genre de modifications dans GETSET2.
C
C     Revision 3.43  2001/02/27 00:11:34  armnrbd
C     Remplacer les appels a PERROR par des appels a MESSYS.
C
C     Revision 3.42  2001/02/26 22:49:42  armnrbd
C     GETSET2 lit les enregistrements de type DATA un seul a la fois.
C
C     Revision 3.41  2001/02/01 12:12:49  armnrbd
C     Ajouter DIMSUP1 et DIMSUP2 dans GETHIGH.
C
C     Revision 3.40  2000/11/24 12:48:09  armnrbd
C     Ajouter NAME dans la liste des options de GETHIC.
C
C     Revision 3.39  2000/09/28 15:48:43  armnrbd
C     Modifier les sequences d'appel a GETIO64.
C
C     Revision 3.38  2000/08/29 13:06:28  armnrbd
C     Ajouter IP1 dans HIGHBUF, donc modifier GETHIGH,GETHIC.
C     Tenir compte de cette information dans GETLEV.
C
C     Revision 3.37  2000/07/24 20:54:01  armnrbd
C     Sauver IBUF dans IB au debut de GETSET2.
C     Ajouter IP3 dans HIGHBUF (routine GETHIGH/GETHIC).
C
C     Revision 3.36  2000/04/04 16:41:59  armnrbd
C     Corriger une comparaison dans GETBUF2.
C
C     Revision 3.35  2000/03/17 03:15:12  armnrbd
C     Separer les definitions des pointeurs IP et IP8 dans GETLEV.
C
C     Revision 3.34  1999/06/09 23:19:09  armnrbd
C     Ne pas toujours initialiser LEV si GETLEV ne reussit pas.
C
C     Revision 3.33  1999/04/08 19:41:17  armnrbd
C     Utiliser le comdeck MACHTYPE.CDK.
C     Appeller SWAPA4 dans la routine GETBUF2.
C     Ajouter le macro i386 dans GETBUF2.
C
C     Revision 3.32  1999/01/19 20:00:04  armnrbd
C     Separer TYPVAR et GRTYP dans le bloc highbuff.
C
C     Revision 3.31  1998/10/27  16:20:35  armnrbd
C     Ajouter le code de verification pour MAXWRD dans
C     GETSZ2 lorsque la routine est en mode niveaux par niveaux.
C
C     Revision 3.30  1998/10/06  20:34:40  armnrbd
C     Ajouter un appel a Y2KDAT dans GETBUF2.
C
C     Revision 3.29  1998/09/04  17:34:47  armnrbd
C     Ajouter le support de la cle "date" lors de la lecture
C     de la date, pour assurer un format approprie de l'annee.
C
C     Revision 3.28  1998/07/07  14:29:56  armnrbd
C     Allonger le format d'ecriture de IBUF(2).
C
C     Revision 3.27  1998/07/03  20:20:39  armnrbd
C     Faire en sorte que le format de l'annee a toujours 4 chiffres dans GETBUF2.
C
C     Revision 3.26  1998/06/13  02:45:28  armnrbd
C     Ignorer les enregistrements descripteurs de grilles Z dans GETBUF2.
C
C     Revision 3.26  1998/06/12  21:13:19  armnrbd
C     Ignorer les enregistrements descripteurs de grilles Z dans GETBUF2.
C
C     Revision 3.25  1998/06/10  20:13:15  armnrbd
C     Ajouter une dependance sur SQ98 dans GETHIC.
C
C     Revision 3.24  1998/06/08  03:33:18  armnrbd
C      Ajouter les routines GETHIGH et GETHIC.
C     Utiliser ces dernieres pour faire la gestion des codes
C      entreposes dans la section haute de IBUF (NEWL, etc...).
C     Corriger une erreur dans GETSET2 et GETZX2 quand MAXWRD
C      revient de RECGET avec une valeur nulle et qu'il faut
C      l'ignorer.
C
C     Revision 3.23  1998/05/30  04:12:34  armnrbd
C     Corriger une erreur dans GETSET2 (verification de taille).
C
C     Revision 3.22  1998/05/28  19:10:01  armnrbd
C     Plusieurs modifications a GETLEV pour les fichiers standards RPN.
C
C     Revision 3.21  1998/02/19  17:34:59  armnrbd
C     Passer de SQ97 a SQ98.
C
C     Revision 3.20  1998/01/05  15:20:30  armnrbd
C     Corriger le nombre d'enregistrements lus dans GETSIZ
C      dans le cas des grilles de type ZONL a plusieurs niveaux.
C
C     Revision 3.19  1997/12/10  18:06:14  armnrbd
C     Mettre les mots IOHEAD+1 a HEAD a zero apres lecture dans GETBUF2.
C
C     Revision 3.18  1997/10/24  20:33:24  armnrbd
C     Tenir compte d'un changement de resolution pour definir le
C      debut d'un nouveau jeux de donnees.
C     Verifier le statut de MAXPK au retour de RECGET dans GETXZ2.
C
C     Revision 3.17  1997/10/10  20:15:40  armnrbd
C     Implanter le macro taille_entete_io pour GETBUF2.
C
C     Revision 3.16  1997/06/06  17:07:59  armnrbd
C     Augmenter le parametre "donnee_minimale" de 24 a 26 pour tenir compte
C     de l'augmentation de taille des etiquettes produites par CONVERT.
C
C     Revision 3.15  1997/05/27  18:53:19  armnrbd
C     Premiere version compatible avec les fichiers standards 1997.
C
C     Revision 3.14  1997/05/07  18:38:19  armnrbd
C     Forcer IBUF(8) negatifs a la lecture.
C
C     Revision 3.13  1997/04/10  14:04:17  armnrbd
C     Ajouter le support des grilles de type 'Z'. Les routines
C     GETBUF2, GETSET2 et GETZX2 ont ete modifiees.
C
C     Revision 3.12  1997/02/17  03:50:04  armnrbd
C     Ajouter le mode I/O 64 bits.
C
C     Revision 3.11  1996/10/15  17:00:25  armnrbd
C     Ajouter un PRECEDE NR+1 dans la routine GETSIZ3
C
C     Revision 3.10  1996/09/11  01:42:24  armnrbd
C     Supporter un eventail plus large d'EOF dans GETLIGN.
C
C     Revision 3.9  1996/02/29  20:34:36  armnrbd
C     Ajouter du code pour toujours ignorer les LABLs dans GETMSET.
C     Faire la meme chose pour GETSIZ3.
C
C     Revision 3.8  1996/02/29  15:27:49  armnrbd
C     Ajouter un message dans GETMSET dans un cas LABL.
C
C     Revision 3.7  1995/12/06  20:41:14  armnrbd
C     La routine GETMSET ne fait plus d'appels directs a XIT.
C
C     Revision 3.6  1995/06/22  15:37:58  armnrbd
C     Corriger la derniere correction apportee a GETZX2 ...
C
C     Revision 3.5  95/06/07  19:45:46  19:45:46  armnrbd (Bernard Dugas)
C     Les coupes zonales NEWL utilisent IG2 plutot que IG4 (fichiers SQI).
C     
C     Revision 3.4  1995/05/30  19:09:28  armnrbd
C     Corriger pour le support des enregistrements ++ en
C     ce qui concerne les fichiers de type SQI.
C
C     Revision 3.3  1995/04/06  14:24:40  armnrbd
C     Modifier le bloc if de CPP dans GETBUF2.
C
C     Revision 3.2  1995/01/23  10:47:42  armnrbd
C     MOdifier la routine GETLEV pour les fichiers SQI.
C
C     Revision 3.1  94/11/17  14:13:28  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:55:36  13:55:36  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.10  94/05/20  23:49:17  armnrbd
C     Corriger une sortie erronnee dans GETSIZ3(-1).
C     
C     Revision 2.9  94/05/09  10:51:26  armnrbd
C     Implanter MINREC dans les differents GETSIZx.
C     
C     Revision 2.8  94/04/05  21:31:00  armnrbd
C     Mieux verifier le nombre de niveaux dans GETSIZ3.
C     
C     Revision 2.7  94/03/31  15:46:33  armnrbd
C     1) Ajouter GETSIZ3 et GETMSET.
C     2) Tenir compte de changements de pas de temps dans GETSET2.
C     
C     Revision 2.6  94/02/18  14:44:10  armnrbd
C     Modifier la declaration EXTERNAL de la routine GETLEV.
C     
C     Revision 2.5  94/02/18  14:35:59  14:35:59  armnrbd (Bernard Dugas)
C     Proteger GETLEV si l'enregistrement ++ est manquant.
C     
C     Revision 2.4  94/01/12  11:23:16  armnrbd
C     Mettre du code de verification de compilation dans GETBUF2.
C     
C     Revision 2.3  94/01/08  22:25:01  armnrbd
C     Passer LEV par LVCODE dans la routine GETLEV.
C     
C     Revision 2.2  93/12/23  16:21:15  armnrbd
C     La modification precedente ne doit s'appliquer 
C     que pour les machines de type HP.
C     
C     Revision 2.1  93/11/19  14:32:30  armnrbd
C     Faire un BACKSPACE dans GETBUF2 si on atteint un EOF.
C     
C     Revision 2.0  93/10/13  13:31:46  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.17  93/06/10  13:48:09  armnrbd
C     Allouer NLEV mots dans GETLEV plutot que MAXLEV pour G.
C     
C     Revision 1.16  93/02/22  20:20:49  armnrbd
C     Modifier le traitement ded MAXWRD dans GETSIZ2 et GETSET2.
C     
C     Revision 1.15  93/02/21  21:39:22  armnrbd
C     Suite de la correction precedente.
C     
C     Revision 1.14  93/02/21  21:08:03  armnrbd
C     Modifier le comportement de GETSET2 si la variable logique REC est .F.
C     
C     Revision 1.13  93/01/14  22:41:12  armnrbd
C     Suite de la correction precedente.
C     
C     Revision 1.12  93/01/14  14:41:01  armnrbd
C     GETSET2 connaitra desormais INFO, MAXWRD et RECABT.
C     
C     Revision 1.11  92/11/21  13:44:06  armnrbd
C     Modifier la routine FIND pour tenir compte de PKTYP.
C     Modifier GETSIZ et GETSIZ2 pour s'assurer des valeurs
C          de retour en cas d'erreur de lecture.
C     
C     Revision 1.10  92/11/19  16:01:58  armnrbd
C     Remplacer PRECEDE( NF ) par PRECEDE( NF,NLEV ).
C     
C     Revision 1.9  92/11/12  13:58:08  armnrbd
C     Troisieme iteration PKTYP.
C     
C     Revision 1.8  92/11/11  12:29:18  armnrbd
C     Deuxieme iteration de l'implantation de PKTYP.
C     
C     Revision 1.7  92/11/03  10:56:42  armnrbd
C     Traitement de fichier vide dans GETYP.
C     
C     Revision 1.6  92/11/02  21:53:46  armnrbd
C     BugFix a la routine GETYP.
C     
C     Revision 1.5  92/11/02  21:46:27  armnrbd
C     Implanter l'appel a GETYP.
C     Implanter GETYP.
C     
C     Revision 1.4  92/10/30  09:46:13  armnrbd
C     Allouer plus de memoire a G dans GETLEV.
C     
C     Revision 1.3  92/10/28  17:11:44  armnrbd
C     Deuxieme passe de PK92.
C     
C     Revision 1.2  92/10/28  13:45:26  armnrbd
C     Premier jeux de modification pour l'implantation du PK92.
C     
C     Revision 1.1  92/03/20  18:49:01  armnrbd
C     Ajouter la routine FIND.
C     
C     Revision 1.0  92/02/21  11:33:12  armnrbd
C     Initial revision
C     

      SUBROUTINE FIND(NF,KIND,NT,NAME,LEV,OK)
 
***    MAY 27/83 - R.LAPRISE.

***    FILE NF IS POSITIONED SO THAT THE NEXT FIELD READ
***    WILL HAVE THE FIRST FOUR WORDS OF ITS LABEL EQUAL
***    TO  KIND,NT,NAME,LEV.  THE CORRESPONDING TEST IS 
***    OMITTED FOR ANY OF THEM SET TO -1 FOR INTEGERS OR
***    BLANK FOR CHARACTERS. OK RETURNS AS FALSE IF THE
***    REQUESTED LABEL IS NOT FOUND. NOTE THAT THE FILE
***    IS NOT REWOUND AT ANY TIME.

      IMPLICIT      none

      INTEGER,      PARAMETER :: HEAD = taille_entete

      LOGICAL       OK,ERROR
      CHARACTER(4)  TYPE,NOM
      CHARACTER*(*) NAME,KIND
      INTEGER       IB(HEAD),NF,NT,LEV
      INTEGER       ITYPE,INOM

      INTEGER,      SAVE :: INEXT = 0
      CHARACTER(4), SAVE ::  NEXT = 'NEXT'

      CHARACTER(4), EXTERNAL :: SETNAM
      EXTERNAL      SUIVANT,PRECEDE,LEADBLK

*--------------------------------------------------------------------
      OK    = .FALSE. ; IF (INEXT == 0) READ(NEXT,'(A4)') INEXT

***    REMOVE ANY LEADING BLANKS.

      NOM  = NAME(1:LEN( NAME ))
      TYPE = KIND(1:LEN( KIND ))

      IF (NOM .EQ.'NEXT') INOM = INEXT
      IF (NOM .EQ.'NEXT')  NOM = ' '

      IF (NOM .NE.'    ') CALL LEADBLK( NOM  )
      IF (TYPE.NE.'    ') CALL LEADBLK( TYPE )
      IF (NOM .NE.'    ') NOM = SETNAM( NF,NOM )

                         READ( TYPE,4 ) ITYPE
      IF (INOM.NE.INEXT) READ( NOM ,4 ) INOM 

  150 CALL SUIVANT( NF, IB,ERROR, OK )

      IF (ERROR .OR. .NOT.OK)                      GOTO 250

          IF (TYPE.NE. '    '.AND. ITYPE.NE.IB(1)) GOTO 150
          IF (NOM .NE. '    '.AND. INOM .NE.INEXT
     +                       .AND. INOM .NE.IB(3)) GOTO 150
          IF (  NT.NE.    -1 .AND.    NT.NE.IB(2)) GOTO 150
          IF ( LEV.NE.    -1 .AND.   LEV.NE.IB(4)) GOTO 150

          CALL PRECEDE( NF,1 )

          OK=.TRUE.

  250 RETURN
*---------------------------------------------------------------------

    4 FORMAT(A4)

      END
      SUBROUTINE getbuf2 (NFL,IBUF,LEN,OK)

***    MARS 27/90 - B.DUGAS

***    CETTE ROUTINE LIT LE PROCHAIN TAMPON D'INFORMATION SUR NFL.

      use DIAG_TOC, only: LirTOC

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete
      INTEGER,    PARAMETER :: IOHEAD = taille_entete_io

      LOGICAL     OK
      INTEGER     NFL,LEN,IBUF(LEN),NF,IO,
     +            I,LENGTH,IOLEN,IOSHFT,
     +            NBR_TOC,NI,NJ,NK,ERR

      CHARACTER*8 TYPE
      CHARACTER*4 PKTYP,GETYP, KIND,NAME

#     include    "machtype.cdk"
#     include    "zlabel.cdk"

      logical              info,debug
      common     /zzverbo/ info
      common     /zzdebug/      debug

      INTEGER     CLE,KLE
      REAL        XG1,XG2,XG3,XG4

      INTEGER,    EXTERNAL :: Y2KDAT, FSTINFX, newdate
      INTEGER(8), EXTERNAL :: Y2KDAT8
      EXTERNAL    PRECLE,CLESUI,LIRPT,
     +            LEADBLK,MESSYS,READF,PUTHIC,
     +            GETYP, IBUFILL,GETXGI

*     used for date calculation (newdate)
      integer(8) :: DATE_CONVERSION_FACTOR
      integer(8), save :: D8=1 00 00 00 00
      integer(8), save :: MinDat8=30 01 01 00 
      integer(8), save :: bit33=X'100000000' ! = 1 0000 0000
      integer(8) :: YYYYMMDD8, HHMMSSHH8, ENTIER8, date64
      integer    :: YYYYMMDD , HHMMSSHH , ENTIER,  NPAS

      pointer     ( IEN4,ENTIER(2))

      CHARACTER(LEN=4), SAVE :: NEWL='NEWL'
      CHARACTER(LEN=4)       :: IBUF4

*---------------------------------------------------------------------
      IEN4 = LOC( ENTIER8 ) !!!  equivalence ( ENTIER8  , ENTIER )

      NF     =  ABS( NFL )
      OK     = .FALSE.
      IO     =  00

      LENGTH =   HEAD/(MOD( MACHINE,2 )+1)
      IOLEN  = IOHEAD/(MOD( MACHINE,2 )+1)
      IOSHFT =   HEAD-IOHEAD

      IF (IOSHFT.LT.0) CALL                          XIT(' Getbuf2',-1 )

      PKTYP  = GETYP( NF )

***    CHECK MINIMUM LENGTH FOR LEN.

      IF (PKTYP.EQ.'    ' .AND. LEN.NE.LENGTH)                 THEN
          IF (INFO) WRITE(6,6001) LEN,LENGTH
          RETURN
      END IF
      IF (PKTYP.EQ.'PK84' .AND. LEN.LT.LENGTH)                 THEN
          IF (INFO) WRITE(6,6002) LEN,LENGTH
          RETURN
      END IF

      IF (PKTYP.EQ.'SQ89' .OR. PKTYP.EQ.'SQ98')                THEN

          CALL PRECLE( NF,CLE,0 )
  050     ERR = FSTINFX( CLE, NF, NI,NJ,NK,
     +                   -1,ZLABEL(1:12),-1,-1,-1,ZTYPE,ZNAME(1:4) )

          KLE = ERR
          IF (ERR.GE.0) CALL IBUFILL( NF, IBUF,ERR,OK )
          IF (ERR.LT.0 .OR. .NOT.OK)                           THEN
              OK = .FALSE.
              RETURN
          END IF

          WRITE( NAME,4 ) IBUF(3)

          IF (NAME.EQ.'HY') CALL LIRPT( NF )
          IF (NAME.EQ.'!!') CALL LirTOC( NF,NBR_TOC )
          IF (NAME.EQ.'>>' .OR.
     +        NAME.EQ.'^^' .OR.
     +        NAME.EQ.'^>' .OR.
     +        NAME.EQ.'!!' .OR.
     +        NAME.EQ.'HY' )                                   THEN
              CLE = ERR
              GOTO 050
          END IF

***        ACCOUNT FOR NEWL '++' RECORDS
***        (BD: old fashion, we now use IP1=32767).

          WRITE( KIND,4 ) IBUF(1)
          CALL GETXGI( XG1,XG2,XG3,XG4 )

          IF (KIND.EQ.'ZONL' .AND. INT( XG2 ).EQ.NK)
     +    CALL PUTHIC(  NEWL,NEWL,IBUF )

          CALL PUTHIC( PKTYP,'PKTYP',IBUF )

***        SHOULD WE UPDATE THE CURRENT KEY COUNTER ?
***        NOTE THAT "ERR.NE.KLE" MEANS THAT SAVZREF
***        HAS BEEN CALLED BY IBUFILL.

          IF (ERR.NE.KLE .AND. NFL.LT.0)                       THEN
              CALL PRECLE( NF,KLE,1 )
          ELSE IF (ERR.EQ.KLE .AND. NFL.GT.0)                  THEN
              CALL CLESUI( NF,ERR )
          END IF

      ELSE

          IF (PKTYP.EQ.'    ' .OR.
     +        PKTYP.EQ.'PK84' )                                THEN 

***            LIRE LE TAMPON D'UN SEUL COUP.

              CALL READF( NF, IBUF, LEN -(LENGTH-IOLEN), OK )
              IF (.NOT.OK) GOTO 101

          ELSE

***            TYPE DE COMPACTION NON-SUPPORTE.

              CALL                                 XIT(' Getbuf2',-2 )

          END IF

          YYYYMMDD = 0 ; HHMMSSHH = 0 ; NPAS = -1
          call GET_DCF( DATE_CONVERSION_FACTOR )

          IF (MACHINE.EQ.2)                                    THEN

***            LE TAMPON D'INFORMATION PASSE
***            DE 64 BITS/MOT A 32 BITS/MOT.

              ENTIER8 = 0 ; ENTIER(1)  = IBUF(4)

              if (BIGENDI == 1)
     +        ENTIER8 = ishft( ENTIER8,-32 )

              date64  = IBUF(3)*bit33+ENTIER8

              if (DATE_CONVERSION_FACTOR > 0_8)                THEN

***               Date selon le format dicte par DATE_CONVERSION_FACTOR
                  date64  = Y2KDAT8( date64 )

                  IF (date64 >= (MinDat8 * 1 00 00 00)
     +                /DATE_CONVERSION_FACTOR) THEN

                      YYYYMMDD8=   (DATE_CONVERSION_FACTOR*date64)/D8  
                      HHMMSShh8=MOD((DATE_CONVERSION_FACTOR*date64),D8)
                      YYYYMMDD = YYYYMMDD8 ; HHMMSShh = HHMMSShh8

                  ELSE

***                   Pas de temps (esperons-le !).
                      IBUF(2) = ENTIER8 ; NPAS = ENTIER8
                      YYYYMMDD = 0 ; HHMMSSHH = 0

                  END IF

              else if (DATE_CONVERSION_FACTOR == 0_8)          THEN

                  IF (date64 > 9999 12 31 23_8)                THEN

***                   Date en format YYYYMMDD HHMMSSHH
                      YYYYMMDD8 = date64 / 1 00 00 00 00
                      HHMMSSHH8 = date64 - YYYYMMDD8 * 1 00 00 00 00
                      HHMMSSHH  = HHMMSSHH8 ; YYYYMMDD  = YYYYMMDD8

                  ELSE IF (date64 >= MinDat8)                  THEN

***                   Date en format YYYYMMDD HH
                      date64    = Y2KDAT8( date64 )
                      YYYYMMDD  = date64 / 100_8
                      HHMMSSHH  = mod( date64,100_8 ) * 1 00 00 00

                  ELSE

***                   Pas de temps (???).
                      IBUF(2) = ENTIER8 ; NPAS = ENTIER8
                      YYYYMMDD = 0 ; HHMMSSHH = 0

                  END IF

              else

***               Pas de temps (!!!).
                  IBUF(2) = ENTIER8 ; NPAS = ENTIER8
                  YYYYMMDD = 0 ; HHMMSSHH = 0

              end if

              IF (YYYYMMDD /=0 .or. HHMMSSHH /= 0)             THEN
***               Sauf erreur, IBUF(2) contiendra un "DATE-TIME STAMP"
                  err = newdate( IBUF(2), YYYYMMDD,HHMMSSHH, +3 )
                  IF (err /= 0) IBUF(2) = IBUF(4)
              ELSE
                  err = 0
              END IF

              IBUF(3) = IBUF(5)
              IBUF(4) = IBUF(8)
              IBUF(5) = IBUF(10)
              IBUF(6) = IBUF(12)
              IBUF(7) = IBUF(14)
              IBUF(8) = IBUF(16)

              WRITE( KIND,4 ) IBUF(1)
              WRITE( NAME,4 ) IBUF(3)

              IF (BIGENDI.EQ.0)                                THEN
                  CALL SWAPA4( KIND )
                  CALL SWAPA4( NAME )
              END IF

          ELSE IF (MACHINE.EQ.1)                               THEN

              WRITE(TYPE, '( A8)') IBUF(1)
              WRITE(NAME,     4  ) IBUF(3)
              READ( TYPE, '(2A4)') KIND,PKTYP

              ENTIER8 = IBUF(2)

              if (DATE_CONVERSION_FACTOR > 0_8)                THEN

***               Date selon le format dicte par DATE_CONVERSION_FACTOR
                  date64    = Y2KDAT8( ENTIER8 )

                   IF (date64 >= (MinDat8 * 1 00 00 00)
     +                 /DATE_CONVERSION_FACTOR) THEN

                       YYYYMMDD=    (DATE_CONVERSION_FACTOR*date64)/D8  
                       HHMMSShh=MOD((DATE_CONVERSION_FACTOR*date64),D8)

                   ELSE

***                    Pas de temps (espereons-le !).
                       NPAS = IBUF(2) ; YYYYMMDD = 0 ; HHMMSSHH = 0

                   END IF

              else if (DATE_CONVERSION_FACTOR == 0_8)          THEN

                  if (ENTIER8 > 9999 12 31 23_8)               THEN

***                    On suppose que IBUF(2) contient une date
***                    en format YYYYMMDD HHMMSSHH

                      YYYYMMDD = IBUF(2) / 1 00 00 00 00
                      HHMMSSHH = IBUF(2) - YYYYMMDD * 1 00 00 00 00

                  else if (IBUF(2) >= 30 01 01 00)             THEN

***                    On suppose que IBUF(2) contient une date
***                    en format YYYYMMDD HH

                      IBUF(2)  = Y2KDAT8( ENTIER8 )
                      YYYYMMDD =      IBUF(2) / 1 00
                      HHMMSSHH = MOD( IBUF(2) , 1 00 ) * 1 00 00 00

                  else

***                   Pas de temps (???).
                      NPAS = IBUF(2) ; YYYYMMDD = 0 ; HHMMSSHH = 0

                  end if

              else

***               Pas de temps (!!!).
                  NPAS = IBUF(2) ; YYYYMMDD = 0 ; HHMMSSHH = 0

              end if

              IF (YYYYMMDD /=0 .or. HHMMSSHH /= 0)             THEN
                  err = newdate( IBUF(2), YYYYMMDD,HHMMSSHH, +3 )
                  IF (err /= 0) IBUF(2) = ENTIER(1)
              ELSE
                  err = 0
              END IF

          END IF

!!!       If (DEBUG) write(6,6100) err,IBUF(2),YYYYMMDD,
!!!  +               HHMMSSHH,DATE_CONVERSION_FACTOR

***        TENIR COMPTE DE LA DIFFERENCE ENTRE HEAD ET IOHEAD.

          IF (IOSHFT .GT.  0   .AND.
     +        LENGTH .LT. LEN  )                               THEN
              DO  I=LEN,LENGTH+1,-1
                  IBUF(I) = IBUF(I-IOSHFT)
              END DO
              DO  I=IOHEAD+1,HEAD
                  IBUF(I) = 0
              END DO
          END IF

***        SAUVEGARDER L'INDICATEUR NEWL.

          WRITE(IBUF4,4) IBUF(4)

          IF (BIGENDI.EQ.0) CALL SWAPA4( IBUF4 )

          IF (IBUF4.NE.NEWL)                                   THEN
              IBUF4   = ' '
          ELSE
              IBUF(4) = 0
          END IF

          CALL PUTHIC( IBUF4,'NEWL',IBUF )

***        GARDER UNE COPIE DE PKTYP DANS IBUF.

          CALL PUTHIC( PKTYP,'PKTYP',IBUF )

***        GARDER UNE COPIE DE ENTIER64 DANS IBUF LORSQU'ON
***        PENSE AVOIR TRAITE UN PAS-DE-TEMPS.

          IF (NPAS >= 0) CALL PUTHIGH( NPAS,'NPAS',IBUF )

***        POSSIBLY REMOVE LEADING BLANKS FROM KIND AND
***        NAME. PUT THE RESULT IN IBUF(1) AND IBUF(3).

          CALL LEADBLK( KIND )
          CALL LEADBLK( NAME )

          READ( KIND,4 ) IBUF(1)
          READ( NAME,4 ) IBUF(3)

***        SHOULD WE BACKSPACE?

          IF (NFL.LT.0)
     +        BACKSPACE( NF ,ERR=100,IOSTAT=IO )

      END IF

***    MAKE SURE THAT IBUF(8) ONLY CONTAINS A NEGATIVE NUMBER:
***    1) POSSIBLY RESTORE NEGATIVE VALUES OF PACKING VARIABLE;
***    2) TRANSLATE POSITIVE VALUES TO THEIR BIT NUMBER EQUIVALENT.

      IF (IBUF(8).GT.4096)                                     THEN
          IBUF(8) = 4096-IBUF(8)
      ELSE IF (IBUF(8).GE.0)                                   THEN
          IF (IBUF(8).EQ.0)
     +        IBUF(8) =  1
          IF (PKTYP  .EQ.'    '.OR.
     +        PKTYP  .EQ.'PK92'.OR.
     +        MACHINE.EQ. 1   )                                THEN
              IBUF(8) = -64/IBUF(8)
          ELSE
              IBUF(8) = -32/IBUF(8)
          END IF
      END IF

***    
      OK = .TRUE.

***    BRANCHEMENT DE FIN DE FICHIER OU DE TRAITEMENT D'ERREUR.

  100 IF (IO.NE.0)                                             THEN
          IF (INFO) WRITE(6,6000) NF,IO
          IF (IO.GT.0) CALL MESSYS( 'In Getbuf2...' )
      END IF

  101 IF (.NOT.(OK .OR. PKTYP.EQ.'SQ89'
     +             .OR. PKTYP.EQ.'SQ98'))
     +    BACKSPACE( NF ,ERR=102,IOSTAT=IO )

  102 RETURN
*---------------------------------------------------------------------
    4 FORMAT(A4)

 6000 FORMAT('   Getbuf2 on unit ',I3,' returns I/O error number ',I5)
 6001 FORMAT('   Getbuf2: requested ',I2,' words; should be ',
     +           I2,' words.')
 6002 FORMAT('   Getbuf2: requested ',I2,' words; minimum size is ',
     +           I2,' words.')
 6100 Format('*DEBUG:Getbuf2  Err,IBUF(2),P1,P2,DCF= ',5I13)

      END

      SUBROUTINE getfld2 (NF,G,KIND,STEP,NAME,LEVEL,IBUF,MAXPK,OK)

***    JAN 15/80 - J.D.HENDERSON.

***    SCANS FILE NF FOR A RECORD WHOSE FIRST FOUR LABEL WORDS ARE...
***     1) KIND = 4 CHARACTER FIELD TYPE ('SPEC','GRID',ETC).
***     2) STEP = TIMESTEP NUMBER.
***     3) NAME = 4 CHARACTER NAME.
***     4) LEVEL = LEVEL NUMBER.

***    THEY ARE NOT CHECKED IF THEY ARE SET TO -1. ORDER OF PRIORITY
***    IN THAT CASE IS KIND, NAME, NSTEP, LEVEL. UPON RETURNING IBUF 
***    CONTAINS THE 8 WORD LABEL FOLLOWED BY THE DATA  (WHICH MAY BE 
***    PACKED). G CONTAINS THE UNPACKED FIELD.

      IMPLICIT      none

      INTEGER,      PARAMETER :: HEAD = taille_entete

      LOGICAL       OK
      CHARACTER*(*) KIND,NAME
      CHARACTER     TYPE*12,NOM*4
CCC   CHARACTER*4   TYPE,NOM
      INTEGER       NF,STEP,LEVEL,MAXPK,IBUF(*)
      REAL          G(*)
      REAL*8        G8(*)

      EXTERNAL      RECGET,RECUP2

*---------------------------------------------------------------------
***    FIRST GET THE RECORD FROM FILE NF.

      TYPE = KIND(1:LEN( KIND ))
      NOM  = NAME(1:LEN( NAME ))

      CALL RECGET( NF, TYPE,STEP,NOM,LEVEL, IBUF,MAXPK,OK )
      IF (.NOT.OK) RETURN

***    UNPACK THE DATA INTO ARRAY G.

      CALL RECUP2( G, IBUF )

      RETURN

*----------------------------------------------------------------------
      ENTRY getfld28 (NF,G8,KIND,STEP,NAME,LEVEL,IBUF,MAXPK,OK)

***    FIRST GET THE RECORD FROM FILE NF.

      TYPE = KIND(1:LEN( KIND ))
      NOM  = NAME(1:LEN( NAME ))

      CALL RECGET( NF, TYPE,STEP,NOM,LEVEL, IBUF,MAXPK,OK )
      IF (.NOT.OK) RETURN

***    UNPACK THE DATA INTO ARRAY G8.

      CALL RECUP2( G8, IBUF )

      RETURN
*----------------------------------------------------------------------

      END 

      SUBROUTINE getlev (NF, LEV,NLEV, IBUF,OK)

***    FEV 12/91 - B. Dugas, RPN.

***    Getlev tente d'extraire l'information sur les niveaux associes
***    a une coupe en section a plusieurs niveaux verticaux. Elle si-
***    gnale son succes en retournant OK=vrai.

      IMPLICIT     none

      INTEGER,     PARAMETER :: MAXLEV = 999 , HEAD = taille_entete

      LOGICAL      OK
      INTEGER      NF,NLEV,LEV(NLEV),IBUF(*)

      INTEGER               INFMOT(0:unite_io_maximale)
      COMMON      /LIRZXL/  INFMOT

      LOGICAL               INFO, IO64B
      COMMON      /ZZVERBO/ INFO

#     include     "machtype.cdk"

***    Variables locales.

      LOGICAL      GETOK
      REAL         PR1,PR2
      REAL*8       PR8(NLEV),PRHOLD
      INTEGER      KIND, ANF, DATYP, J,L, IER, IP1(MAXLEV),
     +             LEN,NWDS,NPACK,JBUF(HEAD), LON
      CHARACTER*4  NOM,TYPE,PKTYP

      REAL             PR
      POINTER    ( IP, PR(1) )

      CHARACTER(4),EXTERNAL :: GETYP
      INTEGER,     EXTERNAL :: GETHIGH,GETPARI
      LOGICAL,     EXTERNAL :: GETIO64,SETIO64
      EXTERNAL     GETBUF2,READF,PRECEDE,LVCODE,
     +             SKIPREC,CONVPR,PUTPARI,ISMOV

***    VARIABLES UTILISEES DANS LA TENTATIVE DE
***    RECHERCHE FORCEE D'UN ENREGISTREMENT ++.

#     include     "zlabel.cdk"

      Integer, Dimension(:),Allocatable, Save :: levels
      Integer, Save :: number = -1

      INTEGER      CLE
      LOGICAL      RETRY,BACKUP
      CHARACTER    HLABEL*80,HNAME*10,HTYPE*2
      EXTERNAL     PRECLE,CLESUI
*---------------------------------------------------------------------

      If (Allocated( levels ) .and. number == NLEV)            Then
          OK = .true. ; INFMOT(NF) = NLEV
          LEV(1:NLEV) = levels(1:NLEV)
          Return
      End If

      RETRY  = .TRUE. 
      BACKUP = .FALSE.
      OK     = .FALSE.
      KIND   = -1

      ANF   = NF
      IF (NF.LT.0)
     +ANF   = ABS( NF )
      PKTYP = GETYP( ANF )

      IF (PKTYP(1:2).NE.'SQ') KIND = 2

      IF (NF.LT.0) GOTO 200

***    RE-INITIALISER (TEMPORAIREMENT) LE COMDECK ZLABEL.

      HLABEL = ZLABEL
      HNAME  = ZNAME
      HTYPE  = ZTYPE

      ZLABEL = ' '
      ZNAME  = ' '
      ZTYPE  = ' '

***    COPIE DE TRAVAIL DE IBUF ET DE LA VALEUR DE DATYP.

      DO  J=1,HEAD
          JBUF(J) = IBUF(J)
      END DO

      DATYP = GETPARI( 'DATYP' )

***    DETEMINER LA LONGUEUR DES DONNEES. ON SUPPOSE QUE L'ON A
***    UNE SEULE COLONNE D'INFORMATION SUPPLEMENTAIRE.

***    LIRE L'ENTETE.

  100 CALL GETBUF2( -NF, IBUF,HEAD, GETOK )

      IF (.NOT.GETOK)                                          THEN
          ZLABEL = HLABEL
          ZNAME  = HNAME
          ZTYPE  = HTYPE
          IF (BACKUP .AND. PKTYP(1:2).EQ.'SQ')                 THEN
              CALL PRECLE( ANF,IER,1 )
              IF (INFO .AND. IER.NE.CLE)
     +        WRITE(6,6001)
          END IF
          RETURN
      END IF

***    SAUVER LE NOM ET LE TYPE.

  200 WRITE(NOM,4)  IBUF(3)
      WRITE(TYPE,4) IBUF(1)

C     IF (TYPE.EQ.'LABL' .AND. NOM.EQ.'INFO')                  THEN
C         CALL GETBUF2( ANF, IBUF,HEAD, GETOK )
C         GOTO 100
C     END IF

***    EST-CE BIEN UN TAMPON D'INFORMATION COLONNE?

      IF (NOM .EQ.'++' .AND.  TYPE.EQ.'ZONL')                  THEN

***        CONTINUER LA VERIFICATION.

          CALL LBLCHK( LEN, NWDS,NPACK,IBUF )

          IF (NLEV.EQ.NWDS)                                    THEN

***            LA VRAIE LONGUEUR SE TROUVE DANS IBUF.

              LEN = GETHIGH('LEN',IBUF )
              LON = HEAD/(MOD( MACHINE,2 )+1)

***            LIRE LA FIN DE CET ENTREGISTREMENT.

              IF (NF.GT.0)                                     THEN

                  IF (PKTYP.EQ.' ')                            THEN

                      CALL SKIPREC( NF, 1, GETOK )
                      IF (GETOK) 
     +                CALL READF( NF, IBUF(HEAD+1),LEN-LON, GETOK )

                  ELSE IF (PKTYP.EQ.'PK84')                    THEN

                      CALL GETBUF2( NF, IBUF,LEN, GETOK )

                  ELSE IF (PKTYP(1:2).EQ.'SQ')                 THEN

                      CALL READSTD( NF, IBUF,NWDS+HEAD, GETOK )

                  END IF

              ELSE

                  GETOK = .TRUE.

              END IF
              IF (GETOK)                                       THEN

                  IP = LOC( PR8(1) )

                  OK = .TRUE.

                  IO64B = GETIO64( IO64B )

                  IF (NF.GT.0)                                 THEN

***                    DECOMPACTER.

                      IF (PKTYP.EQ.'SQ98') GETOK = SETIO64( .TRUE. )
                      CALL RECUP2( PR,IBUF )
                      IF (PKTYP.EQ.'SQ98') GETOK = SETIO64( IO64B )

                      IF (.NOT.IO64B .AND. PKTYP.NE.'SQ98')    THEN
                          DO  L=NLEV,1,-1
                              PR8(L) = PR(L)
                          END DO
                      END IF

                  ELSE IF (IO64B)                              THEN

                      CALL ISMOV( LEV,PR8,NLEV*MACHINE )

                  ELSE IF (PKTYP.EQ.'SQ98')                    THEN

                      OK = .FALSE.
                      RETURN

                  ELSE

                      CALL ISMOV( LEV,PR,NLEV )
                      DO  L=NLEV,1,-1
                          PR8(L) = PR(L)
                      END DO
                      
                  END IF

***                L'INFORMATION NIVEAU EST DE BAS
***                EN HAUT ET EN FORMAT REEL LOG10.

                  DO L=1,(NLEV+1)/2

                      IF (PKTYP(1:2).EQ.'SQ')                  THEN

                          IF (PKTYP.EQ.'SQ89')                 THEN
                              LEV( L ) = NINT( 10**( PR8(NLEV-L+1) ) )
                          ELSE
                              LEV( L ) = NINT( PR8(NLEV-L+1) )
                          END IF

                          IF (PKTYP.EQ.'SQ89')                 THEN
                              LEV( NLEV-L+1 ) = NINT( 10**( PR8(L) ) )
                          ELSE
                              LEV( NLEV-L+1 ) = NINT( PR8(L) )
                          END IF

                      ELSE

                          PRHOLD        = 10**( PR8(NLEV-L+1)-3.0 )
                          PR8(NLEV-L+1) = 10**( PR8(     L  )-3.0 )
                          PR8(     L  ) = PRHOLD

                      END IF

                  END DO

                  IF (PKTYP(1:2).EQ.'SQ')                      THEN

***                    DEFINIR VKIND.

                      CALL CONVPR( LEV(1), PR1, KIND, -1 )
                      CALL PUTPARI('IP1',LEV )

                      IF (KIND.EQ.0)                           THEN
                          CALL SETKIND( 'HAUTEUR' )
                      ELSE IF (KIND.EQ.1)                      THEN
                          CALL SETKIND( 'ETA' )
                      ELSE IF (KIND.EQ.2)                      THEN
                          CALL SETKIND( 'PRESSION' )
                      ELSE IF (KIND.EQ.3)                      THEN
                          CALL SETKIND( 'ARBITRAIRE' )
                      ELSE IF (KIND.EQ.4)                      THEN
                          CALL SETKIND( 'HAUTEURS')   
                      ELSE IF (KIND.EQ.5)                      THEN
                          CALL SETKIND( 'HYBRIDE')    
                      ELSE IF (KIND.EQ.6)                      THEN
                          CALL SETKIND( 'THETA')      
                      ELSE IF (KIND.EQ.21)                     THEN
                          CALL SETKIND( 'GALCHEN')    
                      END IF
 
                  ELSE

                      DO  L=1,NLEV
                          PR(L) = PR8(L)
                      END DO

                      CALL LVCODE( LEV,PR,NLEV ) 

                  END IF

***                MODIFIER INFMOT (I.E. SIGNIFIER QUE
***                GETLEV A DEJA ETE APPELLE AVEC SUCCES).

                  INFMOT(ANF) = NLEV

              END IF

          END IF

      ELSE IF (NF.LT.0)                                        THEN

          OK = .FALSE.
          RETURN

      ELSE IF (TYPE.EQ.'ZONL' .AND. RETRY)                     THEN

          RETRY  = .FALSE.
          BACKUP = .TRUE.

***       TENTER DE TROUVER UN ENREGISTRTTEMENT '++' MALGRE TOUT.

         IF (PKTYP(1:2).EQ.'SQ')                               THEN

             ZNAME  = '++'

***           TEMPORAIREMENT REMETTRE LE POINTEUR DE POSITION
***           DU FICHIER ANF A ZERO POUR UNE NOUVELLE RECHERCHE.
***           CONSERVER LA POSITION COURANTE DANS "CLE".

             IER = 0
             CALL PRECLE( ANF, CLE , 0 )
             CALL CLESUI( ANF, IER )
             GOTO 100

         END IF

      ELSE IF (INFO)                                           THEN

          WRITE(6,6000) (JBUF(J),J=1,7)

      END IF

***    Sauver LEV et NLEV dans levels et number.

      If (.not. allocated( levels ))                           Then
          number = NLEV
          allocate( levels(number) )
          levels(1:number) = LEV(1:number)
      End If

      IF (NF.LT.0) RETURN

      ZLABEL = HLABEL
      ZNAME  = HNAME
      ZTYPE  = HTYPE

      IF (BACKUP .AND. PKTYP(1:2).EQ.'SQ')                     THEN

          OK = .FALSE.

***        RESTAURER LE POINTEUR DE POSITION DU FICHIER ANF
***        ET VERIFIER QUE L'OPERATION A BIEN FONCTIONNER.

          CALL PRECLE( ANF,IER,2 )
          IF (INFO .AND. IER.NE.CLE)
     +    WRITE(6,6001)
      END IF

***    RESTAURER LES HEAD PREMIERS MOTS DE IBUF ET LA VALEUR DE DATYP.

      DO  J=1,HEAD
          IBUF(J) = JBUF(J)
      END DO

      CALL PUTPARI( 'DATYP',DATYP )

      RETURN

*--------------------------------------------------------------------------
    4 FORMAT(A4)
 6000 FORMAT(' Getlev: Looking for ++.'/
     +       '         Found ',A4,I12,1X,A4,3I6,I8)
 6001 FORMAT(' Getlev: Positionning problem encountered',
     +       ' while looking for vertical level information.')

      END

      SUBROUTINE getlign (NF,LIGNE,LEN,OK)

***    FEV 18/91 - B.DUGAS (LIGNES PLUS LONGUES QUE 80 CARACTERES)
***    JAN 17/91 - B.DUGAS

***    CETTE ROUTINE LIT UNE LIGNE DE LEN CARACTERES (FORMATTES)
***    SUR L'UNITE D'E/S NF.  ELLE VERIFIE AUSSI LA PRESENCE D'UNE
***    DES CHAINES "EOF ", "EOI " OU "EOR " EN COLONNES 2 A 5. 

      IMPLICIT    none

      INTEGER     LEN,NF,IO,I
      CHARACTER*1 LIGNE(LEN)
      CHARACTER   FORM*7,INPUT*5
      LOGICAL     OK

      LOGICAL              INFO
      COMMON     /ZZVERBO/ INFO

      EXTERNAL    XIT,MESSYS,UP2LOW

*---------------------------------------------------------------------
      OK = .FALSE.

***    CONSTRUIRE UN FORMAT DE LECTURE DU TYPE '(*LEN* A1)'.

      IF (LEN.GT.999)                                          THEN
          IF (INFO) WRITE(6,6000) LEN
          CALL                                     XIT(' Getlign',-1 )
      END IF

      WRITE( FORM,10 ) LEN
   10 FORMAT('(',I3.3,'A1)')

***    LIRE LA LIGNE AU COMPLET.

      READ( NF, FORM, END=101,ERR=100,IOSTAT=IO ) LIGNE

***    VERIFIER LA PRESENCE D'UN TYPE D'EOR.

      DO  I=1,5
          INPUT(I:I) = LIGNE(I)
      END DO

      CALL UP2LOW( INPUT,INPUT )

      IF (((INPUT(1:1).EQ.'/'      .or.
     +      INPUT(1:1).EQ.'*'    ) .and.
     +     (INPUT(2:5).EQ. 'eof '  .or.
     +      INPUT(2:5).EQ. 'eoi '  .or.
     +      INPUT(2:5).EQ. 'eor ')).or.
     +      INPUT     .EQ.'+   .'
     +    ) GOTO 101

      OK = .TRUE.

***    BRANCHEMENT DE FIN DE FICHIER OU DE TRAITEMENT D'ERREUR.

  100 IF (IO.NE.0)                                             THEN
          IF (INFO) WRITE(6,6001) NF,IO
          CALL MESSYS( 'In Getlign...' )
      END IF
  101 RETURN

*---------------------------------------------------------------------
 6000 FORMAT('   Please specify input ligne length less than 999',
     +       ' caracters.'/
     +       '   Found ',I5)
 6001 FORMAT('   Getlign on unit ',I3,' returns I/O error number ',I5)

      END

      SUBROUTINE getmset (NF, G, LEV,NLEV, STEP,ORDER,
     +                           VARIAB,NVAR, IBUF,MAXPK,OK)

***    FEV 24/94 - B.Dugas, RPN.

***    Si ORDER est vrai...
***    Cette routine lit un pas de temps complet de NVAR variables
***    ayant chacune NLEV niveaux. La routine GETSET2 est utilisee
***    pour effectuee la lecture.

***    Si ORDER est faux...
***    Cette routine lit toutes les NVAR*NLEV series temporelles a
***    une position geographique, correspondant aux NVAR variables
***    ayant chacune NLEV niveaux. La routine GETFLD2 est utilisee
***    pour effectuee la lecture.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      REAL        G(*),GR8
      REAL(8)     G8,EPSILON,MISFLAG
      LOGICAL     OK,ORDER,IO64B,MVALUE,LVAL
      INTEGER     NF,NLEV,NL0,NVAR,MAXPK,JBUF(HEAD),NAME,NR,TIME
      INTEGER     LEV(NLEV),IBUF(*),POSIT,I,J,K,NWDS,STEP(NLEV*NVAR)
      CHARACTER*4 VARIAB(NVAR),NOM,KIND,RECABT,MESSAG*10

      POINTER   ( PG,G8(*) ),( PGR8,GR8(*) )

      LOGICAL              INFO,SINGLZ
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZZSNGL/      SINGLZ

      LOGICAL,    EXTERNAL :: GETIO64
      EXTERNAL    GETSET2,GETFLD2,GETRABT,XIT,CMPLBL,RECGET

      SAVE        MESSAG
      DATA        MESSAG / 'AUCUN' /

*-------------------------------------------------------------------
      NR = 0 ; MVALUE = .FALSE. ; IO64B = GETIO64( IO64B )

      CALL GETRABT( RECABT )

      DO  J=1,HEAD
          JBUF(J) = IBUF(J)
      END DO

***    READ NEXT FIELD AND DETERMINE KIND AND SIZE.

  100 CALL RECGET( NF, ' ',-1,' ',-1, IBUF,MAXPK,OK )
      IF (.NOT.OK) RETURN

      TIME = IBUF(2)

      WRITE(KIND,4) IBUF(1)
      IF (KIND.NE.'LABL' .AND.
     +    KIND.NE.'DATA' .AND.
     +    KIND.NE.'CHAR' .AND.
     +    .NOT.SINGLZ )                                        THEN

                              NWDS = IBUF(5)*IBUF(6)
          IF (KIND.EQ.'ZONL') NWDS = IBUF(5)
          IF (KIND.EQ.'CMPL' .OR.
     +        KIND.EQ.'FOUR' .OR.
     +        KIND.EQ.'SPEC') NWDS = NWDS * 2

          IF (IO64B) PG = LOC( G(1) )

          CALL PRECEDE( NF,1 )

          IF (ORDER .OR. 
     +       (KIND.EQ.'ZONL' .AND. IBUF(6).NE.1))              THEN

***            THE FILE IS ORDERED AS A GRID SET OR IS A MULTI-
***            LEVEL ZONAL ARRAY. TRY TO READ FIRST VARIABLE SET.

              CALL getset2( NF, G, LEV,NL0, IBUF,MAXPK,OK )

              IF (.NOT.OK) RETURN

***            VERIFIER CORRESPONDANCE ENTRE LES PARAMETRES
***            D'ENTREE ET CE QUE RETOURNE GETSET2.

              WRITE(KIND,0004) IBUF(1)
              WRITE(NOM ,0004) IBUF(3)

              IF (NOM .NE.VARIAB(1) .OR.
     +            NLEV.NE.NL0       )                          THEN
                  IF (INFO) WRITE(6,6001) NLEV,VARIAB(1),NL0,NOM
                  OK = .FALSE.
                  RETURN
***               CALL                             XIT(' Getmset',-1 )
              END IF

              DO  J=1,NLEV
                  STEP(J) = IBUF(2)
              END DO
              NR = NR+NLEV

***            READ NEXT VARIABLE AND CHECK NAME AND SIZE.

              DO  I=2,NVAR

***                 SAUVER LE DERNIER IBUF DANS JBUF.

                  DO  J=1,HEAD
                      JBUF(J) = IBUF(J)
                  END DO

                  POSIT =  (I-1)*NLEV*NWDS + 1

  200             IF (IO64B)                                   THEN
                  PGR8 = LOC( G8(POSIT) )
                  CALL getset2( NF, GR8(1)   , LEV,NL0, IBUF,MAXPK,OK )
                  ELSE
                  CALL getset2( NF, G (POSIT), LEV,NL0, IBUF,MAXPK,OK )
                  END IF

                  WRITE(KIND,0004) IBUF(1)
                  WRITE(NOM ,0004) IBUF(3)

                  IF (KIND.EQ.'LABL' .OR. KIND.EQ.'CHAR')      THEN
                      IF (INFO)                                THEN
                          IF (MESSAG.NE.'deja donne')          THEN
                              MESSAG  = 'deja donne'
                              WRITE(6,6012)
                          END IF
                      END IF
                      DO  J=1,HEAD
                          IBUF(J) = JBUF(J)
                      END DO
                      GOTO 200
                  END IF

                  IF (.NOT.OK           .OR. 
     +                NOM .NE.VARIAB(I) .OR.
     +                NL0 .NE.NLEV      )                      THEN

                      IF (INFO) WRITE(6,6001) NLEV,VARIAB(I),NL0,NOM
                      OK = .FALSE.
                      RETURN
***                   CALL                         XIT(' Getmset',-1 )

                  END IF

                  CALL CMPLBL( 0, JBUF, 0,IBUF, OK )
          
                  IF (.NOT.OK    .OR.
     +               (     ORDER .AND. IBUF(2) .NE. TIME))     THEN

                      IF (INFO)                                THEN
                          WRITE(6,6002)
                          CALL PRTLAB2( ' First ibuf: ',JBUF )
                          CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                      END IF

                      OK = .FALSE.
                      RETURN
***                   CALL                         XIT(' Getmset',-2 )

                  END IF

***                SAVE STEP IN CASE OF MULTI LEVEL ZONAL DATA.

                  DO  J=NR+1,NR+NLEV
                      STEP(J) = IBUF(2)
                  END DO
                  NR = NR+NLEV

              END DO

          ELSE

***            THE FILE MAY BE ORDERED AS A TIME SERIES
***            SET. READ NLEV*NVAR RECORDS, DO NOT ASSUME
***            THAT THE TIME STEP REMAINS CONSTANT.

              POSIT = 1

              DO  I=1,NVAR

***                RETREIVE VARIAB(I)

                  READ( VARIAB(I),4) NAME
                  DO  J=1,NLEV

                      IF (IO64B)                               THEN
                          CALL GETFLD28( NF, G8(POSIT),
     +                                  ' ',-1,VARIAB(I),LEV(J), 
     +                                  IBUF,MAXPK,OK )
                      ELSE
                          CALL GETFLD2( NF, G(POSIT),
     +                                  ' ',-1,VARIAB(I),LEV(J), 
     +                                  IBUF,MAXPK,OK )
                      END IF

                      IF (.NOT.OK)                             THEN

                          IF (I*J.NE.1)                        THEN

                              IF (INFO) WRITE(6,6011) VARIAB(I),LEV(J)
                              OK = .FALSE.
                              RETURN
***                           CALL                 XIT(' Getmset',-1 )

                          END IF

                          RETURN

                      END IF

***                    CHECK SIZES.

                      CALL CMPLBL( 0,IBUF, 0,JBUF, OK )

                      IF (.NOT.OK)                             THEN

                          IF (INFO)                            THEN
                              WRITE(6,6002)
                              CALL PRTLAB2( ' First ibuf: ',JBUF )
                              CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                          END IF

                          RETURN
***                       CALL                     XIT(' Getmset',-2 )

                      END IF

***                    REDEFINIR LA POSITION DU PROCHAIN ENREGISTREMENT.

                      NR       = NR+1
                      POSIT    = POSIT+NWDS
                      STEP(NR) = IBUF(2)

***                    PRESENCE DE VALEURS MANQUANTES ?

                      CALL MISPAR( LVAL,MISFLAG,EPSILON )
                      MVALUE = (LVAL .OR. MVALUE)

                  END DO

              END DO

          END IF

      ELSE IF (SINGLZ .OR. KIND.EQ.'DATA')                     THEN

***        MODE D'OPERATION SIMPLIFIE POUR DONNEES DE TYPE 'DATA'
***        ET POUR LE MODE NIVEAU-PAR-NIVEAU. ENTRE AUTRES, LE
***        MODE DE FONCTIONNEMENT "SERIES TEPORELLES" N'EST PAS
***        SUPPORTE...

          IF (.NOT.ORDER) RETURN

          IF (IO64B) PG = LOC( G(1) )

          NWDS = IBUF(5)*IBUF(6)

          CALL PRECEDE( NF,1 )

***        SAUVER LES 8 PREMIERS MOTS DE IBUF DANS JBUF.

          DO  I=1,HEAD
              JBUF(I) = IBUF(I)
          END DO

***        LIRE LES NVAR*NLEV ENREGISTREMENTS DANS L'ORDRE.

          DO  I=1,NVAR
              DO  J=1,NLEV

                  POSIT =  ( (I-1) * NLEV + (J-1) ) * NWDS + 1

                  IF (IO64B)                                   THEN
                      CALL getfld28( NF, G8(POSIT), 
     +                KIND,TIME,VARIAB(I),LEV(J), IBUF,MAXPK,OK )
                  ELSE
                      CALL getfld2( NF, G (POSIT), 
     +                KIND,TIME,VARIAB(I),LEV(J), IBUF,MAXPK,OK )
                  END IF

                  IF (.NOT.OK)                                 THEN
                      IF (RECABT.EQ.'&NON' .AND.
     +                    MAXPK .EQ. 0     .AND.
     +                    NR    .GT. 0     )
     +                    CALL PRECEDE( NF, NR )   
                      IF (INFO) WRITE(6,6011) VARIAB(I),LEV(J)
                      RETURN
                  END IF

                  CALL CMPLBL( 0, JBUF, 0,IBUF, OK )
          
                  IF (.NOT.OK)                                 THEN

                      IF (INFO)                                THEN
                          WRITE(6,6002)
                          CALL PRTLAB2( ' First ibuf: ',JBUF )
                          CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                      END IF

                      RETURN
***                   CALL                         XIT(' Getmset',-2 )

                  END IF

                  NR       = NR+1
                  STEP(NR) = IBUF(2)

***                PRESENCE DE VALEURS MANQUANTES ?

                  CALL MISPAR( LVAL,MISFLAG,EPSILON )
                  MVALUE = (LVAL .OR. MVALUE)

              END DO
          END DO

      ELSE

***        IGNORER LES ENREGISTREMENTS DE TYPE 'CHAR' ET 'LABL'.

          IF (INFO)                                            THEN
              IF (MESSAG.NE.'deja donne')                      THEN
                  MESSAG  = 'deja donne'
                  WRITE(6,6012)
              END IF
          END IF
 
         DO  J=1,HEAD
              JBUF(J) = IBUF(J)
          END DO

          GOTO 100

      END IF

***    ACTIVER LES VALEURS MANQUANTES SI ELLES ONT ETE
***    DETECTEES DANS AU MOINS UN ENREGISTREMENT.

      IF (MVALUE) CALL SET_MISPAR( MISFLAG,EPSILON )

      RETURN
*-------------------------------------------------------------------

    4 FORMAT(A4)

 6001 FORMAT(' Getmset: While trying to read ',I5,' levels of ',A4,
     +       ' found ',I5,' levels of ',A4)
 6002 FORMAT(' Getmset: More than one size ...')
 6011 FORMAT(' Getmset: Unable to find ',A4,' at level ',I5,' ...')
 6012 FORMAT(' Getmset: Stripping CHAR and LABL records from input.')

      END
      SUBROUTINE getmset2 (NF, G, SET,NSET, LEV,VARIAB,STEP,
     +                            IBUF,MAXPK,OK )

***    Juin 2001 - B.Dugas, RPN.

***    Cette routine lit un pas de temps complet de SET(NSET)
***    enregistrements.  La routine GETSET2 est utilisee pour
***    effectuee la lecture. L'information sur les noms et
***    niveaux correspondant se trouve dans les champs
***    d'entree VARIAB et LEV, respectivement.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      REAL        G(*),GR8
      LOGICAL     OK,IO64B,MVALUE,LVAL
      CHARACTER*4 NOM,KIND,RECABT
      REAL(8)     G8,EPSILON,MISFLAG
      INTEGER     NF,NSET,MAXPK,JBUF(HEAD)
      INTEGER     SET(0:*),LEV(*),IBUF(*),STEP(*)
      INTEGER     POSIT,I,J,K,NWDS,NR,TIME,NIV,NLEV
      CHARACTER   NIV_S*15,MESSAG*10,ZHOLD*80

      CHARACTER * ( * ) VARIAB(*)

      POINTER   ( PG,G8(*) ),( PGR8,GR8(*) )

      LOGICAL              INFO,SINGLZ
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZZSNGL/      SINGLZ

#     include    "zlabel.cdk"

      LOGICAL,    EXTERNAL :: GETIO64
      EXTERNAL    GETSET2,GETFLD2,GETRABT,XIT,CMPLBL,RECGET
      EXTERNAL    GET_IP1_STRING

      SAVE        MESSAG
      DATA        MESSAG / 'AUCUN' /
*-------------------------------------------------------------------

      NR = 0 ; MVALUE = .FALSE. ; IO64B = GETIO64( IO64B )

      CALL GETRABT( RECABT )

      DO  J=1,HEAD
          JBUF(J) = IBUF(J)
      END DO

***    READ NEXT FIELD AND DETERMINE KIND AND SIZE.

  100 CALL RECGET( NF, ' ',-1,' ',-1, IBUF,MAXPK,OK )
      IF (.NOT.OK) RETURN

      TIME = IBUF(2)

      WRITE(KIND,4) IBUF(1)
      IF (KIND.NE.'LABL' .AND.
     +    KIND.NE.'DATA' .AND.
     +    KIND.NE.'CHAR' .AND.
     +    .NOT.SINGLZ )                                        THEN

                              NWDS = IBUF(5)*IBUF(6)
          IF (KIND.EQ.'ZONL') NWDS = IBUF(5)
          IF (KIND.EQ.'CMPL' .OR.
     +        KIND.EQ.'FOUR' .OR.
     +        KIND.EQ.'SPEC') NWDS = NWDS * 2

          IF (IO64B) PG = LOC( G(1) )

          CALL PRECEDE( NF,1 )

***        THE FILE IS ORDERED AS A GRID SET OR IS A MULTI-
***        LEVEL ZONAL ARRAY. TRY TO READ ALL THE SETS.

          DO  I=1,NSET

***             SAUVER LE DERNIER IBUF DANS JBUF.

              DO  J=1,HEAD
                  JBUF(J) = IBUF(J)
              END DO

              POSIT = SET(I-1) * NWDS + 1

  200         IF (IO64B)                                       THEN
                  PGR8 = LOC( G8(POSIT) )
                  CALL getset2( NF, GR8(1)   , LEV(SET(I-1)+1),NLEV,
     +                                         IBUF,MAXPK,OK )
              ELSE
                  CALL getset2( NF, G (POSIT), LEV(SET(I-1)+1),NLEV,
     +                                         IBUF,MAXPK,OK )
              END IF

              WRITE(KIND,0004) IBUF(1)
              WRITE(NOM ,0004) IBUF(3)

              IF (KIND.EQ.'LABL' .OR. KIND.EQ.'CHAR')          THEN
                  IF (INFO)                                    THEN
                      IF (MESSAG.NE.'deja donne')              THEN
                          MESSAG  = 'deja donne'
                          WRITE(6,6012)
                     END IF
                  END IF
                  DO  J=1,HEAD
                      IBUF(J) = JBUF(J)
                  END DO
                  GOTO 200
              END IF

              IF (.NOT.OK                      .OR. 
     +             NOM .NE.VARIAB(SET(I))(1:4) .OR.
     +             NLEV.NE.SET(I)-SET(I-1) )                   THEN
 
                  IF (INFO .AND. MAXPK.NE.0)
     +                WRITE(6,6001) SET(I)-SET(I-1),
     +                              VARIAB(SET(I))(1:4), NLEV,NOM

                  OK = .FALSE.
                  RETURN
***               CALL                         XIT('Getmset2',-1 )

             END IF

             CALL CMPLBL( 0, JBUF, 0,IBUF, OK )
          
             IF (.NOT.OK .OR. IBUF(2) .NE. TIME)               THEN

                 IF (INFO)                                     THEN
                     WRITE(6,6002)
                     CALL PRTLAB2( ' First ibuf: ',JBUF )
                     CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                 END IF

                 RETURN
***              CALL                         XIT('Getmset2',-2 )

             END IF

***           SAVE STEP IN CASE OF MULTI LEVEL ZONAL DATA.

              DO  J=NR+1,NR+NLEV
                  STEP(J) = IBUF(2)
              END DO

***            PRESENCE DE VALEURS MANQUANTES ?

              CALL MISPAR( LVAL,MISFLAG,EPSILON )
              MVALUE = (LVAL .OR. MVALUE)

              NR = NR+NLEV

          END DO

      ELSE IF (SINGLZ .OR. KIND.EQ.'DATA')                     THEN

***        MODE D'OPERATION SIMPLIFIE POUR DONNEES DE TYPE 'DATA'
***        ET POUR LE MODE NIVEAU-PAR-NIVEAU. ENTRE AUTRES, LE
***        MODE DE FONCTIONNEMENT "SERIES TEPORELLES" N'EST PAS
***        SUPPORTE...

          IF (IO64B) PG = LOC( G(1) )

          NWDS = IBUF(5)*IBUF(6)

          CALL PRECEDE( NF,1 )

***        SAUVER LES 8 PREMIERS MOTS DE IBUF DANS JBUF.

          DO  I=1,HEAD
              JBUF(I) = IBUF(I)
          END DO

***        LIRE LES SET(NSET) ENREGISTREMENTS DANS L'ORDRE.

          DO  I=1,NSET
              DO  J=SET(I-1)+1,SET(I)

                  POSIT  = (J-1) * NWDS + 1

                  NIV    = LEV(J)
                  NOM    = VARIAB(J)

                  ZHOLD  = ZLABEL
                  ZLABEL = VARIAB(J)(5:20)

                  IF (IO64B)                                   THEN
                      CALL getfld28( NF, G8(POSIT), 
     +                KIND,TIME,NOM,NIV, IBUF,MAXPK,OK )
                  ELSE
                      CALL getfld2( NF, G (POSIT), 
     +                KIND,TIME,NOM,NIV, IBUF,MAXPK,OK )
                  END IF

                  ZLABEL = ZHOLD

                  IF (.NOT.OK)                                 THEN
                      IF (RECABT.EQ.'&NON' .AND.
     +                    MAXPK .EQ. 0     .AND.
     +                    NR    .GT. 0     )               
     +                    CALL PRECEDE( NF, NR )   
                      IF (INFO)                                THEN
                         CALL GET_IP1_STRING( NIV,NIV_S )
                         WRITE(6,6011) NOM,TRIM( NIV_S )
                      END IF
                      RETURN
                  END IF

                  CALL CMPLBL( 0, JBUF, 0,IBUF, OK )
          
                  IF (.NOT.OK)                                 THEN

                      IF (INFO)                                THEN
                          WRITE(6,6002)
                          CALL PRTLAB2( ' First ibuf: ',JBUF )
                          CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                      END IF

                      RETURN
***                   CALL                         XIT('Getmset2',-2 )

                  END IF

                  NR       = NR+1
                  STEP(NR) = IBUF(2)

***                PRESENCE DE VALEURS MANQUANTES ?

                  CALL MISPAR( LVAL,MISFLAG,EPSILON )
                  MVALUE = (LVAL .OR. MVALUE)

              END DO
          END DO

      ELSE

***        IGNORER LE ENREGISTREMENTS DE TYPE 'CHAR' ET 'LABL'.

          IF (INFO)                                            THEN
              IF (MESSAG.NE.'deja donne')                      THEN
                  MESSAG  = 'deja donne'
                  WRITE(6,6012)
              END IF
          END IF
          DO  J=1,HEAD
              IBUF(J) = JBUF(J)
          END DO
          GOTO 100

      END IF

***    ACTIVER LES VALEURS MANQUANTES SI ELLES ONT ETE
***    DETECTEES DANS AU MOINS UN JEUX D'ENREGISTREMENTS.

      IF (MVALUE) CALL SET_MISPAR( MISFLAG,EPSILON )

      RETURN
*-------------------------------------------------------------------

    4 FORMAT(A4)

 6001 FORMAT(' Getmset2: While trying to read ',I5,' levels of ',A4,
     +       ' found ',I5,' levels of ',A4)
 6002 FORMAT(' Getmset2: More than one size ...')
 6011 FORMAT(' Getmset2: Unable to find ',A4,' at level ',A,' ...')
 6012 FORMAT(' Getmset2: Stripping CHAR and LABL records from input.')

      END
      SUBROUTINE getmset3 (NF, G, SET,NIP3,NSET, LEV,VARIAB,STEP,
     +                            IBUF,MAXPK,OK )

***    Juin 2009 - B.Dugas, RPN.

***    Cette routine lit un pas de temps complet de SET(NSET)
***    enregistrements.  La routine GETSET2 est utilisee pour
***    effectuee la lecture. L'information sur les noms et
***    niveaux correspondant se trouve dans les champs
***    d'entree VARIAB et LEV, respectivement.

***    P/R a getmset2, cette routine retourne les valeurs de IP3.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      REAL        G(*),GR8
      LOGICAL     OK,IO64B,MVALUE,LVAL
      REAL(8)     G8,EPSILON,MISFLAG
      CHARACTER*4 NOM,KIND,RECABT,HNEWL
      INTEGER     NF,NSET,MAXPK,JBUF(HEAD),NIP3(*)
      INTEGER     SET(0:*),LEV(*),IBUF(*),STEP(*)
      INTEGER     POSIT,I,J,K,NWDS,NR,TIME,NIV,NLEV
      CHARACTER   NIV_S*15,MESSAG*10,ZHOLD*80

      CHARACTER*4,SAVE :: NEWL = 'NEWL'
      LOGICAL,    SAVE :: NEW_LEV = .FALSE.,PP_LEV=.FALSE.
      INTEGER,    DIMENSION(:), ALLOCATABLE :: INT_LEV
      INTEGER,    DIMENSION(:), ALLOCATABLE, SAVE :: SAV_LEV

      CHARACTER * ( * ) VARIAB(*)

      CHARACTER(LEN=15) :: EXT_SLEV,INT_SLEV

      POINTER   ( PG,G8(*) ),( PGR8,GR8(*) )

      INTEGER              INFMOT(0:unite_io_maximale)
      COMMON     /LIRZXL/  INFMOT

      LOGICAL              INFO,SINGLZ,NOABORT
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZZSNGL/      SINGLZ
      COMMON     /ZZABORT/             NOABORT

#     include    "zlabel.cdk"

      LOGICAL,    EXTERNAL :: GETIO64
      INTEGER,    EXTERNAL :: GETHIGH
      CHARACTER*4,EXTERNAL :: GETHIC
      EXTERNAL    GETSET2,GETFLD2,
     +            GETRABT,XIT,CMPLBL,RECGET,
     +            GET_IP1_STRING

      SAVE        MESSAG
      DATA        MESSAG / 'AUCUN' /
*-------------------------------------------------------------------

      NR = 0 ; MVALUE = .FALSE. ; IO64B = GETIO64( IO64B )

      ALLOCATE( INT_LEV(SET(NSET)) )

      IF (.NOT.ALLOCATED( SAV_LEV) )                           THEN
          ALLOCATE( SAV_LEV(SET(NSET)) )
          DO  I=1,NSET
              DO  J=SET(I-1)+1,SET(I)
                  SAV_LEV(J) = J-SET(I-1)
              END DO
          END DO
      ELSE IF (NEW_LEV)                                        THEN
          NEW_LEV = .FALSE.
      END IF

      CALL GETRABT( RECABT )

      DO  J=1,HEAD
          JBUF(J) = IBUF(J)
      END DO

***    READ NEXT FIELD AND DETERMINE KIND AND SIZE.

  100 CALL RECGET( NF, ' ',-1,' ',-1, IBUF,MAXPK,OK )
      IF (.NOT.OK) RETURN

      TIME = IBUF(2)

      WRITE(KIND,4) IBUF(1)
      IF (KIND.NE.'LABL' .AND.
     +    KIND.NE.'DATA' .AND.
     +    KIND.NE.'CHAR' .AND.
     +    .NOT.SINGLZ )                                        THEN

                              NWDS = IBUF(5)*IBUF(6)
          IF (KIND.EQ.'ZONL') NWDS = IBUF(5)
          IF (KIND.EQ.'CMPL' .OR.
     +        KIND.EQ.'FOUR' .OR.
     +        KIND.EQ.'SPEC') NWDS = NWDS * 2

          IF (IO64B) PG = LOC( G(1) )

          CALL PRECEDE( NF,1 )

***        THE FILE IS ORDERED AS A GRID SET OR IS A MULTI-
***        LEVEL ZONAL ARRAY. TRY TO READ ALL THE SETS.

          DO  I=1,NSET

***             SAUVER LE DERNIER IBUF DANS JBUF.

              DO  J=1,HEAD
                  JBUF(J) = IBUF(J)
              END DO

              POSIT = SET(I-1) * NWDS + 1

  200         IF (IO64B)                                       THEN
                  PGR8 = LOC( G8(POSIT) )
                  CALL getset2( NF, GR8(1)   , INT_LEV(SET(I-1)+1),NLEV,
     +                                         IBUF,MAXPK,OK )
              ELSE
                  CALL getset2( NF, G (POSIT), INT_LEV(SET(I-1)+1),NLEV,
     +                                         IBUF,MAXPK,OK )
              END IF

***            GESTION DES NIVEAUX CONTENUS DANS LES ENREGISTREMENTS '++'.

              IF (KIND == 'ZONL')                              THEN
                  HNEWL = GETHIC('NEWL',IBUF )
                  IF (NLEV /= INFMOT(NF) .OR. HNEWL == NEWL)   THEN
                      ! Sauver les niveaux TROUVES dans le dernier '++' (PP).
                      SAV_LEV(SET(I-1)+1:SET(I)) = 
     +                    INT_LEV(SET(I-1)+1:SET(I))
                      NEW_LEV = .TRUE. ; PP_LEV = .TRUE.
                  ELSE IF (PP_LEV)                             THEN
                      IF (NEW_LEV)                             THEN
                          IF (I > 1 .AND.
     +                        NLEV == SET(I-1)-SET(I-2))       THEN
                              ! Definir SAV_LEV pour ce jeu de niveaux
                              SAV_LEV(SET(I-1)+1:SET(I)) = 
     +                            SAV_LEV(SET(I-2)+1:SET(I-1))
                          END IF
                      END IF
                      IF (NLEV == SET(I)-SET(I-1))
     +                    INT_LEV(SET(I-1)+1:SET(I)) = 
     +                       SAV_LEV(SET(I-1)+1:SET(I))
                  END IF
              END IF

              WRITE(KIND,0004) IBUF(1)
              WRITE(NOM ,0004) IBUF(3)

              NIP3(I) = MAX( 1, GETHIGH( 'IP3',IBUF ) )

              IF (KIND.EQ.'LABL' .OR. KIND.EQ.'CHAR')          THEN
                  IF (INFO)                                    THEN
                      IF (MESSAG.NE.'deja donne')              THEN
                          MESSAG  = 'deja donne'
                          WRITE(6,6012)
                     END IF
                  END IF
                  DO  J=1,HEAD
                      IBUF(J) = JBUF(J)
                  END DO
                  GOTO 200
              END IF

***            COMPARER LES NIVEAUX LUS ET SPECIFIE EN ENTREE.

              IF (.NOT.NOABORT)                                THEN
                  DO  J=SET(I-1)+1,SET(I)
                      IF (INT_LEV(J) /= LEV(J)) EXIT
                  END DO
              ELSE
                  J = SET(I)+1
              END IF

              IF (.NOT.OK                      .OR. 
     +             NOM  /= VARIAB(SET(I))(1:4) .OR.
     +             NLEV /= SET(I)-SET(I-1)     .OR.
     +             J    /= SET(I)+1)                           THEN
 
                  IF (INFO .AND.
     +               (J    /= SET(I)+1            .OR.
     +                NOM  /= VARIAB(SET(I))(1:4) .OR.
     +                NLEV /= SET(I)-SET(I-1)))                THEN

                      IF (J    /= SET(I)+1)                    THEN
                          CALL GET_IP1_STRING( INT_LEV(J),INT_SLEV )
                          CALL GET_IP1_STRING(     LEV(J),EXT_SLEV )
                          WRITE(6,6003)
     +                       VARIAB(SET(I))(1:4),TRIM( EXT_SLEV ),
     +                       NOM                ,TRIM( INT_SLEV )
                      ELSE IF (NOM  /= VARIAB(SET(I))(1:4))    THEN
                          WRITE(6,6013) VARIAB(SET(I))(1:4),NOM
                      ELSE
                          WRITE(6,6001) SET(I)-SET(I-1),
     +                              VARIAB(SET(I))(1:4), NLEV,NOM
                      END IF

                  ELSE IF (INFO .AND. MAXPK.NE.0)              THEN

                      WRITE(6,6001) SET(I)-SET(I-1),
     +                              VARIAB(SET(I))(1:4), NLEV,NOM

                  END IF

                  OK = .FALSE.
                  RETURN
***               CALL                         XIT('Getmset3',-1 )

              END IF

              CALL CMPLBL( 0, JBUF, 0,IBUF, OK )
          
              IF (.NOT.OK .OR. IBUF(2) .NE. TIME)              THEN

                  IF (INFO)                                    THEN
                      WRITE(6,6002)
                      CALL PRTLAB2( ' First ibuf: ',JBUF )
                      CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                  END IF

                  OK = .FALSE.
                  RETURN
***               CALL                        XIT('Getmset3',-2 )

              END IF

***           SAVE STEP IN CASE OF MULTI LEVEL ZONAL DATA.

              DO  J=NR+1,NR+NLEV
                  STEP(J) = IBUF(2)
              END DO

***            PRESENCE DE VALEURS MANQUANTES ?

              CALL MISPAR( LVAL,MISFLAG,EPSILON )
              MVALUE = (LVAL .OR. MVALUE)

              NR = NR+NLEV

          END DO

      ELSE IF (SINGLZ .OR. KIND.EQ.'DATA')                     THEN

***        MODE D'OPERATION SIMPLIFIE POUR DONNEES DE TYPE 'DATA'
***        ET POUR LE MODE NIVEAU-PAR-NIVEAU. ENTRE AUTRES, LE
***        MODE DE FONCTIONNEMENT "SERIES TEPORELLES" N'EST PAS
***        SUPPORTE...

          IF (IO64B) PG = LOC( G(1) )

          NWDS = IBUF(5)*IBUF(6)

          CALL PRECEDE( NF,1 )

***        SAUVER LES 8 PREMIERS MOTS DE IBUF DANS JBUF.

          DO  I=1,HEAD
              JBUF(I) = IBUF(I)
          END DO

***        LIRE LES SET(NSET) ENREGISTREMENTS DANS L'ORDRE.

          DO  I=1,NSET
              DO  J=SET(I-1)+1,SET(I)

                  POSIT  = (J-1) * NWDS + 1

                  NIV    = LEV(J)
                  NOM    = VARIAB(J)

                  ZHOLD  = ZLABEL
                  ZLABEL = VARIAB(J)(5:20)

                  IF (IO64B)                                   THEN
                      CALL getfld28( NF, G8(POSIT), 
     +                KIND,TIME,NOM,NIV, IBUF,MAXPK,OK )
                  ELSE
                      CALL getfld2( NF, G (POSIT), 
     +                KIND,TIME,NOM,NIV, IBUF,MAXPK,OK )
                  END IF

                  NIP3(I) = MAX( 1, GETHIGH( 'IP3',IBUF ) )

                  ZLABEL = ZHOLD

                  IF (.NOT.OK)                                 THEN
                      IF (RECABT.EQ.'&NON' .AND.
     +                    MAXPK .EQ. 0     .AND.
     +                    NR    .GT. 0     )               
     +                    CALL PRECEDE( NF, NR )   
                      IF (INFO)                                THEN
                         CALL GET_IP1_STRING( NIV,NIV_S )
                         WRITE(6,6011) NOM,TRIM( NIV_S )
                      END IF
                      RETURN
                  END IF

                  CALL CMPLBL( 0, JBUF, 0,IBUF, OK )
          
                  IF (.NOT.OK)                                 THEN

                      IF (INFO)                                THEN
                          WRITE(6,6002)
                          CALL PRTLAB2( ' First ibuf: ',JBUF )
                          CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                      END IF

                      RETURN
***                   CALL                         XIT('Getmset3',-2 )

                  END IF

                  NR       = NR+1
                  STEP(NR) = IBUF(2)

***                PRESENCE DE VALEURS MANQUANTES ?

                  CALL MISPAR( LVAL,MISFLAG,EPSILON )
                  MVALUE = (LVAL .OR. MVALUE)

              END DO
          END DO

      ELSE

***        IGNORER LE ENREGISTREMENTS DE TYPE 'CHAR' ET 'LABL'.

          IF (INFO)                                            THEN
              IF (MESSAG.NE.'deja donne')                      THEN
                  MESSAG  = 'deja donne'
                  WRITE(6,6012)
              END IF
          END IF
          DO  J=1,HEAD
              IBUF(J) = JBUF(J)
          END DO
          GOTO 100

      END IF

***    ACTIVER LES VALEURS MANQUANTES SI ELLES ONT ETE
***    DETECTEES DANS AU MOINS UN JEUX D'ENREGISTREMENTS.

      IF (MVALUE) CALL SET_MISPAR( MISFLAG,EPSILON )

      RETURN
*-------------------------------------------------------------------

    4 FORMAT(A4)

 6001 FORMAT(' Getmset3: While trying to read ',I5,' levels of ',A,
     +       ' found ',I5,' levels of ',A/)
 6002 FORMAT(' Getmset3: More than one size ...')
 6003 FORMAT(' Getmset3: While looking for variable ',A,' at level ',A,
     +       ' found ',A,' at ',A/)
 6013 FORMAT(' Getmset3: While looking for variable ',A,' found ',A/)

 6011 FORMAT(' Getmset3: Unable to find ',A4,' at level ',A,' ...')
 6012 FORMAT(' Getmset3: Stripping CHAR and LABL records from input.')

      END
      SUBROUTINE getmset4 (NF, G, SET,NSAMP,RKIND,HIVAL,LOVAL,NSET,
     +                            LEV,VARIAB,STEP, IBUF,MAXPK,OK )

***    Juin 2016 - B.Dugas, UQAM.

***    Cette routine lit un pas de temps complet de SET(NSET)
***    enregistrements.  La routine GETSET2 est utilisee pour
***    effectuee la lecture. L'information sur les noms et
***    niveaux correspondant se trouve dans les champs
***    d'entree VARIAB et LEV, respectivement.

***    P/R a getmset2, cette routine retourne 1) le nombre d'echantillons
***    associe aux moyennes NSAMP, le cas echeant, 2) le type de codage
***    des IP1/2/3 rencontre, RKIND, et enfin 3) les bornes de l'interval
***    temporel correspondant aux moyennes temporelles, HIVAL et LOVAL
***    et ce, encore une fois, le cas echeant.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

***    Arguments.

      LOGICAL     OK
      CHARACTER * ( * ) VARIAB(*)
      INTEGER     NF,NSET,MAXPK
      REAL        G(*),HIVAL(*),LOVAL(*)
      INTEGER     SET(0:*),NSAMP(*),RKIND(*),LEV(*),IBUF(*),STEP(*)
      
***    Variables locales.

      REAL        GR8
      LOGICAL     IO64B,MVALUE,LVAL
      REAL(8)     G8,EPSILON,MISFLAG
      CHARACTER(4) NOM,KIND,RECABT,HNEWL
      INTEGER     JBUF(HEAD),IPM
      INTEGER     POSIT,I,J,K,NWDS,NR,TIME,NIV,NLEV
      CHARACTER   NIV_S*15,MESSAG*10,ZHOLD*80

      CHARACTER(4),SAVE :: NEWL = 'NEWL'
      LOGICAL,     SAVE :: NEW_LEV = .FALSE.,PP_LEV=.FALSE.
      INTEGER,    DIMENSION(:), ALLOCATABLE :: INT_LEV
      INTEGER,    DIMENSION(:), ALLOCATABLE, SAVE :: SAV_LEV

      CHARACTER(15) :: EXT_SLEV,INT_SLEV

      POINTER   ( PG,G8(*) ),( PGR8,GR8(*) )

      INTEGER              INFMOT(0:unite_io_maximale)
      COMMON     /LIRZXL/  INFMOT

      LOGICAL              INFO,SINGLZ,NOABORT
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZZSNGL/      SINGLZ
      COMMON     /ZZABORT/             NOABORT

#     include    "zlabel.cdk"

      CHARACTER(4),EXTERNAL :: GETHIC 
      LOGICAL,     EXTERNAL :: GETIO64
      INTEGER,     EXTERNAL :: GETHIGH,GETSAMPLZ
      EXTERNAL     GETSET2,GETFLD2,
     +             GETRABT,XIT,CMPLBL,RECGET,
     +             GET_IP1_STRING

      SAVE        MESSAG
      DATA        MESSAG / 'AUCUN' /
*-------------------------------------------------------------------

      NR = 0 ; MVALUE = .FALSE. ; IO64B = GETIO64( IO64B )

      ALLOCATE( INT_LEV(SET(NSET)) )

      IF (.NOT.ALLOCATED( SAV_LEV) )                           THEN
          ALLOCATE( SAV_LEV(SET(NSET)) )
          DO  I=1,NSET
              DO  J=SET(I-1)+1,SET(I)
                  SAV_LEV(J) = J-SET(I-1)
              END DO
          END DO
      ELSE IF (NEW_LEV)                                        THEN
          NEW_LEV = .FALSE.
      END IF

      CALL GETRABT( RECABT )

      DO  J=1,HEAD
          JBUF(J) = IBUF(J)
      END DO

***    READ NEXT FIELD AND DETERMINE KIND AND SIZE.

  100 CALL RECGET( NF, ' ',-1,' ',-1, IBUF,MAXPK,OK )
      IF (.NOT.OK) RETURN

      TIME = IBUF(2)

      WRITE(KIND,4) IBUF(1)
      IF (KIND.NE.'LABL' .AND.
     +    KIND.NE.'DATA' .AND.
     +    KIND.NE.'CHAR' .AND.
     +    .NOT.SINGLZ )                                        THEN

                              NWDS = IBUF(5)*IBUF(6)
          IF (KIND.EQ.'ZONL') NWDS = IBUF(5)
          IF (KIND.EQ.'CMPL' .OR.
     +        KIND.EQ.'FOUR' .OR.
     +        KIND.EQ.'SPEC') NWDS = NWDS * 2

          IF (IO64B) PG = LOC( G(1) )

          CALL PRECEDE( NF,1 )

***        THE FILE IS ORDERED AS A GRID SET OR IS A MULTI-
***        LEVEL ZONAL ARRAY. TRY TO READ ALL THE SETS.

          DO  I=1,NSET

***             SAUVER LE DERNIER IBUF DANS JBUF.

              DO  J=1,HEAD
                  JBUF(J) = IBUF(J)
              END DO

              POSIT = SET(I-1) * NWDS + 1

  200         IF (IO64B)                                       THEN
                  PGR8 = LOC( G8(POSIT) )
                  CALL getset2( NF, GR8(1)   , INT_LEV(SET(I-1)+1),NLEV,
     +                                         IBUF,MAXPK,OK )
              ELSE
                  CALL getset2( NF, G (POSIT), INT_LEV(SET(I-1)+1),NLEV,
     +                                         IBUF,MAXPK,OK )
              END IF

***            GESTION DES NIVEAUX CONTENUS DANS LES ENREGISTREMENTS '++'.

              IF (KIND == 'ZONL')                              THEN
                  HNEWL = GETHIC('NEWL',IBUF )
                  IF (NLEV /= INFMOT(NF) .OR. HNEWL == NEWL)   THEN
                      ! Sauver les niveaux TROUVES dans le dernier '++' (PP).
                      SAV_LEV(SET(I-1)+1:SET(I)) = 
     +                    INT_LEV(SET(I-1)+1:SET(I))
                      NEW_LEV = .TRUE. ; PP_LEV = .TRUE.
                  ELSE IF (PP_LEV)                             THEN
                      IF (NEW_LEV)                             THEN
                          IF (I > 1 .AND.
     +                        NLEV == SET(I-1)-SET(I-2))       THEN
                              ! Definir SAV_LEV pour ce jeu de niveaux
                              SAV_LEV(SET(I-1)+1:SET(I)) = 
     +                         SAV_LEV(SET(I-2)+1:SET(I-1))
                          END IF
                      END IF
                      IF (NLEV == SET(I)-SET(I-1))
     +                    INT_LEV(SET(I-1)+1:SET(I)) = 
     +                       SAV_LEV(SET(I-1)+1:SET(I))
                  END IF
              END IF

              WRITE(KIND,0004) IBUF(1)
              WRITE(NOM ,0004) IBUF(3)

              IF (KIND.EQ.'LABL' .OR. KIND.EQ.'CHAR')          THEN
                  IF (INFO)                                    THEN
                      IF (MESSAG.NE.'deja donne')              THEN
                          MESSAG  = 'deja donne'
                          WRITE(6,6012)
                     END IF
                  END IF
                  DO  J=1,HEAD
                      IBUF(J) = JBUF(J)
                  END DO
                  GOTO 200
              END IF

              ! Determiner le nombre d'echantillons NSAMP
              NSAMP(I) = GETSAMPLZ(RKIND(I),HIVAL(I),LOVAL(I),IPM,IBUF)

***            COMPARER LES NIVEAUX LUS ET SPECIFIE EN ENTREE.

              IF (.NOT.NOABORT)                                THEN
                  DO  J=SET(I-1)+1,SET(I)
                      IF (INT_LEV(J) /= LEV(J)) EXIT
                  END DO
              ELSE
                  J = SET(I)+1
              END IF

              IF (.NOT.OK                      .OR. 
     +             NOM  /= VARIAB(SET(I))(1:4) .OR.
     +             NLEV /= SET(I)-SET(I-1)     .OR.
     +             J    /= SET(I)+1)                           THEN
 
                  IF (INFO .AND.
     +               (J    /= SET(I)+1            .OR.
     +                NOM  /= VARIAB(SET(I))(1:4) .OR.
     +                NLEV /= SET(I)-SET(I-1)))                THEN

                      IF (J    /= SET(I)+1)                    THEN
                          CALL GET_IP1_STRING( INT_LEV(J),INT_SLEV )
                          CALL GET_IP1_STRING(     LEV(J),EXT_SLEV )
                          WRITE(6,6003)
     +                     TRIM( VARIAB(SET(I))(1:4) ),TRIM( EXT_SLEV ),
     +                     TRIM( NOM )                ,TRIM( INT_SLEV )
                      ELSE IF (NOM  /= VARIAB(SET(I))(1:4))    THEN
                          WRITE(6,6013)
     +                          TRIM( VARIAB(SET(I))(1:4) ),TRIM( NOM )
                      ELSE
                          WRITE(6,6001) SET(I)-SET(I-1),
     +                    TRIM( VARIAB(SET(I))(1:4) ), NLEV,TRIM( NOM )
                      END IF

                  ELSE IF (INFO .AND. MAXPK.NE.0)              THEN

                      WRITE(6,6001) SET(I)-SET(I-1),
     +                    TRIM( VARIAB(SET(I))(1:4) ), NLEV,TRIM( NOM )

                  END IF

                  OK = .FALSE.
                  RETURN
***               CALL                         XIT('Getmset4',-1 )

              END IF

              CALL CMPLBL( 0, JBUF, 0,IBUF, OK )
          
              IF (.NOT.OK .OR. IBUF(2) .NE. TIME)              THEN

                  IF (INFO)                                    THEN
                      WRITE(6,6002)
                      CALL PRTLAB2( ' First ibuf: ',JBUF )
                      CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                  END IF

                  OK = .FALSE.
                  RETURN
***               CALL                        XIT('Getmset4',-2 )

              END IF

***           SAVE STEP IN CASE OF MULTI LEVEL ZONAL DATA.

              DO  J=NR+1,NR+NLEV
                  STEP(J) = IBUF(2)
              END DO

***            PRESENCE DE VALEURS MANQUANTES ?

              CALL MISPAR( LVAL,MISFLAG,EPSILON )
              MVALUE = (LVAL .OR. MVALUE)

              NR = NR+NLEV

          END DO

      ELSE IF (SINGLZ .OR. KIND.EQ.'DATA')                     THEN

***        MODE D'OPERATION SIMPLIFIE POUR DONNEES DE TYPE 'DATA'
***        ET POUR LE MODE NIVEAU-PAR-NIVEAU. ENTRE AUTRES, LE
***        MODE DE FONCTIONNEMENT "SERIES TEPORELLES" N'EST PAS
***        SUPPORTE...

          IF (IO64B) PG = LOC( G(1) )

          NWDS = IBUF(5)*IBUF(6)

          CALL PRECEDE( NF,1 )

***        SAUVER LES 8 PREMIERS MOTS DE IBUF DANS JBUF.

          DO  I=1,HEAD
              JBUF(I) = IBUF(I)
          END DO

***        LIRE LES SET(NSET) ENREGISTREMENTS DANS L'ORDRE.

          DO  I=1,NSET
              DO  J=SET(I-1)+1,SET(I)

                  POSIT  = (J-1) * NWDS + 1

                  NIV    = LEV(J)
                  NOM    = VARIAB(J)

                  ZHOLD  = ZLABEL
                  ZLABEL = VARIAB(J)(5:20)

                  IF (IO64B)                                   THEN
                      CALL getfld28( NF, G8(POSIT), 
     +                KIND,TIME,NOM,NIV, IBUF,MAXPK,OK )
                  ELSE
                      CALL getfld2( NF, G (POSIT), 
     +                KIND,TIME,NOM,NIV, IBUF,MAXPK,OK )
                  END IF

                  ! Determiner le nombre d'echantillons NSAMP
                  IF (J == SET(I-1)+1)
     +               NSAMP(I) = 
     +                  GETSAMPLZ(RKIND(I),HIVAL(I),LOVAL(I),IPM,IBUF)

                  ZLABEL = ZHOLD

                  IF (.NOT.OK)                                 THEN
                      IF (RECABT.EQ.'&NON' .AND.
     +                    MAXPK .EQ. 0     .AND.
     +                    NR    .GT. 0     )               
     +                    CALL PRECEDE( NF, NR )   
                      IF (INFO)                                THEN
                         CALL GET_IP1_STRING( NIV,NIV_S )
                         WRITE(6,6011) NOM,TRIM( NIV_S )
                      END IF
                      RETURN
                  END IF

                  CALL CMPLBL( 0, JBUF, 0,IBUF, OK )
          
                  IF (.NOT.OK)                                 THEN

                      IF (INFO)                                THEN
                          WRITE(6,6002)
                          CALL PRTLAB2( ' First ibuf: ',JBUF )
                          CALL PRTLAB2( ' Last  ibuf: ',IBUF )
                      END IF

                      RETURN
***                   CALL                         XIT('Getmset4',-2 )

                  END IF

                  NR       = NR+1
                  STEP(NR) = IBUF(2)

***                PRESENCE DE VALEURS MANQUANTES ?

                  CALL MISPAR( LVAL,MISFLAG,EPSILON )
                  MVALUE = (LVAL .OR. MVALUE)

              END DO
          END DO

      ELSE

***        IGNORER LE ENREGISTREMENTS DE TYPE 'CHAR' ET 'LABL'.

          IF (INFO)                                            THEN
              IF (MESSAG.NE.'deja donne')                      THEN
                  MESSAG  = 'deja donne'
                  WRITE(6,6012)
              END IF
          END IF
          DO  J=1,HEAD
              IBUF(J) = JBUF(J)
          END DO
          GOTO 100

      END IF

***    ACTIVER LES VALEURS MANQUANTES SI ELLES ONT ETE
***    DETECTEES DANS AU MOINS UN JEUX D'ENREGISTREMENTS.

      IF (MVALUE) CALL SET_MISPAR( MISFLAG,EPSILON )

      RETURN
*-------------------------------------------------------------------

    4 FORMAT(A4)

 6001 FORMAT(' Getmset4: While trying to read ',I5,' levels of ',A,
     +       ' found ',I5,' levels of ',A/)
 6002 FORMAT(' Getmset4: More than one size ...')
 6003 FORMAT(' Getmset4: While looking for variable ',A,' at level ',A,
     +       ' found ',A,' at ',A/)
 6013 FORMAT(' Getmset4: While looking for variable ',A,' found ',A/)

 6011 FORMAT(' Getmset4: Unable to find ',A4,' at level ',A,' ...')
 6012 FORMAT(' Getmset4: Stripping CHAR and LABL records from input.')

      END
      SUBROUTINE getset2 (NF,G,LEV,NLEV,IBUF,MAXPK,OK)

***    JAN 18/80 - J.D.HENDERSON
***    MAI 03/91 - B.Dugas, RPN. (Le traitement des jeux de type 'ZONL'
***                               se fait par la  routine GETZX2; les
***                               enregistrements  de type 'LABL'  ne 
***                               sont plus ignores.)

***    READS NEXT SET FROM FILE NF INTO ARRAY G. IT ASSUMES THAT THE
***    SET ENDS WHEN IT ENCOUNTERS EITHER AN NEW TIMESTEP, AN END OF
***    FILE, A NEW NAME, OR THE FIRST LEVEL IS REPEATED. 
***    LABL RECORDS ARE IGNORED.

***    IBUF MUST CONTAIN 8 WORDS FOR THE LABEL AND ENOUGH EXTRA WORDS
***    TO CONTAIN THE PACKED FIELD. IBUF(1-8) RETURNS WITH LAST LABEL 
***    IN THE SET. AN IMMEDIATE E-O-F RETURNS WITH NLEV=0.  LEV(NLEV)
***    IS SET TO THE LEVEL VALUES FROM IBUF(4).

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete , MAXLEV = 999

      REAL        G(*)
      REAL(8)     G8,EPSILON,MISFLAG
      CHARACTER   ETIKET*16,INIKET*16
      LOGICAL     OK,SPEC,REC,IO64B,MVALUE,LVAL
      CHARACTER*4 NAME,TYPE,RECABT,PKTYP,NIV_S*15
      INTEGER     LEV(*),IBUF(*),IB(HEAD),NLEV,MAXPK,
     +            INITL,INITN,INITT,INITD1,INITD2,KIND,
     +            NWDS,I,N,NF,LR,MAXWRD0,MAXW,MAXB
      INTEGER     INITLK,LEVELK

      POINTER   ( PG,G8(1) )

      COMMON     /MAXWRD/ MAXWRD0

      LOGICAL              INFO, SINGLZ
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZZSNGL/       SINGLZ

      INTEGER,    EXTERNAL :: GETKIND
      LOGICAL,    EXTERNAL :: GETIO64
      CHARACTER*4,EXTERNAL :: GETYP,GETHIC
      EXTERNAL    RECGET,PRECEDE,GETZX2,RECUP2,XIT,FILEV,
     +            SETKIND,GETRABT

      DATA        INIKET / ' ' /,
     +            ETIKET / ' ' /
      DATA        INITLK /  0  /,
     +            LEVELK /  0  /

CCC   INTEGER     MEMOIRC,IER
CCC   EXTERNAL    MEMOIRC

*-------------------------------------------------------------------
      IO64B = GETIO64( IO64B ) ; CALL GETRABT( RECABT )

      DO  I=1,HEAD
          IB(I)=IBUF(I) 
      END DO  

***    READ NEXT FIELD AND DETERMINE KIND AND SIZE.

      NLEV = 0
      MAXB = MAXWRD0
      MVALUE = .FALSE.

      PKTYP = GETYP( NF )

C 100 IER = MEMOIRC( 0 )
  100 CALL RECGET( NF, ' ',-1,' ',-1, IBUF,MAXPK,OK )

      IF (.NOT.OK)                                             THEN
          DO  I=1,HEAD
              IBUF(I) = IB(I) 
          END DO   
          RETURN
      END IF

      WRITE(TYPE,4) IBUF(1)
      WRITE(NAME,4) IBUF(3)

      IF (PKTYP(1:2).eq.'SQ')                                  THEN
          IF (NAME.EQ.'>>' .OR.
     +        NAME.EQ.'^^' .OR.
     +        NAME.EQ.'^>' .OR.
     +        NAME.EQ.'!!' .OR.
     +        NAME.EQ.'HY') GOTO 100
      END IF
      IF (TYPE.NE.'LABL')                                      THEN

          IF (TYPE.EQ.'ZONL')                                  THEN

              IF (NAME.EQ.'++') GOTO 100
              CALL PRECEDE( NF,1 )

              LR = IBUF(5)
              CALL getzx2( NF, G,LR,LEV,NLEV, IBUF,MAXPK,OK )

          ELSE

              IF (IO64B) PG = LOC( G(1) )

              KIND   = IBUF(1)
              INITT  = IBUF(2)
              INITN  = IBUF(3) 
              INITL  = IBUF(4) 
              INITD1 = IBUF(5) 
              INITD2 = IBUF(6) 

              IF (PKTYP(1:2).EQ.'SQ')                          THEN
                  INITLK            = GETKIND( )
                  INIKET(01:04)     = GETHIC ( 'ETIK1',IBUF )
                  INIKET(05:08)     = GETHIC ( 'ETIK2',IBUF )
                  IF (PKTYP.NE.'SQ89')                         THEN
                      INIKET(09:12) = GETHIC ( 'ETIK3',IBUF )
                      INIKET(13:16) = GETHIC ( 'ETIK4',IBUF )
                  END IF
              END IF

              SPEC  = (TYPE.EQ.'SPEC' .OR.
     +                 TYPE.EQ.'CMPL' .OR.
     +                 TYPE.EQ.'FOUR')

              NWDS  = IBUF(5)*IBUF(6)
              IF (SPEC) NWDS = NWDS*2

***            READ THE REST OF THE SET.

  150         NLEV  = NLEV+1

                  IF (NLEV*NWDS.GT.MAXWRD0 .AND. MAXWRD0.NE.-1)THEN

                      IF (RECABT.EQ.'&NON')                    THEN
                          CALL PRECEDE( NF,NLEV )
                          NLEV    =  0
                          MAXPK   =  0
                          MAXWRD0 =  0
                          OK      = .FALSE.
                          RETURN
                      END IF

                      IF (INFO)                                THEN
                          CALL PRTLAB2(' Getset2: Ibuf = ',IBUF )
                          WRITE(6,6001) NLEV,MAXWRD0
                      END IF

                      CALL                         XIT(' Getset2',-1 )

                  END IF

                  LEV(NLEV) = IBUF(4)
                  N         = (NLEV-1)*NWDS+1

                  IF (IO64B)                                   THEN
                      CALL RECUP2( G8(N), IBUF )
                  ELSE
                      CALL RECUP2( G (N), IBUF )
                  END IF

***                PRESENCE DE VALEURS MANQUANTES ?

                  CALL MISPAR( LVAL,MISFLAG,EPSILON )
                  MVALUE = (LVAL .OR. MVALUE)

***                'CHAR' AND 'DATA' RECORDS ARE ALWAYS READ ONE AT A
***                TIME OR SINGLE VERTICAL LEVEL MODE CAN BE REQUESTED.

                  IF (SINGLZ .OR. TYPE.EQ.'CHAR'
     +                       .OR. TYPE.EQ.'DATA') RETURN

                  DO  I=1,HEAD
                      IB(I)=IBUF(I) 
                  END DO  

                  MAXW = MAXPK
                  CALL RECGET( NF, ' ',-1,' ',-1, IBUF,MAXW,REC )

                  IF (.NOT.REC)                                THEN
                      IF (MAXW.EQ.0)                           THEN
                          IF (IBUF(3).EQ.INITN .AND.
     +                        IBUF(4).NE.INITL)                THEN
                              NLEV    = 0
                              MAXPK   = 0
                              OK      = REC
                              RETURN
                          ELSE
                              MAXWRD0 = MAXB
                          END IF
                      END IF
                      GOTO 250
                  END IF

                  IF (PKTYP(1:2).EQ.'SQ')                      THEN
                      LEVELK            = GETKIND( )
                      ETIKET(01:04)     = GETHIC ( 'ETIK1',IBUF )
                      ETIKET(05:08)     = GETHIC ( 'ETIK2',IBUF )
                      IF (PKTYP.NE.'SQ89')                     THEN
                          ETIKET(09:12) = GETHIC ( 'ETIK3',IBUF )
                          ETIKET(13:16) = GETHIC ( 'ETIK4',IBUF )
                      END IF
                  END IF

                  WRITE(TYPE,4) IBUF(1)
                  IF (TYPE   .EQ.'LABL' .OR.
     +                IBUF(2).NE.INITT  .OR.
     +                IBUF(3).NE.INITN  .OR.
     +                IBUF(5).NE.INITD1 .OR.
     +                IBUF(6).NE.INITD2 .OR.
     +                LEVELK .NE.INITLK .OR.
     +                ETIKET .NE.INIKET .OR.
     +                IBUF(4).EQ.INITL)  GOTO 200

              GOTO 150

***            BACKSPACE AND RESTORE IBUF BEFORE RETURNING 
***            (IF NOT AT EOF).

  200         CALL PRECEDE( NF,1 )
              IF (LEVELK.NE.INITLK) CALL SETKINDI( INITLK )

  250         DO  I=1,HEAD
                  IBUF(I) = IB(I) 
              END DO   

***            ACTIVER LES VALEURS MANQUANTES SI ELLES ONT ETE
***            DETECTEES DANS AU MOINS UN ENREGISTREMENT.

              IF (MVALUE) CALL SET_MISPAR( MISFLAG,EPSILON )
              call setkindi( INITLK )

          END IF

      END IF

      RETURN

*----------------------------------------------------------------------
    4 FORMAT(A4)
 6001 FORMAT(' Getset2: Nlev = ',I6,'. MaxWord too small',I7/)

      END 

      INTEGER FUNCTION getsiz (NF,IBUF,LEN,NWDS,PACK)

***    CETTE ROUTINE DETERMINE LES DIFFERENTS PARAMETRES MEMOIRE
***    ASSOCIES AUX ENREGISTREMENTS D'UN FICHIER. LE FICHIER EST
***    REMIS A SA POSITION INITIALE A LA SORTIE.

***    PARAMETRES:

*      NF   = UNITE E/S
*      IBUF = TAMPON D'E/S
*      LEN  = LONGEUR MINIMALE DU TAMPON COMPLET
*      NWDS = NOMBRE DE MOTS REEL DECOMPACTES. CETTE VALEUR
*             EST AUSSI GARDEE SUR MAXWRD SI NWDS>MAXWRD.
*      PACK = FACTEUR DE COMPRESSION

***    VALEUR DE RETOUR: TAILLE DE LA SECTION DONNEE (IDAT)

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete
      INTEGER,    PARAMETER :: MINREC = donnee_minimale + HEAD

      CHARACTER*4 KIND
      LOGICAL     OK,ERROR
      INTEGER     NF,IBUF(*),LEN,NWDS,PACK
      INTEGER     NB,ZZMAXWRD,CARSIZ

      COMMON     /MAXWRD/ ZZMAXWRD

      LOGICAL              DEBUG
      COMMON     /ZZDEBUG/ DEBUG

      EXTERNAL    SUIVANT,LBLCHK,PRECEDE

*---------------------------------------------------------------------- 
***    SPECIFY ERROR RETURN VALUE.

      LEN    = 0
      NWDS   = 0
      PACK   = 0
      CARSIZ = 0
      GETSIZ = 0

***    READ TILL FIRST REAL DATA RECORD.

   99 NB = 0

  100 CALL SUIVANT( NF, IBUF, ERROR,OK )
      IF (ERROR .OR. .NOT.OK) RETURN

      NB = NB+1

***    CHECK RECORD TYPE TYPE.

      WRITE(KIND,'(A4)') IBUF(1)

      IF (KIND.EQ.'LABL')                                      THEN
          CALL LBLCHK( LEN,NWDS,PACK,IBUF )
          CARSIZ = MAX( CARSIZ,nwds )
          GOTO 100
      END IF
      IF (KIND.EQ.'ZONL' .AND. IBUF(6).NE.1)
     +    NB = NB+IBUF(6)-1 

***    REPOSITION THE FILE.

      CALL PRECEDE( NF,NB )

***    CALCULATE SIZE.

      CALL LBLCHK( LEN, NWDS,PACK,IBUF )

      LEN      = MAX( LEN  , MINREC )
      NWDS     = MAX( NWDS , CARSIZ )
      ZZMAXWRD = MAX( NWDS , ZZMAXWRD )

      IF (DEBUG) WRITE(6,6100) ZZMAXWRD

      GETSIZ = LEN-HEAD

  102 RETURN
*----------------------------------------------------------------------

 6100 FORMAT('*DEBUG:GETSIZ',6X,'MAXWRD reset to ',I9)

      END

      INTEGER FUNCTION getsiz2 (NF,IBUF,LEN,NWDS,PACK,LEV,NLEV)

***    CETTE ROUTINE DETERMINE LES DIFFERENTS PARAMETRES MEMOIRE
***    ASSOCIES AUX ENREGISTREMENTS D'UN FICHIER. LE FICHIER EST
***    REMIS A SA POSITION INITIALE A LA SORTIE.

***    PARAMETRES:

*      NF   = (INPUT)  UNITE E/S
*      IBUF = (I/O)    TAMPON D'E/S
*      LEN  = (OUTPUT) LONGEUR MINIMALE DU TAMPON COMPLET
*      NWDS = (OUTPUT) NOMBRE DE MOTS REEL DECOMPACTES. CETTE VALEUR
*                      EST AUSSI GARDEE SUR MAXWRD SI NWDS>MAXWRD.
*      PACK = (OUTPUT) FACTEUR DE COMPRESSION
*      LEV  = (OUTPUT) VERTICAL LEVELS ARRAY
*      NLEV = (OUTPUT) NUMBER OF LEVELS

***    VALEUR DE RETOUR: TAILLE DE LA SECTION DONNEE (IDAT)

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete
      INTEGER,    PARAMETER :: MINREC = donnee_minimale + HEAD

      INTEGER     NF,IBUF(*),LEN,NWDS,PACK, LEV(1),NLEV

      INTEGER     MAXWRD0, MAXSWRD0
      COMMON     /MAXWRD/  MAXWRD0
      COMMON     /MAXSWRD/ MAXSWRD0

      LOGICAL              DEBUG
      COMMON     /ZZDEBUG/ DEBUG

      EXTERNAL    GETYP,FILEV,LBLCHK

*---------------------------------------------------------------------- 
***    SPECIFY ERROR RETURN VALUES.

      LEN     = 0
      NLEV    = 0
      NWDS    = 0
      PACK    = 0
      GETSIZ2 = 0

***    FIND ALL LEVELS AND FIRST DATA BUFFER.

      CALL FILEV( LEV,NLEV, IBUF, -NF )

      IF (NLEV.LE.0) RETURN

      CALL LBLCHK( LEN, NWDS,PACK,IBUF )

      LEN     = MAX( LEN       , MINREC  , MAXSWRD0 + HEAD )
      MAXWRD0 = MAX( NWDS*NLEV , MAXWRD0 , MAXSWRD0 )

      IF (DEBUG) WRITE(6,6100) MAXWRD0

      GETSIZ2 = LEN - HEAD

      RETURN
*----------------------------------------------------------------------

 6100 FORMAT('*DEBUG:GETSIZ2',5X,'MAXWRD reset to ',I9)

      END

      INTEGER FUNCTION getsiz3 (NF,IBUF,LEN,NWDS,PACK, TIMT,
     +                             LEV,NLEV,NOM,NVAR, MAXV)

***    CETTE ROUTINE DETERMINE LES DIFFERENTS PARAMETRES MEMOIRE
***    ASSOCIES AUX ENREGISTREMENTS D'UN FICHIER. ELLE RETOURNE LE
***    NOMBRE DE VARIABLES/NIVEAUX AVANT UNE REPETITION D'UN PAS
***    DE TEMPS (SI TIMT EST VRAI) OU D'UNE PAIRE DE NOM/NIVEAU.
***    (SINON). CETTE DERNIERE CONDITION EST PLUS GENERALE QUE 
***    CELLE SE LIMITANT AUX VARIABLES D'UN PAS DE TEMPS.

***    LE FICHIER EST REMBOBINE A LA SORTIE. IL EST IMPORTANT DE
***    NOTER QUE TOUTES LES VARIABLES DOIVENT AVOIR LE MEME
***    NOMBRE DE NIVEAUX ET LA MEME TAILLE HORIZONTALE.

***    PARAMETRES:

*      NF   = (INPUT)  UNITE E/S
*      IBUF = (I/O)    TAMPON D'E/S
*      LEN  = (OUTPUT) LONGEUR MINIMALE DU TAMPON COMPLET
*      NWDS = (OUTPUT) NOMBRE DE MOTS REEL DECOMPACTES. CETTE VALEUR
*                      EST AUSSI GARDEE SUR MAXWRD SI NWDS>MAXWRD.
*      PACK = (OUTPUT) FACTEUR DE COMPRESSION
*      TIMT = (INPUT)  CLE LOGIQUE CONTROLANT LE MODE DE SELECTION
*      LEV  = (OUTPUT) VERTICAL LEVELS ARRAY
*      NLEV = (OUTPUT) NUMBER OF LEVELS
*      NOM  = (OUTPUT) NOM DES VARIABLES
*      NVAR = (OUTPUT) NOMBRE DE VARIABLES
*      MAXV = (INPUT)  NOMBRE MAXIMAL DE NIVEAU ET DE VARIABLES

***    VALEUR DE RETOUR: TAILLE DE LA SECTION DONNEE (IDAT)

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete
      INTEGER,    PARAMETER :: MINREC = donnee_minimale + HEAD

      INTEGER     MAXV
      LOGICAL     TIMT
      CHARACTER*4 NOM(MAXV)
      INTEGER     NF,IBUF(*),LEN,NWDS,PACK,
     +            LEV(MAXV),NLEV,NVAR

***    VARIABLES LOCALES.

      CHARACTER          GRTYP
      CHARACTER (LEN=4)  KIND,NAME,PKTYP
      CHARACTER (LEN=12) STRING1,STRING2
      LOGICAL     COMPARE,ERROR,OK
      INTEGER     JBUF(HEAD),TIME,I,J,NR,NL,NL0, NIVEAU, MAXLEN

      INTEGER     MAXWRD0, MAXSWRD0
      COMMON     /MAXWRD/  MAXWRD0
      COMMON     /MAXSWRD/ MAXSWRD0

      LOGICAL              DEBUG
      COMMON     /ZZDEBUG/ DEBUG

      CHARACTER(4), external :: GETHIC
      EXTERNAL    FILEV,LBLCHK,CMPLBL,
     +            SUIVANT,PRECEDE,XIT

*---------------------------------------------------------------------- 
***    SPECIFY ERROR RETURN VALUES.

      LEN     = 0
      LEV(1)  = 0
      NLEV    = 0
      NWDS    = 0
      PACK    = 0
      GETSIZ3 = 0
      NOM(1)  = ' '
      NVAR    = 0

      MAXLEN  = 0

***    FIND ALL LEVELS AND FIRST DATA BUFFER.

      CALL FILEV( LEV,NLEV, JBUF, -NF )

      IF (NLEV.GE.MAXV .OR. NLEV.LE.0)                         THEN
          NLEV = 0
          RETURN
      END IF

      ! Sauver les enregisrements 'TiTac' de NF
      PKTYP = GETHIC( 'PKTYP',JBUF ) ; PKTYP = PKTYP(1:2)
      GRTYP = ' ' ; IF (PKTYP == 'SQ') GRTYP = GETHIC( 'GRTYP',JBUF )
      IF (GRTYP == 'Z') CALL MakZref( NF,OK )
      
      DO  I=1,HEAD
          IBUF(I) = JBUF(I)
      END DO

      WRITE(KIND,0004) IBUF(1)
      TIME  =          IBUF(2)
      WRITE(NAME,0004) IBUF(3)

          NL0 = NLEV
          NR  = NL0
      IF (KIND.EQ.'ZONL' .AND. NLEV.EQ.IBUF(6))
     +    NR  = 1

***    SE RENDRE A LA FIN DE LA PREMIERE VARIABLE.

      DO  I=1,NR

          CALL SUIVANT( NF, JBUF,ERROR,OK )
          IF (ERROR .OR. .NOT.OK) GOTO 300

          WRITE(KIND,0004) JBUF(1)

***        NE PAS CONSIDERER LES ENREGISTRMENTS DE TYPE LABL ET CHAR.

          IF (KIND.EQ.'LABL' .OR. KIND.EQ.'CHAR')              THEN
              CALL SUIVANT( NF, JBUF,ERROR,OK )
              IF (ERROR .OR. .NOT.OK) GOTO 300
          END IF

      END DO

      CALL LBLCHK( LEN, NWDS,PACK,IBUF )

***    SAVE NAME AND TRY TO GET ANOTHER MULTI-LEVEL VARIABLE.

  100 IF (NVAR.GE.MAXV)                                        THEN
          NVAR = 0
          RETURN
      END IF

      NVAR      = NVAR+1
      NOM(NVAR) = NAME

      MAXLEN    = MAX( LEN,MINREC, MAXLEN )

  200 CONTINUE

          DO  I=1,NR

              CALL SUIVANT( NF, JBUF,ERROR,OK )

              IF (ERROR .OR. .NOT.OK)                          THEN
                  IF (I.EQ.1) GOTO 300
                  WRITE(6,6001) NVAR+1,I,NR
                  CALL                             XIT(' Getsiz3',-1 )
              END IF

***            ENCORE UNE FOIS, NE PAS CONSIDERER LES LABL ET CHAR.

              WRITE(KIND,0004) JBUF(1)

              IF (KIND.EQ.'LABL' .OR. KIND.EQ.'CHAR')          THEN
                  CALL SUIVANT( NF, JBUF,ERROR,OK )
                  IF (ERROR .OR. .NOT.OK) GOTO 300
              END IF

          END DO

***        COMPARER LES DERNIER ET
***        PREMIER ENREGISTREMENTS.

          CALL CMPLBL( 0,IBUF, 0,JBUF, COMPARE )

          IF (.NOT.COMPARE)                                    THEN
              WRITE(6,6002)
              CALL PRTLAB2(' First ibuf: ',IBUF )
              CALL PRTLAB2(' Last  ibuf: ',JBUF )
              CALL                                 XIT(' Getsiz3',-2 )
          END IF

          WRITE(NAME,0004) JBUF(3)
          NIVEAU = JBUF(4)

          IF (NR*NL0.EQ.1 .AND. .NOT.TIMT)                     THEN

***            FILEV N'A TROUVE QU'UN SEUL NIVEAU.
***            VERIFIER S'IL N'EN A PAS D'AUTRES,
***            ASSOCIES A DES PAS DE TEMPS DIFFERENTS.

              IF (NAME.NE.NOM(NVAR))                           THEN

***                NOUVELLE VARIABLE.INITIALISER
***                LE COMPTEUR DE NIVEAUX.

                  NL        = 1

***                VERIFIER QUE L'ON A LE MEME JEUX
***                DE NIVEAUX POUR CETTE VARIABLE

                  IF (NIVEAU.NE.LEV(NL))                       THEN
                      call get_ip1_string( LEV(NL),string1 )
                      call get_ip1_string( NIVEAU ,string2 )
                      WRITE(6,6003) TRIM( string1 ),TRIM( string2 )
                      CALL                         XIT(' Getsiz3',-3 )
                  END IF

              ELSE

                  IF (NVAR.EQ.1)                               THEN

***                    S'ASSURER QU'ON A VRAIMENT
***                    UN NOUVEAU NIVEAU.

                      DO  I=1,NLEV
                          IF (NIVEAU.EQ.LEV(I)) GOTO 300
                      END DO

***                    SAUVER CE NOUVEAU NIVEAU.

                      IF (NLEV.GE.MAXV)                        THEN
                          NLEV = 0
                          RETURN
                      END IF

                      NLEV      = NLEV+1
                      LEV(NLEV) = NIVEAU

                  ELSE

***                    SUITE D'UN JEUX DEJA INITIALISE.

                      NL        = NL+1

***                    VERIFIER QUE L'ON A TOUJOURS LE MEME
***                    JEUX DE NIVEAUX POUR CETTE VARIABLE.

                      IF (NIVEAU.NE.LEV(NL))                   THEN
                          call get_ip1_string( LEV(NL),string1 )
                          call get_ip1_string( NIVEAU ,string2 )
                          WRITE(6,6003)TRIM( string1 ),TRIM( string2 )
                          CALL                     XIT(' Getsiz3',-3 )
                      END IF

                  END IF

                  GOTO 200

              END IF

          END IF

***        S'ASSURER QU'ON A VRAIMENT
***        UN NOUVEAU NOM.

          DO  I=1,NVAR
              IF (NAME.EQ.NOM(I)) GOTO 250
          END DO

      IF (.NOT.TIMT .OR. 
     +        (TIMT .AND. TIME.EQ.JBUF(2)))                    THEN
          CALL LBLCHK( LEN, NWDS,PACK,JBUF )
          GOTO 100
      END IF

  250 CALL PRECEDE( NF,NR+1 )
  300 CALL PRECEDE( NF,  -1 )

      LEN     = MAX(             MAXLEN  , MAXSWRD0 + HEAD )
      MAXWRD0 = MAX( NWDS*NLEV , MAXWRD0 , MAXSWRD0 )

      IF (DEBUG) WRITE(6,6100) MAXWRD0

      GETSIZ3 = LEN - HEAD

      RETURN
*----------------------------------------------------------------------

    4 FORMAT(A4)

 6001 FORMAT(' Getsiz3: At variable ',I5,' error reading',
     +       ' record ',I5,' of ',I5)
 6002 FORMAT(' Getsiz3: More than one size ...')
 6003 FORMAT(' Getsiz3: While looking for level ',A,
     +       ', found level ',A)

 6100 FORMAT('*DEBUG:GETSIZ3',5X,'MAXWRD reset to ',I9)

      END

      INTEGER FUNCTION getsiz4 (NF,IBUF,LEN,NWDS,PACK, 
     +                          SET,NSET, LEV,NOM, MAXV)

***    CETTE ROUTINE DETERMINE LES DIFFERENTS PARAMETRES MEMOIRE
***    ASSOCIES AUX ENREGISTREMENTS D'UN FICHIER. ELLE RETOURNE LE
***    NOMBRE DE JEUX DE VARIABLES/NIVEAUX AVANT UNE REPETITION
***    D'UNE PAIRE DE NOM/NIVEAU.

***    LE FICHIER EST REMBOBINE A LA SORTIE. IL EST IMPORTANT
***    DE NOTER QUE TOUTES LES VARIABLES DOIVENT AVOIR LA MEME
***    TAILLE HORIZONTALE, MAIS PAS NECESSAIREMENT LE MEME
***    NOMBRE DE NIVEAUX VERTICAUX.

***    PARAMETRES:

*      NF   = (INPUT)  UNITE E/S
*      IBUF = (I/O)    TAMPON D'E/S
*      LEN  = (OUTPUT) LONGEUR MINIMALE DU TAMPON COMPLET
*      NWDS = (OUTPUT) NOMBRE DE MOTS REEL DECOMPACTES. CETTE VALEUR
*                      EST AUSSI GARDEE SUR MAXWRD SI NWDS>MAXWRD.
*      PACK = (OUTPUT) FACTEUR DE COMPRESSION
*      SET  = (OUTPUT) ORDINAL DU DERNIER ENREGISTREMENT ASSOCIE
*                      A CHAQUE JEUX DE VARIABLES
*      NSET = (OUTPUT) NOMBRE DE JEUX DE VARIABLES
*      LEV  = (OUTPUT) VERTICAL LEVELS ARRAY ; SIZE = (MAXV,2)
*      NOM  = (OUTPUT) NOM DES VARIABLES ; SIZE = SET(NSET)
*      MAXV = (INPUT)  NOMBRE MAXIMAL DE NIVEAUX ET DE VARIABLES

***    VALEUR DE RETOUR: TAILLE DE LA SECTION DONNEE (IDAT).

***    LE NOMBRE TOTAL D'ENREGISTREMENTS LUS SERA SET(NSET) < MAXV

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete
      INTEGER,    PARAMETER :: MINREC = donnee_minimale + HEAD

      INTEGER     MAXV
      INTEGER     NF,IBUF(*),LEN,NWDS,PACK, INIMAX,
     +            LEV(MAXV,2),SET(0:MAXV), NSET

      CHARACTER * ( * ) NOM(MAXV)

      INTEGER     LOCLEV(MAXV)

***    VARIABLES LOCALES.

      LOGICAL     COMPARE,OK
      CHARACTER   GRTYP,NAME*20
      CHARACTER*4 KIND,PKTYP
      INTEGER     JBUF(HEAD),TIME,I,J,NLEV,IER,SKIP,NSKIP,IP1,MAXLEN

      LOGICAL              DEBUG
      COMMON     /ZZDEBUG/ DEBUG

      INTEGER     MAXWRD0, MAXSWRD0
      COMMON     /MAXWRD/  MAXWRD0
      COMMON     /MAXSWRD/ MAXSWRD0

      CHARACTER(4) ETIK1,ETIK2,ETIK3,ETIK4
      CHARACTER(4),EXTERNAL :: GETYP,GETHIC
      EXTERNAL    FILEV2,LBLCHK,CMPLBL,
     +            SUIVANT,PRECEDE,XIT

      DATA        ETIK1,ETIK2 / ' ',' ' /
      DATA        ETIK3,ETIK4 / ' ',' ' /

*---------------------------------------------------------------------- 
***    SPECIFY ERROR RETURN VALUES.

      IP1      =-1
      LEN      = 0
      LEV(1,1) = 0
      LEV(1,2) =-1
      NLEV     = 0
      NWDS     = 0
      PACK     = 0
      GETSIZ4  = 0
      NOM(1)   = ' '
      NAME     = ' '
      NSET     = 0
      SET(0)   = 0

      MAXLEN   = 0
      NSKIP    = 0

      PKTYP    = GETYP( NF )
      PKTYP    = PKTYP(1:2)

      INIMAX   = MAXWRD0

***    FIND ALL LEVELS ASSOCIATED WITH THE FIRST VARIABLE.

      CALL FILEV2( LOCLEV,NLEV, JBUF, -NF, SKIP )

      IF (NLEV.GE.MAXV .OR. NLEV.LE.0)                         THEN
          NSET = 0
          GOTO 400
      END IF

      ! Sauver les enregisrements 'TiTac' de NF
      PKTYP = GETHIC( 'PKTYP',JBUF ) ; PKTYP = PKTYP(1:2)
      GRTYP = ' ' ; IF (PKTYP == 'SQ') GRTYP = GETHIC( 'GRTYP',JBUF )
      IF (GRTYP == 'Z') CALL MakZref( NF,OK )

      IBUF(1:HEAD) = JBUF(1:HEAD)

      TIME  =          IBUF(2)
      WRITE(NAME,0004) IBUF(3)

      IP1 = LOCLEV(NLEV)
      IF (PKTYP.EQ.'SQ')                                       THEN
          ETIK1 = GETHIC('ETIK1' ,IBUF )
          ETIK2 = GETHIC('ETIK2' ,IBUF )
          ETIK3 = GETHIC('ETIK3' ,IBUF )
          ETIK4 = GETHIC('ETIK4' ,IBUF )
      END IF

      NAME(05:08) = ETIK1
      NAME(09:12) = ETIK2
      NAME(13:16) = ETIK3
      NAME(17:20) = ETIK4

      CALL LBLCHK( LEN, NWDS,PACK,IBUF )

***    SAVE THE CURRENT VARIABLE'S NAME AND LEVELS
***    IN THE NOM AND LEV INPUT FIELDS, RESPECTIVELY.

  100 IF (NSET.GE.MAXV)                                        THEN
          NSET = 0
          GOTO 400
      END IF

          NSKIP     = NSKIP+SKIP

          NSET      = NSET+1
          SET(NSET) = SET(NSET-1)+NLEV

          MAXLEN    = MAX( LEN,MINREC, MAXLEN )
          MAXWRD0   = MAX( NWDS*NLEV , MAXWRD0 )

          DO  I=SET(NSET-1)+1,SET(NSET)
              NOM(I)   = NAME
              LEV(I,1) = LOCLEV(I-SET(NSET-1))
              LEV(I,2) = -1
          END DO

          LEV(SET(NSET-1)+1,2) = IP1

***        FIND ALL LEVELS ASSOCIATED WITH THE NEXT VARIABLE.

          CALL FILEV2( LOCLEV,NLEV, JBUF, -NF, SKIP )

          IF (NLEV + SET(NSET).GE.MAXV .OR. NLEV.LE.0)         THEN
              IF (DEBUG)                                       THEN
                  WRITE(NAME,0004) JBUF(3)
                  IF (NLEV > 0)                                THEN
                      WRITE(6,6100) NF,NLEV,SET(NSET),MAXV,NAME(1:4)
                  ELSE
                      WRITE(6,6101) NF
                  END IF
              END IF
              GOTO 300
          END IF

***        COMPARE THE CURRENT RECORD'S DESCRIPTORS
***        WITH THOSE OF THE FIRST ONE.

          CALL CMPLBL( 0,IBUF, 0,JBUF, COMPARE )

          IF (.NOT.COMPARE)                                    THEN
              WRITE(KIND,0004) JBUF(1)
              IF (KIND.NE.'CHAR')                              THEN
                  WRITE(6,6001)
                  CALL PRTLAB2(' First ibuf: ',IBUF )
                  CALL PRTLAB2(' Last  ibuf: ',JBUF )
                  CALL                             XIT(' Getsiz4',-1 )
              ELSE
                  GOTO 300
              END IF
          END IF

          WRITE(NAME,0004) JBUF(3)

          IP1 = LOCLEV(NLEV)
          IF (PKTYP.EQ.'SQ')                                   THEN
              ETIK1 = GETHIC('ETIK1' ,JBUF )
              ETIK2 = GETHIC('ETIK2' ,JBUF )
              ETIK3 = GETHIC('ETIK3' ,JBUF )
              ETIK4 = GETHIC('ETIK4' ,JBUF )
          END IF

          NAME(05:08) = ETIK1
          NAME(09:12) = ETIK2
          NAME(13:16) = ETIK3
          NAME(17:20) = ETIK4

***        MAKE SURE WE REALLY HAVE FOUND A NEW VARIABLE
***        **AND** A NEW SET OF LEVELS

          DO  I=1,NSET
              IF (NAME.EQ.NOM(SET(I)))                         THEN
                  IF ( SET(I)-SET(I-1).EQ.NLEV)                THEN
                       DO  J=1,NLEV
                           IF (LOCLEV(J).NE.LEV(SET(I-1)+J,1))  GOTO 200
                       END DO
                       IF (IP1.EQ.LEV(SET(I-1)+1,2)) GOTO 300
  200                  CONTINUE
                  END IF
              END IF
          END DO

      IF (TIME.EQ.JBUF(2))                                     THEN
          CALL LBLCHK( LEN, NWDS,PACK,JBUF )
          GOTO 100
      END IF

***    RE-POSITION THE INPUT FILE'S INTERNAL POINTER.

  300 CALL PRECEDE( NF, NLEV+SKIP+SET(NSET)+NSKIP )

      LEN     = MAX(             MAXLEN  , MAXSWRD0 + HEAD )
CCC   MAXWRD0 = MAX( NWDS*NLEV , MAXWRD0 , MAXSWRD0 )

      IF (DEBUG .AND. MAXWRD0 .NE. INIMAX) WRITE(6,6200) NF,MAXWRD0

      GETSIZ4 = LEN - HEAD

  400 CONTINUE

      RETURN
*----------------------------------------------------------------------

    4 FORMAT(A4)

 6001 FORMAT(' Getsiz4: More than one size ...')

 6100 FORMAT('*DEBUG:GETSIZ4',5X,'NF =',I5,', TOO MANY RECORDS IN SET,',
     +        I5,'+',I5,'>',I5,', IGNORING ',A)
 6101 FORMAT('*DEBUG:GETSIZ4',5X,'NF =',I5,', NLEV <= 0, IGNORING ')
 6200 FORMAT('*DEBUG:GETSIZ4',5X,'NF =',I5,', MAXWRD reset to ',I9)

      END

      CHARACTER*4 FUNCTION getyp (NFL)

***    CETTE ROUTINE DETERMINE LA VALEUR DE DEFAUT DE PKTYP.

***    NFL EST LE NUMERO DE L'UNITE D'I/O QU'IL FAUT LIRE.
***        =  0 ==> PKTYP EST EXPLICITEMENT SPECIFIEE. EN FAIT
***                 PKTYP(O) CONTIENT LA VALEUR DE DEFAUT.
***       < > 0 ==> PKTYP EST DETERMINE A PARTIR DES PREMIERS 64 BITS
***                 LUS SUR L'UNITE I/O ABS(NF). 

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      INTEGER     NFL,NF,WORD1,WORD2,IO

#     include    "machtype.cdk"

      CHARACTER*4   PKTYP(0:unite_io_maximale)
      COMMON     /ZZPKTYP/  PKTYP

      LOGICAL              INFO
      COMMON     /ZZVERBO/ INFO

      EXTERNAL    MESSYS,XIT

*----------------------------------------------------------------------
      NF = ABS( NFL )

      IF (NF.NE.0 .AND. NF.LE.unite_io_maximale 
     +            .AND. PKTYP(NF).EQ.'****')                   THEN

          IF (MACHINE.EQ.2)                                    THEN

              READ( NF, END=50,ERR=100,IOSTAT=IO ) WORD1,WORD2

              IF (WORD2.NE.0)                                  THEN
                 WRITE(PKTYP(NF),'(A4)') WORD2
                 IF (BIGENDI.EQ.0) CALL SWAPA4( PKTYP(NF) )
              ELSE
                  PKTYP(NF) = PKTYP(0)
              END IF

          ELSE IF (MACHINE.EQ.1)                               THEN

              READ( NF, END=50,ERR=100,IOSTAT=IO ) WORD1
              WRITE(PKTYP(NF),'(4X,A4)') WORD1

          END IF

          BACKSPACE( NF ,ERR=100,IOSTAT=IO )

      ELSE IF (NF.GT.unite_io_maximale)                        THEN

          GOTO 100

      END IF

***    SPECIFIER LES VALEURS DE DEFAUTS.

  050 IF (PKTYP(NF).NE.'    ' .AND.
     +    PKTYP(NF).NE.'PK84' .AND.
     +    PKTYP(NF).NE.'SQ98' .AND.
     +    PKTYP(NF).NE.'SQ89' )    PKTYP(NF) = PKTYP(0)

      GETYP = PKTYP(NF)

      RETURN

***    BRANCHEMENT DE FIN DE FICHIER OU DE TRAITEMENT D'ERREUR.

  100 IF (IO.NE.0)                                             THEN
          IF (INFO) WRITE(6,6000) NF,IO
          IF (IO.GT.0) CALL MESSYS( 'In Getyp...' )
          CALL                                     XIT('  Getyp ',-1 )
      END IF

      GETYP = '****'

  101 RETURN
*---------------------------------------------------------------------

 6000 FORMAT('   Getyp on unit ',I3,' returns I/O error number ',I5)

      END
      SUBROUTINE getzx2 (NF,ZX,LR,LEV,NLEV,IBUF,MAXPK,OK)

***    MODIFIEE par B.Dugas, RPN - Mai 8/91:
***     ... Ajouter la variable NEWL (i.e. 'NEWL' level).
***    MODIFIEE par B.Dugas, RPN - Mars 19/91:
***     ... LR peut etre nul a l'entree.
***    MODIFIEE par B.Dugas, RPN - Fevrier 12/91:
***     ... Ajouter le mode de lecture a multi-niveaux.

***    AUTHOR: J.D.HENDERSON - NOV  5/80

***    READS NEXT CROSS-SECTION FROM FILE NF INTO ARRAY ZX(LR,NLEV). 
***    IT ASSUMES THAT THE SET ENDS WHEN IT ENCOUNTERS EITHER A NEW
***    TIMESTEP, AN END OF FILE, A NEW NAME, OR THE FIRST LEVEL IS
***    REPEATED. LABL RECORDS ARE IGNORED.  LEV(NLEV) IS SET TO THE
***    LEVEL VALUES FROM IBUF(4).

***    IBUF MUST CONTAIN 8 WORDS FOR THE LABEL AND ENOUGH EXTRA WORDS
***    TO CONTAIN A PACKED ROW.  IBUF(1-8) RETURNS WITH LAST LABEL IN 
***    THE SET. AN IMMEDIATE E-O-F RETURNS WITH NLEV=0.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      INTEGER     INITLK,LEVELK
      CHARACTER   ETIKET*16,INIKET*16
      INTEGER     NF,MAXPK, LR,NLEV,LEV(*), IBUF(*),
     +            IB(HEAD), INITA,INITL,    INITT,INITN,
     +            INITD,    DEBUT,FIN,      I,L,INFMOT(0:unite_io_maximale),
     +            MAXB,     MAXWRD0,         MAXW

      LOGICAL     OK,REC,   MVALUE,LVAL,    INFO, IO64B
      CHARACTER*4 TYPE,     NAME,RECABT,    WARN*10
      REAL(8)     ZX8,      ZXTEMP8,        EPSILON,MISFLAG
      REAL        ZX(*),    ZXTEMP

      POINTER   ( PZ,ZX8(1) )

      LOGICAL,    EXTERNAL :: GETIO64
      EXTERNAL    RECGET,RECUP2,GETLEV,PRECEDE

      SAVE        WARN

      COMMON     /LIRZXL/  INFMOT
      COMMON     /ZZVERBO/ INFO
      COMMON     /MAXWRD/  MAXWRD0

      INTEGER     GETKIND
      CHARACTER*4 GETHIC,NEWL,HNEWL,GETYP,PKTYP
      EXTERNAL    GETHIC,GETKIND,GETYP,GETRABT

      DATA        NEWL / 'NEWL' /
      DATA        INIKET / ' ' /,
     +            ETIKET / ' ' /
      DATA        INITLK /  0  /,
     +            LEVELK /  0  /

*-------------------------------------------------------------------
      IO64B = GETIO64( IO64B ) ; CALL GETRABT( RECABT )

      MAXB  = MAXWRD0
      PKTYP = GETYP( NF )

***    GET THE NEXT RECORD THAT IS PART OF A CROSS-SECTION.

      NLEV = 0 ; MVALUE = .FALSE.
  100 CALL RECGET( NF, 'ZONL',-1,' ',-1, IBUF,MAXPK,OK )
      IF (.NOT.OK) RETURN

      IF (IO64B) PZ = LOC( ZX(1) )

      INITT = IBUF(2) 
      INITN = IBUF(3) 
      INITL = IBUF(4) 
      INITD = IBUF(5)
      INITA = IBUF(6)

      IF (PKTYP(1:2).EQ.'SQ')                                  THEN
          INITLK            = GETKIND( )
          INIKET(01:04)     = GETHIC ( 'ETIK1',IBUF )
          INIKET(05:08)     = GETHIC ( 'ETIK2',IBUF )
          IF (PKTYP.NE.'SQ89')                         THEN
              INIKET(09:12) = GETHIC ( 'ETIK3',IBUF )
              INIKET(13:16) = GETHIC ( 'ETIK4',IBUF )
          END IF
      END IF

      HNEWL = GETHIC('NEWL',IBUF )
      WRITE( NAME,4 ) INITN
      IF (NAME.EQ.'++' .or.
     +    NAME.EQ.'>>' .or.
     +    NAME.EQ.'^^' .or.
     +    NAME.EQ.'^>' .or.
     +    NAME.EQ.'!!' .or.
     +    NAME.EQ.'HY')
     +    GOTO 100

***    CHECK FOR NEW VALUES OF LR.

      IF (LR.EQ.0)                                             THEN
          LR = IBUF(5)
      ELSE IF (LR.NE.IBUF(5) .AND. WARN.NE.'Deja donne')       THEN
          IF (INFO) WRITE(6,6000) LR,IBUF(5)
          WARN = 'Deja donnee'
          LR   =  IBUF(5)
      END IF

***    CHECK FOR SINGLE- OR MULTI-LEVEL MODE OF OPERATION.

      IF (INITA.EQ.1)                                          THEN

          INFMOT(NF) = -1

***        READ THE REST OF THE CROSS-SECTION ONE LEVEL AT A TIME.

  150     NLEV = NLEV+1

              IF (NLEV*LR.GT.MAXWRD0 .AND. MAXWRD0.NE.-1)      THEN

                  IF (RECABT.EQ.'&NON')                        THEN
                      CALL PRECEDE( NF,NLEV )
                      NLEV    =  0
                      MAXPK   =  0
                      MAXWRD0 =  0
                      OK      = .FALSE.
                      RETURN
                  END IF

                  IF (INFO)                                    THEN
                      CALL PRTLAB2(' Getzx2: Ibuf = ',IBUF )
                      WRITE(6,6001) NLEV,MAXWRD0
                  END IF

                  CALL                             XIT(' Getzx2 ',-1 )

              END IF

              DEBUT     = LR*(NLEV-1)+1
              LEV(NLEV) = IBUF(4)

              IF (IO64B)                                       THEN
                  CALL RECUP2( ZX8(DEBUT),IBUF )
              ELSE
                  CALL RECUP2( ZX (DEBUT),IBUF )
              END IF

              DO  I=1,HEAD
                  IB(I)=IBUF(I) 
              END DO

***            DETECTION DE LA PRESENCE DE VALEURS MANQUANTES ?

              CALL MISPAR( LVAL,MISFLAG,EPSILON )
              MVALUE = (LVAL .OR. MVALUE)

***            PASSER AU PROCHAIN ENREGISTREMENT.

              MAXW = MAXPK
              CALL RECGET( NF, ' ',-1,' ',-1, IBUF,MAXW,REC )

              IF (.NOT.REC)                                    THEN
                  IF (MAXW.EQ.0)                               THEN 
                      IF (IBUF(3).EQ.INITN .AND.
     +                    IBUF(4).NE.INITL)                    THEN
                          NLEV    = 0
                          MAXPK   = 0
                          OK      = REC
                          RETURN
                      ELSE
                          MAXWRD0 = MAXB
                      END IF
                  END IF
                  GOTO 211
              END IF

              IF (PKTYP(1:2).EQ.'SQ')                          THEN
                  LEVELK            = GETKIND( )
                  ETIKET(01:04)     = GETHIC ( 'ETIK1',IBUF )
                  ETIKET(05:08)     = GETHIC ( 'ETIK2',IBUF )
                  IF (PKTYP.NE.'SQ89')                         THEN
                      ETIKET(09:12) = GETHIC ( 'ETIK3',IBUF )
                      ETIKET(13:16) = GETHIC ( 'ETIK4',IBUF )
                  END IF
              END IF

              WRITE( TYPE,4 ) IBUF(1)
              IF (TYPE   .NE.'ZONL' .OR.
     +            IBUF(2).NE.INITT  .OR.
     +            IBUF(3).NE.INITN  .OR.
     +            IBUF(4).EQ.INITL  .OR.
     +            LEVELK .NE.INITLK .OR.
     +            ETIKET .NE.INIKET .OR.
     +            IBUF(5).NE.INITD)  GOTO 210

          GOTO 150

***        BACKSPACE AND RESTORE IBUF BEFORE RETURNING 
***        IF NOT AT EOF.

  210     CALL PRECEDE( NF,1 )
          IF (LEVELK.NE.INITLK) CALL SETKINDI( INITLK )

  211     DO  I=1,HEAD
              IBUF(I)=IB(I) 
          END DO

***        ACTIVER LES VALEURS MANQUANTES SI ELLES ONT ETE
***        DETECTEES DANS AU MOINS UN ENREGISTREMENT.

          IF (MVALUE) CALL SET_MISPAR( MISFLAG,EPSILON )

      ELSE

***        UNPACK THE CROSS-SECTION ARRAY AND 
***        RETREIVE THE LEVEL INFORMATION.

          NLEV = INITA
          CALL RECUP2( ZX,IBUF )

***        IF NEW LEVEL INFO IS NEEDED, GET IT.

          IF (NLEV.NE.INFMOT(NF) .OR. HNEWL.EQ.NEWL)           THEN

              DO  I=1,HEAD
                  IB(I) = IBUF(I)
              END DO

              CALL GETLEV( NF,LEV,NLEV,IBUF, REC )

              DO  I=1,HEAD
                  IBUF(I) = IB(I)
              END DO

***            INITIALIZE LEV TO SOMETHING USEFULL AND
***            MONOTONOUS IF GETLEV WAS UNSUCESSFULL.

              IF (.NOT.REC .AND. INFMOT(NF).EQ.-1)             THEN
                  CALL SETKIND( 'ARBITRAIRE' )
                  DO  L=1,NLEV
                      LEV(L) = L
                  END DO
                  INFMOT(NF) = NLEV
              ELSE IF (PKTYP(1:2).EQ.'SQ' .AND.
     +                 INFMOT(NF).EQ.NLEV)                     THEN
                  INITLK = GETKIND( )
                  IF (INITLK.EQ.6)                             THEN
                      CALL CONVPR( IBUF(4),1.0,INITLK,+2 )
                  ELSE
                      CALL CONVPR( IBUF(4),0.0,INITLK,+2 )
                  END IF
              END IF

          END IF
          
***        Inverser l'order des niveaux (du haut bas vers le bas).

          DO  350 L=1,NLEV/2

              DEBUT = LR*(L-1)
              FIN   = LR*(NLEV-L)

              IF (IO64B)                                       THEN
                  DO  I=1,LR
                      ZXTEMP8      = ZX8(I+DEBUT)
                      ZX8(I+DEBUT) = ZX8(I+FIN  )
                      ZX8(I+FIN  ) = ZXTEMP8
                  END DO
              ELSE
                  DO  I=1,LR
                      ZXTEMP      = ZX(I+DEBUT)
                      ZX(I+DEBUT) = ZX(I+FIN  )
                      ZX(I+FIN  ) = ZXTEMP
                  END DO
              END IF

  350     CONTINUE

      END IF

      RETURN

*----------------------------------------------------------------------
    4 FORMAT(A4)

 6000 FORMAT(' Getzx2 finds a conflict between LR and IBUF(5)'/
     +       ' Re-defining LR. Old/new values are: ',2I6)
 6001 FORMAT(' Getzx2: Nlev = ',I6,'. MaxWord too small in',
     +       ' single level mode ',I7/)

      END 
      INTEGER FUNCTION gethigh (NAME,IBUF)

      IMPLICIT          none

***    Cette routine lit les mots qui ont ete
***    places dans la section haute de IBUF
***    en format entier.

      INTEGER           IBUF(taille_entete)
      CHARACTER * ( * ) NAME

***    Variables locales.

      INTEGER           VALUE
      CHARACTER(4)      PKTYP
      CHARACTER(8)      NOM

      LOGICAL                    info
      COMMON           /ZZVERBO/ info

      EXTERNAL          LOW2UP,XIT

*------------------------------------------------------------------------------
      VALUE = -1

***    Convertir name en majuscules.

      nom = NAME
      call LOW2UP( nom,nom )

***    Definir PKTYP

      WRITE(PKTYP,'(A4)') IBUF(10)

***    On connait ce nom ?

      SELECT CASE ( NOM )

         CASE('LEN')
            VALUE = IBUF(11)
         CASE('DEET')
            VALUE = IBUF(12)
         CASE('NPAS')
            VALUE = IBUF(13)
         CASE('DATEO')
            VALUE = IBUF(14)
         CASE('IG1')
            VALUE = IBUF(15)
         CASE('IG2')
            VALUE = IBUF(16)
         CASE('IG3')
            VALUE = IBUF(17)
         CASE('IG4')
            VALUE = IBUF(18)
         CASE('DATYP')
            VALUE = IBITS( IBUF(19), 0, 9 )
         CASE('DIMSUP1')
            VALUE = IBITS( IBUF(19), 9,13 ) + 1
         CASE('DIMSUP2')
            VALUE = IBITS( IBUF(19),22,10 ) + 1
         CASE('IP1')
            VALUE = IBUF(20)
         CASE('IP2')
            VALUE = IBUF(21)
         CASE('IP3')
            VALUE = IBUF(22)
         CASE('RKIND')
            VALUE = IBUF(29)
            IF (PKTYP(1:2) /= 'SQ') VALUE = -1
         CASE DEFAULT
            IF (INFO) WRITE(6,6001) NOM
            CALL                                   XIT(' Gethigh',-1 )

      END SELECT

      gethigh = VALUE

      RETURN
*------------------------------------------------------------------------------

 6001 FORMAT(' Gethigh: unknown integer parameter name ',A)

      END
      CHARACTER(4) FUNCTION gethic (NAME,IBUF)

      IMPLICIT          none

***    Cette routine lit les mots qui ont ete
***    places dans la section haute de IBUF
***    et les retourne en format caracteres.

      INTEGER           IBUF(taille_entete)
      CHARACTER * ( * ) NAME

***    Variables locales.

      CHARACTER(8)      NOM
      CHARACTER(4)      VALUE,VTEMP

      LOGICAL                    info
      COMMON           /ZZVERBO/ info

      EXTERNAL          LOW2UP,XIT

*------------------------------------------------------------------------------
      VALUE = ' '

***    Convertir name en majuscules.

      nom = NAME
      call LOW2UP( nom,nom )

***    On connait ce nom ?

      SELECT CASE ( NOM )

         CASE('GRTYP')
            WRITE(vtemp,0004) IBUF(9)
            VALUE = vtemp(3:3)
         CASE('TYPVAR')
            WRITE(vtemp,0004) IBUF(9)
            VALUE = vtemp(1:2)
         CASE('PKTYP')
            WRITE(VALUE,0004) IBUF(10)
         CASE('NEWL')
            WRITE(VALUE,0004) IBUF(23)
         CASE('NAME')
            WRITE(VALUE,0004) IBUF(24)
         CASE('ETIK1')
            WRITE(VALUE,0004) IBUF(25)
         CASE('ETIK2')
            WRITE(VALUE,0004) IBUF(26)
         CASE('ETIK3')
            WRITE(VALUE,0004) IBUF(27)
         CASE('ETIK4')
            WRITE(VALUE,0004) IBUF(28)

         CASE DEFAULT
            IF (INFO) WRITE(6,6001) NOM
            CALL                                   XIT(' Gethic ',-1 )

      END SELECT

      gethic = VALUE

      RETURN
*------------------------------------------------------------------------------

 0004 FORMAT(A4)
 6001 FORMAT(' Gethic: unknown character parameter name ',A)

      END
      REAL FUNCTION gethir (NAME,IBUF)

      IMPLICIT          none

***    Cette routine lit les mots qui ont ete
***    places dans la section haute de IBUF
***    et les retourne en format REAL.

      INTEGER           IBUF(taille_entete)
      CHARACTER * ( * ) NAME

***    Variables locales.

      CHARACTER(8)      NOM
      REAL              VALUE

      LOGICAL                    info
      COMMON           /ZZVERBO/ info

      EXTERNAL          LOW2UP,XIT

*------------------------------------------------------------------------------
      VALUE = 0.0

***    Convertir name en majuscules.

      nom = NAME
      call LOW2UP( nom,nom )

***    On connait ce nom ?

      SELECT CASE ( NOM )

         CASE('HIVAL')
            VALUE = TRANSFER( IBUF(30), 1. )
         CASE('LOVAL')
            VALUE = TRANSFER( IBUF(31), 1. )

         CASE DEFAULT
            IF (INFO) WRITE(6,6001) NOM
            CALL                                   XIT(' Gethir ',-1 )

      END SELECT

      gethir = VALUE

      RETURN
*------------------------------------------------------------------------------

 6001 FORMAT(' Gethir: unknown character parameter name ',A)

      END
      INTEGER FUNCTION GETIPMODE( IBUF )

      INTEGER, EXTERNAL :: GETSAMPLZ

      INTEGER NSAMPZ,RKIND,IPMODE,IBUF(*)
      REAL    HIVAL,LOVAL

      NSAMPZ = GETSAMPLZ( RKIND,HIVAL,LOVAL,IPMODE, IBUF )

      GETIPMODE = IPMODE

      RETURN
      END
      INTEGER FUNCTION GETSAMPLZ( RKIND,HIVAL,LOVAL,IPMODE, IBUF )

      ! Objet:
      ! Cherche a determiner le nombre d'echantillons qui a pu
      !  etre code dans IP2/IP3, selon l'usage qui est fait des
      !  IP1/IP2/IP3, i.e. avec ou sans interval verticaux ou
      !  de temps, en tenant aussi compte de la presence des
      !  codage OLD-STYLE ou bien NEW-STYLE.

      ! Notez que les limites des codages utilises ici
      ! sont les suivantes:
      !  254903968   <=  IP <= 267486880 pour KIND_SAMPLES
      ! 0.100000E+07 >= VIP >=    0.0
      !  171017888   <=  IP <= 183500800 pour KIND_HOURS

      ! Les valeurs codees < 171017888 ne representent
      ! donc ni des heures ni des nombres d'echantillons.
      
      ! Auteur: B. Dugas (UQAM/RPN)

      ! Revision: version original, septembre 2016.
      ! 
      ! Revision 1 2017/07/28 17:17  dugas
      ! - Supporter l'implementation des sorties GEM 4.8+ codees avec
      !   les nouvelles options de codages des IP1/2/3. Celles-ci sont
      !   maintenant correctement identifiees comme des echantillons.
      ! - Correction aux codages des (HIVAL,LOVAL) de moyennes de
      !   fichiers OLD-STYLE pour les rendre identiques aux autres
      !   codages: Ajouter un offset de DEET aux deux variables.
      !      
      ! Revision 2 2017/10/20 20:20  dugas
      !  Tenir compte de la signature de moyennes (/) ou de
      !  variances (%) dans le deuxieme caracteres du TYPVAR

      use          convert_ip123_int, only : KIND_HOURS, KIND_SAMPLES
      use          stats_signatures

      IMPLICIT     none

      ! Arguments

      INTEGER,     INTENT(IN)  :: IBUF(*)
      INTEGER,     INTENT(OUT) :: RKIND,IPMODE
      REAL,        INTENT(OUT) :: HIVAL,LOVAL

      ! Variables locales

      REAL(8)      TDIFF
      LOGICAL      lMeanVar,vMeanVar
      REAL         VIP2,VIP3,HEURES
      INTEGER(8)   TIME_RANGE,VIP2_5,
     +             NPAS_DEET,  NPAS_DEET60,  NPAS_DEET3600,
     +             NPASP1_DEET,NPASP1_DEET60,NPASP1_DEET3600
      INTEGER      IP1,IP2,IP3, NPAS,DEET,IKIND, NSAMPZ, DATEO,DATEV, IPM
      CHARACTER(2) NULS,PKTYP,typvar

      CHARACTER(4),EXTERNAL :: GETHIC
      INTEGER,     EXTERNAL :: GETHIGH
      REAL(4),     EXTERNAL :: GETHIR

!------------------------------------------------------------------------------
      NSAMPZ = 1 ! Initialiser au cas on le decodage ne donne rien
      IPMODE =-1

      PKTYP  = GETHIC('PKTYP' ,IBUF )

      IF (PKTYP /= 'SQ')                                       THEN
          ! Comparer IBUF(2) a la plus petite valeur
          ! associee a un "DATE-TIME STAMP group" valide.
          IF (IBUF(2) < 01 01 00 01 0) GETSAMPLZ = IBUF(2)
          RKIND = -1
          RETURN
      END IF

      typvar = GETHIC('TYPVAR',IBUF )

      ! Signature d'une operation temporelle ?
      lMeanVar = .FALSE. ; vMeanVar = .FALSE.
      if (typvar(2:2) == time_mean_signature .OR.
     +    typvar(2:2) == variance_signature .OR.
     +    typvar(2:2) == median_signature .OR.
     +    typvar(2:2) == stdev_signature .OR.
     +    typvar(2:2) == timmax_signature .OR.
     +    typvar(2:2) == timmin_signature ) lMeanVar = .true.

      if (.not.lMeanVar)                                       THEN
          if (typvar == 'MN' .OR. typvar == 'VA') vMeanVar =  .TRUE.
      end if

      ! Verifier si on a un interval temporel OU VERTICAL encode
      !  dans ibuf et retoruner les valeurs correspondantes
      RKIND = GETHIGH('RKIND',IBUF )
      HIVAL = GETHIR ('HIVAL',IBUF )
      LOVAL = GETHIR ('LOVAL',IBUF )

      DATEO = GETHIGH('DATEO',IBUF )
      DEET  = GETHIGH('DEET',IBUF )
      NPAS  = GETHIGH('NPAS',IBUF )

      HEURES = 0.

      NPAS_DEET   = 0 ; NPAS_DEET60   = 0 ; NPAS_DEET3600   = 0
      NPASP1_DEET = 0 ; NPASP1_DEET60 = 0 ; NPASP1_DEET3600 = 0

      IF (DEET > 0.)                                           THEN
          NPAS_DEET   = NINT(  NPAS   *DBLE( DEET )/5., 8 )
          NPASP1_DEET = NINT( (NPAS+1)*DBLE( DEET )/5., 8 )
          HEURES = NPAS*(DBLE( DEET )/60.)/60.
          IF (MOD( NPAS,60 ) == 0 .AND. NPAS/60 /= 0) THEN
             NPASP1_DEET60 = 
     +           NINT( ((NPAS/60)+1)*DBLE( DEET*60 ) / 5, 8 )
             NPAS_DEET60   = 
     +           NINT(  (NPAS/60)   *DBLE( DEET*60 ) / 5, 8 )
          END IF
          IF (MOD( NPAS,3600 ) == 0 .AND. NPAS/3600 /= 0) THEN
             NPASP1_DEET3600 = 
     +           NINT( ((NPAS/3600)+1)*DBLE( DEET*3600 ) / 5, 8 )
             NPAS_DEET3600   = 
     +           NINT(  (NPAS/3600)   *DBLE( DEET*3600 ) / 5, 8 )
          END IF
      END IF
          
      IF (RKIND >=0) IPMODE = 1

      IF (lMeanVar)                                            THEN

          ! Signature de moyennes (/) ou de variances (%) detectees.
          ! IP3 devrait alors contenir le nombre d'echantillons
          ! NSAMPZ (KIND_SAMPLES), DATEO la date de validitee du
          ! premier echantillon et DATEV celle du dernier. De
          ! plus, si NSAMPZ=NPAS+1, on a alors un ensemble complet
          ! et IP2 pourrait alors contenir l'heure absolue de
          ! prevision (KIND_HOURS).

          IP3   = MAX( 1, GETHIGH('IP3' ,IBUF ) )

          CALL diag_convip_plus( IP3,VIP3,IKIND,-2,NULS,.FALSE. )

          IF (IKIND == KIND_SAMPLES)                           THEN
              IPMODE = 1 ; NSAMPZ = NINT( VIP3 )
          ELSE
              GOTO 999
          END IF

          IP2   = GETHIGH('IP2' ,IBUF )

          IF (IP2*720_8 == NPAS_DEET)                          THEN
              ! ip2 = npas*deet a 5 secondes pres ==>
              VIP2 = IP2 ; IKIND = KIND_HOURS
          ELSE
              CALL diag_convip_plus( IP2,VIP2,IKIND,-2,NULS,.FALSE. )
          END IF

          IF (IKIND == KIND_HOURS)                             THEN
              HIVAL = VIP2
              LOVAL = HIVAL-(NPAS_DEET/720.0_8)
          ELSE
              HIVAL = NPAS_DEET/720.0_8
              LOVAL = 0.0
          END IF
              
      ELSE IF (vMeanVar)                                       THEN

          ! Codage utilise par les routines
          ! de traitement temporel de MFV.

         NSAMPZ = MAX( 1, GETHIGH('IP3' ,IBUF ) )
         LOVAL = 0.0 ; HIVAL = HEURES ; IPMODE = 0
          
      ELSE IF (RKIND == KIND_HOURS)                            THEN

          ! Interval de temps.
          !  On suppose que c'est le debut d'un interval deja
          !  moyenne lorsque (HIVAL-LOVAL) corresponds a
          !  (NPAS+1)*DEET a 5 secondes pres.

          TIME_RANGE = NINT( (HIVAL-DBLE( LOVAL ))*720., 8 )

          IF (NPAS_DEET     == TIME_RANGE)                     THEN
              NSAMPZ = NPAS+1
          ELSE
     +    IF (NPAS_DEET60   == TIME_RANGE)                     THEN
              NSAMPZ = (NPAS/60)+1
          ELSE
     +    IF (NPAS_DEET3600 == TIME_RANGE)                     THEN
              NSAMPZ = (NPAS/3600)+1
          END IF

          IF (NSAMPZ == 1)                                     THEN
              ! On a probablement trouve un
              ! echantillon d'accumulateur
              IPMODE = -1  ; RKIND = -1
              HIVAL  = -1. ; LOVAL = -1.
          END IF

      ELSE IF (RKIND /= -1)                                    THEN

          ! Interval de coordonee verticale.
          !  Est-ce que IP2 est deja code en heures
          !  ou bien en un nombre d'echantillons ?

          IP2 = GETHIGH( 'IP2',IBUF )

          IF (IP2*720_8 == NPAS_DEET)                          THEN
              ! ip2 = npas*deet a 5 secondes pres ==>
              VIP2 = IP2 ; IKIND = KIND_HOURS
          ELSE
              CALL diag_convip_plus( IP2,VIP2,IKIND,-2,NULS,.FALSE. )
          END IF

          VIP2_5 = NINT( VIP2*720._8, 8 )

          IF (IKIND == KIND_HOURS)                             THEN

              ! IP2 est encode en heures et cette derniere
              !  valeur est egale a (NPAS+1)*DEET/3600 
              IF (NPASP1_DEET     == VIP2_5)                   THEN
                  NSAMPZ = NPAS+1
              ELSE
     +        IF (NPASP1_DEET60   == VIP2_5)                   THEN
                  NSAMPZ = (NPAS/60)+1
              ELSE
     +        IF (NPASP1_DEET3600 == VIP2_5)                   THEN
                  NSAMPZ = (NPAS/3600)+1
              END IF

          ELSE IF (IKIND == KIND_SAMPLES)                      THEN

              ! IP2 est deja code en nombre d'echantillons
              NSAMPZ = NINT( VIP2 )

          ELSE

              ! Codage de type OLD-STYLE. On suppose qu'on
              ! a mis le nombre d'echantillon dans IP2
              ! lorsque IP2 = NPAS+1
              IF (IP2 == NPAS+1
     +       .OR.(IP2 == (NPAS/60)+1    .AND.
     +            MOD( NPAS,60 ) == 0)
     +       .OR.(IP2 == (NPAS/3600)+1  .AND.
     +            MOD( NPAS,3600 ) == 0))                      THEN
                  NSAMPZ = IP2
              END IF

              IF (NSAMPZ > 1) IPMODE = 0

          END IF

      ELSE ! IP3 est "libre". On suppose qu'il contient alors un
           !  nombre d'echantillons, possiblement code en mode
           !  KIND_SAMPLES. Sinon, on ignore tout codage et
           !  on est en mode de compatibilite arriere

          IP3 = GETHIGH( 'IP3',IBUF )

          IF (IP3 > 32767)                                     THEN

              CALL diag_convip_plus( IP3,VIP3,IKIND,-2,NULS,.FALSE. )

              IF (IKIND == KIND_SAMPLES)                       THEN
                  NSAMPZ = NINT( VIP3 ) ; IPMODE = 1
              ELSE
                  ! Mode compatibilite arriere (partie 1)
                  NSAMPZ = IP3 ; IPMODE = 0
                  LOVAL = DEET ; HIVAL = HEURES+DEET
              END IF

          ELSE IF (IP3 > 1)                                    THEN

              ! Mode compatibilite arriere (partie 2)
              NSAMPZ = IP3 ; IPMODE = 0
              LOVAL = DEET ; HIVAL = HEURES+DEET

          END IF

      END IF

  999 GETSAMPLZ = NSAMPZ

      RETURN
!------------------------------------------------------------------------------
 6001 FORMAT(' New- and Old-style IP1/2/3 coding detected in data.')

      END FUNCTION GETSAMPLZ
