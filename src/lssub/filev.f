#     if !defined (unite_io_maximale)
#         define   unite_io_maximale 99
#     endif

C     $Log: filev.ftn,v $
C     Revision 3.26  2016/10/26 16:06  dugas
C     - Ajouter la reconnaissance support des intervals
C       verticaux ou temporels codes dans les IP1/2/3
C
C     Revision 3.25  2014/09/25 18:42:02  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.24  2012/08/03 22:10:11  dugas
C     Au retour de FILEV, IBUF(8) depends du type de fichier.
C
C     Revision 3.23  2008/04/28 21:40:20  dugas
C     Corriger l'usage des macros pour r.gppf (passe 2).
C
C     Revision 3.22  2008/04/28 14:23:15  dugas
C     Ne plus tenir compte du cas non-SQ98.
C
C     Revision 3.21  2007/12/19 19:29:45  dugas
C     - Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
C     - FILEV supporte LEV=IP1 pour les fichiers CMC/RPN.
C
C     Revision 3.20  2007/08/29 20:19:34  dugas
C     Ajouter une comparaison des noms dans la boucle principale 150.
C
C     Revision 3.19  2006/02/09 18:19:32  dugas
C     Meilleur traitement des numeros d'unitees I/O.
C
C     Revision 3.18  2005/02/01 21:03:15  dugas
C     Corriger le comportement lorsque de gros enregistrements de type
C      caracteres ("CHAR"/DATYP=3) se trouvent a la fin d'un fichier.
C      Alors, les donnees "CHAR" ne sont plus ignorees et sont lues
C      un enregistrement a la fois (NLEV=1).
C
C     Revision 3.17  2004/11/08 20:44:05  dugas
C     Ajouter le support des donnees de type CHAR/datyp=3.
C
C     Revision 3.16  2003/05/23 20:54:26  dugas
C     Modifier la declaration de INFMOT.
C
C     Revision 3.15  2002/12/06 16:29:36  dugas
C     Utiliser le type du niveau initial (tel que rapporte par
C      CONVIP) pour definir l'etendue d'un ensemble de donnees.
C
C     Revision 3.14  2001/11/20 21:14:01  armnrbd
C     Retourner un jeux de niveaux arbitraires si la routine GETLEV
C     ne reussit pas a lire un enregistrement ++ pour coupes zonales.
C
C     Revision 3.13  2001/11/05 13:20:23  armnrbd
C     Pour des raisons de consistances avec les autres
C     routines, ETIKET passe de 12 a 16 caracteres.
C
C     Revision 3.12  2001/10/23 14:09:50  armnrbd
C     Tenir compte de l'ETIKET dans la recherche des jeux de niveaux.
C
C     Revision 3.11  2001/09/24 14:15:22  armnrbd
C     Modifier l'operation de rembobinnage des fichiers zonaux en mode SQ98.
C
C     Revision 3.10  2001/08/31 11:02:42  armnrbd
C     Ajouter le point d'entree FILEV2.
C
C     Revision 3.9  2001/02/27 00:11:34  armnrbd
C     Remplacer les appels a PERROR par des appels a MESSYS.
C
C     Revision 3.8  2000/11/24 12:45:26  armnrbd
C     Enlever la definition par defaut du macro taille_entete.
C
C     Revision 3.7  1998/06/08 03:35:54  armnrbd
C     Utiliser GETHIC pour verifier le statut de NEWL.
C
C     Revision 3.6  1998/05/21  18:48:27  armnrbd
C     Changer la valeur par defaut du macro taille_entete.
C
C     Revision 3.5  1997/10/24  20:33:24  armnrbd
C     Tenir compte d'un changement de resolution pour definir le
C      debut d'un nouveau jeux de donnees.
C
C     Revision 3.4  1997/02/17  03:50:04  armnrbd
C     Ajouter le mode I/O 64 bits.
C
C     Revision 3.3  1996/02/29  20:37:37  armnrbd
C     Tenir compte des enregistrements LABLs avant de rembobinner
C     dans le cas de fichiers zonaux a plusieurs niveaux.
C
C     Revision 3.2  1995/01/23  10:39:49  armnrbd
C     Modifier mle traitement de coupes zonales multi-niveaux.
C
C     Revision 3.1  94/11/17  14:13:22  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:55:30  13:55:30  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.3  94/09/01  21:35:07  armnrbd
C     Corriger un bogue dans les appels a SUIVANT.
C     
C     Revision 2.2  94/08/16  20:59:30  armnrbd
C     Enlever certaines references aux routines I/O Fortran.
C     
C     Revision 2.1  94/03/31  15:45:59  armnrbd
C     Tenir compte de changements de pas de temps.
C     
C     Revision 2.0  93/10/13  13:31:43  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.5  93/08/22  22:16:02  armnrbd
C     Modifier le traitement pour sigma=.001
C     
C     Revision 1.4  92/11/12  13:58:04  armnrbd
C     Troisieme iteration PKTYP.
C     
C     Revision 1.3  92/11/11  12:28:53  armnrbd
C     Deuxieme iteration de l'implantation de PKTYP.
C     
C     Revision 1.2  92/10/28  13:42:40  armnrbd
C     1) Le premier IBUF valide est retourne et non plus les dernier lu.
C     2) Premier jeux de modification pour l'implantation du PK92.
C     
C     Revision 1.1  92/02/27  12:49:46  armnrbd
C     Corriger le traitementt du compte NR au EOF
C     dans le cas de fichier d'enregistrements de
C     surface. BUG fix.
C     
C     Revision 1.0  92/02/21  11:32:50  armnrbd
C     Initial revision
C     

      SUBROUTINE filev (LEVELS,NLEV,IBUF,NFL)

