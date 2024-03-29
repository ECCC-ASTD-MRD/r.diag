#     if defined (AUTO_DOC)
*
*     * LSPGM contient l'historique des revisions a la version UNIX/LINUX
*     * (32 bits real/integer) de LSPGM. Cette version a d'abord ete codee
*     * pour des ordinateurs de type MIPS, puis pour des ordinateurs HP9000.
*     * Certaines extensions MP de Silicon Graphics ont deja ete supportees
*     * mais sont aujourd'hui commentees. Dans ce dernier cas, la variable
*     * CPP "nombre_de_taches" servait a determiner le nombre maximal
*     * de processeurs allouables.
*
*     $Log: driver.ptn,v $
*     Revision 4.125 2020/02/25 17:17  dugas
*     - Introduire l'alias VSINTHL dans VSINTH.
*
*     Revision 4.125 2020/02/25 17:17  dugas
*     - Sauver nomprg via 'CALL PUTVERB'.
*
*     Revision 4.124 2019/12/05 16:16  dugas
*     - Faire appel a DIAG_CCARD plutot qu'a la routine CCARD dans LSPGM.
*
*     Revision 4.123 2019/11/20 15:15  dugas
*     - Ajouter le programme OilFill de MFV.
*
*     Revision 4.122  2019/06/04 17:17  dugas
*     - Passer a la version 6.4.5 (development).
*
*     Revision 4.121  2019/05/16 14:14:14  dugas
*     - Ajouter le module AVERAGES de MFV (version adaptee)
*     - Re-ordonner la liste des declaration de modules EXTERNAL
*     
*     Revision 4.120  2018/08/16 15:15:15  dugas
*     Passer a la version 6.4.4 (development) et
*     legere revision de la documentation.
*
*     Revision 4.119  2018/04/09 15:15:15  dugas
*     Passer a la version 6.4.3 (development).
*
*     Revision 4.118  2018/02/20 10:10:10  dugas
*     Petite correction au traitement du premier argument
*
*     Revision 4.117  2018/01/30 14:14:14  dugas
*     - Remplacer GETARG par GET_COMMAND_ARGUMENT et utiliser
*       COMMAND_ARGUMENT_COUNT pour obtenir le # d'arguments.
*
*     Revision 4.116  2018/01/28 16:16:16  dugas
*     - Ajouter la verification de nomprg='-VERSION' dans DRIVER
*     - Modifier la sortie 'DAT' de PROGRAM_VERSION
*
*     Revision 4.115  2017/11/21 15:15:15  dugas
*     Passer a la version 6.4.2 (development).
*
*     Revision 4.114  2017/06/07 17:17:17  dugas
*     Passer a la version 6.4.1 (development).
*
*     Revision 4.113  2017/06/06 16:16:16  dugas
*     Passer a la version 6.4.0 (Release).
*
*     Revision 4.112  2015/04/28 21:54:35  dugas
*     Passer a la version 6.3.1.
*
*     Revision 4.111  2014/09/26 20:40:05  dugas
*     Passer a la version 6.3.0
*
*     Revision 4.110  2014/09/25 19:25:09  dugas
*     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG et ajouter l'option FIT3D au module FIT.
*
*     Revision 4.109  2014/02/05 21:17:58  dugas
*     Enlever une ligne redondante pour l'appel a ZXDEVP.
*
*     Revision 4.108  2014/01/28 18:26:33  dugas
*     Ajouter les alias MAKEYY et MAKEYYV au module MAKEZG.
*
*     Revision 4.107  2014/01/09 19:32:54  dugas
*     Ajouter le point d'entree MAKEZGV a MAKEZG pour le traitement des donnees vectorielles.
*
*     Revision 4.106  2013/11/28 22:20:22  dugas
*     Passer a la version 6.2.4.
*
*     Revision 4.105  2013/02/07 22:07:49  bernard
*     - Correction pour GFORTRAN (declaration EXTERNAL GETARG enlevee).
*     - Correction a la declaration de la variable UNIT5 dans LSPGM.
*
*     Revision 4.104  2012/09/07 20:56:51  dugas
*     Passer a la version 6.2.3.
*
*     Revision 4.103  2012/07/26 17:29:44  dugas
*     Passer a la version 6.2.2.
*
*     Revision 4.102  2012/07/02 21:20:42  dugas
*     Passer a 6.2.1.
*
*     Revision 4.101  2012/05/29 21:18:29  dugas
*     Passer a la version 6.2.0.
*
*     Revision 4.100  2012/02/13 18:16:02  dugas
*     Passer a la version 6.1.11
*
*     Revision 4.99  2011/09/19 17:15:05  dugas
*     Passons a la version 6.1.10
*
*     Revision 4.98  2011/08/04 19:22:22  dugas
*     Ajouter le module FSTMDIAG.
*
*     Revision 4.97  2011/07/18 20:39:52  dugas
*     Passer a la version 6.1.9
*
*     Revision 4.96  2011/07/15 21:11:55  dugas
*     Ajouter la doc pour RZONVAVG et utiliser QUIT plutot que XIT a la sortie de LSPGM.
*
*     Revision 4.95  2011/06/15 19:35:02  dugas
*     Passer a la version 6.1.8.
*
*     Revision 4.94  2011/03/25 13:40:49  dugas
*     Passer a la version 6.1.7
*
*     Revision 4.93  2011/01/13 19:17:08  dugas
*     Passer a la version 6.1.5.
*
*     Revision 4.92  2010/12/01 17:41:08  dugas
*     Passer a la version 6.1.4.
*
*     Revision 4.91  2010/10/23 17:01:22  dugas
*     Fermer la version 6.1.2, ouvrir la 6.1.3
*
*     Revision 4.90  2010/07/21 17:37:34  dugas
*     Passer a la version 6.1.1 utilisant rmn_012.
*
*     Revision 4.89  2010/07/06 15:44:12  dugas
*     Passer a la version 6.1.0.
*
*     Revision 4.88  2009/09/08 20:41:01  dugas
*     Passer a 6.0.5 et rmn_010 le 25 aout 2009.
*
*     Revision 4.87  2009/01/23 22:40:06  dugas
*     Passer a la version 6.0.4.
*
*     Revision 4.86  2008/11/24 22:00:39  dugas
*     Passer a la version 6.0.3 et ajouter une description de MSFACT.
*
*     Revision 4.85  2008/07/24 20:00:32  dugas
*     Passer a la version 6.0.2.
*
*     Revision 4.84  2008/05/03 21:06:30  dugas
*     Modification generale pour r.gppf.
*
*     Revision 4.83  2008/04/25 22:02:42  dugas
*     Passer a la version 6.0.1.
*
*     Revision 4.82  2008/01/14 17:58:18  dugas
*     Passer a la v_6.0.0.
*
*     Revision 4.81  2007/12/21 00:31:45  dugas
*     Ajouter le module ZXAGLB.
*
*     Revision 4.80  2007/09/06 17:25:36  dugas
*     Passer a la version 5.5.5
*
*     Revision 4.79  2007/08/29 19:28:39  dugas
*     RDIAG_VERSION devient PROGRAM_VERSION pour la v_5.5.4.
*
*     Revision 4.78  2006/12/18 15:42:28  dugas
*     Passer a la version 5.5.3 et utiliser rmnbeta.
*
*     Revision 4.77  2006/09/21 01:36:28  dugas
*     Fermer la version 5.5.1 et ouvrir la 5.5.2.
*
*     Revision 4.76  2006/07/19 19:21:48  dugas
*     Passer a la version 5.5.0.
*
*     Revision 4.75  2006/06/19 16:36:26  dugas
*     Passer a la version 5.4.6.
*
*     Revision 4.74  2006/04/26 16:27:12  dugas
*     Passer a la version 5.4.5.
*
*     Revision 4.73  2006/02/09 17:08:44  dugas
*     - Utiliser la librairie rmn_rc008.
*     - Ajouter le module MERIAVG (calcul de moyennes meridionales).
*     - Passer a la version 5.4.3.
*
*     Revision 4.72  2005/12/12 23:01:28  dugas
*     Modification to the info.lspgm documentation:
*     - Add ADDLEV, STDEV lines to section C
*     - Modify the TIMCOV entry in section C
*     - Add PSAGG, PSVAG lines to section D
*     - Remove the STDEV entry from section D
*
*     Revision 4.71  2005/07/28 17:48:29  dugas
*     Passer a la la version 5.4.2
*
*     Revision 4.70  2005/07/07 17:30:59  dugas
*     Version 5.4.0.
*
*     Revision 4.69  2005/04/14 18:49:38  dugas
*     Passer a la version 5.3.5
*
*     Revision 4.68  2005/01/17 19:48:52  dugas
*     Passer a la version 5.3.4.
*
*     Revision 4.67  2004/12/10 00:38:13  dugas
*     Passer a la version 5.3.3.
*
*     Revision 4.66  2004/11/26 15:54:55  dugas
*     Corriger la section info.lspgm de la documentation.
*
*     Revision 4.65  2004/11/12 19:40:37  dugas
*     - Ajouter les valeurs REVxxx et DATyyy au parametre de ligne
*       de commande "-vers" lors de l'appel au module LSPGM. Modifier
*       la routine RDIAG_VERSION en consequence.
*     - Ajouter les points d'entrees GGVECZ, ZONVAR, ZONVAVG et ZONVDEV.
*     - Ajouter le module YTOX.
*
*     Revision 4.64  2004/09/13 16:50:57  dugas
*     Ajouter le module ADDTEXT
*
*     Revision 4.62  2004/04/30 17:28:39  dugas
*     Ajouter les alias PSAGG et PSVAGG a LLAGG
*
*     Revision 4.61  2003/12/10 23:16:52  dugas
*     Ajouter MAKEZG a la section D de LSPGM
*
*     Revision 4.59  2003/09/15 15:54:40  dugas
*     Version 5.1.4
*
*     Revision 4.58  2003/01/21 15:10:01  dugas
*     Version 5.1.0 pour pollux=O3000
*
*     Revision 4.57  2002/09/17 18:57:17  dugas
*     Passer a la version 5.0.1
*
*     Revision 4.56  2002/08/26 18:13:02  dugas
*     Version 4.11.12
*
*     Revision 4.55  2002/04/22 15:54:29  dugas
*     Ajouter le modeule MAKEZG
*
*     Revision 4.54  2002/01/14 16:10:30  dugas
*     Version 4.11.5 fermee pour transfert vers CVS.
*
*     Revision 4.53  2001/11/21 16:18:43  armnrbd
*     Version 4.11.4 fermee pour transfert vers CVS.
*
*     Revision 4.52  2001/11/01 14:21:31  armnrbd
*     Deuxieme tentative de livraison de le 4.11.1
*
*     Revision 4.51  2001/10/29 14:52:37  armnrbd
*     Fermer la version officielle 4.11.1
*
*     Revision 4.50  2001/05/01 15:47:59  armnrbd
*     Ajouter les modules FLAT et SMSPEC.
*
*     Revision 4.49  2001/03/27 15:52:10  armnrbd
*     Modifier legerement le traitement de VERY_NICE_DIAG.
*
*     Revision 4.48  2001/03/24 00:51:03  armnrbd
*     Ajouter le traitement de la variable VERY_NICE_DIAG.
*
*     Revision 4.47  2000/07/21 16:49:49  armnrbd
*     Ajouter le point d'entree GSASG de GPASG.
*     Amalgamer GMLT et GDIV dans GADD.
*
*     Revision 4.46  2000/05/30 20:27:32  armnrbd
*     Ajouter le module VARSPEC dans la v4.9.4.
*
*     Revision 4.45  20/0./4.  0.:5.:0.  0.:5.:0.  armnrbd (Bernard Dugas)
*     Fermer la version officielle 4.9.1
*     
*     Revision 4.44  1999/09/27 15:44:45  armnrbd
*     Fermer la version 4.8.1
*
*     Revision 4.43  1999/08/25 17:09:41  armnrbd
*     Enlever l'appel au module GGDEV.
*     Enlever le macro NOIMSL pour EOFROT.
*
*     Revision 4.42  1999/07/15 15:53:18  armnrbd
*     Ajouter le point d'entree ZXRHUM au module GPHUM.
*
*     Revision 4.41  1999/05/19 17:24:34  armnrbd
*     Version corrigee du 17 mai 1999 (4.7.2).
*
*     Revision 4.40  1999/05/06 18:43:19  armnrbd
*     Fermer version officielle de mai 1999.
*
*     Revision 4.39  1999/04/08 22:12:13  armnrbd
*     Premiere version LINUX.
*
*     Revision 4.38  1999/03/22 20:43:33  armnrbd
*     Ajouter le module GPVTAT et le point d'entree GPTAVT.
*
*     Revision 4.37  1998/11/10  15:41:49  armnrbd
*     Ajouter la routine RDIAG_VERSION.
*
*     Revision 4.36  1998/09/22  21:03:03  armnrbd
*     Ajouter le programme GPASG.
*
*     Revision 4.35  1998/09/15  00:49:26  armnrbd
*     Ajouter XAPPEND,RMIN,RMAX,TIMMIN,TIMMAX.
*     Modifier la documentation concernant TIMCOV.
*
*     Revision 4.34  1998/07/03  01:13:09  armnrbd
*     Ajouter le point d'entree ADDLEV pour les grilles horizontales.
*
*     Revision 4.33  1998/06/09  20:34:03  armnrbd
*     Ajouter le module TSCHECK.
*
*     Revision 4.32  1998/05/29  01:08:14  armnrbd
*     Ajouter le programme ZDHDIV.
*
*     Revision 4.31  1998/05/06  17:42:25  armnrbd
*     Ajouter le module gsathlt.
*
*     Revision 4.30  1998/02/19  19:04:38  armnrbd
*     Remplacer MODULE par MODULUS.
*
*     Revision 4.29  1998/02/19  17:25:54  armnrbd
*     Ajouter le programme MODULE.
*
*     Revision 4.28  1998/01/16  19:35:23  armnrbd
*     Corriger la documentation.
*
*     Revision 4.27  1997/09/23  15:29:32  armnrbd
*     Re-diriger les appels a CDIV,CMLT,CONJMLT,DIVF,MLTF et SUBF
*     vers le module ADDF qui par la-meme devient un module multi-
*     fonctions.
*
*     Revision 4.26  1997/09/11  18:26:18  armnrbd
*     Ajouter le module SPSLOPE.
*
*     Revision 4.25  1997/09/09  15:57:28  armnrbd
*     Forcer la minimisation de nomprg.
*
*     Revision 4.24  1997/09/09  15:48:03  armnrbd
*     Ajouter l'appel a LSSUB (a de fins de documentations).
*
*     Revision 4.23  1997/06/02  20:40:50  armnrbd
*     Ajouter le module GSOMEGA.
*
*     Revision 4.22  1997/05/30  18:21:07  armnrbd
*     Ajouter le module GSOMGAH.
*
*     Revision 4.21  1997/04/09  20:41:41  armnrbd
*     Ajouter le point d'entree LLVAGG.
*
*     Revision 4.20  1997/02/17  03:35:47  armnrbd
*     Ajouter le point d'entree ACCUMUL.
*
*     Revision 4.19  1996/12/10  18:18:37  armnrbd
*     Remplacer IOPEN par ZZZOPEN.
*
*     Revision 4.18  1996/01/19  14:41:33  armnrbd
*     Ajouter les programmes PSGRID et XPAND.
*
*     Revision 4.17  1996/01/04  19:15:39  armnrbd
*     Ajouter les programmes CRITT, FTEST, T2TEST, TTESTA et TTESTE.
*
*     Revision 4.16  1995/12/06  18:59:52  armnrbd
*     Ajouter les programmes TSTEP et VBASD.
*
*     Revision 4.15  1995/11/30  16:14:09  armnrbd
*     Ajouter le programme SOLFLUX.
*
*     Revision 4.14  1995/11/22  21:08:42  armnrbd
*     Ajouter le programme LLAGG.
*
*     Revision 4.13  1995/11/20  19:36:56  armnrbd
*     Ajouter les programmes BINS, GSHUMH et VEINT.
*
*     Revision 4.12  1995/11/16  18:53:27  armnrbd
*     Ajouter les programmes BARX,BARY,DELX,DELY,CALMAP,CALPRES,
*     GADD,PLAGALC et le point d'entree STDEV dans TIMCOV.
*
*     Revision 4.11  1995/11/04  02:10:47  armnrbd
*     Ajouter les programmes GSMSLP et GSMSLPH.
*
*     Revision 4.10  1995/10/24  15:32:53  armnrbd
*     Activer les commandes ADD,MLT,SUB,DIV,SORT,WINDOW et KE.
*
*     Revision 4.9  1995/10/16  14:35:53  armnrbd
*     Ajouter le programme CTEMPS.
*
*     Revision 4.8  1995/10/03  15:56:12  armnrbd
*     Ajouter le programme SHIFTF.
*
*     Revision 4.7  1995/08/28  01:14:01  armnrbd
*     Ajouter le programme VPINTV.
*
*     Revision 4.6  1995/08/01  17:43:09  armnrbd
*     Ajouter le programme SORTF.
*
*     Revision 4.5  1995/07/10  16:03:48  armnrbd
*     Mettre a jor certaines sections d'informations automatiques.
*
*     Revision 4.4  1995/07/07  02:29:46  armnrbd
*     Equivalencer les modules INTTIM et TIMSUM.
*
*     Revision 4.3  1995/07/06  02:56:25  armnrbd
*     Ajouter les programmes FIT et TFILTER.
*
*     Revision 4.2  1995/02/13  19:47:34  armnrbd
*     Ajouter le programme GSATHL.
*
*     Revision 4.1  94/11/18  13:59:33  armnrbd
*     Ajouter la description du programme COMPLEX.
*     
*     Revision 4.0  94/11/17  14:19:51  armnrbd
*     Messages informatifs quand au passage de la version 3.x a 4.0...
*     1) Les espaces en debut des noms de variables de sont plus pertinents.
*     2) Les grilles complexes de type CMPL sont maintenant supportees.
*     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
*     4) Plusieurs nouvelles cles sont disponibles au demarrage.
*     
*     Revision 3.10  94/07/14  14:13:57  armnrbd
*     Ajouter les programmes MEMCOEF et MEMPRED.
*     
*     Revision 3.9  94/05/23  16:35:49  armnrbd
*     Ajouter le programme LININT.
*     
*     Revision 3.8  94/05/20  22:52:47  armnrbd
*     Ajouter le programme VERTINC.
*     
*     Revision 3.7  94/05/20  14:38:56  armnrbd
*     Ajouter les programmes SINF et COSF.
*     
*     Revision 3.6  94/04/04  22:02:11  armnrbd
*     Remplacer EOF25 par MEOFVEC.
*     Ajouter le programme TMMULT.
*     
*     Revision 3.5  94/03/17  16:27:06  armnrbd
*     Ajouter le programme MINVERS.
*     
*     Revision 3.4  94/02/14  09:18:51  armnrbd
*     Ajouter les programmes SPDLAT et SPDLON.
*     Ajouter le define cpp NOIMSL.
*     
*     Revision 3.3  94/01/18  16:40:52  armnrbd
*     Implanter le support de la variable cpp VERY_NICE.
*     
*     Revision 3.2  94/01/05  17:21:16  17:21:16  armnrbd (Bernard Dugas)
*     Ajouter le programme GSAPTP
*     
*     Revision 3.1  93/10/24  01:40:51  armnrbd
*     Ajouter les programmes ENLEVE et ZXMAV.
*     Isoler les programmes xxxPLOT par la variable CPP "NOPLOT".
*     
*     Revision 3.0  93/10/13  13:55:52  armnrbd
*     Premiere version compatible HP-UX.
*     
*     Revision 1.18  93/10/03  16:42:16  armnrbd
*     Separer la section PLOT du reste des routines.
*     Enlever l'appel a la routine NSPEC.
*     
*     Revision 1.17  93/08/04  16:09:20  armnrbd
*     Ajouter les programmes GGALL et VSINTH.
*     
*     Revision 1.16  93/06/25  14:41:00  armnrbd
*     Ajouter le programme COFAPS.
*     
*     Revision 1.15  93/06/23  11:22:11  armnrbd
*     Ajouter les programmes SPLDISS et XMPLOT.
*     
*     Revision 1.14  93/06/09  12:15:34  armnrbd
*     Ajouter le programme XPLOT.
*     
*     Revision 1.13  93/04/28  16:23:45  armnrbd
*     Correction a la mod precedente: vraiment ajouter gaussw (et legendre).
*     
*     Revision 1.12  93/02/24  16:07:23  armnrbd
*     Ajouter les programmes de la famille de series temporelles
*      et les programmes ADJUST,GAUSSW,SMOOTH et SPECTR.
*     
*     Revision 1.11  92/12/10  15:55:11  armnrbd
*     Utiliser le nouveau CCARD et tenir compte que le premier
*     parametre est generalement le nom du programme a executer.
*     
*     Revision 1.10  92/11/26  17:09:38  armnrbd
*     Ajouter le programme SUBAREA.
*     
*     Revision 1.9  92/11/25  21:17:07  armnrbd
*     Ajouter les programmes DERTIM,INTTIM et TRANSPOS.
*     
*     Revision 1.8  92/11/21  13:05:46  armnrbd
*     Ajouter les programmes EOF25 et EOFROT.
*     
*     Revision 1.7  92/08/28  13:47:40  armnrbd
*     Corriger un bogue dans le traitement des prefixes.
*     
*     Revision 1.6  92/08/26  10:41:11  armnrbd
*     Ajouter GDIV et GMLT.
*     
*     Revision 1.5  92/08/26  08:47:33  armnrbd
*     Corriger la ligne macro/cpp de RGOPR.
*     
*     Revision 1.4  92/08/25  16:09:26  armnrbd
*     Ajouter la fonction RGOPR.
*     
*     Revision 1.3  92/06/03  11:51:06  armnrbd
*     Enlever tout prefixe au nom du programme.
*     
*     Revision 1.2  92/06/01  14:46:17  armnrbd
*     Ajouter la fonction HOVPLOT.
*     
*     Revision 1.1  92/05/01  10:12:10  armnrbd
*     Ajouter un enonce EXTERNAL.
*     Ajouter la fonction LPPRINT (oubliee).
*     
*     Revision 1.0  92/04/30  21:40:02  armnrbd
*     Initial revision
*     
#     endif
#     if defined (MORE_INFO)
*a
*a  A) DISPLAY PROGRAMS - FIELDS OR FILE CONTENTS
*a  ---------------------------------------------
*a    
*a  crvplot  - PLOT CURVES IN THE X - Y PLANE                             1 0 C
*a  ggplot   - CREATES NCAR PLOT MAP AND/OR VECTOR FROM FILE(S)           3 0 C
*a  ggsign   - MAPS THE SIGN (-,0,+) OF EACH POINT IN A GRID              1 0 C
*a  ggstat   - PRINTS STATISTICS FOR EACH FIELD IN A GRID FILE           79 0
*a  hovplot  - HOVMULLER PLOT UTILITY FOR SLICES AT A SINGLE LEVEL        1 0 C
*a  invntry  - LISTS FIELD LABELS FROM A DIAGNOSTICS FILE                79 0
*a  ijlook   - PRINTS TIME SERIES OF A WINDOW IN A GRID FILE              1 0 C
*a  lpprint  - PRINTS VALUES OF ANY SIZE (MAX 361x180) GRID               1 0 C
*a  splook   - PRINTS REQUESTED SPECTRAL FIELDS FROM A FILE               1 0 C
*a  spplot   - PLOTS A 2-D SPECTRUM                                       1 0 C
*a  spslope  - COMPUTES AND PRINTS SPECTRAL M OR N LOGARITHMIC SLOPE      1 0 C G
*a  tscheck  - PRODUCE A SUMMARY OF THE CONTENTS OF A FILE                1 0
*a  txtplot  - PLOT A TEXT RECORD ON A FRAME                              0 0 C
*a  xmplot   - PLOT UP TO 50 1-D ZONAL/MERIDIONAL CROSS-SECTIONS          1 0 C
*a  xplot    - PLOT A ONE DIMENSIONAL ARRAY                               1 0 C
*a  zxint    - GRAPHS LAT AVG AND PRES INTEGRAL OF A CROSS-SECTION        1 0 C
*a  zxplot   - CREATES NCAR PLOT VECTORS  FOR ONE CROSS-SECTION           3 0 C
*a  zxprint  - PRINTS VALUES OFF A CROSS SECTION FILE                     1 0 C
*a    
*b    
*b  B) FILE, LABEL OR RECORD MANIPULATION PROGRAMS
*b  ----------------------------------------------
*b    
*b  addlev   - ADDS/INTERPOLATE LEVELS IN A SET OF 3D ARRAYS              1 1 C
*b  addtext  - APPEND A TEXT RECORD TO A FILE. DATA READ FROM stdin       0 1 C
*b  adjust   - ADJUST LABEL FORMAT BETWEEN (MTL) AND (TOR) FILES          1 1
*b  binach   - CONVERT A STANDARD CCRN FILE TO CHARACTER FORM             1 1
*b  chabin   - RESTORE A CHARACTER CODED FILE BACH TO BINARY              1 1
*b  convert  - CMC/RPN STANDART TO/FROM CCC FORMAT FILES                  1 1 
*b  enleve   - REMOVES SELECTED RECORDS FROM A FILE                       1 1 C
*b  extrac   - ZEROES OUT ALL OF A GRID EXCEPT A WINDOW DEFINED IN INPUT  1 1 C
*b  fsttri   - SORT RPN-STANDART FILEs ACCORDING TO THEIR INTERNAL KEYS   ? 1 
*b  joiner   - JOINS TWO FILES. RESULT HAS ASCENDING STEP NUMBERS         2 1
*b  joinup   - JOINS UP TO 78 FILES WITHOUT CHECKING (MINIMUM 1)         78 1
*b  levrev   - REVERSES THE ORDER OF LEVELS OF EACH SET IN A FILE         1 1
*b  mergef   - MERGES TWO FILES ORDERED BY TIMESTEP NUMBER                2 1
*b  newnam   - CHANGES THE NAME IN IBUF(3) OF ALL RECORDS ON A FILE       1 1 C
*b  rcopy    - COPY RECORDS FROM RECORD NUMBERS N1 TO N2 INCLUSIVE        1 1 C
*b  relabl   - CHANGES COMPLETE LABELS IN A FILE                          1 1 C
*b  repack   - REPACKS A FILE                                             1 1 C
*b  rmlabl   - REMOVES ALL LABELS RECORDS IN A FILE                       1 1
*b  select   - SELECTS UP TO FOUR REQUESTED VARIABLES FROM A FILE         1 4 C
*b  select2  - SELECTS UP TO TWO VARIABLES, DOES TIME INTERVAL CHECK      1 2 C
*b  shiftf   - SHIFT (CIRCULAR OR NOT) A TIME-SEQUENCE OF RECORDS         1 1 C
*b  sortf    - SORTS FILE ACCORDING TO CRITERIA FOUND IN SECOND FILE      2 1 C
*b  timegen  - CREATES A FILE WITH VALUES SET EQUAL TO TIMESTEP NUMBER    1 1
*b  tstep    - RELABELS MODEL TIMESTEP NUMBER TO DATE-TIME GROUP          1 1 C
*b  windowf  - EXTRAC/EXPAND A WINDOW RECORD INTO ANOTHER                 1 1 C
*b  xappend  - APPENDS SUPERLABELLED SETS IN FILE 'ADD' TO FILE 'OLD'     2 1
*b  xfind    - FIND A SUPERLABELED SET IN A FILE                          1 1 C
*b  xsave    - SAVES A SUPERLABELED SET IN A FILE                         2 1 C
*b  
*c    
*c  C) GENERAL COMPUTATION PROGRAMS
*c  -------------------------------
*c    
*c  accumul  - PERFORMS TIMEWISE ACCUMULATIONS FILE PER FILE            1/2 1
*c  addf     - ADDS UP TO 78 FILES (MINIMUM 2)                           78 1
*c  addlev   - ADDS/INTERPOLATEs LEVELS IN AN ARRAY                       1 1 C
*c  averages - DERIVES ENSEMBLE OR TIME MEANS AND VARIANCES OF RPN FILES  ? 2
*c  barx     - FAIT LA MOYENNE SELON X                                    2 1 C
*c  bary     - FAIT LA MOYENNE SELON y                                    2 1 C
*c  calmap   - CALCUL LES FACTEURS MAPSCALE ET DE CORIOLIS                1 2 C
*c  calpres  - CALCUL DE LOG(PI) SUR LES SURFACES DES NIVEAUX GAL-CHEN    4 3 C
*c  cdiv     - COMPLEX DIVISION OF TWO FILES (X/0=0)                      2 1
*c  cmlt     - COMPLEX MULTIPLICATION OF TWO FILES                        2 1
*c  complex  - COMPLEX ARRAYS TO/FROM REAL AND IMAGINARY PARTS          1/2 2/1
*c  conjmlt  - COMPLEX CONJUGATE MULTIPLICATION OF TWO COMPLEX FILES      2 1
*c  corpar   - COMPUTE CORIOLIS PARAMETER OF SAME TYPE/SIZE AS INPUT      1 1
*c  cosf     - COMPUTE THE COSINUS VALUE OF A FILE (IN RADIANS)           1 1 C
*c  delx     - FAIT LA DERIVEE selon X                                    2 1 C
*c  dely     - FAIT LA DERIVEE selon Y                                    2 1 C
*c  dertim   - TIME DIFFERENCE BETWEEN SUCCESIVE TIME STEPS IN A FILE     1 1
*c  diftim   - TIME DIFFERENCE OF TWO SETS IN THE SAME FILE               1 1 C
*c  divf     - DIVIDES TWO REAL FILES  (X/0=0)                            2 1
*c  dxdp     - VERTICAL PRESSURE DERIVATIVE OF A FILE                     1 1
*c  expone   - EXPONENTIATES A REAL FILE                                  1 1
*c  extrac   - ZEROES OUT ALL OF A GRID EXCEPT A WINDOW DEFINED IN INPUT  1 1 C
*c  fpow     - RAISES A REAL FILE TO A GIVEN POWER                        1 1 C
*c  flat     - FLATTEN THE LATERAL BOUNDARY IN THE NORMAL DIRECTION       1 1 C
*c  gadd     - ADDS TO EACH SET IN A FILE THE FIRST SET OF ANOTHER        1 1
*c  fstmdiag - CALCULATES MEANS, VARIANCES OF AN UNSTRUCTURED (RPN) FILES ? 2
*c  gdiv     - DIVIDES EACH SET IN A FILE BY THE FIRST SET OF ANOTHER     1 1
*c  globavg  - CALCULATES SURFACE AREA MEANS OF A SET OF FIELDS           1 1
*c  gmlt     - MULTIPLIES EACH SET IN A FILE BY THE FIRST SET OF ANOTHER  1 1
*c  grset    - CREATES A GRID DATA FIELD FOR TESTING PURPOSES             0 1 C G
*c  inttim   - TIME SUMMATION BETWEEN SUCCESIVE TIME STEPS IN A FILE      1 1
*c  kef      - COMPUTES KINETIC ENERGY  (U**2+V**2)/2.                    2 1
*c  loge     - NATURAL LOG OF A REAL FILE                                 1 1
*c  miroir   - BUILD GLOBAL ARRAYS FROM HEMISPHERIC ONES                  1 1 C
*c  mksymm   - BUILD SYMMETRIC GLOBAL ARRAYS FROM HEMISPHERIC ONES        1 1
*c  mkunsy   - BUILD ANTI-SYMMETRIC GLOBAL ARRAYS FROM HEMISPHERIC ONES   1 1
*c  mltf     - MULTIPLIES TWO REAL FILES                                  2 1
*c  msfact   - OUTPUT THE SURFACE MAP-SCALE-FACTORS USED BY globavg       1 1
*c  modulus  - MODULUS OF A FILE                                          1 1
*c  oilfill  - FILLS AREAS THAT HAVE MISSING VALUES                       2 1 C
*c  plagalc  - INTERPOLATES GAL-CHAN LEVEL GRIDS FROM P LEVELS FOR RCM    3 1 C
*c  pgen     - CREATES A FILE OF SAME TYPE AS INPUT WITH PRESSURE VALUES  1 1
*c  psdiv    - DIVIDES A FILE OF REAL SETS BY A ONE-LEVEL REAL FILE       2 1
*c  psmlt    - MULTIPLIES A FILE OF REAL SETS BY A ONE-LEVEL REAL FILE    2 1
*c  rgopr    - MULTIPLIES A MULTI0LEVEL FILE BY RGAS/PRESSURE             1 1
*c  rmax     - FINDS THE MAXIMUM FOR EACH RECORD IN A FILE                1 1
*c  rmin     - FINDS THE MINIMUM FOR EACH RECORD IN A FILE                1 1
*c  sinf     - COMPUTE THE SINUS VALUE OF A FILE (IN RADIANS)             1 1 C
*c  slice    - SELECTS ZONAL OR MERIDIONAL SECTIONS FROM FILE OF SETS     1 1
*c  smspec   - SPECTRAL FILTERING USING DISCREET SIN AND COS TRANSFORMS   1 2 C
*c  spconj   - COMPLEX CONJUGATE OF A COMPLEX FILE                        1 1
*c  sqroot   - TAKES THE SQUARE ROOT OF AN ARRAY (NO TYPE CHECK)          1 1
*c  square   - SQUARES GRID FIELDS                                        1 1
*c  stdev    - COMPUTES STANDARD DEVIATIONS                               1 1
*c  subf     - SUBTRACTS TWO FILES                                        2 1
*c  timavg   - COMPUTES MULTI-LEVEL TIME AVERAGE OF A FILE                1 1
*c  timcov   - COMPUTES COVARIANCES                                       2 1
*c  timdev   - COMPUTES TIME DEVIATIONS OF A FILE                         2 1
*c  timmax   - FINDS MAXIMUM TIME-SERIES VALUE AT EACH POINT              1 1
*c  timmin   - FINDS MINIMUM TIME-SERIES VALUE AT EACH POINT              1 1
*c  timsum   - (SAME AS PROGRAM INTTIM)                                   1 1
*c  varspec  - COMPUTE SPECTRUM FROM GRIDED VALUES                        1 3 C
*c  veint    - VERTICAL ETA INTEGRAL OF A FILE (FULL OR HALF LEVELS)      1 1 C
*c  vertinc  - VERTICAL PRESSURE INCREMENTS (DELTA P) LEVEL BY LEVEL      1 1
*c  vminmax  - FIND VERICAL MINIMUM OR MAXIMUMS IN A FILE                 1 1 C
*c  vpint    - VERTICAL PRESSURE INTEGRAL OF A FILE                       1 1
*c  vpintl   - VERTICAL PRESSURE INTEGRAL OF A FILE LEVEL BY LEVEL        1 1
*c  vpintv   - VERTICAL PRESSURE INTEGRAL WITH VARIABLE BOUNDARIES        2 1 C
*c  vsint    - VERTICAL SIGMA INTEGRAL OF A FILE (FULL OR HALF LEVELS)    1 1 C
*c  vsinth   - VERTICAL SIGMA INTEGRAL FOR HYBRID COORDINATE LEVELS       1 1 C
*c  ytox     - COMPUTES Z = Y**X                                          2 1
*c  xlin     - LINEAR OPERATION ON ONE FILE     Y=A*X+B                   1 1 C
*c  xpand    - MODIFIE LES DIMENSIONS(X,Y) D'UN TABLEAU 4D(X,Y,Z,T)       1 1 C
*c  xylin    - LINEAR OPERATION ON TWO FILES    Z=A*X+B*Y+C               2 1 C
*c  
*d    
*d  D) GRID PROGRAMS
*d  ----------------
*d
*d  beta     - COMPUTES THE FUNCTION BETA FOR ALL PRESSURE LEVELS         1 1 C
*d  betao    - COMPUTES BETA FOR OBSERVED HEIGHTS                         2 2
*d  delhat   - COMPUTES THE FUNCION DELTA-HAT FOR ALL PRESSURE LEVELS     1 1 C
*d  delhato  - COMPUTES DELTA-HAT FROM OBSERVED HEIGHTS                   2 1
*d  fmask    - MAKES 1. OR 0. MASK FROM A GRID                            1 1 C
*d  gaussw   - PRODUCES A FILE OF GAUSSIAN WEIGTH                         1 1
*d  ggacof   - GAUSSIAN GRIDS OR ZONAL CROSS-SECTION TO SPECTRAL COEFF    1 1 C  
*d  ggall    - CONVERT GAUSSIAN GRID FILE TO LAT-LONG FILE                1 1 C
*d  ggaps    - CONVERT GAUSSIAN GRID FILE TO P.S. FILE                    1 1 C G
*d  ggdev    - GRID SET DEVIATION FROM GLOBAL MEAN                        1 1
*d  ggdlat   - LATITUDE DERIVATIVE OF A GRID SET                          1 1
*d  ggdlon   - LONGITUDE DERIVATIVE OF A GRID SET                         1 1
*d  gghems   - SPLITS GLOBAL GAUSSIAN GRID FILE INTO HEMISPHERES          1 2   G
*d  gglob    - CONVERTS HEMI GRID OR CROSS-SECTION FILE TO GLOBAL         1 1 C
*d  ggtrig   - GRID SET MULTIPLIED BY CONST*FUNCTION(LAT,LON)             1 1 C
*d  ggvecps  - CONVERTS LAT-LONG U,V TO P.S. WIND COMPONENTS              2 4 C
*d  ggvecz   - TRANSFORM LAT-LONG GRID VECTORS TO/FROM ROTATED Z GRIDS    2 2
*d  gpasg    - INTERPOLATES PRESSURE FILES TO SIGMA/ETA/GEM               3 1 C
*d  gpdpd    - COMPUTES DEW POINT DEPRESSION FROM T AND SHUM OR RHUM      2 1
*d  gphum    - CONVERTS PRES. GRIDS OF ES,T TO SPECIFIC AND REL HUM       3 2
*d  gptavt   - COMPUTE VIRTUAL TEMPERATURE FROM TEMPERATURE               2 1
*d  gpvtat   - CONVERT VIRTUAL TEMPERATURE TO TEMPERATURE                 2 1
*d  grset    - CREATE SETS OF MULTILEVEL FIELD SET TO AN ASSIGNED VALUE   0 1 C
*d  gsapl    - INTERPOLATES SIGMA FILE TO PRESSURE                        2 1 C
*d  gsaptp   - INTERPOLATES SIGMA FILE OF TEMP TO PRESSURE PHI AND TEMP   3 2 C
*d  gsapzl   - INTERPOLATES SIGMA FILE OF PHI TO PRESSURE PHI AND TEMP    3 2 C
*d  gsasg    - INTERPOLATES SIGMA/ETA/GEM TO SIGMA/ETA/GEM                3 1 C
*d  gsathl   - INTERPOLATES A SIGMA/PRESSURE/ETA FILE TO THETA            3 1 C
*d  gsathlt  - INTERPOLATES FROM ETA OR PRESSURE LEVELS TO THETA LEVELS   4 4 C
*d  gshumh   - CONVERTS ETA GRIDS OF GCM/RCM ES TO SPECIFIC AND REL HUM   4 2 C
*d  gsmslp   - COMPUTES MEAN-SEA-LEVEL PRESSURE FROM SIGMA T, LNSP, PHIS  3 1 C
*d  gsmslph  - COMPUTES MEAN-SEA-LEVEL PRESSURE FROM HYBRID T, LNSP, PHIS 3 1 C
*d  gsomgah  - CONVERTS ETA (SIGMA/HYBRID) Q,D FILES TO VERTICAL MOTION   4 1 C G
*d  gsomega  - CONVERTS Q,D FILES TO VERTICAL MOTION                      3 1 C G
*d  gwtqd    - COMPUTES SPECTRAL Q,D FROM GRID WINDS                      2 2 C
*d  laslon   - ADD/REMOVE LAST LONGITUDE COLUMN                           1 1 C
*d  llagg    - CONVERT LAT-LONG GRID FILE TO GAUSSIAN FILE                1 1 C
*d  llvagg   - CONVERT LAT-LONG WINDS FILE TO GAUSSIAN FILE               2 2 C
*d  makeyy   - INTERPOLATE SCALAR FIELDS ONTO A GEM/DM YY-GRID            1 1 C
*d  makeyyv  - INTERPOLATE VECTOR FIELDS ONTO A GEM/DM YY-GRID            2 2 C
*d  makezg   - INTERPOLATE SCALAR FIELDS ONTO A GEM/DM Z-GRID             1 1 C
*d  makezgv  - INTERPOLATE VECTOR FIELDS ONTO A GEM/DM Z-GRID             2 2 C
*d  meriavg  - COMPUTES MULTI-LEVEL MERIDIONAL AVERAGE OF A SET OF GRIDS  1 1
*d  mslpr    - COMPUTES MEAN-SEA-LEVEL-PRESSURE FROM T,PHI PRESSURE FILES 2 1
*d  nhall    - CONVERT NH GAUSSIAN GRID FILE TO LAT-LONG FILE             1 1 C
*d  oilfill  - FILLS MISSING VALUE POINTS FROM NEARBY VALUES              2 1
*d  psagg    - CONVERT POLAR-STEREOGRAPHIC SCALAR GRIDS                   1 1 C
*d  psvagg   - CONVERTS POLAR-STEREOGRAPHIC WINDS                         2 2 C
*d  psgrid   - CALCUL LES PARAMETRES POUR UNE GRILLE POLAIRE STEREO       1 1
*d  rangrd   - CREATES MULTI-LEVEL SETS OF RANDOM VALUE GRIDS             0 1 C
*d  rzonavg  - TAKES THE REPRESENTATIVE ZONAL AVERAGE OF A SCALAR FIELD   2 1
*d  rzonvavg - TAKES THE REPRESENTATIVE ZONAL AVERAGE OF A VECTOR FIELD   3 2
*d  shall    - CONVERT SH GAUSSIAN GRID FILE TO LAT-LONG FILE             1 1 C
*d  signag   - PRODUCES A GRID OF (-1,0,1) FROM (-,0,+) INPUT CARDS       0 1 C
*d  smooth   - SIMPLE MINDED GEOGRAPHICAL SMOOTHER                        1 1
*d  solflux  - RE-COMPUTE THE INCIDENT SOLAR FLUX AT THE TOP OF THE MODEL 1 1 C
*d  subarea  - COMPUTES SUB-AREAS (EITHER PS OR LL) OF GG GRIDS           1 1 C
*d  transpos - TRANSPOSE LATITUDES AND LONGITUDES IN A GRID FILE          1 1
*d  zonavg   - COMPUTES MULTI-LEVEL ZONAL AVERAGE OF A SET OF GRIDS       1 1
*d  zoncov   - COMPUTES ZONAL COVARIANCE OF TWO GRID SETS                 2 1
*d  zondev   - COMPUTES ZONAL DEVIATIONS OF A GRID SET                    2 1
*d  zonvar   - COMPUTES ZONAL VARIANCES OF A GRID SET                     1 1
*d  zonvavg  - COMPUTES MULTI-LEVEL ZONAL AVERAGE OF A SET OF WINDS       2 2
*d  zonvdev  - COMPUTES ZONAL DEVIATIONS OF A SET OF WINDS                4 2
*d  
*e  
*e  E) SPHERICAL HARMONIC PROGRAMS
*e  ------------------------------
*e    
*e  cofagg   - CONVERTS SPECTRAL FILE TO GAUSSIAN GRIDS                   1 1 C
*e  cofaps   - CONVERTS SPECTRAL FILE TO POLAR STEREOGRAPHIC GRIDS        1 1 C G
*e  ctemps   - CONVERTS SPECTRAL PHI FILE TO SPECTRAL TEMPERATURES        2 1
*e  cwinds   - CONVERTS SPECTRAL Q,D FILES TO SPECTRAL U,V                2 2
*e  gsomgah  - CONVERTS ETA (SIGMA/HYBRID) Q,D FILES TO VERTICAL MOTION   4 1 C G
*e  gsomega  - CONVERTS Q,D FILES TO VERTICAL MOTION                      3 1 C G
*e  spamp    - PRODUCES AMPLITUDE OF COMPLEX ARRAY                        1 1
*e  spblow   - HEMISPHERIC TO/FROM GLOBAL SPECTRAL ARRAYS                 1 2 C
*e  spcalpa  - MAKES FILE OF CMPLX(N*(N+1),0.)                            1 1   G
*e  spcdns   - CONTRIBUTION OF SP COEFF TO GLOBAL MEAN OF PRODUCT         2 1   G
*e  spcsum   - PRINTS SPECTRAL SUMS OVER M OR N                           1 0 C G
*e  spdlat   - COMPUTES SPECTRAL LATITUDE DERIVATIVE                      1 1   G
*e  spdlon   - COMPUTES SPECTRAL LONGITUDE DERIVATIVE                     1 1   G
*e  spdlsq   - COMPUTES SPECTRAL LAPLACIAN                                1 1   G
*e  spflux   - COMPUTE AND PRINT SPECTRAL M OR N FLUX                     1 0 C G
*e  spgdev   - SETS SPECTRAL MEANS TO ZERO                                1 1
*e  splapl   - COMPUTES SPECTRAL LAPLACIAN                                1 1   G
*e  spldiss  - COMPUTES LEITH SPECTRAL DISSIPATION FUNCTION               1 1   G
*e  splinv   - MULTIPLY SPECTRAL FILE BY A**2/(N*(N+1))                   1 1   G
*e  spnegm   - PRODUCES SPECTRAL HARMONIC "-M CONJUGATE"                  1 1
*e  spreim   - SEPARATES REAL AND IMAGINARY PARTS OF A COMPLEX ARRAY      1 2
*e  spresol  - EXTRACTS LOWER RESOLUTION SUB-SET FROM SPECTRAL FILE       1 1 C G
*e  spsmoo   - SPECTRAL SMOOTHING "a la" Sardeshmukh & Hoskins            1 1 C  
*e  spvdgx   - SPECTRAL V DOT GRAD X                                      3 1   G
*e  spzdev   - COMPUTES SPECTRAL DEVIATION FROM ZONAL MEAN                1 1   G
*e  spzxmlt  - MULTIPLY SPECTRAL FILE BY CROSS-SECTION FILE               2 1
*e  zxwave   - MAKES CROSS-SECTION OF SPECTRAL AMPLITUDE AND PHASE        1 2 C
*e  
*f  
*f  F) ZONAL CROSS-SECTION PROGRAMS
*f  -------------------------------
*f    
*f  ggacof   - CONVERTS ZONAL CROSS-SECTION FILE TO SPECTRAL COEFF FILE   1 1 C
*f  zadlev   - ADDS/INTERPOLATE LEVELS IN A ZONAL CROSS-SECTION           1 1 C
*f  zdhdiv   - ZONAL CROSS-SECTION DELTA-HAT DIVIDER                      1 1
*f  zonmod   - CONVERTS FILES FROM SINGLE-LEVEL MODE TO MULTI-LEVEL MODE  1 1
*f  zxaglb   - CREATES GLOBAL GRID FROM CROSS-SECTION                     1 1
*f  zxdev    - CROSS-SECTION DEVIATION FROM MERIDIONAL MEAN               1 1
*f  zxdevp   - CROSS-SECTION DEVIATION FROM PRESSURE MEAN.                1 1
*f  zxdlat   - CROSS-SECTION LATITUDE DERIVATIVE - LEGENDRE POLYNOMIALS   1 1 C
*f  zxdlatf  - CROSS-SECTION LATITUDE DERIVATIVE - FINITE DIFFERENCE      1 1
*f  zxgam    - CROSS-SECTION GAMMA CALCULATION  GAM=K/(-P*DT/DP+KT)       1 1
*f  zxint    - GRAPHS LATITUDE AND PRESSURE INTEGRALS OF CROSS-SECTION    1   C
*f  zxmav    - CROSS-SECTION MERIDIONAL AVERAGE PUT ON A FILE             1 1
*f  zxpsi    - COMPUTES MERIDIONAL STREAM-FUNCTION FROM A CROSS-SECTION   1 1
*f  zxrhum   - CROSS-SECTION CALCULATION OF RELATIVE HUMIDITY             2 1
*f  zxtrig   - CROSS-SECTION MULTIPLIED BY  CONST*TRIG(LAT)**M            1 1 C
*f  
*g
*g  G) TIME-SERIES ANALYSIS AND MATRIX OPERATIONS PROGRAMS
*g  ------------------------------------------------------
*g
*g  anomali  - TESTING A SET OF CONDITIONS ON SETS OF TIME SERIES         1 1 C
*g  binning  - IDENTIFIES MEAN PROPRETIES BY THE BIN METHOD               1 1 C
*g  bins     - SIMPLE TIMESTEP BINNING PROGRAM                            1 1 C
*g  critt    - COMPUTES THE CRITICAL VALUE FOR THE STUDENT-T TEST         0 1 C
*g  eofrot   - ORTHOGONAL/OBLIQUE ROTATION OF EOF VECTORS                 1 3 C
*g  fcats    - COMPUTE TIME SERIES FROM TIME SERIES FOURIER COEFFICIENTS  1 1 C
*g  fit      - TIME SERIES POLYNOMIAL REGRESSION FIT AND DISPLAY          1 1 C
*g  ftest    - CONDUCT AN EQUALITY OF VARIANCE TEST (F-TEST)              2 5 C
*g  fullcor  - CORRELATION BETWEEN RECORDS IN A FILE                      1 1 C
*g  fullmix  - CREATES DATA FOR INPUT TO FULLCOR                          1 2 C
*g  ggatim   - TRANSFORM GRIDS TO TIME-SERIES FORMAT                      2 1 C
*g  lagcor   - ONE POINT LAGGED/UNLAGGED CORRELATION BETWEEN TWO FILES    2 1 C
*g  linint   - FILL HOLES IN DATASET WITH LINEAR INTERPOLATION            1 1 C
*g  memcoef  - CALCULATE MEM PARAMETRES OR MEM SPECTRA                    1 1 C
*g  mempred  - MAKE PREDICTIONS WITH A MEM MODEL                          2 1 C
*g  meofvec  - MATRIX EIGEN SOLVER                                        1 2 C
*g  minvers  - MATRIX INVERSION OF A FILE                                 1 1
*g  mkmaskX  - MASK MAKING FAMILY OF PROGRAMS (X=1,2,3)                   X X C
*g  mmult    - MATRIX MULTIPLY OF TWO FILES (STORED IN COLUMN MODE)       2 1
*g  tmmult   - TRANSPOSE MATRIX MULTIPLY OF TWO FILES (AS IN MMULT)       2 1
*g  mtrace   - TRACE OF A MATRIX (STORED IN COLUMN MODE)                  1
*g  pcomp    - PRINCIPAL COMPONENT CALCULATION                            2 1
*g  randeof  - PRINCIPAL COMPONENT SELECTION ALGORITHM                    2 2 C
*g  shiftf   - SHIFT (CIRCULAR OR NOT) A SET OF TIME SERIES               1 1 C
*g  sortf    - SORTS FILE ACCORDING TO CRITERIA FOUND IN SECOND FILE      2 1 C
*g  spectr   - WAVENUMBER POWER SPECTRUM FROM TIME-SERIES                 1 1   G
*g  t2test   - CONDUCT A TWO SAMPLE HOTELLING'S T**2 STATISTICAL TEST    10 7 C
*g  tfilter  - TIME FILTER A SET OF SERIES BY CONVOLUTION FILTERS         1 1 C
*g  timagg   - TRANSFORM TIME-SERIES TO GRIDS FORMAT                      1 1
*g  tsafc    - COMPUTE FINITE FFT'S OF TIME SERIES                        1 1 C
*g  ttesta   - CONDUCT AN "APPROXIMATE" DIFFERENCE OF MEANS TEST          4 5 C
*g  tteste   - CONDUCT AN "EXACT" DIFFERENCE OF MEANS TEST                4 5 C
*g  unbinn   - INVERT BINNING PROCEDURE                                   1 1 C
*g  unmask   - INVERT MASKING PROCEDURE                                   2 1
*g  unseas   - REMOVE SEASONNAL CYCLE FROM FC TIME-SERIES                 1 1 C
*g  vbasd    - COMPUTES AN ESTIMATE OF POPULATION STANDARD DEVIATION      1 1
*g  w2stat   - CRAMER-VON MISSES STATISTIC FOR RANDOM FIT OF TS           1 1
*g  xtrac    - DATA EXTRACTION FAMILY OF PROGRAMS (xtracX,X=none,2,3,4)   2 1
*g
#     endif
#     if !defined (NO_SOURCE)
      PROGRAM driver

