#     if !defined (taille_entete_io)
#         define   taille_entete_io 16
#     endif
#     if !defined (unite_io_maximale)
#         define   unite_io_maximale 99
#     endif

C
C     $Log: put.ftn,v $
C     Revision 3.53  2018/04/16 13:13  dugas
C     Tenir compte d'un jeux incomplet de moyennes dans PUTSAMPLZ
C
C     Revision 3.52  2017/11/02 21:21  dugas
C     Tenir compte des differentes signatures d'operations temporelles
C      qui pourraient se retrouver dans le deuxieme caracteres du TYPVAR
C      lors du traitement de la routine PUTSAMPLZ. Ces signatures sont
C      fournies via le nouveau module stats_signatures
C
C     Revision 3.51  2016/10/25 14:44  dugas
C     - Modifications a PUTSAMPLZ pour possiblement sauver l'interval
C       des echeances dans IP2 pour des ensembles tous valides au
C       meme moment (i.e. DEET=0). Le nombre d'echantillons
C       etait deja sauve dans ip3 dans cette situation.
C
C     Revision 3.51  2016/10/25 14:44  dugas
C     - La variable HEAD passe de 28 a 32
C     - Modifications syntaxiques de type F77 --> F90
C     - Ajouter les arguments RKIND,HIVAL et LOVAL a PUTMSET3 qui utilise
C       maintenant PUTSAMPLZ pour sauver la taille des echantillons
C     - Ajouter RKIND aux variables traitees par PUTHIGH
C     - Ajouter la routine PUTHIR pour sauver des variables reelles
C       dans la section haute de IBUF (HIVAL et LOVAL en ce moment)
C     - Ajouter la routine PUTSAMPLZ qui sauve la taille des echantillons
C       de moyennes temporelles selon les differents formats supportes
C
C     Revision 3.50  2014/12/03 23:24:37  dugas
C     Enlever les enonces EQUIVALENCE.
C
C     Revision 3.49  2014/10/16 12:14:19  dugas
C     Modifications commandees par la compilation avec GFORTRAN et IFORT.
C
C     Revision 3.48  2014/09/25 18:42:04  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.47  2014/07/08 20:00:37  dugas
C     Remplacer les appels a GETPARI/PUTPARI par des appels a GETHIGH/PUTHIGH dans PUTLEV.
C
C     Revision 3.46  2013/10/08 01:15:03  bernard
C      - Modifications des entetes de PUTFLD2 (a la F90)
C      - L'appel a la fonction TASADR dans cette routine
C        devient un appel de sous-routine (CALL)
C
C     Revision 3.45  2010/10/23 16:20:11  dugas
C     Ne pas invoquer NEWDATE dans PUTBUF2 si DATE_CONVERSION_FACTOR < 0.
C
C     Revision 3.44  2010/07/07 21:39:51  dugas
C     Tenir compte de PKTYP='PK84' dans la conversion des
C      dates dans la routine PUTBUF2 (ceci est un oubli).
C
C     Revision 3.43  2010/02/12 22:35:25  dugas
C     La routine PUTBUF2 convertit le DATETIMESTAMP qui se retrouve
C      maintenant dans le IBUF(2) interne au format approprie.
C
C     Revision 3.42  2009/09/08 19:31:30  dugas
C     Ajouter PUTMSET3 tenant compte des IP3.
C
C     Revision 3.41  2008/11/24 21:25:38  dugas
C     Ajouter KEEPDATEV au common ZZZDATE dans PUTBUF2.
C
C     Revision 3.40  2008/04/28 21:38:53  dugas
C     Corriger l'usage des macros pour r.gppf (passe 2).
C
C     Revision 3.39  2008/04/28 14:23:15  dugas
C     Ne plus tenir compte du cas non-SQ98.
C
C     Revision 3.38  2007/12/19 19:24:38  dugas
C     - Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
C     - PUTLEV supporte LEV=IP1 pour les fichiers CMC/RPN.
C     - Enlever l'appel a PUTHIGH(IP1) dans PUTMSET2.
C
C     Revision 3.37  2006/04/26 16:11:16  dugas
C     Les nombres de bits utilises dans IBUF(19) pour DATYP et DIMSUP2
C      passent de 6 et 13, a 9 et 10, respectivement, dans les routines
C      GETHIGH et PUTHIGH.
C
C     Revision 3.36  2006/02/09 18:20:11  dugas
C     Meilleur traitement des numeros d'unitees I/O.
C
C     Revision 3.35  2005/07/28 17:20:45  dugas
C     Modifier le code pour enlever les messages d'avertissement de F90.
C
C     Revision 3.34  2004/11/08 20:50:27  dugas
C     Ajouter le support des donnees de type CHAR/datyp=3.
C
C     Revision 3.33  2002/08/20 19:02:29  dugas
C     Ajouter IP2 dans HIGHBUF et modifier PUTHIGH/PUTHIC pour en tenir compte.
C     Ajouter le support  des coordonnees HYBRID dans PUTLEV.
C
C     Revision 3.32  2002/04/22 15:33:51  dugas
C     Legere modification dans PUTHIC (mot #9).
C
C     Revision 3.31  2001/11/20 21:16:00  armnrbd
C     Modifier IBUF(4) dans PUTLEV si VKIND=3 (niveaux arbitraires).
C
C     Revision 3.30  2001/10/11 11:18:23  armnrbd
C      Tenir compte des etiquettes dans PUTMSET2.
C
C     Revision 3.29  2001/08/31 11:10:59  armnrbd
C     Ajouter la routine PUTMSET2.
C
C     Revision 3.28  2001/02/27 00:10:31  armnrbd
C     Enlever la refererence externe a PERROR.
C
C     Revision 3.27  2001/02/01 12:11:58  armnrbd
C     Ajouter DIMSUP1 et DIMSUP2 dans PUTHIGH.
C
C     Revision 3.26  2000/11/30 12:40:54  armnrbd
C     Terminer la derniere modification sur le controle de
C     la valeur du macro taille_entete dans PUTHIC.
C
C     Revision 3.25  2000/11/24 12:48:52  armnrbd
C     Modifier les valeurs possibles du macro taille_entete.
C     Ajouter NAME dans la liste des options de PUTHIC.
C
C     Revision 3.24  2000/09/28 15:48:43  armnrbd
C     Modifier les sequences d'appel a GETIO64.
C
C     Revision 3.23  2000/08/29 13:08:45  armnrbd
C      Ajouter IP1 dans HIGHBUF, donc modifier PUTHIGH, PUTHIC.
C     Tenir compte de cette information dans PUTLEV.
C
C     Revision 3.22  2000/07/24 20:56:22  armnrbd
C     Ajouter IP3 dans HIGHBUF et deplacer la definition des
C      indicateurs logiques associes dans PUTHIGH et PUTHIC.
C
C     Revision 3.21  2000/04/04 16:40:17  armnrbd
C     Modifier les transferts de date dans PUTBUF2.
C
C     Revision 3.20  2000/03/17 03:14:24  armnrbd
C     Separer les definitions des pointeurs IP et IP8 dans PUTLEV.
C
C     Revision 3.19  1999/05/04 22:08:49  armnrbd
C     Initialiser NEWL=' ' dans PUTZX2 en mode niveau par niveau.
C
C     Revision 3.18  1999/04/27 19:29:40  armnrbd
C     Corriger une erreur dans PUTLEV affectant les fichiers STD98.
C
C     Revision 3.17  1999/04/27 02:01:49  armnrbd
C     Restaurer NEWL a sa valeur initiale apres
C     un appel a PUTLEV dans la routine PUTZX2.
C
C     Revision 3.16  1999/04/08 19:43:56  armnrbd
C     Utiliser le comdeck MACHTYPE.CDK.
C     Appeller SWAPA4 dans la routine PUTBUF2.
C     Deplacer un endif de cpp dans PUTLEV.
C
C     Revision 3.15  1999/01/19 20:00:27  armnrbd
C     Separer TYPVAR et GRTYP dans le bloc highbuff.
C
C     Revision 3.14  1998/09/04  17:33:38  armnrbd
C     Conserver la compatibilite arriere avec CCCma pour Y2K.
C
C     Revision 3.13  1998/06/10  20:13:15  armnrbd
C     Ajouter une dependance sur SQ98 dans PUTHIC.
C
C     Revision 3.12  1998/06/10  18:46:23  armnrbd
C     Modifier le traitement de NEWL dans PUTBUF2.
C
C     Revision 3.11  1998/06/08  03:30:48  armnrbd
C     Ajouter les routines PUTHIGH et PUTHIC.
C     Utiliser ces dernieres pour faire la gestion des codes
C      entreposes dans la section haute de IBUF (NEWL, etc...).
C
C     Revision 3.10  1998/05/28  19:08:40  armnrbd
C     Plusieurs modifications a PUTLEV pour les fichiers standards RPN.
C
C     Revision 3.9  1997/10/10  20:16:25  armnrbd
C     Implanter le macro taille_entete_io pour PUTBUF2.
C
C     Revision 3.8  1997/02/17  03:50:04  armnrbd
C     Ajouter le mode I/O 64 bits.
C
C     Revision 3.7  1996/11/07  21:25:14  armnrbd
C     Modifier IBUF(4) dans le cas ZONL multi-niveaux (remplacer 1 par 0)
C     dans les routines PUTSET2, PUTZX2 et PUTLEV.
C     Modifer le traitement de IBUF dans PUTLEV.
C
C     Revision 3.6  1996/10/15  17:00:25  armnrbd
C     Modifier PUTLEV pour corriger le traitement de sigma=1.
C
C     Revision 3.5  1996/02/22  03:52:35  armnrbd
C     Ajouter l'option SINGLZ pour forcer la sortie des champs
C     de type zonaux dans des enregistrements a un seul niveau.
C
C     Revision 3.4  1995/07/04  19:58:35  armnrbd
C     Ecrire un nombre negatif a 64 bits dans PUTBUF2 dans le
C     cas de niveaux verticaux codes en valeurs negatives.
C
C     Revision 3.3  1995/05/30  19:09:28  armnrbd
C     Deplacer l'ecriture de INFMOT de PUTLEV a PUTZX2.
C
C     Revision 3.2  1995/01/23  10:58:44  armnrbd
C     S'assurer que IBUF est bien defini avant l'appel a PUTZX2 dans PUTSET2.
C
C     Revision 3.1  94/11/17  14:14:03  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:56:06  13:56:06  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.3  94/05/31  20:29:48  armnrbd
C     Ajouter la routine PUTLEV.
C     
C     Revision 2.2  94/03/31  15:47:25  armnrbd
C     Ajouter la routine PUTMSET.
C     
C     Revision 2.1  94/01/08  22:24:10  armnrbd
C     Passer LEV par LVDCODE dans la routine PUTZX2.
C     
C     Revision 2.0  93/10/13  13:32:11  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.10  93/09/16  23:03:20  23:03:20  armnrbd (Bernard Dugas)
C     Remplacer un read(' ') par read(blank) dans PUTBUF2.
C     
C     Revision 1.9  93/06/22  12:26:27  12:26:27  armnrbd (Bernard Dugas)
C     Restaurer l'ordre des niveaux dans PUTZX2 apres l'ecriture.
C     
C     Revision 1.8  93/01/25  22:02:15  armnrbd
C     2
C     
C     Revision 1.7  92/12/16  17:34:03  armnrbd
C     Ajouter la routine PUTYP.
C     
C     Revision 1.6  92/11/21  18:20:04  armnrbd
C     BugFix a la routine PUTSET2.
C     
C     Revision 1.5  92/11/12  21:35:33  armnrbd
C     Troisieme iteration PKTYP.
C     
C     Revision 1.4  92/11/11  12:29:24  armnrbd
C     Deuxieme iteration de l'implantation de PKTYP.
C     
C     Revision 1.3  92/10/30  12:11:50  armnrbd
C     Utiliser le macro cpp 'taille_entete'.
C     
C     Revision 1.2  92/10/28  17:12:18  armnrbd
C     Deuxieme passe de PK92.
C     
C     Revision 1.1  92/10/28  13:45:44  armnrbd
C     Premier jeux de modification pour l'implantation du PK92.
C     
C     Revision 1.0  92/02/21  11:34:24  armnrbd
C     Initial revision
C     

      SUBROUTINE PUTBUF2 (NFL,IBUF,LEN,OK )

***    MARS 27/90 - B.DUGAS

***    CETTE ROUTINE ECRIT UN TAMPON D'INFORMATION SUR NF.

      IMPLICIT      none

      INTEGER,      PARAMETER :: HEAD = taille_entete
      INTEGER,      PARAMETER :: IOHEAD = taille_entete_io

      CHARACTER(8)  HOLD
      LOGICAL       OK,CDATE
      INTEGER       NFL,NF,LEN,LENGTH,IOLEN,IOSHFT,err,
     +              IBUF(LEN),NAME,I,LEVEL,IHOLD(HEAD)

      CHARACTER(4)  PKTYP,NOMG,NOMD,TYPE,HNEWL

#     include      "machtype.cdk"

      LOGICAL                INFO
      COMMON       /ZZVERBO/ INFO

      INTEGER                              DATVAL
      LOGICAL                YDATE,KEEPIP2
      COMMON       /ZZZDATE/ YDATE,KEEPIP2,DATVAL

      INTEGER,      external :: Y2KDAT
      INTEGER(8),   external :: Y2KDAT8

      INTEGER,      external :: GETHIGH
      CHARACTER(4), external :: GETYP,GETHIC
      EXTERNAL      XIT,PUTYP,PUTHIC,SWAPA4,TASADR

!     used for date calculation (newdate)
      integer(8),   save :: bit33=X'100000000' ! = 1 0000 0000
      integer(8) :: DATE_CONVERSION_FACTOR
      integer    :: DATE32,YYYYMMDD, HHMMSSHH, NPAS
      integer(8) :: DATE64,YYYYMMDD8,HHMMSSHH8,DCF

      pointer     ( IDT32,DATE32(2) )

      INTEGER(8) :: MinDat8=  30 01 01 00,
     +              MaxDat8= 100 00 00 00

      integer,      external :: newdate

      CHARACTER(4), SAVE :: NEWL='NEWL',BLANK=' '

      INTEGER(8) :: BASDAT8=1900 00 00 00, UNMILLION=1 00 00 00

*---------------------------------------------------------------------
      IDT32 = LOC( DATE64 ) !!! equivalence ( DATE64, DATE32(1) )

      OK = .TRUE.
      NF = ABS( NFL )

      CDATE =.FALSE.

***    Sauver le contenu initial de l'entete dans HOLD

      IHOLD(1:HEAD) = IBUF(1:HEAD)

***    Modifier BASDAT8 selon la valeur de DATE_CONVERSION_FACTOR.

      call GET_DCF( DATE_CONVERSION_FACTOR )

      IF (DATE_CONVERSION_FACTOR > 0)                          THEN
          DCF = ( UnMillion * UnMillion ) / DATE_CONVERSION_FACTOR
          IF (CDATE .and. DATVAL >= 0) BASDAT8 = DATVAL * DCF
      ELSE IF (DATE_CONVERSION_FACTOR == 0)                    THEN
          IF (YDATE .and. DATVAL.GE.0) BASDAT8 = DATVAL * UNMILLION
      END IF

***    RETREIVE THE NEWL FLAG (BUT ONLY FOR MULTI-LEVEL ZONAL ARRAYS).

      WRITE(TYPE,4) IBUF(1)

      IF (TYPE   .EQ.'ZONL' .AND.
     +    IBUF(6).NE. 1     )                                  THEN
          HNEWL = GETHIC('NEWL',IBUF )
      ELSE
          HNEWL = ' '
      END IF

***    USE THE PACKING TYPE STORED IN IBUF.

      PKTYP = GETHIC('PKTYP',IBUF )

      CALL PUTYP( NF,PKTYP )

      LENGTH =   HEAD/(MOD( MACHINE,2 )+1)
      IOLEN  = IOHEAD/(MOD( MACHINE,2 )+1) 
      IOSHFT =   HEAD-IOHEAD 

      IF (PKTYP.EQ.'    ' .AND. LEN.NE.LENGTH) CALL  XIT(' Putbuf2',-1 )
      IF (PKTYP.EQ.'PK84' .AND. LEN.LT.LENGTH) CALL  XIT(' Putbuf2',-2 )

      IF (IOSHFT.LT.0) CALL                          XIT(' Putbuf2',-3 )

***    BIAS NEGATIVE VALUES OF PACKING VARIABLE TO ENSURE
***    POSITIVE NUMERICAL VALUES IN IBUF IN PK84 CASE.
***    RESTORE TO PACKING PROPORTION IN PK92 CASE...

      IF (IBUF(8).LT.0)                                        THEN
          IF (PKTYP.EQ.'PK84') IBUF(8)= 4096   -   IBUF(8)
          IF (PKTYP.EQ.'    ') IBUF(8)=  64  /ABS( IBUF(8) )
      END IF

***    RIGHT ALIGN (32-BIT WISE) NAMES IN THE PK92 CASE.

      IF (PKTYP.EQ.' ')                                        THEN
          WRITE(NOMG,0004) IBUF(3)
          CALL TASADR( NOMG,NOMD )
          READ(NOMD,0004) NAME
      ELSE
          NAME = IBUF(3)
      END IF

***    Convertir le "DATE-TIME STAMP" qui se trouve
***    encore dans IBUF(2) en date imprimable. Le
***    est place dans DATE64 pour le moment.

      NPAS = GETHIGH('NPAS',IBUF )

***    Le "DATE-TIME STAMP" en vieux format pour 1930010100
***    est 01 01 30 00 0 (FORMAT MMJJYYHHR). Les valeur plus
***    petites sont toutes des pas-de-temps. Pour les valeurs
***    plus grandes, on se fie a NPAS qui a pu etre place dans
***    la section haute de IBUF.

      if (DATE_CONVERSION_FACTOR >= 0 .AND.
     +   (IBUF(2) < 0 .OR.
     +   (IBUF(2) > 01 01 30 00 0 .AND. IBUF(2) /= NPAS)))     THEN
          err = newdate( IBUF(2), YYYYMMDD,HHMMSSHH, -3 )
      ELSE
          err = 1  !  Pas de temps, aucune conversion
      END IF

      IF (err == 0)                                            THEN

***        IBUF(2) semble bien contenir un "DATE-TIME STAMP".
***        Convertir selon le DATE_CONVERSION_FACTOR.

          IF (PKTYP /= 'PK84')                                 THEN

***            RESTORE 2-DIGIT YEARS (IF NECESSARY)
***            IN THE PK92 DATA FORMAT CASE.

              IF (DATE_CONVERSION_FACTOR > 0)                  THEN

                  YYYYMMDD8 = YYYYMMDD ; HHMMSSHH8 = HHMMSSHH
                  DATE64    = YYYYMMDD8 * 1 00 00 00 00 + HHMMSSHH8

                  DATE64 = DATE64/DATE_CONVERSION_FACTOR

                  IF ((YDATE .AND. DATVAL >= 00 ) .OR.
     +                (DATE64 >= (MinDat8*UnMillion)/
     +                  DATE_CONVERSION_FACTOR+BASDAT8 
     +           .AND. DATE64 <  (MaxDat8*UnMillion)/
     +                  DATE_CONVERSION_FACTOR+BASDAT8) )
     +            THEN
                      CDATE   =.TRUE.
                      DATE64  = DATE64 - BASDAT8
                  END IF

              ELSE if (DATE_CONVERSION_FACTOR == 0)            THEN

                  IF (MOD( HHMMSSHH , 1 00 00 00 ) == 0)       THEN

***                   DATE EN FORMAT YYYYMMDDHH (??)
                      DATE64 = YYYYMMDD*100_8+(HHMMSSHH/1 00 00 00)

                      IF (DATE64 < bit33)                      THEN

                          IF((YDATE              .AND.
     +                        DATVAL >=  00    )
     +                   .OR.(DATE64 >= MinDat8+BASDAT8  .AND.
     +                        DATE64 <  MaxDat8+BASDAT8) )     THEN
                              CDATE   =.TRUE.
                              DATE64  = DATE64 - BASDAT8
                          END IF

                      END IF

                  ELSE

***                   DATE EN FORMAT YYYYMMDD HHMMSSHH
                      YYYYMMDD8 = YYYYMMDD ; HHMMSSHH8 = HHMMSSHH
                      DATE64    = YYYYMMDD8 * 1 00 00 00 00 + HHMMSSHH8

                  END IF

              END IF

          ELSE

***            Cas PK84 comme PK92 mais sans considerations de BASDAT.

              IF (DATE_CONVERSION_FACTOR > 0)                      THEN

                  YYYYMMDD8 = YYYYMMDD ; HHMMSSHH8 = HHMMSSHH
                  DATE64    = YYYYMMDD8 * 1 00 00 00 00 + HHMMSSHH8

                  DATE64 = DATE64/DATE_CONVERSION_FACTOR

              ELSE if (DATE_CONVERSION_FACTOR == 0)                THEN

                  IF (MOD( HHMMSSHH , 1 00 00 00 ) == 0)           THEN

***                   DATE EN FORMAT YYYYMMDDHH (??)
                      DATE64 = YYYYMMDD*100_8+(HHMMSSHH/1 00 00 00)

                  ELSE

***                   DATE EN FORMAT YYYYMMDD HHMMSSHH
                      YYYYMMDD8 = YYYYMMDD ; HHMMSSHH8 = HHMMSSHH
                      DATE64    = YYYYMMDD8 * 1 00 00 00 00 + HHMMSSHH8

                  END IF

              END IF

          END IF

      ELSE

          DATE64 = IBUF(2)

      END IF

      IF (MACHINE.EQ.2)                                        THEN

***        LE TAMPON D'INFORMATION PASSE DE 32 BITS/MOT A 64 BITS/MOT.

          IBUF(16) = IBUF(8)
          IBUF(14) = IBUF(7)
          IBUF(12) = IBUF(6)
          IBUF(10) = IBUF(5)
          IBUF(8)  = IBUF(4)

***        SAUVER L'INFORMATION SUR LE NIVEAU VERTICAL.

          LEVEL    = IBUF(8)

          IF (HNEWL.EQ.NEWL)                                   THEN

***            METTRE 'NEWL' DANS IBUF(4).

              READ(NEWL,4) IBUF(8)
              IBUF(7) =  0

              IF (BIGENDI.EQ.0) CALL SWAPA4( IBUF(8) )

          ELSE IF (IBUF(4).LT.0)                               THEN

***            ECRIRE UN NOMBRE
***            NEGATIF DE 64 BITS.

              IBUF(7) = -1

          ELSE

              IBUF(7) =  0

          END IF

          IBUF(5)  = NAME

          IF (BIGENDI == 0)                                    THEN
              IBUF(4) = DATE32(1)
              IBUF(3) = DATE32(2)
          ELSE IF (BIGENDI == 1)                               THEN
              IBUF(4) = DATE32(2)
              IBUF(3) = DATE32(1)
          END IF

          READ( PKTYP,0004) IBUF(2)
          READ( BLANK,0004) IBUF(6)

          IF (BIGENDI.EQ.0)                                    THEN
              CALL SWAPA4( IBUF(5) )
              CALL SWAPA4( IBUF(2) )
              CALL SWAPA4( IBUF(1) )
          END IF

          IBUF(9)  = 0
          IBUF(11) = 0
          IBUF(13) = 0
          IBUF(15) = 0

      ELSE IF (MACHINE.EQ.1)                                   THEN

***        FILL-IN THE END OF IBUF(1) AND IBUF(3).

          WRITE(HOLD,'(2A4)') IBUF(1),'    '
          READ( HOLD,'( A8)') IBUF(1)

          IBUF(3) = NAME

          WRITE(HOLD,'(2A4)') IBUF(3),'    '
          READ( HOLD,'( A8)') IBUF(3)

          IBUF(2) = DATE64

      END IF

***    TENIR COMPTE DE LA DIFFERENCE ENTRE HEAD ET IOHEAD.

      IF (IOSHFT .GT.  0   .AND.
     +    LENGTH .LT. LEN  )                                   THEN
          DO  I=LENGTH+1,LEN
              IBUF(I-IOSHFT) = IBUF(I)
          END DO
      END IF

***    ECRIRE TOUT LE TAMPON IBUF.

      CALL WRITEF( NF, IBUF, LEN -(LENGTH-IOLEN) )

      IF (PKTYP.EQ.' ') READ(NOMG,0004) NAME

      IF (MACHINE.EQ.2)                                        THEN

***        RESTAURER IBUF(1 A 8).

          IF (BIGENDI.EQ.0) CALL SWAPA4( IBUF(1) )

          IBUF(2) = IBUF(4)
          IBUF(3) = NAME
          IBUF(4) = LEVEL
          IBUF(5) = IBUF(10)
          IBUF(6) = IBUF(12)
          IBUF(7) = IBUF(14)
          IBUF(8) = IBUF(16)

      ELSE IF (MACHINE.EQ.1)                                   THEN

***        EMPTY THE END OF IBUF(1) AND IBUF(3).

          WRITE(HOLD,0004) IBUF(1)
          READ( HOLD,0004) IBUF(1)

          IBUF(3) = NAME

          WRITE(HOLD,0004) IBUF(3)
          READ( HOLD,0004) IBUF(3)

      END IF

***    ACCOUNT FOR THE DIFFERENCE BETWEEN HEAD AND IOHEAD.

      IF (IOSHFT .GT.  0   .AND.
     +    LENGTH .LT. LEN  )                                   THEN
          DO  I=LEN,LENGTH+1,-1
              IBUF(I) = IBUF(I-IOSHFT)
          END DO
      END IF

***    RESTORE THE INITIAL HEAD WORDS IN IBUF.

      IBUF(1:HEAD) = IHOLD(1:HEAD)

      RETURN

*---------------------------------------------------------------------
 0004 FORMAT(A4)

      END
      SUBROUTINE putmset (NF,G,LEV,NLEV,VARIAB,NVAR,IBUF,MAXPK)

***    FEV 24/94 - B.Dugas, RPN.

***    Cette routine ecrit un pas de temps complet de NVAR variables
***    ayant chacune NLEV niveaux. La routine PUTSET2 est utilisee
***    pour effectuee l'ecriture.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      REAL        G(*),GR8
      INTEGER     NF,NLEV,NVAR,MAXPK
      INTEGER     LEV(NLEV),IBUF(*)
      CHARACTER*4 VARIAB(NVAR)

***    Variables locales.

      LOGICAL     IO64B
      CHARACTER*4 KIND
      INTEGER     POSIT,I,NWDS

      REAL*8         G8
      POINTER   ( PG,G8(1) ),( PGR8,GR8(*) )

      LOGICAL,    EXTERNAL :: GETIO64
      EXTERNAL    PUTSET2

*-------------------------------------------------------------------
      WRITE(KIND,0004) IBUF(1)

          IO64B     = GETIO64( IO64B )

      IF (IO64B) PG = LOC( G(1) )

                          NWDS = IBUF(5)*IBUF(6)
      IF (KIND.EQ.'ZONL') NWDS = IBUF(5)
      IF (KIND.EQ.'CMPL' .OR.
     +    KIND.EQ.'FOUR' .OR.
     +    KIND.EQ.'SPEC') NWDS = NWDS * 2
      IF (KIND.EQ.'CHAR' .AND.
     +   .NOT.IO64B      .AND.
     +    IBUF(8).EQ.-64) NWDS = NWDS * 2

      DO  I=1,NVAR

          READ(VARIAB(I),0004) IBUF(3)
          POSIT = (I-1)*NLEV*NWDS+1

          IF (IO64B)                                           THEN
              PGR8 = LOC( G8(POSIT) )
              CALL putset2( NF, GR8, LEV,NLEV, IBUF,MAXPK )
          ELSE
              CALL putset2( NF, G (POSIT), LEV,NLEV, IBUF,MAXPK )
          END IF

      END DO

      RETURN
*-------------------------------------------------------------------

 0004 FORMAT(A4)

      END
      SUBROUTINE putmset2 (NF, G, SET,NSET, LEV,VARIAB,MAXV, IBUF,MAXPK)

***    Juin 2001 - B.Dugas, RPN.

***    Cette routine ecrit un pas de temps complet de SET(NSET)
***    enregistrements La routine PUTSET2 est utilisee pour
***    effectuee l'ecriture.  L'information sur les noms et
***    niveaux correspondant se trouve dans les champs
***    d'entree VARIAB et LEV, respectivement.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      REAL        G(*),GR8
      INTEGER     NF,NSET,MAXV,MAXPK
      CHARACTER * ( * ) VARIAB(MAXV)
      INTEGER     SET(0:NSET),LEV(MAXV,2),IBUF(*)

***    Variables locales.

      LOGICAL     IO64B
      INTEGER     POSIT,I,NWDS,NLEV,DEBSET
      CHARACTER*4 KIND, HOLDN*20

      REAL*8          G8
      POINTER   ( PG8,G8(1) ),( PGR8,GR8(*) )

      LOGICAL,    EXTERNAL :: GETIO64
      EXTERNAL    PUTSET2,PUTHIGH,PUTHIC

*-------------------------------------------------------------------
      WRITE(KIND,0004) IBUF(1)

          IO64B     = GETIO64( IO64B )

      IF (IO64B) PG8 = LOC( G(1) )

                          NWDS = IBUF(5)*IBUF(6)
      IF (KIND.EQ.'ZONL') NWDS = IBUF(5)
      IF (KIND.EQ.'CMPL' .OR.
     +    KIND.EQ.'FOUR' .OR.
     +    KIND.EQ.'SPEC') NWDS = NWDS * 2
      IF (KIND.EQ.'CHAR' .AND.
     +   .NOT.IO64B      .AND.
     +    IBUF(8).EQ.-64) NWDS = NWDS * 2

      DO  I=1,NSET

          DEBSET = SET(I-1)+1

          READ(VARIAB(DEBSET),0004) IBUF(3)
          POSIT = SET(I-1)*NWDS+1
          NLEV  = SET(I)-SET(I-1)

          HOLDN = VARIAB(DEBSET)
          IF (HOLDN(17:20).NE.' ')
     +        CALL PUTHIC( HOLDN(17:20),'ETIK4' ,IBUF )
          IF (HOLDN(13:16).NE.' ')
     +        CALL PUTHIC( HOLDN(13:16),'ETIK3' ,IBUF )
          IF (HOLDN(09:12).NE.' ')
     +        CALL PUTHIC( HOLDN(09:12),'ETIK2' ,IBUF )
          IF (HOLDN(05:08).NE.' ')
     +        CALL PUTHIC( HOLDN(05:08),'ETIK1' ,IBUF )

          IF (IO64B)                                           THEN
              PGR8 = LOC( G8(POSIT) )
              CALL putset2( NF, GR8, LEV(DEBSET,1),NLEV, IBUF,MAXPK )
          ELSE
              CALL putset2( NF, G (POSIT), LEV(DEBSET,1),NLEV,
     +                                     IBUF,MAXPK )
          END IF

      END DO

      RETURN
*-------------------------------------------------------------------

 0004 FORMAT(A4)

      END
      SUBROUTINE putmset3 (NF, G, SET,NIP3,NSET,
     +                            LEV,VARIAB,MAXV,
     +                            IBUF,MAXPK)

***    Juin 2001 - B.Dugas, RPN.

***    Cette routine ecrit un pas de temps complet de SET(NSET)
***    enregistrements La routine PUTSET2 est utilisee pour
***    effectuee l'ecriture.  L'information sur les noms et
***    niveaux correspondant se trouve dans les champs
***    d'entree VARIAB et LEV, respectivement.

      IMPLICIT    none

      INTEGER     HEAD
      PARAMETER ( HEAD = taille_entete )

      REAL        G(*),GR8
      INTEGER     NF,NSET,MAXV,MAXPK
      CHARACTER * ( * ) VARIAB(MAXV)
      INTEGER     SET(0:NSET),NIP3(NSET),LEV(MAXV,2),IBUF(*)

***    Variables locales.

      INTEGER     POSIT,I,NWDS,NLEV,DEBSET
      CHARACTER*4 KIND, HOLDN*20

      REAL*8          G8
      POINTER   ( PG8,G8(1) ),( PGR8,GR8(*) )

      LOGICAL     GETIO64,IO64B
      EXTERNAL    GETIO64,PUTSET2,PUTHIGH,PUTHIC

*-------------------------------------------------------------------
      WRITE(KIND,0004) IBUF(1)

          IO64B     = GETIO64( IO64B )

      IF (IO64B) PG8 = LOC( G(1) )

                          NWDS = IBUF(5)*IBUF(6)
      IF (KIND.EQ.'ZONL') NWDS = IBUF(5)
      IF (KIND.EQ.'CMPL' .OR.
     +    KIND.EQ.'FOUR' .OR.
     +    KIND.EQ.'SPEC') NWDS = NWDS * 2
      IF (KIND.EQ.'CHAR' .AND.
     +   .NOT.IO64B      .AND.
     +    IBUF(8).EQ.-64) NWDS = NWDS * 2

      DO  I=1,NSET

          DEBSET = SET(I-1)+1

          READ(VARIAB(DEBSET),0004) IBUF(3)
          POSIT = SET(I-1)*NWDS+1
          NLEV  = SET(I)-SET(I-1)

          CALL PUTHIGH( NIP3(I),'IP3'  ,IBUF )

          HOLDN = VARIAB(DEBSET)
          IF (HOLDN(17:20).NE.' ')
     +        CALL PUTHIC( HOLDN(17:20),'ETIK4' ,IBUF )
          IF (HOLDN(13:16).NE.' ')
     +        CALL PUTHIC( HOLDN(13:16),'ETIK3' ,IBUF )
          IF (HOLDN(09:12).NE.' ')
     +        CALL PUTHIC( HOLDN(09:12),'ETIK2' ,IBUF )
          IF (HOLDN(05:08).NE.' ')
     +        CALL PUTHIC( HOLDN(05:08),'ETIK1' ,IBUF )

          IF (IO64B)                                           THEN
              PGR8 = LOC( G8(POSIT) )
              CALL putset2( NF, GR8, LEV(DEBSET,1),NLEV, IBUF,MAXPK )
          ELSE
              CALL putset2( NF, G (POSIT), LEV(DEBSET,1),NLEV,
     +                                     IBUF,MAXPK )
          END IF

      END DO

      RETURN
*-------------------------------------------------------------------

 0004 FORMAT(A4)

      END
      SUBROUTINE putmset4 (NF, G, SET,NIP3,RKIND,HIVAL,LOVAL,NSET,
     +                            LEV,VARIAB,MAXV, IBUF,MAXPK)

***    Juin 2016 - B.Dugas, UQAM.

***    Cette routine ecrit un pas de temps complet de SET(NSET)
***    enregistrements La routine PUTSET2 est utilisee pour
***    effectuee l'ecriture.  L'information sur les noms et
***    niveaux correspondant se trouve dans les champs
***    d'entree VARIAB et LEV, respectivement. 

***    De plus, le type de codage RKIND (vertical ou temporel)
***    IP1/2/3 ainsi que les extremas HIVAL et LOVAL sont aussi
***    possiblement ecrits.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

***    Arguments.

      CHARACTER * ( * ) VARIAB(MAXV)
      INTEGER     NF,NSET,MAXV,MAXPK
      REAL        G(*),HIVAL(*),LOVAL(*)
      INTEGER     SET(0:NSET),NIP3(NSET),RKIND(*),LEV(MAXV,2),IBUF(*)

***    Variables locales.

      REAL        GR8
      LOGICAL     IO64B
      INTEGER     POSIT,I,NWDS,NLEV,DEBSET
      CHARACTER*4 KIND, HOLDN*20,TYPVAR*2
      REAL        HIVALI,LOVALI

      REAL*8          G8
      POINTER   ( PG8,G8(1) ),( PGR8,GR8(*) )

      LOGICAL,    EXTERNAL :: GETIO64
      EXTERNAL    PUTSET2,PUTHIGH,PUTHIC,PUTHIR, PUTSAMPLZ

*-------------------------------------------------------------------
      WRITE(KIND,0004) IBUF(1)

      IO64B     = GETIO64( IO64B )

      IF (IO64B) PG8 = LOC( G(1) )

                          NWDS = IBUF(5)*IBUF(6)
      IF (KIND.EQ.'ZONL') NWDS = IBUF(5)
      IF (KIND.EQ.'CMPL' .OR.
     +    KIND.EQ.'FOUR' .OR.
     +    KIND.EQ.'SPEC') NWDS = NWDS * 2
      IF (KIND.EQ.'CHAR' .AND.
     +   .NOT.IO64B      .AND.
     +    IBUF(8).EQ.-64) NWDS = NWDS * 2

      DO  I=1,NSET

          DEBSET = SET(I-1)+1

          READ(VARIAB(DEBSET),0004) IBUF(3)
          POSIT = SET(I-1)*NWDS+1
          NLEV  = SET(I)-SET(I-1)

!!!       CALL PUTHIGH( NIP3(I),'IP3'  ,IBUF )
          CALL PUTHIR ( HIVAL(I),'HIVAL',IBUF )
          CALL PUTHIR ( LOVAL(I),'LOVAL',IBUF )
          CALL PUTHIGH( RKIND(I),'RKIND',IBUF )

          CALL PUTSAMPLZ( NIP3(I),IBUF )

          HOLDN = VARIAB(DEBSET)
          IF (HOLDN(17:20).NE.' ')
     +        CALL PUTHIC( HOLDN(17:20),'ETIK4' ,IBUF )
          IF (HOLDN(13:16).NE.' ')
     +        CALL PUTHIC( HOLDN(13:16),'ETIK3' ,IBUF )
          IF (HOLDN(09:12).NE.' ')
     +        CALL PUTHIC( HOLDN(09:12),'ETIK2' ,IBUF )
          IF (HOLDN(05:08).NE.' ')
     +        CALL PUTHIC( HOLDN(05:08),'ETIK1' ,IBUF )

          IF (IO64B)                                           THEN
              PGR8 = LOC( G8(POSIT) )
              CALL putset2( NF, GR8, LEV(DEBSET,1),NLEV, IBUF,MAXPK )
          ELSE
              CALL putset2( NF, G (POSIT), LEV(DEBSET,1),NLEV,
     +                                     IBUF,MAXPK )
          END IF

      END DO

      RETURN
*-------------------------------------------------------------------

 0004 FORMAT(A4)

      END
      SUBROUTINE putset2 (NF,G,LEV,NLEV,IBUF,MAXPK)

***    JAN 18/80 - J.D.HENDERSON
***    MAI 03/91 - B.Dugas, RPN. (Le traitement des jeux de type 'ZONL'
***                               se fait par la routine PUTZX2)

***    WRITES A SET OF FIELDS TO FILE NF.  G CONTAINS THE SET OF NLEV
***    FIELDS. LEV(NLEV) = LEVEL VALUES FOR THE LABELS. ALL LABEL WORDS 
***    IN  IBUF(1-8) MUST BE PRESET EXCEPT THE LEVEL IN WORD 4. MAXPK 
***    IS THE MAXIMUM LENGTH OF A PACKED FIELD.

***    NOTE:
***    IF MACHINE IS EQUAL TO 4, TWO PACKING METHODS ARE SUPPORTED AND
***    THE IDAT PART OF IBUF IS NO LONGER USED. THEN, MAXPK IS ALSO
***    IGNORED.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      REAL        G(*)
      INTEGER     NF,NLEV,LEV(0:NLEV-1),IBUF(*),MAXPK

#     include    "machtype.cdk"

***    Variables locales.

      REAL*8           G8
      POINTER    ( PG8,G8(1) )

      LOGICAL      IO64B
      INTEGER      PACK, I,L,N, DATYP
      CHARACTER(4) TYPE,PKTYP,GETYP,SAVEP
      INTEGER      KIND0,NI0,NJ0,PACK0, LEN,NWDS
      SAVE         KIND0,NI0,NJ0,PACK0, LEN,NWDS

      INTEGER,     DIMENSION(:), ALLOCATABLE :: JBUF
      SAVE                                      JBUF

      CHARACTER(4),EXTERNAL :: GETHIC
      INTEGER,     EXTERNAL :: GETHIGH
      LOGICAL,     EXTERNAL :: GETIO64
      EXTERNAL     LBLCHK,RECPK2,RECPUT,PUTZX2,PUTPARI

      DATA         KIND0,NI0,NJ0,PACK0 / 4*-1 /

*-------------------------------------------------------------------- 
***    ENSURE OUTPUT DATYP CONSISTENCY.

      DATYP = GETHIGH('DATYP',IBUF )
      CALL PUTPARI('DATYP',DATYP )

***    WHAT KIND OF DATA DO WE HAVE ?

      WRITE(TYPE,0004) IBUF(1)

      IF (TYPE.NE.'ZONL')                                      THEN

***        EVERYTHING BUT ZONAL ARRAYS PASSES HERE.

          IF (MACHINE.EQ.2)                                    THEN

                  IO64B     = GETIO64( IO64B )

              IF (IO64B) PG8 = LOC( G(1) )

***            PUT DEFAULT PKTYP IN IBUF FOR LBLCHK.

              SAVEP = GETHIC( 'PKTYP',IBUF )

              PKTYP = GETYP( 0 )
              CALL PUTHIC( PKTYP,'PKTYP',IBUF )

***            ALLOCATE OUTPUT BUFFER ONLY WHEN NEEDED.

              IF (KIND0 .NE. IBUF(1) .OR.
     +            NI0   .NE. IBUF(5) .OR.
     +            NJ0   .NE. IBUF(6) .OR.
     +            PACK0 .NE. IBUF(8) )                         THEN

                  IF (KIND0.NE.-1) DEALLOCATE( JBUF )

                  CALL LBLCHK( LEN,NWDS,PACK,IBUF )

                  ALLOCATE( JBUF(LEN) )

                  KIND0 = IBUF(1)
                  NI0   = IBUF(5)
                  NJ0   = IBUF(6)
                  PACK0 = IBUF(8)

              END IF

              DO I=1,HEAD
                 JBUF(I) = IBUF(I)
              END DO

              CALL PUTHIC( SAVEP,'PKTYP',IBUF )

***            TREAT ONE LEVEL AT A TIME.

              DO L=0,NLEV-1

                  JBUF(4) = LEV(L)
                  N       = L*NWDS+1

***                PACK THE FIELD INTO JBUF. 
***                WRITE THE RECORD TO FILE NF.

                  IF (IO64B)                                   THEN
                      CALL RECPK2( JBUF,LEN-HEAD, G8(N) )
                  ELSE
                      CALL RECPK2( JBUF,LEN-HEAD, G (N) )
                  END IF

                  CALL RECPUT( NF, JBUF )

              END DO

          ELSE IF (MACHINE.EQ.1)                               THEN

                  NWDS = IBUF(5)*IBUF(6)
              IF (TYPE.EQ.'SPEC' .OR.
     +            TYPE.EQ.'CMPL' .OR.
     +            TYPE.EQ.'FOUR')
     +            NWDS = NWDS*2 

              DO L=0,NLEV-1

                  IBUF(4) = LEV(L)
                  N       = L*NWDS+1

                  CALL RECPK2( IBUF,MAXPK, G(N) )
                  CALL RECPUT( NF, IBUF )

              END DO

          END IF

      ELSE

***       ZONAL ARRAYS ARE WRITTEN WITH PUTZX2.

         IF (NLEV.GT.1)                                        THEN
             IBUF(4) = 0
             IBUF(6) = NLEV
         ELSE
             IBUF(4) = LEV(0)
             IBUF(6) = 1
         END IF

         CALL  putzx2( NF, G,LEV, IBUF,MAXPK )

      END IF

      RETURN
*----------------------------------------------------------------------

    4 FORMAT(A4)

      END 
      SUBROUTINE putyp (NF,OUTPTYP )

***    Mettre a jour le contenu de ZZPKTYP lors d'une
***    operation d'ecriture avec la routine putbuf2.

      INTEGER       NF
      CHARACTER*4   OUTPTYP,  PKTYP(0:unite_io_maximale)
      COMMON       /ZZPKTYP/  PKTYP
*----------------------------------------------------------------------

      IF (NF.LE.unite_io_maximale) PKTYP(NF)   = OUTPTYP

*----------------------------------------------------------------------
      RETURN
      END

      SUBROUTINE putzx2 (NF, ZX,LEV, IBUF,MAXPK)

***    MODIFIEE par B.Dugas, RPN - Mai 8/91:
***     ... Ajouter la variable NEWL (i.e. 'NEWL'evel).

***    Fevrier 12/91 - B.Dugas, RPN.

***    Putzx2 ecrit un enregistrement correspondant a une coupe
***    en section (TYPE='ZONL') et optionnellement, un enregistre-
***    ment d'informations niveaux.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      REAL        ZX(*),ZXR
      INTEGER     NF, LEV(*), MAXPK, IBUF(*)

      LOGICAL              SINGLZ
      COMMON     /ZZZSNGL/ SINGLZ
      INTEGER              INFMOT
      COMMON     /ECRZXL/  INFMOT(0:unite_io_maximale)

***    Variables locales.

      LOGICAL     IO64B,CALLEV
      INTEGER     I,L,LR, DEBUT,FIN, DATYP,VKIND, NLEV
      CHARACTER(4) PKTYP,NEWL,HNEWL
      REAL        ZXTEMP, PR1
      REAL*8      ZXTEMP8

      REAL*8          ZX8
      POINTER   ( PZ8,ZX8(1) ),(PZXR,ZXR(1) )

      INTEGER,     EXTERNAL :: GETHIGH
      LOGICAL,     EXTERNAL :: GETIO64
      CHARACTER(4),EXTERNAL :: GETYP,GETHIC
      EXTERNAL     PUTFLD2,SETLAB,LVDCODE,PUTLEV,
     +             PUTPARI,PUTHIC

      DATA         NEWL / 'NEWL' /

*----------------------------------------------------------------------
      NLEV = IBUF(6)

***    ENSURE OUTPUT DATA TYPE CONSISTENCY.

      DATYP = GETHIGH('DATYP',IBUF )
      CALL PUTPARI('DATYP',DATYP )

***    DETERMINE CURRENT I/O BIT MODE.

          IO64B     = GETIO64( IO64B )
      IF (IO64B) PZ8 = LOC( ZX (1) )

***    MODE D'OPERATION SIMPLE- OU MULTI-NIVEAUX.
     
      IF (NLEV.EQ.1 .OR. SINGLZ)                               THEN

          CALL PUTHIC( ' ','NEWL',IBUF )

          IBUF(6) = 1

          DO  L=1,NLEV
              IBUF(4) = LEV(L)
              DEBUT   = (L-1)*IBUF(5)+1
              IF (IO64B)                                       THEN
                  PZXR = LOC( ZX8(DEBUT) )
                  CALL PUTFLD2( NF, ZXR(1), IBUF,MAXPK )
              ELSE
                  CALL PUTFLD2( NF, ZX(DEBUT), IBUF,MAXPK )
              END IF
          END DO

      ELSE

          PKTYP = GETYP( 0 )

***        Inverser l'order des niveaux (du bas vers le haut).

          LR = IBUF(5)

          DO 050 L=1,NLEV/2

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
                      ZXTEMP       = ZX(I+DEBUT)
                      ZX (I+DEBUT) = ZX(I+FIN  )
                      ZX (I+FIN  ) = ZXTEMP
                  END DO
              END IF

  050     CONTINUE

***        Ecrire la grille. Corriger pour NEWL dans ibuf(4).

          IF (PKTYP(1:2).EQ.'SQ')                              THEN
              CALL CONVPR( LEV(1) ,PR1,VKIND,-2 )
              IF (VKIND.EQ.6)                                  THEN
                  CALL CONVPR( IBUF(4),1.0,VKIND,+2 )
              ELSE
                  CALL CONVPR( IBUF(4),0.0,VKIND,+2 )
              END IF
          ELSE
              IBUF(4) = 0
          END IF

          CALLEV  = .FALSE.

          HNEWL   = GETHIC('NEWL',IBUF )

          IF (NLEV.NE.INFMOT(NF) .OR. HNEWL.EQ.NEWL)           THEN
              CALL PUTHIC( NEWL,'NEWL',IBUF )
              INFMOT(NF) = NLEV
              CALLEV  = .TRUE.
          END IF

          CALL PUTFLD2( NF, ZX, IBUF,MAXPK )

***        Restaurer l'ordre des niveaux (du haut vers le bas).

          DO 060 L=1,NLEV/2

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
                      ZXTEMP       = ZX(I+DEBUT)
                      ZX (I+DEBUT) = ZX(I+FIN  )
                      ZX (I+FIN  ) = ZXTEMP
                  END DO
              END IF

  060     CONTINUE

          IF (CALLEV)                                          THEN

***            Sauver un nouveau tampon de valeurs niveaux.

              CALL PUTLEV( NF, LEV,NLEV, IBUF,MAXPK )

***            Restaurer NEWL a sa valeur initiale.

              CALL PUTHIC( HNEWL,NEWL,IBUF )

          END IF

      END IF

      RETURN
      END
      SUBROUTINE putlev( NF, LEV,NLEV, IBUF,MAXPK )

***    Mai 31/94 - B.Dugas, RPN.

***    Ecrire les niveaux vericaux correspondants a une coupe
***    en section (TYPE='ZONL').

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD =  taille_entete

      INTEGER     NF,NLEV,LEV(NLEV),IBUF(*),MAXPK

      INTEGER             INFMOT(0:unite_io_maximale)
      COMMON     /ECRZXL/ INFMOT

***    Variables locales.

      CHARACTER(4) PKTYP
      LOGICAL      IO64B,OK
      REAL         PR (NLEV)
      REAL*8       PR8(NLEV),PRHOLD
      INTEGER      J,L,IP1,  JBUF(HEAD), DATYP,VKIND

      REAL          PRR
      POINTER    ( PPRR,PRR(1) )

      CHARACTER(4),EXTERNAL :: GETYP
      INTEGER,     EXTERNAL :: GETHIGH,GETKIND
      LOGICAL,     EXTERNAL :: GETIO64,SETIO64
      EXTERNAL     SETLAB,LVDCODE,PUTFLD2,CONVPR,PUTHIGH,PUTHIC

      DATA         DATYP / 1 /
*----------------------------------------------------------------------

      VKIND = 0
      IO64B = GETIO64( IO64B )
      PPRR  = LOC( PR8(1) )

      DO  J=1,HEAD
          JBUF(J) = IBUF(J)
      END DO

      CALL PUTHIC(' ','NEWL',IBUF )
      CALL SETLAB( IBUF, 'ZONL',-1,'++',-1,1,-1,-1,-1 )

***    L'information niveau est de bas en haut et en
***    format reel log10.

      PKTYP = GETYP( 0 )

      IF (PKTYP(1:2).EQ.'SQ')                                  THEN

          VKIND = GETKIND( )

          CALL CONVPR( IP1, 0, VKIND, +1 )
          CALL PUTHIGH( IP1,'IP1',IBUF )

          DO  L=1,NLEV
              PR8(L) = LEV(L)
          END DO


      ELSE

          CALL LVDCODE( PR,LEV,NLEV )

          DO  L=NLEV,1,-1
              PR8(L) = PR(L)
          END DO

      END IF

      IF (VKIND.EQ.3) IBUF(4) = 1

      DO  L=1,(NLEV+1)/2

          IF (PKTYP.EQ.'SQ98')                                 THEN
              PRHOLD        = PR8(NLEV-L+1)
              PR8(NLEV-L+1) = PR8(     L  )
              PR8(     L  ) = PRHOLD
          ELSE
              PRHOLD        = LOG10( PR8(NLEV-L+1) )
              PR8(NLEV-L+1) = LOG10( PR8(     L  ) )
              PR8(     L  ) = PRHOLD
          END IF
      END DO

***    Les sorties sont en 64 ou 32 bits ?

      IF (PKTYP.EQ.'SQ98')                                     THEN
          IBUF(8) = -32
          OK      = SETIO64( .TRUE. )
          CALL PUTHIGH( 2,'DATYP',IBUF )
          CALL PUTFLD2( NF, PRR, IBUF,MAXPK )
      ELSE
          IF (.NOT.IO64B)                                      THEN
              DO  L=1,NLEV
                  PR(L) = PR8(L)
              END DO
              CALL PUTFLD2( NF, PR, IBUF,MAXPK )
          ELSE
              CALL PUTFLD2( NF, PRR, IBUF,MAXPK )
          END IF
      END IF

      OK = SETIO64( IO64B )

      DO  J=1,HEAD
          IBUF(J) = JBUF(J)
      END DO

      RETURN

*----------------------------------------------------------------------
      END
      SUBROUTINE puthigh (VALUE,NAME,IBUF)

      IMPLICIT          none

***    Cette routine ecrit des mots (en format
***    entier)  dans la section haute de IBUF.

      INTEGER,          PARAMETER :: HEAD = taille_entete

      INTEGER           VALUE,IBUF(HEAD)
      CHARACTER * ( * ) NAME

#     include          "highbuf.cdk"

***    Variables locales.

      INTEGER           BITVAL
      CHARACTER*8       NOM

      LOGICAL                    info
      COMMON           /ZZVERBO/ info

      EXTERNAL          LOW2UP,XIT
#     if defined (HP) || defined (SUN)
      INTEGER           NUM1,NUM2, AND,OR

      AND( NUM1, NUM2) = IAND( NUM1, NUM2)
      OR ( NUM1, NUM2) = IOR ( NUM1, NUM2)
#     endif
*------------------------------------------------------------------------------
***    Verifier la valeur de HEAD.

      if ( HEAD /= 32)                                 THEN
          IF (INFO) WRITE(6,6001) 32,taille_entete
          CALL                                     XIT(' Puthigh',-1 )
      END IF

***    Convertir name en majuscules.

      nom = NAME
      call LOW2UP( nom,nom )

***    On connait ce nom ?

      SELECT CASE ( NOM )

         CASE('LEN')
            IBUF(11) = VALUE
         CASE( 'DEET')
            IBUF(12) = VALUE
            highdel  = .TRUE.
         CASE('NPAS')
            IBUF(13) = VALUE
            highpas  = .TRUE.
         CASE('DATEO')
            IBUF(14) = VALUE
            highdat  = .TRUE.
         CASE('IG1')
            IBUF(15) = VALUE
            highigi  = .TRUE.
         CASE('IG2')
            IBUF(16) = VALUE
            highigi  = .TRUE.
         CASE('IG3')
            IBUF(17) = VALUE
            highigi  = .TRUE.
         CASE('IG4')
            IBUF(18) = VALUE
            highigi  = .TRUE.
         CASE('DATYP')

***        Bits 0 a 8 pour DATYP.
          
            BITVAL   = IBITS( -1,0,23 )
            IBUF(19) = AND( IBUF(19), ISHFT( BITVAL,9 ) )
            BITVAL   = AND( VALUE,    IBITS( -1,0, 9 ) )
            IBUF(19) = OR(  IBUF(19), BITVAL )

            highdtp  = .TRUE.

         CASE('DIMSUP1')

***        Bits 9 a 21 pour DIMSUP1 (dimension supplementaire #1)

            BITVAL   = IBITS( -1,0,10 )
            BITVAL   = OR( ISHFT( BITVAL,22 ), IBITS( -1,0,9 ) )
            IBUF(19) = AND( IBUF(19),BITVAL )
            BITVAL   = AND( VALUE-1, IBITS( -1,0,13 ) )
            IBUF(19) = OR(  IBUF(19), ISHFT( BITVAL,9 ) )

         CASE('DIMSUP2')

***        Bits 22 a 31 pour DIMSUP2 (dimension supplementaire #2)

            IBUF(19) = AND( IBUF(19), IBITS( -1,0,22 ) )
            IBUF(19) = OR(  IBUF(19), ISHFT( VALUE-1,22 ) )

         CASE('IP1')
            IBUF(20) = VALUE
            highip1  = .TRUE.
         CASE('IP2')
            IBUF(21) = VALUE
            highip2  = .TRUE.
         CASE('IP3')
            IBUF(22) = VALUE
            highip3  = .TRUE.
         CASE('RKIND')
            IBUF(29) = VALUE
            highkin  = .TRUE.

         CASE DEFAULT
            IF (INFO) WRITE(6,6002) NOM
            CALL                                   XIT(' Puthigh',-2 )

      END SELECT

      RETURN
*------------------------------------------------------------------------------

 6001 FORMAT(' Puthigh: size discrepancy in high area',2I4)
 6002 FORMAT(' Puthigh: unknown integer parameter name ',A)

      END
      SUBROUTINE puthic (VALUE,NAME,IBUF)

      IMPLICIT          none

***    Cette routine ecrit des mots (en format
***    caractere) dans la section haute de IBUF.

      INTEGER,          PARAMETER :: HEAD = taille_entete

      INTEGER           IBUF(HEAD)
      CHARACTER * ( * ) NAME,VALUE

#     include          "highbuf.cdk"

***    Variables locales.

      CHARACTER(8)      NOM
      CHARACTER(4)      VALEUR,VTEMP

      LOGICAL                    info
      COMMON           /ZZVERBO/ info

      EXTERNAL          LOW2UP,XIT

*------------------------------------------------------------------------------
***    Verifier la valeur de HEAD.

      if ( HEAD /= 32)                                THEN
          IF (INFO) WRITE(6,6001) 32,taille_entete
          CALL                                     XIT(' Puthic ',-1 )
      END IF

***    Convertir name et value en majuscules.

      nom = NAME
      call LOW2UP( nom,nom )

      valeur = VALUE
      call LOW2UP( valeur,valeur )

***    On connait ce nom ?

      SELECT CASE ( NOM )

         CASE('GRTYP')
            WRITE(vtemp,0004) IBUF(9)
            vtemp(3:3) = valeur
            vtemp(4:4) = ' '
            READ(vtemp, 0004) IBUF(9)
            hightyp = .TRUE. 
         CASE('TYPVAR' )
            WRITE(vtemp,0004) IBUF(9)
            vtemp(1:2) = valeur
            vtemp(4:4) = ' '
            READ(vtemp, 0004) IBUF(9)
            highvar = .TRUE. 
         CASE( 'PKTYP')
            READ(valeur,0004) IBUF(10)
         CASE( 'NEWL')
            READ(valeur,0004) IBUF(23)
         CASE( 'NAME')
            READ(valeur,0004) IBUF(24)
            highnam = .TRUE.
         CASE( 'ETIK1')
            READ(valeur,0004) IBUF(25)
            higheti = .TRUE.
         CASE( 'ETIK2')
            READ(valeur,0004) IBUF(26)
            higheti = .TRUE.
         CASE( 'ETIK3')
            READ(valeur,0004) IBUF(27)
            higheti = .TRUE.
         CASE( 'ETIK4')
            READ(valeur,0004) IBUF(28)
            higheti = .TRUE.

         CASE DEFAULT
            IF (INFO) WRITE(6,6002) NOM
            CALL                                   XIT(' Puthic ',-2 )

      END SELECT

      RETURN
*------------------------------------------------------------------------------

 0004 FORMAT(A4)
 6001 FORMAT(' Puthic: size discrepancy in high area',2I4)
 6002 FORMAT(' Puthic: unknown character parametre name ',A)

      END
      SUBROUTINE puthir (VALUE,NAME,IBUF)

      IMPLICIT          none

***    Cette routine ecrit des mots (en format
***    REAL) dans la section haute de IBUF.

      INTEGER,          PARAMETER :: HEAD = taille_entete

      INTEGER           IBUF(HEAD)
      CHARACTER * ( * ) NAME
      REAL              VALUE

#     include          "highbuf.cdk"

***    Variables locales.

      CHARACTER(8)      NOM

      LOGICAL                    info
      COMMON           /ZZVERBO/ info

      EXTERNAL          LOW2UP,XIT

*------------------------------------------------------------------------------
***    Verifier la valeur de taille_entete.

      if (HEAD /= 32)                                          THEN
          IF (INFO) WRITE(6,6001) 32,taille_entete
          CALL                                     XIT(' Puthir ',-1 )
      END IF

***    Convertir name en majuscules.

      nom = NAME
      call LOW2UP( nom,nom )

***    On connait ce nom ?

      SELECT CASE ( NOM )

         CASE( 'HIVAL')
            IBUF(30) = TRANSFER( VALUE, 1 )
            highhiv = .TRUE.
         CASE( 'LOVAL')
            IBUF(31) = TRANSFER( VALUE, 1 )
            highlov = .TRUE.

         CASE DEFAULT
            IF (INFO) WRITE(6,6002) NOM
            CALL                                   XIT(' Puthir ',-2 )

      END SELECT

      RETURN
*------------------------------------------------------------------------------

 0004 FORMAT(A4)
 6001 FORMAT(' Puthir: size discrepancy in high area',2I4)
 6002 FORMAT(' Puthir: unknown character parametre name ',A)

      END
      SUBROUTINE putfld2 (NF,G,IBUF,MAXPK)

***    JAN 18/80 - J.D.HENDERSON

***    WRITES FIELD G TO FILE NF. ALL LABEL WORDS IN IBUF(1-8) 
***    MUST BE PRESET. MAXPK IS THE MAXIMUM LENGTH OF A PACKED 
***    FIELD. 

***    NOTE:
***    IF MACHINE IS EQUAL TO 2, TWO PACKING METHODS ARE SUPPORTED
***    AND THE IDAT PART OF IBUF IS NOT USED. THEN, MAXPK IS
***    IGNORED.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      REAL        G(1)
      INTEGER     NF,IBUF(0:HEAD),MAXPK

#     include    "machtype.cdk"

***    Variables locales.

      INTEGER      I,PACK,NWDS
      CHARACTER(4) PKTYP,SAVEP
      INTEGER,     SAVE :: KIND0,NI0,NJ0,PACK0, LEN

      INTEGER,     SAVE, DIMENSION(:), ALLOCATABLE :: JBUF

      CHARACTER(4),EXTERNAL :: GETHIC,GETYP
      EXTERNAL     LBLCHK,RECPK2,RECPUT,PUTHIC

      DATA         KIND0,NI0,NJ0,PACK0 / 4*-1 /

*-------------------------------------------------------------------- 
      IF (MACHINE.EQ.2)                                        THEN

          SAVEP = GETHIC( 'PKTYP',IBUF )

***        PUT DEFAULT PKTYP IN IBUF FOR LBLCHK.

          PKTYP = GETYP( 0 )
          CALL PUTHIC( PKTYP,'PKTYP',IBUF )

***        ALLOCATE OUTPUT BUFFER ONLY WHEN NEEDED.

          IF (KIND0 .NE. IBUF(0) .OR.
     +        NI0   .NE. IBUF(4) .OR.
     +        NJ0   .NE. IBUF(5) .OR.
     +        PACK0 .NE. IBUF(7) )                             THEN

              IF (KIND0.NE.-1) DEALLOCATE( JBUF )

              CALL LBLCHK( LEN,NWDS,PACK,IBUF )

              ALLOCATE( JBUF(LEN) )

              KIND0 = IBUF(0)
              NI0   = IBUF(4)
              NJ0   = IBUF(5)
              PACK0 = IBUF(7)

          END IF

          DO I=0,HEAD-1
             JBUF(I+1) = IBUF(I)
          END DO

***        RESTORE ORIGINAL PACKING TYPE.

          CALL PUTHIC( SAVEP,'PKTYP',IBUF )

***        PACK THE FIELD G INTO JBUF...

          CALL RECPK2( JBUF,LEN-HEAD, G )

***        ... AND WRITE THE RECORD TO FILE NF.

          CALL RECPUT( NF, JBUF )

      ELSE IF (MACHINE.EQ.1)                                   THEN

***        FIRST PACK THE FIELD INTO IBUF. 

          CALL RECPK2( IBUF,MAXPK, G )

***        WRITE THE RECORD TO FILE NF.

          CALL RECPUT( NF, IBUF )

      END IF

      RETURN
*-------------------------------------------------------------------

      END 
      SUBROUTINE PUTSAMPLZ( NSAMPZ,IBUF )

      ! Objet:
      ! Ecrire le nombre d'echantillons dans IP2 et/ou IP3,
      !  selon l'usage qui est fait des IP1/IP2/IP3, i.e. avec
      !  ou sans interval verticaux ou de temps, et en
      !  utilisant un codage NEW-STYLE de preference.

      ! Notez que les limites des codages utilises ici
      ! sont les suivantes:
      !  254903968   <=  IPi <= 267486880 pour KIND_SAMPLES
      ! 0.100000E+07 >= VIPi >=    0.0
      !  171017888   <=  IPi <= 183500800 pour KIND_HOURS

      ! Les valeurs codees < 171017888 ne representent
      ! donc ni des heures ni des nombres d'echantillons.
      
      ! Auteur: B. Dugas (UQAM/RPN)

      ! Revision:  version originale, septembre 2016.
      !
      ! Revision 1 2017/11/07 21:21  dugas
      !  Detecter la presence d'une signature de
      !  differentes quantites temporelles dans
      !  le deuxieme caractere du TYPVAR

      use          convert_ip123_int
      use          stats_signatures

      IMPLICIT     none

      INTEGER      IBUF(*),NSAMPZ

      CHARACTER(4) NULS,typvar*2
      LOGICAL      COMPLET,lMeanVar
      REAL         HEURES
      REAL         HIVAL,LOVAL
      type(FLOAT_IP) :: RP1,RP2,RP3
      REAL         VIP1,VIP2,VIP3,HOLD
      INTEGER      IP1,IP2,IP3, KIND,RANGE_KIND,NPAS,DEET,STAT

      LOGICAL                INFO
      COMMON       /ZZVERBO/ INFO

      REAL,        EXTERNAL :: GETHIR
      INTEGER,     EXTERNAL :: GETHIGH
      CHARACTER*4, EXTERNAL :: GETHIC
      EXTERNAL     PUTHIGH, PUTHIR,diag_convip_plus

!------------------------------------------------------------------------------
      IF (NSAMPZ <= 1) RETURN ! Not a time-mean average. Do nothing !

      IP2    = GETHIGH(  'IP2',IBUF )
      IP3    = GETHIGH(  'IP3',IBUF )

      NPAS   = GETHIGH( 'NPAS',IBUF )
      DEET   = GETHIGH( 'DEET',IBUF )
      
      HIVAL  = GETHIR ('HIVAL',IBUF ) 
      LOVAL  = GETHIR ('LOVAL',IBUF ) 

      typvar = GETHIC ('TYPVAR',IBUF )

      ! Signature d'une operation temporelle ?
      lMeanVar = .FALSE.
      if (typvar(2:2) == time_mean_signature .OR.
     +    typvar(2:2) == variance_signature .OR.
     +    typvar(2:2) == median_signature .OR.
     +    typvar(2:2) == stdev_signature .OR.
     +    typvar(2:2) == timmax_signature .OR.
     +    typvar(2:2) == timmin_signature ) lMeanVar = .true.

      RANGE_KIND = GETHIGH( 'RKIND',IBUF )

      ! Comparaison a 5 seconds pres
      COMPLET = ( NINT( NPAS*dble( deet )/5, 8) ==
     +            NINT( dble( HIVAL-LOVAL )*720., 8) )

      IF (lMeanVar)                                            THEN

          ! Signature de moyennes, de variances, de minimums
          ! ou de maximums temporels detectees. IP3 devrait alors
          ! contenir le nombre d'echantillons NSAMPZ (KIND_SAMPLES),
          ! DATEO la date de validitee du premier echantillon et DATEV
          ! celle du dernier. De plus, si NSAMPZ=NPAS+1, on a alors
          ! un ensemble complet et IP2 pourrait alors contenir
          ! l'heure absolue de prevision (KIND_HOURS).

          if (is_level( RANGE_KIND ))                   then
              ! PLacer le nombre d'echantillons ns dans IP3
              ! IP2 sera automatiquement utilise pour RP1%lo              
              RP1%hi = HIVAL  ; RP1%lo = LOVAL ; RP3%kind = RANGE_KIND
              RP2%hi = NSAMPZ ; RP2%lo = NSAMPZ; RP2%kind = KIND_SAMPLES
              stat   = encode_ip( ip1,ip2,ip3, RP1,RP2,RP3 ) 
              if (stat == CONVERT_ERROR)                       then
                  IF (INFO)
     +            write(6,6003) stat,RP1%hi,RP1%lo,RP1%kind,
     +                               RP2%hi,RP2%lo,RP2%kind
                  CALL                             XIT('PutSamplZ',-3 )

              end if
          else
              if (COMPLET)                                     then
                  ! Placer HIVAL (ou bien HIVAL-LOVAL) dans 
                  ! IP2 et le nombre d'echantillons dans IP3.
                  if (HIVAL <= 1000000.)                       then
                      ! Coder HIVAL dans IP2
                      call diag_convip_plus( ip2,HIVAL,
     +                                   KIND_HOURS,+2,nuls,.false. )
                  else if (HIVAL-LOVAL <= 1000000.)            then
                      ! Coder HIVAL-LOVAL dans IP2
                      call diag_convip_plus( ip2,HIVAL-LOVAL,
     +                                   KIND_HOURS,+2,nuls,.false. )
                  end if
              else
                  ! Placer le nombre total d'heures dans IP2
                  HEURES = NPAS*((dble( deet )/60.)/60.)
                  call diag_convip_plus( ip2,HEURES,
     +                                   KIND_HOURS,+2,nuls,.false. )
              end if
              if (NSAMPZ < 2000000)                            then
              ! 1 999 999 est la limite superieure des valeurs qui pourront
              ! etre codees correctement en mode NEW-STYLE pour KIND_SAMPLES
              ! Coder le nombre d'echantillons dans IP3 ...
                  call diag_convip_plus( ip3,float(NSAMPZ),
     +                                   KIND_SAMPLES,+2,nuls,.false. )
              else
     +        if (NSAMPZ < 254903968)                          then
              ! Notez que les limites des valeurs codees pour KIND_SAMPLES
              ! sont les suivantes: 254903968   <=  IPi <= 267486880
                  IP3 = NSAMPZ ; IP2 = 0
              ELSE ! Trop d'echantillons. Erreur !
                  IF (INFO) WRITE(6,6002) NSAMPZ
                  CALL                             XIT('PutSamplZ',-2 )
              end if
          end if
          ! Sauver les nouvelles valeurs des IP2/3
          call PUTHIGH( ip2,'IP2',IBUF )
          call PUTHIGH( ip3,'IP3',IBUF )

      ELSE
     +IF (COMPLET .and. HIVAL > LOVAL .and.
     +   (RANGE_KIND == -1 .or. RANGE_KIND == KIND_HOURS))     THEN
          ! Coder (ou re-coder) (HIVAL,LOVAL) dans (IP2,IP3)
          RP1%hi = 0.0   ; RP1%lo = 0.0   ; RP1%kind = KIND_PRESSURE
          RP2%hi = HIVAL ; RP2%lo = LOVAL ; RP2%kind = KIND_HOURS
          stat = encode_ip( ip1,ip2,ip3, RP1,RP2,RP3 ) 
          IF (stat == CONVERT_ERROR)                           THEN
              IF (INFO) 
     +             WRITE(6,6001) stat,RP2%hi,RP2%lo,RP2%kind
              CALL                                 XIT('PutSamplZ',-1 )
          END IF
          CALL PUTHIGH( IP2       ,'IP2'  ,IBUF )
          CALL PUTHIGH( IP3       ,'IP3'  ,IBUF )
          CALL PUTHIGH( KIND_HOURS,'RKIND',IBUF )
      ELSE
     +IF (RANGE_KIND >= 0 .AND. RANGE_KIND /= KIND_HOURS)      THEN
          ! Interval de coordonee verticale dans IP1 et IP3.
          ! On a mets le nombre d'echantillon dans IP2.
          CALL diag_convip_plus( IP2,FLOAT( NSAMPZ ),
     +                           kIND_SAMPLES,+2,NULS,.FALSE. )
          CALL PUTHIGH( IP2,'IP2',IBUF )
      ELSE
     +IF (NSAMPZ < 2 000 000)                                  THEN 
          ! IP2 et IP3 sont "libres". On place le nombre d'echantillons
          !  codes en mode KIND_SAMPLES dans IP3 et IP2=(HIVAL-LOVAL)
          !  ou bien (NSAMPZ*DEET), lorsque HIVAL=LOVAL. Dans ce
          !  dernier cas, on suppose que DEET contient
          !  l'interval entre les echantillons.
          IF (HIVAL >= 0.0  .AND.
     +        LOVAL >= 0.0  .AND.
     +        HIVAL /= LOVAL)                                  THEN
              HOLD   = HIVAL - LOVAL
          ELSE
              HOLD   = NSAMPZ * DBLE( DEET ) / 3600.
          END IF
          IF (HOLD <= 1000000.)
     +    CALL diag_convip_plus( IP2,HOLD,kIND_HOURS,+2,NULS,.FALSE. )
          CALL diag_convip_plus( IP3,FLOAT( NSAMPZ ),
     +                           kIND_SAMPLES,+2,NULS,.FALSE. )
          CALL PUTHIGH( IP2,'IP2',IBUF )
          CALL PUTHIGH( IP3,'IP3',IBUF )
      ELSE
     +IF (2 000 000 <= NSAMPZ .AND. NSAMPZ < 254903968)        THEN
          ! Ecrire NSAMPZ en format non-code dans IP3. IP2 = 0
          IP3 = NSAMPZ ; IP2 = 0
          CALL PUTHIGH( IP2,'IP2',IBUF )
          CALL PUTHIGH( IP3,'IP3',IBUF )
      ELSE ! Trop d'echantillons. Erreur !
          IF (INFO) WRITE(6,6002) NSAMPZ
          CALL                                     XIT('PutSamplZ',-2 )
      END IF

      RETURN
!------------------------------------------------------------------------------
 6001 format(/'   Erreur=',I3,' dans ENCODE_ip, RP2=',2p4e14.6,I3/)
 6002 format(/'   Too many samples, NSAMPZ = ',I11/)
 6003 format(/'   Erreur=',I3,' dans ENCODE_ip, RP1=',2p4e14.6,I3/
     +                                     31x,'RP2=',2p4e14.6,I3/)

      END SUBROUTINE PUTSAMPLZ