***    FEV 26/92 - B.Dugas, RPN (COUNT THE (EOF) EMPTY RECORDS)
***    MAI 03/91 - B.Dugas, RPN (USE BACKSPACE RATHER THAN REWIND)
***    FEV 19/91 - B.Dugas, RPN (PORT TO CY920/F77)
***    MAR 21/80 - J.D.HENDERSON
  
***    EXTENSIVELY MODIFED ON FEB 20/88 BY B.DUGAS SO AS TO WORK FOR
***    FILES HAVING MORE THAN ONE NAME AND/OR KIND. 
  
***    FINDS THE NUMBER OF LEVELS IN A SET ON FILE NFL.  THIS IS DONE
***    BY COUNTING RECORDS UNTIL  THE LEVEL IN IBUF(4) RETURNS TO ITS
***    INITIAL  VALUE, NAME  AND KIND.  SUPERLABELS AND CHARACTER FIELDS
***    ARE IGNORED  I.E. (IBUF(1)='LABL' OR 'CHAR'). THE LEVELS ARRAY
***    RETURNS WITH THE ACTUAL LEVEL VALUES. AN EMPTY/PROBLEM FILE
***    RETURNS WITH NLEV=0.
  
***    NOTE THAT ...
***           1) NFL POSITIVE = USE THE FIRST SET ON THE FILE,
***                             REWIND AFTER READING.
***           2) NFL NEGATIVE = USE THE NEXT SET ON THE FILE,
***                             RESTORE POSITION AFTER READING.
***           3) AN ATTEMPT IS MADE TO DISTINGUISH BETWEEN
***              A SIGMA=.001 AND PRESSURE=1 VALUES.
***           4) filev2 WORKS AS filev, EXCEPT THAT THE FILE
***              IS NOT REPOSITIONNED AT THE END.
***           5) LEVEL RANGES ARE ALSO SUPPORTED: THE ROUTINE
***              CONSIDERS A REPEAT RANGE AS THE BEGINNING OF
***              A NEW SET OF LEVELS (aka CHECKS FOR IP3).

      use         convert_ip123_int, only : KIND_HOURS

      IMPLICIT    none
  
      INTEGER,    PARAMETER :: HEAD = taille_entete

      CHARACTER   EXEMOD*6
      CHARACTER*4 INAME,NAME,   IKIND,KIND, NEWL,HNEWL,CINIL,PKTYP
      INTEGER     I,IBUF(HEAD), LEVELS(1),NR,IER,TIME,NSKIP,
     +            NF,NFL,NLEV,  IO,IP3,KBUF(HEAD),SKIP, CLE,
     +            INIMAX,INITL, INITD1,INITD2,IBS(HEAD),
     +            RANGE_KIND
      LOGICAL     SURFACE,      OK,ERROR,GETOK

      CHARACTER(16),SAVE :: INIKET=' ', ETIKET=' '
      INTEGER,      SAVE :: INITLK=0,   LEVELK=0,
     +                      INITP2=-1,  IP2=-1,
     +                      INITP13=-1, IP13=-1,
     +                      INITP23=-1, IP23=-1

      INTEGER*8,  DIMENSION(:), ALLOCATABLE :: JBUF

      INTEGER     MAXSWRD
      COMMON     /MAXSWRD/ MAXSWRD

      INTEGER              INFMOT(0:unite_io_maximale)
      COMMON     /LIRZXL/  INFMOT

      LOGICAL              INFO
      COMMON     /ZZVERBO/ INFO

      CHARACTER(4),EXTERNAL :: GETHIC,GETYP
      INTEGER,     EXTERNAL :: GETKIND,GETHIGH
      EXTERNAL     GETBUF2,GETLEV,XIT,PRECEDE,SUIVANT,MESSYS,PRECLE

      DATA        NEWL   / 'NEWL'   /,
     +            EXEMOD / 'FILEV2' /