***  Ceci est le programme d'appel des diagnostiques de type CCC
***  tel qu'implante a RPN (SEA/Dorval) par B.Dugas, en 1991-92.
***  Ce programme a ete place dans le domaine public en 2014 et
***  une copie est maintenant disponible sur...
***  ...    https://github.com/Bernard-Dugas/r.diag

      IMPLICIT  none

      INTEGER   i,j,k, nargs,ier
      CHARACTER nom*256,nomprg*8

      EXTERNAL  addf,   adjust, addtext,anomali,averages,
     +          beta,   betao,  binach, binning,bins,
     +          chabin, cofagg, cofaps, complex,condef, convert,
     +          corpar, cosf,   critt,  ctemps, cwinds, 
     +          delhat, delhato,dertim, diftim, dxdp,
     +          enleve, eofrot, expone, extrac, 
     +          fcats,  fit,    flat,   fmask,  fpow,
     +          fptest, fstmdiag,fsttri,fullcor,fullmix,
     +          gadd,   gaussw, gdiv,   gmlt,   ggacof, ggall,  ggaps,
     +          ggatim, ggdlat, ggdlon, gghems, gglob,  ggsign, ggstat

      EXTERNAL  ggtrig, ggvecps,globavg,gpasg,  gpdpd,  gphum,  gpvtat, 
     +          grset,  gsapl,  gsaptp, gsapzl, gsathl, gsathlt,gshumh, 
     +          gsmslp, gsmslph,gsomgah,gsomega,gwtqd,
     +          ijlook, inttim, invntry,
     +          joiner, joinup,
     +          lagcor, kef,    laslon, levrev, linepc, linint,
     +          llagg,  loge,   lpprint,lspgm,  lssub,  
     +          makezg, memcoef,mempred,mergef, meofvec,meriavg,minvers,
     +          miroir, mkmask1,mkmask2,mkmask3,mksymm, mkunsy, mmult,  
     +          modulus,mslpr,  mtrace,
     +          newnam, oilfill