* ---------------------------------------------------------------------
      EXEMOD  = 'FILEV'

      ENTRY filev2 (LEVELS,NLEV,IBUF,NFL,SKIP)

      NF      = IABS( NFL )
      IO      = 0

      SURFACE = .FALSE.
      NSKIP   =  0
      NR      =  0
      NLEV    =  0

      IBS(1)  =  0
      INIMAX  =  MAXSWRD

      IF (EXEMOD.NE.'FILEV') SKIP = 0

      PKTYP = GETYP( NF )

***    READ THE LABEL. SKIP SUPERLABELS. RETURN IF EOF.
  
      IF (NFL.GT.0) CALL PRECEDE( NF ,-1 )
  
  110 CALL SUIVANT( NF, KBUF, ERROR,OK )

      IF (     OK           ) NR = NR+1
      IF (.NOT.OK .OR. ERROR) GOTO 210

          WRITE(IKIND,4) KBUF(1)
          WRITE(INAME,4) KBUF(3)
          KIND   = IKIND
          TIME   = KBUF(2)
          NAME   = INAME
          INITL  = KBUF(4)
          INITD1 = KBUF(5)
          INITD2 = KBUF(6)

          IF (PKTYP(1:2).EQ.'SQ')                              THEN

              RANGE_KIND = GETHIGH('RKIND',KBUF )
              IP3        = GETHIGH( 'IP3' ,KBUF )

              IF (RANGE_KIND >= 0)                             THEN
                  IF (RANGE_KIND == KIND_HOURS)                THEN
                      INITP13 = -1
                      INITP23 = IP3 ! Initial IP3 coded in hours
                  ELSE
                      INITP13 = IP3 ! Initial IP3 coded as a level
                      INITP23 = -1
                  END IF
              END IF

              INITLK            = GETKIND( )
              INIKET(01:04)     = GETHIC ( 'ETIK1',KBUF )
              INIKET(05:08)     = GETHIC ( 'ETIK2',KBUF )
              IF (PKTYP.NE.'SQ89')                             THEN
                  INIKET(09:12) = GETHIC ( 'ETIK3',KBUF )
                  INIKET(13:16) = GETHIC ( 'ETIK4',KBUF )
              END IF

          END IF

          HNEWL  = GETHIC('NEWL',KBUF )

          WRITE(CINIL,4) INITL

***        NE PAS TENIR COMPTE DES CHAMPS DE SURFACE ICI. MAIS,
***        TRAITER LES CHAMPS ZONAUX MULTI-NIVEAUX IMMEDIATEMENT.

          IF (IKIND.EQ.'ZONL' .AND. KBUF(6).NE.1)              THEN

***            FICHIER ZONAL MULTI-NIVEAUX. NLEV EST DANS KBUF(6).

              NLEV  = KBUF(6)
              GETOK =.FALSE.

              DO I=1,HEAD
                 IBUF(I) = KBUF(I)
              END DO

              IF (NLEV.NE.INFMOT(NF) .OR. CINIL.EQ.NEWL
     +                               .OR. HNEWL.EQ.NEWL)       THEN