***   EXTERNAL  nspec

      EXTERNAL  parmsub,pcomp,  pgen,   psdiv,  psmlt,
     +          randeof,rangrd, rcopy,  relabl,
     +          repack, rgopr,  rmax,   rmlabl,
     +          select, select2,shiftf, signag, sinf,   slice,  smooth, 
     +          solflux,sortf,  spamp,  spblow, spcalpa,spcdns, spconj, 
     +          spcsum, spdlat, spdlon, spdlsq, spectr, spflux, spgdev, 
     +          splapl, spldiss,splinv, splook

      EXTERNAL  spnegm, spreim, spresol,spslope,spsmoo, smspec, spvdgx, 
     +          spzdev, spzxmlt,sqroot, square, subarea,stdev,  
     +          t2test, tfilter,timagg, timavg, timcov, timdev, timegen,
     +          tmmult, transpos,tsafc, tscheck,tstep,  ttesta, tteste,
     +          unbinn, unmask, unseas, 
     +          varspec,vbasd,  veint,  vertinc,vminmax,vpint,  vpintl,
     +          vpintv, vsint,  vsinth

      EXTERNAL  w2stat, windowf,
     +          xappend,xfind,  xlin,   xsave,  xtrac,
     +          xtrac2, xtrac3, xtrac4, xylin,
     +          ytox,
     +          zadlev, zdhdiv, zonavg, zoncov, zondev, zonmod, zxaglb,
     +          zxdev,  zxdevp, zxdlat, zxdlatf,zxgam,  zxint,  zxmav,
     +          zxprint,zxpsi,  zxtrig, zxwave
     +          zxtrig, zxwave
#     if !defined (NORCM)
      EXTERNAL  barx,   bary,   calmap, calpres,delx,   dely,   plagalc,
     +          psgrid, xpand
#     endif
#     if !defined (NOPLOT)
      EXTERNAL  crvplot,ggplot, hdplot, hovplot,spplot, txtplot,xmplot, 
     +          xplot, zxplot
#     endif
      integer,  external :: nice19
      logical,  external :: is_on,is_off
      external  getenvc, qqexit

      character niceval*5,nicemac*5
      character oui*3,on*2,vrai*4,true*4,yes*3,off*3,no*2,non*3,false*5
      data      oui , on , vrai , true , yes , off , no , non , false /
     +         'oui','on','vrai','true','yes','off','no','non','false'/
      data      nomprg / ' ' / , nicemac / ' ' /

*------------------------------------------------------------------
***    Faire un nice19 (i.e. un "nice -19") quand
***    une des conditions suivantes est rencontree:
***    1) VERY_NICE_DIAG  = oui  *** ou bien ***
***    2) VERY_NICE_DIAG != non et nicemac = oui
#     if defined (VERY_NICE)
      nicemac = VERY_NICE
#     endif
      call getenvc( 'VERY_NICE_DIAG',niceval )

      if ( is_on( niceval ) .or.
     +   ( is_on( nicemac ) .and.
     +.not.is_off( niceval ) ) )
     +     ier = nice19( )