***                LIRE LES NOUVEAUX NIVEAUX. ALLOUER ASSEZ D'ESPACE
***                TAMPON POUR TRAVAILLER. DESALLOUER A LA FIN.

                  ALLOCATE( JBUF(HEAD+NLEV+6) )

                  CALL GETLEV( NF,LEVELS,NLEV,JBUF, GETOK )

                  IF (.NOT.GETOK .AND. INFMOT(NF).EQ.-1)       THEN

                      CALL SETKIND( 'ARBITRAIRE' )
                      INITLK = GETKIND( )
                      DO  I=1,NLEV
                           LEVELS(I) = I
                      END DO
                      INFMOT(NF) = NLEV
                  ELSE IF (GETOK .AND. PKTYP(1:2).EQ.'SQ')     THEN
                      CALL PRECLE( NF,CLE,1 )
                  ELSE IF (INFMOT(NF).EQ.NLEV)                 THEN
                      IF (PKTYP(1:2).EQ.'SQ')                  THEN
                          INITLK = GETKIND( )
                          IF (INITLK.EQ.6)                     THEN
                             CALL CONVPR( IBUF(4),1.0,INITLK,+2 )
                          ELSE
                             CALL CONVPR( IBUF(4),0.0,INITLK,+2 )
                          END IF
                      ELSE
                          IBUF(4) = 0
                      END IF
                  END IF

                  DEALLOCATE( JBUF )

              END IF

              IF (EXEMOD.EQ.'FILEV')                           THEN

***                REMBOBINNER.

                  IF (PKTYP(1:2).EQ.'SQ')                      THEN
                      CALL PRECLE( NF,CLE,1 )
                      IF (NSKIP.GT.0)
     +                CALL PRECLE( NF,CLE,NSKIP )
                  ELSE
                      CALL PRECEDE( NF,NLEV )
                      IF (NSKIP.GT.0)
     +                CALL PRECEDE( NF,NSKIP )
                  END IF

              ELSE

                  SKIP = NSKIP

              END IF

              RETURN

          END IF
          IF (INITL.EQ.1)                                      THEN

***            ON EST PEUT-ETRE SUR UN ENREGISTREMENT DE SURFACE. 

              SURFACE = .TRUE.

          ELSE

              SURFACE = .FALSE.

          END IF

      IF (KIND.EQ.'LABL' .OR. KIND.EQ.'CHAR')                  THEN

          IF (KIND.EQ.'CHAR')                                  THEN

              IF (KBUF(8).EQ.-64)                              THEN
                  MAXSWRD = MAX( MAXSWRD, 2*KBUF(5)*KBUF(6) )
              ELSE IF (KBUF(8).EQ.-32)                         THEN
                  MAXSWRD = MAX( MAXSWRD,   KBUF(5)*KBUF(6) )
              END IF

          END IF

          IF (IBS(1).EQ.0)                                 THEN

***            SAUVER LA PREMIERE ENTETE IGNOREE.

              DO  I=1,HEAD
                  IBS(I) = KBUF(I)
              END DO

          END IF

          NSKIP = NSKIP+1
          GOTO 110

      END IF
  
***    LOOP TO READ THE REST OF THE LABELS IN THIS SET.
***    ENDS WHEN KBUF(1),KBUF(3) AND KBUF(4) ALL REPEAT
***    OR WHEN EITHER KBUF(2) OR THE LEVEL TYPE CHANGES
***    OR THE INTERNAL LEBEL (ETIKET) CHANGES.
  
  150 CONTINUE

          IF (INAME.EQ.NAME .AND. IKIND.EQ.KIND)               THEN

              IF (PKTYP(1:2).EQ.'SQ')                          THEN

                  RANGE_KIND = GETHIGH('RKIND',KBUF )
                  IP3        = GETHIGH( 'IP3' ,KBUF )

                  IF (RANGE_KIND >= 0)                         THEN
                      IF (RANGE_KIND == KIND_HOURS)            THEN
                          IP13 = -1
                          IP23 = IP3 ! IP3 coded in hours
                      ELSE
                          IP13 = IP3 ! IP3 coded as a level
                          IP23 = -1
                      END IF
                  END IF

                  LEVELK            = GETKIND( )
                  ETIKET(01:04)     = GETHIC ( 'ETIK1',KBUF )
                  ETIKET(05:08)     = GETHIC ( 'ETIK2',KBUF )
                  IF (PKTYP.NE.'SQ89')                         THEN
                      ETIKET(09:12) = GETHIC ( 'ETIK3',KBUF )
                      ETIKET(13:16) = GETHIC ( 'ETIK4',KBUF )
                  END IF

              END IF

              IF (NLEV.EQ.0)                                   THEN