***    Recuperer le nom du programme. S'assurer de sa validite.

      nargs = command_argument_count()

      If (nargs < 1)                                           Then
          Write(6,'(" Specifier LSPGM pour en savoir plus sur r.diag")')
          CALL qqexit( 1 )
      End If

      Call get_command_argument( 1,nom )

      If (nom(256:256).EQ.'/')                                 Then
          Write(6,'(" Pas trouve le nom du programme dans"/A256)') nom
          CALL qqexit( 2 )
      End If

***    Enlever tout prefixe.

      Do i=255,1,-1
          If (nom(i:i).EQ.'/')                                 Then
              Do j=i+1,Min( i+8,256 )
                  k           = j-i
                  nomprg(k:k) = nom(j:j)
              End Do
              nom = nomprg
              GoTo 100
          End If
      End Do

***    Minimiser le nom du programme et s'assurer
***    que le nom du programme est dans nomprg.

  100 CALL up2low( nom, nom )
      nomprg = nom

      If (nomprg == '-version')                                Then
         ! Y-a-t'il un autre argument ?
         If (command_argument_count() > 1)                     Then
             CALL get_command_argument( 2,nom )
             CALL LOW2UP( nom,nom )
             IF (NOM == 'ALL'
     +      .OR. NOM == 'DAT'
     +      .OR. NOM == 'REV')                                 Then
                CALL program_version( NOM )
             End If
         Else
             CALL PROGRAM_VERSION('ALL')
         End If
         CALL qqexit( 0 )
      End If