***                ALWAYS SAVE FIRST LEVEL HEADER IN IBUF.

                  DO  I=1,HEAD
                      IBUF(I) = KBUF(I)
                  END DO

              ELSE IF ((KBUF(4) == INITL  .AND. IP13 == INITP13)
     +            .OR.  KBUF(5) /= INITD1
     +            .OR.  KBUF(6) /= INITD2
     +            .OR.  IP23    /= INITP23 ! IP3 time coding change ?
     +            .OR.  LEVELK  /= INITLK
     +            .OR.  ETIKET  /= INIKET)                     THEN

***                NOUS SOMMES AU DEBUT DU PROCHAIN JEUX DE DONNEES.

                  GOTO 210

              ELSE IF (SURFACE)                                THEN

***                LE NIVEAU INITIAL N'ETAIT PAS UN NIVEAU DE
***                SURFACE, MAIS PROBABLEMENT A SIGMA=.001.

                  SURFACE = .FALSE.

              END IF

***            SAVE NEW LEVEL.

              NLEV         = NLEV+1
              LEVELS(NLEV) = KBUF(4)

              If (pktyp(1:2) == 'SQ')                          THEN
                  IBUF(8)  = MAX( IBUF(8), KBUF(8) )
              Else
                  IBUF(8)  = MIN( IBUF(8), KBUF(8) )
              End If

          ELSE IF (SURFACE)                                    THEN

***            LE NIVEAU INITIAL ETAIT UN NIVEAU DE SURFACE.

              GOTO 210

          END IF
  
          CALL SUIVANT( NF, KBUF,ERROR,OK )

          IF (     OK )     NR = NR+1
          IF (.NOT.OK .OR. 
     +         ERROR  )     GOTO 210

          WRITE(KIND,4)     KBUF(1)
          WRITE(NAME,4)     KBUF(3)

          IF (TIME  .NE. KBUF(2) .OR.
     +        INAME .NE. NAME    .OR.
     +       (INITL .EQ. KBUF(4) .AND.
     +        IKIND .EQ. KIND))   GOTO 210

      GOTO 150
  
***    ERROR PROCESSING.

  209 IF (IO.NE.0) THEN
          IF (INFO) WRITE(6,6000) NF,IO
          CALL                                       MESSYS( ' ' )
          CALL                                       XIT('  Filev ',-1 )
      END IF

  210 IF (NR-NLEV.GT.0) CALL PRECEDE( NF,NR-NLEV )

      IF (NLEV.NE.0)                                           THEN

          IF (EXEMOD.EQ.'FILEV')                               THEN

***            REPOSITION FILE BEFORE RETURNING.
  
              CALL PRECEDE( NF,NLEV )

          ELSE

              SKIP = NSKIP

          END IF

      ELSE IF (NSKIP.GT.0)                                     THEN

***        ON A SEULEMENT VU DES ENREGISTREMENTS
***        DE TYPE LABL OU CHAR AVANT LE *EOF*.

          IF (EXEMOD.NE.'FILEV') SKIP = 0

***        ON RETOURNE LES CONDITIONS ASSOCIEES AU
***        PREMIER ENREGISTREMENT DE CE TYPE.

          DO  I=1,HEAD
              IBUF(I) = IBS(I)
          END DO

          IF (IBUF(8).EQ.-64)                                  THEN
              MAXSWRD = MAX( INIMAX, 2*IBUF(5)*IBUF(6) )
          ELSE IF (IBUF(8).EQ.-32)                             THEN
              MAXSWRD = MAX( INIMAX,   IBUF(5)*IBUF(6) )
          END IF

          NLEV = 1

      END IF

      RETURN
  
* -------------------------------------------------------------------------
    4 FORMAT(A4)
 6000 FORMAT(' Filev on unit ',I3,' returns I/O error number ',I5)

      END 