***    Enlever tout postfixe.

      Do i=1,8
          If (nomprg(i:i).EQ.'.')                              Then
              Do j=i,8
                  nomprg(j:j) = ' '
              End Do
              ! print *,'nomprg=',trim(nomprg)
              GoTo 200
          End If
      End Do

***    Comparer nomprg avec tous les nom connus.

  200 Call PUTVERB( nomprg ) ! Sauver le nom de la commande

      If ('accumul'.EQ.nomprg) Call timavg
      If ('addf' .EQ. nomprg) Call addf
      If ('add'.EQ.nomprg) Call addf
      If ('addlev'.EQ.nomprg) Call zadlev
      If ('adjust' .EQ. nomprg) Call adjust
      If ('addtext' .EQ. nomprg) Call addtext
      If ('averages' .EQ. nomprg) Call averages
      If ('beta' .EQ. nomprg) Call beta
      If ('betao' .EQ. nomprg) Call betao
      If ('binach' .EQ. nomprg) Call binach
      If ('binning' .EQ. nomprg) Call binning
      If ('bins' .EQ. nomprg) Call bins
      If ('cdiv'.EQ.nomprg) Call addf
      If ('chabin' .EQ. nomprg) Call chabin
      If ('cmlt'.EQ.nomprg) Call addf
      If ('cofagg' .EQ. nomprg) Call cofagg
      If ('cofaps' .EQ. nomprg) Call cofaps
      If ('complex' .EQ. nomprg) Call complex
      If ('condef' .EQ. nomprg) Call condef
      If ('conjmlt'.EQ.nomprg) Call addf
      If ('convert' .EQ. nomprg) Call convert
      If ('corpar' .EQ. nomprg) Call corpar
      If ('cosf' .EQ. nomprg) Call cosf
      If ('cos'.EQ.nomprg) Call cosf
      If ('critt' .EQ. nomprg) Call critt
      If ('ctemps' .EQ. nomprg) Call ctemps
      If ('cwinds' .EQ. nomprg) Call cwinds
      If ('delhat' .EQ. nomprg) Call delhat
      If ('delhato' .EQ. nomprg) Call delhato
      If ('dertim' .EQ. nomprg) Call dertim
      If ('diftim' .EQ. nomprg) Call diftim
      If ('divf'.EQ.nomprg) Call addf
      If ('div'.EQ.nomprg) Call addf
      If ('dxdp' .EQ. nomprg) Call dxdp
      If ('enleve' .EQ. nomprg) Call enleve
***   If ('eof25' .EQ. nomprg) Call eof25
      If ('eofrot' .EQ. nomprg) Call eofrot
      If ('expone' .EQ. nomprg) Call expone
      If ('extrac' .EQ. nomprg) Call extrac
      If ('fcats' .EQ. nomprg) Call fcats
      If ('fit' .EQ. nomprg) Call fit
      If ('fit3d'.EQ.nomprg) Call fit
      If ('flat' .EQ. nomprg) Call flat
      If ('fmask' .EQ. nomprg) Call fmask
      If ('fpow' .EQ. nomprg) Call fpow
      If ('fstmdiag' .EQ. nomprg) Call fstmdiag
      If ('fsttri' .EQ. nomprg) Call fsttri
      If ('ftest' .EQ. nomprg) Call ftest
      If ('fullcor' .EQ. nomprg) Call fullcor
      If ('fullmix' .EQ. nomprg) Call fullmix
      If ('gadd' .EQ. nomprg) Call gadd
      If ('add2d'.EQ.nomprg) Call gadd
      If ('gaussw' .EQ. nomprg) Call gaussw
      If ('gdiv'.EQ.nomprg) Call gadd
      If ('gmlt'.EQ.nomprg) Call gadd
      If ('mlt2d'.EQ.nomprg) Call gadd
      If ('ggacof' .EQ. nomprg) Call ggacof
      If ('ggall' .EQ. nomprg) Call ggall
      If ('ggaps' .EQ. nomprg) Call ggaps
      If ('ggatim' .EQ. nomprg) Call ggatim
      If ('ggdlat' .EQ. nomprg) Call ggdlat
      If ('ggdlon' .EQ. nomprg) Call ggdlon
      If ('gghems' .EQ. nomprg) Call gghems
      If ('gglob' .EQ. nomprg) Call gglob
      If ('ggsign' .EQ. nomprg) Call ggsign
      If ('ggstat' .EQ. nomprg) Call ggstat
      If ('ggtrig' .EQ. nomprg) Call ggtrig
      If ('ggvecps' .EQ. nomprg) Call ggvecps
      If ('ggvecz'.EQ.nomprg) Call ggvecps
      If ('globavg' .EQ. nomprg) Call globavg
      If ('gpasg' .EQ. nomprg) Call gpasg
      If ('gpdpd' .EQ. nomprg) Call gpdpd
      If ('gphum' .EQ. nomprg) Call gphum
      If ('gptavt'.EQ.nomprg) Call gpvtat
      If ('gpvtat' .EQ. nomprg) Call gpvtat
      If ('grset' .EQ. nomprg) Call grset
      If ('gsapl' .EQ. nomprg) Call gsapl
      If ('gsaptp' .EQ. nomprg) Call gsaptp
      If ('gsapzl' .EQ. nomprg) Call gsapzl
      If ('gsasg'.EQ.nomprg) Call gpasg
      If ('gsathl' .EQ. nomprg) Call gsathl
      If ('gsathlt' .EQ. nomprg) Call gsathlt
      If ('gshumh' .EQ. nomprg) Call gshumh
      If ('gsmslp' .EQ. nomprg) Call gsmslp
      If ('gsmslph' .EQ. nomprg) Call gsmslph
      If ('gsomgah' .EQ. nomprg) Call gsomgah
      If ('gsomega' .EQ. nomprg) Call gsomega
      If ('gwtqd' .EQ. nomprg) Call gwtqd
      If ('ijlook' .EQ. nomprg) Call ijlook
      If ('inttim' .EQ. nomprg) Call inttim
      If ('timsum'.EQ.nomprg) Call inttim
      If ('invntry' .EQ. nomprg) Call invntry
      If ('joiner' .EQ. nomprg) Call joiner
      If ('joinup' .EQ. nomprg) Call joinup
      If ('kef' .EQ. nomprg) Call kef
      If ('ke'.EQ.nomprg) Call kef
      If ('lagcor' .EQ. nomprg) Call lagcor
      If ('laslon' .EQ. nomprg) Call laslon
      If ('legendre' .EQ. nomprg) Call legendre
      If ('levrev' .EQ. nomprg) Call levrev
      If ('linepc' .EQ. nomprg) Call linepc
      If ('linint' .EQ. nomprg) Call linint
      If ('llagg' .EQ. nomprg) Call llagg
      If ('llvagg'.EQ.nomprg) Call llagg
      If ('loge' .EQ. nomprg) Call loge
      If ('lpprint' .EQ. nomprg) Call  lpprint
      If ('lspgm' .EQ. nomprg) Call lspgm
      If ('lssub' .EQ. nomprg) Call lssub
      If ('makezg' .EQ. nomprg) Call makezg
      If ('makeyy' .EQ.nomprg) call makezg
      If ('makezgv'.EQ.nomprg) call makezg
      If ('makeyyv'.EQ.nomprg) call makezg
      If ('memcoef' .EQ. nomprg) Call memcoef
      If ('mempred' .EQ. nomprg) Call mempred
      If ('meofvec' .EQ. nomprg) Call meofvec
      If ('mergef' .EQ. nomprg) Call mergef
      If ('merge'.EQ.nomprg) Call mergef
      If ('meriavg' .EQ. nomprg) Call meriavg
      If ('minvers' .EQ. nomprg) Call minvers
      If ('miroir' .EQ. nomprg) Call miroir
      If ('mkmask1' .EQ. nomprg) Call mkmask1
      If ('mkmask2' .EQ. nomprg) Call mkmask2
      If ('mkmask3' .EQ. nomprg) Call mkmask3
      If ('mksymm' .EQ. nomprg) Call mksymm
      If ('mkunsy' .EQ. nomprg) Call mkunsy
      If ('mltf'.EQ.nomprg) Call addf
      If ('mlt'.EQ.nomprg) Call addf
      If ('mmult  ' .EQ. nomprg) Call mmult
      If ('modulus' .EQ. nomprg) Call modulus
      If ('tmmult ' .EQ. nomprg) Call tmmult
      If ('msfact'.EQ.nomprg) Call globavg
      If ('mslpr  ' .EQ. nomprg) Call mslpr
      If ('mtrace ' .EQ. nomprg) Call mtrace
      If ('newnam ' .EQ. nomprg) Call newnam
      If ('oilfill' .EQ. nomprg) Call oilfill
      If ('nhall'.EQ.nomprg) Call ggall
***   If ('nspec' .EQ. nomprg) Call nspec
      If ('parmsub' .EQ. nomprg) Call parmsub
      If ('pcomp' .EQ. nomprg) Call pcomp
      If ('pgen' .EQ. nomprg) Call pgen
      If ('psagg'.EQ.nomprg) Call llagg
      If ('psvagg'.EQ.nomprg) Call llagg
      If ('psdiv' .EQ. nomprg) Call psdiv
      If ('psmlt' .EQ. nomprg) Call psmlt
      If ('randeof' .EQ. nomprg) Call randeof
      If ('rangrd' .EQ. nomprg) Call rangrd
      If ('rcopy' .EQ. nomprg) Call rcopy
      If ('relabl' .EQ. nomprg) Call relabl
      If ('repack' .EQ. nomprg) Call repack
      If ('rgopr' .EQ. nomprg) Call rgopr
      If ('rmax' .EQ. nomprg) Call rmax
      If ('rmin'.EQ.nomprg) Call rmax
      If ('rmlabl' .EQ. nomprg) Call rmlabl
      If ('rzonavg'.EQ.nomprg) Call zonavg
      If ('rzonvavg'.EQ.nomprg) Call zonavg
      If ('select' .EQ. nomprg) Call select
      If ('select2' .EQ. nomprg) Call select2
      If ('shall'.EQ.nomprg) Call ggall
      If ('shiftf' .EQ. nomprg) Call shiftf
      If ('shift'.EQ.nomprg) Call shiftf
      If ('signag' .EQ. nomprg) Call signag
      If ('sinf' .EQ. nomprg) Call sinf
      If ('sin'.EQ.nomprg) Call sinf
      If ('slice' .EQ. nomprg) Call slice
      If ('smooth' .EQ. nomprg) Call smooth
      If ('smspec' .EQ. nomprg) Call smspec
      If ('solflux' .EQ. nomprg) Call solflux
      If ('sortf' .EQ. nomprg) Call sortf
      If ('sort'.EQ.nomprg) Call sortf
      If ('spamp' .EQ. nomprg) Call spamp
      If ('spblow' .EQ. nomprg) Call spblow
      If ('spcalpa' .EQ. nomprg) Call spcalpa
      If ('spcdns' .EQ. nomprg) Call spcdns
      If ('spconj' .EQ. nomprg) Call spconj
      If ('spcsum' .EQ. nomprg) Call spcsum
      If ('spdlat' .EQ. nomprg) Call spdlat
      If ('spdlon' .EQ. nomprg) Call spdlon
      If ('spdlsq' .EQ. nomprg) Call spdlsq
      If ('spectr' .EQ. nomprg) Call spectr
      If ('spflux' .EQ. nomprg) Call spflux 
      If ('spgdev' .EQ. nomprg) Call spgdev
      If ('splapl' .EQ. nomprg) Call splapl
      If ('spldiss' .EQ. nomprg) Call spldiss
      If ('splinv' .EQ. nomprg) Call splinv
      If ('splook' .EQ. nomprg) Call splook
      If ('spnegm' .EQ. nomprg) Call spnegm
      If ('spreim' .EQ. nomprg) Call spreim
      If ('spresol' .EQ. nomprg) Call spresol
      If ('spslope' .EQ. nomprg) Call spslope
      If ('spsmoo' .EQ. nomprg) Call spsmoo
      If ('spvdgx' .EQ. nomprg) Call spvdgx
      If ('spzdev' .EQ. nomprg) Call spzdev
      If ('spzxmlt' .EQ. nomprg) Call spzxmlt
      If ('sqroot' .EQ. nomprg) Call sqroot
      If ('square' .EQ. nomprg) Call square
      If ('stdev' .EQ. nomprg) Call stdev
      If ('subarea' .EQ. nomprg) Call subarea
      If ('subf'.EQ.nomprg) Call addf
      If ('sub'.EQ.nomprg) Call addf
      If ('t2test' .EQ. nomprg) Call t2test
      If ('tfilter' .EQ. nomprg) Call tfilter
      If ('timagg' .EQ. nomprg) Call timagg
      If ('timavg' .EQ. nomprg) Call timavg
      If ('timcov' .EQ. nomprg) Call timcov
      If ('timdev' .EQ. nomprg) Call timdev
      If ('timmax'.EQ.nomprg) Call timavg
      If ('timmin'.EQ.nomprg) Call timavg
      If ('timegen' .EQ. nomprg) Call timegen
      If ('transpos' .EQ. nomprg) Call transpos
      If ('tsafc' .EQ. nomprg) Call tsafc
      If ('tscheck' .EQ. nomprg) Call tscheck
      If ('tstep' .EQ. nomprg) Call tstep
      If ('ttesta' .EQ. nomprg) Call ttesta
      If ('tteste' .EQ. nomprg) Call tteste
      If ('unbinn' .EQ. nomprg) Call unbinn
      If ('unmask' .EQ. nomprg) Call unmask
      If ('unseas' .EQ. nomprg) Call unseas
      If ('varspec' .EQ. nomprg) Call varspec
      If ('vbasd' .EQ. nomprg) Call vbasd
      If ('veint' .EQ. nomprg) Call veint
      If ('vertinc' .EQ. nomprg) Call vertinc
      If ('vminmax' .EQ. nomprg) Call vminmax
      If ('vpint' .EQ. nomprg) Call vpint
      If ('vpintl' .EQ. nomprg) Call vpintl
      If ('vpintv' .EQ. nomprg) Call vpintv
      If ('vsint' .EQ. nomprg) Call vsint
      If ('vsinth' .EQ. nomprg) Call vsinth
      If ('vsinthl'.EQ.nomprg) Call vsinth
      If ('w2stat' .EQ. nomprg) Call w2stat
      If ('windowf' .EQ. nomprg) Call windowf
      If ('window'.EQ.nomprg) Call windowf
      If ('xappend' .EQ. nomprg) Call xappend
      If ('xfind' .EQ. nomprg) Call xfind
      If ('xlin' .EQ. nomprg) Call xlin
      If ('xsave' .EQ. nomprg) Call  xsave
      If ('xtrac' .EQ. nomprg) Call xtrac
      If ('xtrac2' .EQ. nomprg) Call xtrac2
      If ('xtrac3' .EQ. nomprg) Call xtrac3
      If ('xtrac4' .EQ. nomprg) Call xtrac4
      If ('xylin' .EQ. nomprg) Call xylin
      If ('ytox' .EQ. nomprg) Call ytox
      If ('zadlev' .EQ. nomprg) Call zadlev
      If ('zdhdiv' .EQ. nomprg) Call zdhdiv
      If ('zonavg' .EQ. nomprg) Call zonavg
      If ('zonvavg'.EQ.nomprg) Call zonavg
      If ('zoncov' .EQ. nomprg) Call zoncov
      If ('zonvar'.EQ.nomprg) Call zoncov
      If ('zondev' .EQ. nomprg) Call zondev
      If ('zonvdev'.EQ.nomprg) Call zondev
      If ('zonmod' .EQ. nomprg) Call zonmod
      If ('zxaglb' .EQ. nomprg) Call zxaglb
      If ('zxdev' .EQ. nomprg) Call zxdev
      If ('ggdev'.EQ.nomprg) Call zxdev
      If ('zxdevp' .EQ. nomprg) Call zxdevp
      If ('zxdlat' .EQ. nomprg) Call zxdlat
      If ('zxdlatf' .EQ. nomprg) Call zxdlatf
      If ('zxgam' .EQ. nomprg) Call zxgam
      If ('zxint' .EQ. nomprg) Call zxint
      If ('zxmav' .EQ. nomprg) Call zxmav
      If ('zxprint' .EQ. nomprg) Call zxprint
      If ('zxpsi' .EQ. nomprg) Call zxpsi
      If ('zxrhum'.EQ.nomprg) Call gphum
      If ('zxtrig' .EQ. nomprg) Call zxtrig
      If ('zxwave' .EQ. nomprg) Call zxwave
#     if !defined (NOPLOT)
      If ('crvplot' .EQ. nomprg) Call crvplot
      If ('ggplot' .EQ. nomprg) Call ggplot
      If ('hdplot' .EQ. nomprg) Call hdplot
      If ('hovplot' .EQ. nomprg) Call hovplot
      If ('spplot' .EQ. nomprg) Call spplot
      If ('txtplot' .EQ. nomprg) Call txtplot
      If ('xplot' .EQ. nomprg) Call  xplot
      If ('xmplot' .EQ. nomprg) Call  xmplot
      If ('zxplot' .EQ. nomprg) Call zxplot
#     endif
#     if !defined (NOMCR)
      If ('barx' .EQ. nomprg) Call barx
      If ('bary' .EQ. nomprg) Call bary
      If ('calmap' .EQ. nomprg) Call calmap
      If ('calpres' .EQ. nomprg) Call calpres
      If ('delx' .EQ. nomprg) Call delx
      If ('dely' .EQ. nomprg) Call dely
      If ('plagalc' .EQ. nomprg) Call plagalc
      If ('psgrid' .EQ. nomprg) Call psgrid
      If ('xpand' .EQ. nomprg) Call xpand
#     endif

      Write(6,'(//" Programme ",A8," inconnu."//)') nomprg
      Call qqexit( 3 )

      Stop

      End

      Subroutine lspgm

#     if defined (AUTO_DOC)
*
***   Historique de lspgm avant son inclusion dans le programme DRIVER.

*     * Auteur: B.Dugas, RPN - 21 fevier 1992.
*
*     Revision 3.15  94/09/16  11:12:23  11:12:23  armnrbd (Bernard Dugas)
*     AJouter la doc pour BETA,BETAO,DELHAT,DELHATO.
*     
*     Revision 3.14  94/07/14  14:05:08  14:05:08  armnrbd (Bernard Dugas)
*     Ajouter les programmes MEMCOEF et MEMPRED.
*     
*     Revision 3.13  94/05/23  16:36:03  armnrbd
*     Ajouter le programme LININT.
*     
*     Revision 3.12  94/05/20  22:53:04  armnrbd
*     Ajouter le programme VERTINC.
*     
*     Revision 3.11  94/05/10  20:55:29  armnrbd
*     Ajouter les programmes SINF et COSF.
*     
*     Revision 3.11  94/05/10  20:50:24  armnrbd
*     Ajouter les programmes SINF et COSF.
*     
*     Revision 3.10  94/04/04  22:02:50  armnrbd
*     Ajouter le programme TMMULT.
*     
*     Revision 3.9  94/03/31  16:05:09  armnrbd
*     Remplacer EOF25 par le programme MEOFVEC.
*     
*     Revision 3.8  94/03/17  16:27:24  armnrbd
*     Ajouter le programme MINVERS.
*     
*     Revision 3.7  94/02/16  16:37:51  armnrbd
*     Corriger la description de SPDLAT et SPDLON.
*     
*     Revision 3.6  94/02/16  15:48:29  armnrbd
*     Modifier la description de GGTRIG.
*     
*     Revision 3.5  94/02/14  09:38:42  armnrbd
*     Ajouter les programmes SPDLAT et SPDLON.
*     
*     Revision 3.4  94/01/05  17:10:03  armnrbd
*     Ajouter le programme GSAPTP
*     
*     Revision 3.3  93/11/02  13:12:45  armnrbd
*     Ajouter declaration EXTERNAL pour la routine UP2LOW.
*     
*     Revision 3.2  93/11/02  11:56:18  armnrbd
*     Petit BugFix au cas -DEF.
*     
*     Revision 3.1  93/11/02  10:48:57  armnrbd
*     Ajouter les programmes ZXMAX et ENLEVE.
*     Ajouter la cle DEF (pour defaut).
*     
*     Revision 3.0  93/10/13  13:56:30  armnrbd
*     Premiere version compatible HP-UX.
*     
*     Revision 2.15  93/08/19  15:20:16  armnrbd
*     Modifications cosmetiques.
*     
*     Revision 2.14  93/08/04  16:09:50  armnrbd
*     Ajouter les programmes GGALL et VSINTH.
*     Enlever toutes references a COFALL.
*     
*     Revision 2.13  93/06/23  11:22:26  armnrbd
*     Ajouter les programmes SPLDISS et XMPLOT.
*     
*     Revision 2.12  93/06/09  12:15:51  armnrbd
*     Ajouter le programme XPLOT.
*     Modifier le comportement du programme GPDPD.
*     
*     Revision 2.11  93/03/05  14:53:48  armnrbd
*     Ajouter reference a ADJUST dans la section de documentation.
*     
*     Revision 2.10  93/02/17  16:36:27  armnrbd
*     Modifier les programmes GGATIM et TIMAGG.
*     Ajouter les programmes de la section G ainsi que
*        les programmes GAUSSW,RANGRD et SMOOTH.
*     
*     Revision 2.9  92/12/24  12:04:46  armnrbd
*     Mentionner que GGTRIG fonctionne egalement sur grilles hemispheriques.
*     
*     Revision 2.8  92/12/10  15:55:10  armnrbd
*     Utiliser le nouveau CCARD (positionnel en premier).
*     
*     Revision 2.7  92/11/26  17:09:51  armnrbd
*     Ajouter le programme SUBAREA.
*     
*     Revision 2.6  92/11/25  21:16:46  armnrbd
*     Ajouter le programme TRANSPOS.
*     
*     Revision 2.5  92/11/25  17:20:20  armnrbd
*     Remplacer l'appel a JCLPNT par un appel a  CCARD.
*     
*     Revision 2.4  92/11/25  16:11:24  armnrbd
*     Ajouter les programmes DERTIM et INTTIM.
*     
*     Revision 2.3  92/11/21  13:03:01  armnrbd
*     1) Ajouter les programmes EOF25 et EOFROT.
*     2) implanter support de PKTYP dans tous les modules.
*     3) Quelques BugFix @ TIMCOV, ZXINT et ailleurs.
*     4) Modifier les transformees spectrales en ne considerant
*        que les polynomes d'une seule hemisphere.
*     
*     Revision 2.2  92/08/28  13:57:34  armnrbd
*     Implantation de GETSIZ/GETSIZ2.
*     
*     Revision 2.1  92/08/25  16:18:59  armnrbd
*     Ajouter le programme GROPR.
*     Modifier le comportement de GGDLAT.
*     
*     Revision 2.0  92/06/02  12:23:53  armnrbd
*     Ajouter HOVPLOT/Enlever HDPLOT.
*     Modifier CONVERT suite a des suggestions de Caya.
*     Corriger la documentation de ZADLEV.
*     
*     Revision 1.91  92/05/06  11:15:56  armnrbd
*     Paufiner le format 6100.
*     
*     Revision 1.9  92/05/06  11:05:16  armnrbd
*     Terminer l'ajout de la documenttion automatique.
*     Ajouter CONVERT,MKSYMM,MKUNSY,MIROIR,SPBLOW et SPSMOO
*        dans la documentation generale.
*     Mentionner la cle -help de secour specifique.
*     
*     Revision 1.8  92/04/30  13:52:10  armnrbd
*     Ajouter GGDEV,GGDLAT,GGDLON,GGHEMS,GGVECPS,GGTRIG,GGLOB,MSLPR,
*             GPDPD,PGEN,PSDIV,PSMLT,JOINER,TIMEGEN,BETAO.
*     Le programme WINDOW devient WINDOWF.
*     Continuer d'ajouter la documentation automatique.
*     
*     Revision 1.7  92/04/08  09:18:26  armnrbd
*     Modifier documentation re: ggvecps.
*     Ajouter les programmes BETA,DELHAT,DELHATO,GGSIGN,SIGNAG,GGVECPS,
*                            LEVREV,RZONAVG,TIMCOV,ZONCOV,SELECT2,FMASK
*     
*     Revision 1.6  92/03/25  15:01:08  armnrbd
*     Bug Fix a LSPGM.
*     
*     Revision 1.5  92/03/25  14:45:19  armnrbd
*     Add IJLOOK,LPPRINT,RELABL,SLICE,ZXPRINT.
*     Continuer a ajouter la documentation automatique.
*     Ajouter la section "MORE INFO" a LSPGM.
*     
*     Revision 1.4  92/03/06  15:37:40  armnrbd
*     Corriger LSPGM.
*     
*     Revision 1.3  92/03/06  15:20:49  armnrbd
*     Inserer du code de documentation automatique dans LSPGM.
*     
*     Revision 1.2  92/03/06  14:57:44  armnrbd
*     Modifier implantation de la doc automatique dans ZADLEV.PTN (1.1)
*     
*     Revision 1.1  92/03/04  21:21:08  armnrbd
*     Modifier BINACH et CHABIN (1.0)
*     Ajouter SPCALPA,SPDLSQ,SPNEGM,SPREIM,SPZXMLT,ZXDEV,
*             ZXDEVP,ZXDLAT,ZXDLATF,ZXTRIG,ZXWAVE.
*     
*     Revision 1.0  92/02/27  14:04:48  armnrbd
*     Initial revision
*     
#     endif

      EXTERNAL    QQQDOC,XIT,DIAG_CCARD,GETLIGN,UP2LOW,
     +            PROGRAM_VERSION

      LOGICAL     OK,LOPEN(99)

      INTEGER     I,IO,STIMEI,IPOS,PASS
      CHARACTER   NOMFIC*256,LIGN*80,CHOIX,UNIT5*512,
     +            CLES(4)*8,NAM(4)*8,DEF2(4)*8

      COMMON     /IODIRE/  UNIT5
      COMMON     /TIMER/   STIMEI
      COMMON     /PROGNAM/ NOMFIC
      COMMON     /ZZZOPEN/ LOPEN
*---------------------------------------------------------------------
      NOMFIC  = 'driver.ptn'

      CLES(1) = '-'
      NAM(1)  = ' '
      DEF2(1) = ' '

      CLES(2) = 'HELP'
      NAM(2)  = 'NON'
      DEF2(2) = 'OUI'

      CLES(3) = 'DEF'
      NAM(3)  = 'NON'
      DEF2(3) = 'OUI'

      CLES(4) = 'VERS'
      NAM(4)  = 'NON'
      DEF2(4) = 'OUI'

***    STANDART INPUT I/O UNIT NAME IS BLANCK.

      UNIT5 = ' '

***    GET INITIAL SYSTEM TIME AND SAVE IT.

      CALL SYSTEM_CLOCK( STIMEI )

      DO I=1,99
          LOPEN(I) = .FALSE.
      END DO

***    CHECK FOR A HELP REQUEST.

      PASS = 0

      IPOS = 1
      CALL DIAG_CCARD( CLES,DEF2,NAM,4, IPOS )

      IF (NAM(4) /= 'NON') CALL PROGRAM_VERSION( nam(4) )

      IF (NAM(2) == 'OUI')                                     THEN
          CALL QQQDOC( )
          CALL QUIT('  Help  ', 0 )
      ELSE IF (NAM(3) == 'OUI')                                THEN
          NOMFIC = 'lspgm_a.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_b.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_c.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_d.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_e.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_f.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_g.doc'
          CALL QQQDOC( )
          CALL QUIT('  Help  ', 0 )
      END IF

  050 WRITE(6,6000)

***    QUELLE SECTION (' ' ===> TOUTES).

      CALL GETLIGN( 5, LIGN,80, OK)

      CHOIX = ' '
      PASS  = PASS+1

      IF (.NOT.OK)                                             THEN
          GOTO 100
      ELSE
          READ( LIGN, 5000,END=100,ERR=100,IOSTAT=IO) CHOIX
          CALL UP2LOW( CHOIX,CHOIX )
      END IF  

  100 IF (CHOIX /= ' ' .OR. PASS > 1)                          THEN
          IF (CHOIX.EQ.'a' .OR.
     +        CHOIX.EQ.'b' .OR.
     +        CHOIX.EQ.'c' .OR.
     +        CHOIX.EQ.'d' .OR.
     +        CHOIX.EQ.'e' .OR.
     +        CHOIX.EQ.'f' .OR.
     +        CHOIX.EQ.'g' )                                   THEN
              NOMFIC = 'lspgm_'//CHOIX//'.doc'
              CALL QQQDOC( )
              GOTO 050
          ELSE
              IF (CHOIX.NE.'q' .AND. PASS.LE.1)    WRITE(6,6100)
              CALL                                 QUIT('  Lspgm ', 0 )
          END IF
      ELSE
          NOMFIC = 'lspgm_a.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_b.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_c.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_d.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_e.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_f.doc'
          CALL QQQDOC( )
          NOMFIC = 'lspgm_g.doc'
          CALL QQQDOC( )
      END IF

      WRITE(6,6200)

      CALL                                         QUIT('  Lspgm ', 0 )

*---------------------------------------------------------------------
 5000 FORMAT(A1)
 6000 FORMAT(/
     +  '1Available sections:'//
     +  ' A) Display programs'/
     +  ' B) File/label/record manipulation programs'/
     +  ' C) General computation programs'/
     +  ' D) Grid programs'/
     +  ' E) Spherical harmonic and fourier programs'/
     +  ' F) Zonal cross-section programs'/
     +  ' G) Time-series analysis and matrix operations programs'///
     +  'Up to four characters follow each description...'//
     +  '   1 - Number of input files (excluding stdin)'/
     +  '   2 - Number of output files  (excluding stdout)'/
     +  '   3 - C if the program reads stdin'/
     +  '   4 - G if the program is restricted to global fields'//
     +  '0Choose one section (a/b/c/d/e/f/g or q): ',$)
 6100 FORMAT('0Only one of a,b,c,d,e,f,g or q is allowed...')
 6200 FORMAT(/26X,'*** NOTE ***'//3x,'Help is also available from the',
     +  ' individual programs themselves'/3X,'Simply invoke the',
     +  ' programs with the -help specifier, as in ...'
     +   //20X,'Program_Name -help' //)

      END SUBROUTINE lspgm
      SUBROUTINE PROGRAM_VERSION ( mode )

#include "r.diag_build_info.h"

      IMPLICIT      none

      CHARACTER*(*) mode

***    Auteur: B.Dugas - RPN, le 9 novembre 1998

***    Objet: Imprimer de l'information sur la version courante.

      CHARACTER *80 rdiag,version,AMODE*3
      CHARACTER     vdate*20,REV*64

      EXTERNAL      RMNLIB_version
*---------------------------------------------------------------------

      AMODE = mode
      CALL LOW2UP( AMODE,AMODE )

      REV   = VERSION
      vdate = BUILD_TIMESTAMP
      rdiag = 'Version ' // trim( REV ) // ' ' // trim( vdate )

      CALL RMNLIB_version( version, .false.)

      IF (AMODE.EQ.'REV')                                      THEN

          write(6,'(A)') REV
          stop

      ELSE IF (AMODE.EQ.'DAT')                                 THEN

          write(6,'(A)') 'Date '// vdate
          stop

      ELSE IF (AMODE.EQ.'ALL' .OR.AMODE.EQ.'OUI')              THEN

          write(6,6000) trim( rdiag ),trim( version )

      END IF

      RETURN

*---------------------------------------------------------------------
 6000 format(/' The current R.DIAG is : ',A/
     +        ' And it is linked with ',A/)

      END SUBROUTINE program_version
#     endif
