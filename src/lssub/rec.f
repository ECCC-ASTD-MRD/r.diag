#     if !defined (ligne_maximale)
#         define   ligne_maximale 512
#     endif

C     $Log: rec.ftn,v $
C     Revision 3.49  2018/07/26 16:16  dugas
C     Initialiser INOM1 et modifier le message d'erreur -2 de RECGET.
C
C     Revision 3.48  2016/10/26 15:22  dugas
C     Legeres modifications syntaxiques F77 --> F90
C
C     Revision 3.47  2014/12/04 21:35:20  dugas
C     Enlever le DATA ZERO redondant dans RECUP2.
C
C     Revision 3.46  2014/12/03 23:23:38  dugas
C     Enlever les enonces EQUIVALENCE.
C
C     Revision 3.45  2014/10/16 12:02:45  dugas
C     Modifications commandees par la compilation avec GFORTRAN et IFORT.
C
C     Revision 3.44  2014/09/25 18:42:04  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.43  2014/07/08 20:05:20  dugas
C     DATYP est definie via GETHIGH (donc de IBUF) plutot que via GETPARI dans RECPK2.
C
C     Revision 3.42  2013/10/28 20:45:21  bernard
C     Permettre l'I/O de mots complexes (datyp=8) en 64 bits.
C
C     Revision 3.41  2013/07/17 21:51:10  bernard
C     Simplifier le traitement des DATYP dans RECUP2 et RECPK2. Tenir aussi compte des DATYP pour valeurs manquantes.
C
C     Revision 3.40  2011/11/22 19:02:13  dugas
C     Ajouter un TYP3 optionnel dans RECGET.
C
C     Revision 3.39  2011/06/06 19:41:50  dugas
C      Utiliser un appel prealable a GET_CENDIAN( CENDI ) pour controler
C      l'appel a SWAP_ENDIANNESS dans les routines RECUP@ et RECPK2.
C
C     Revision 3.38  2010/10/26 20:37:40  dugas
C     Renommer MAXWRD a ZZMAXWRD pour des fins de debug dans RECGET.
C
C     Revision 3.37  2008/05/13 16:48:19  dugas
C     Corriger plusieurs message INFO/DEBUG pour usages de lev=IP1.
C
C     Revision 3.36  2008/04/30 19:47:35  dugas
C     Corriger l'usage des macros pour r.gppf.
C
C     Revision 3.35  2008/04/28 14:23:15  dugas
C     Ne plus tenir compte du cas non-SQ98.
C
C     Revision 3.34  2007/12/19 19:22:36  dugas
C     Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
C
C     Revision 3.33  2007/08/29 20:27:36  dugas
C     - Ajouter le support du datyp=133.
C     - S'assurer que le donnees complexes (datyp=8) sont gardees a la
C       precision de la machine: Le mode 64 bits n'est donc pas supporte
C       si les mots reels natifs sont a 32 bits.
C
C     Revision 3.32  2006/09/21 01:25:02  dugas
C     Corriger l'interaction de IO64B et DATYP=8 dans RECPK2.
C
C     Revision 3.31  2006/07/04 16:06:36  dugas
C     Ajouter le support des donnees Z32 (DATYP=8) dans RECPK2 et REUP2.
C
C     Revision 3.30  2005/07/28 17:22:37  dugas
C     - Modifier le code pour enlever les messages d'avertissement de F90.
C     - Ajouter le support de DATYP=6,129 et 134 dans RECUP2 et RECPK2.
C
C     Revision 3.29  2005/02/01 20:58:04  dugas
C     Ajouter du code DEBUG dans RECGET et RECUP2.
C
C     Revision 3.28  2004/09/13 17:29:56  dugas
C     Ajouter le support des donnees CHAR/datyp=3 dans RECPK2 et RECUP2.
C
C     Revision 3.27  2003/10/24 21:05:48  dugas
C     Implementer du code compatible RS6000
C
C     Revision 3.26  2003/07/04 01:20:56  dugas
C     Utiliser GETRABT pour definir RECABT.
C
C     Revision 3.25  2003/06/23 14:24:10  dugas
C     Faire en sorte que TYP2 = TYP1 par defaut dans RECGET et
C      enlever un bout de code redondant dans leur traitement.
C
C     Revision 3.24  2002/04/22 15:43:49  dugas
C     Activer le code E64 dans RECPK2 et RECUP2
C
C     Revision 3.23  2000/11/30 12:39:38  armnrbd
C     Legere correction du tir dans RECGET concernant l'usage
C     de ZNAME, pour les fichiers non-standards RPN.
C
C     Revision 3.22  2000/11/24 12:54:34  armnrbd
C     Integrer ZNAME dans le decodage des noms equivalents qui
C     a ete implante dans la routine RECGET.
C
C     Revision 3.21  2000/09/28 15:48:43  armnrbd
C     Modifier les sequences d'appel a GETIO64.
C
C     Revision 3.20  2000/07/24 21:00:01  armnrbd
C     Le parametre NAME de RECGET peut contenir deux arguments.
C     En meme temps, on appelle EQVNOM pour determiner s'il
C      y des equivalences entre ces differents noms.
C
C     Revision 3.19  2000/03/17 03:12:48  armnrbd
C     Tenter de proteger des underflow lors des conversions
C     de type en entree ou en sortie (Real*8 de/vers Real).
C
C     Revision 3.18  1999/09/03 21:13:56  armnrbd
C     Corriger la decompaction de grilles a 64 bits pour PK84.
C
C     Revision 3.17  1999/06/23 20:59:16  armnrbd
C     Modifier le code STD98 de RECPUT.
C     Ajouter du code defensif NaN dans RECUP2.
C
C     Revision 3.16  1999/04/08 19:32:45  armnrbd
C     Utiliser le comdeck MACHTYPE.CDK.
C     Inverser les mots a 64 bits sur les machines SMALL ENDIAN
C     dans les routine RECPK2 et RECUP2. De plus changer la
C     longueur de LCMI dans ces deux routines (cas spectral).
C
C     Revision 3.15  1999/02/21 04:57:04  armnrbd
C     Corriger l'allocation de LCMI dans RECPK2.
C     Re-definir NWDS dans le cas spectral a la fin de RECPK2.
C
C     Revision 3.14  1999/01/19  20:09:08  armnrbd
C     Renommer ABORT en DABORT (conflit avec la version systeme).
C
C     Revision 3.13  1998/07/07  14:29:56  armnrbd
C     Allonger le format d'ecriture de IBUF(2).
C
C     Revision 3.12  1998/06/08  03:42:49  armnrbd
C     Utiliser (GET/PUT)HIGH et (GET/PUT)HIC pour faire la gestion
C      des codes entreposes dans la section haute de IBUF (NEWL, etc...).
C
C     Revision 3.11  1998/05/28  19:16:38  armnrbd
C     Tenir compte de donnees entieres dans les routines
C      RECUP2 et RECPK2 pour les fichiers standards RPN.
C
C     Revision 3.10  1998/04/15  02:18:59  armnrbd
C     Vider ZNAME dans RECGET avnt le retour s'il le faut.
C
C     Revision 3.9  1998/02/19  17:34:59  armnrbd
C     Passer de SQ97 a SQ98.
C
C     Revision 3.8  1997/12/10  18:04:46  armnrbd
C     Corriger la compaction de la moyenne spectrale dans
C      RECPK2 pour le cas PK92 lorsque IO64B est vrai.
C
C     Revision 3.7  1997/10/10  20:12:01  armnrbd
C     Faire la distinction entre la longueur du tampon I/O et
C       ce qu'il faut vraiment lire sur disque.
C
C     Revision 3.6  1997/05/27  18:53:19  armnrbd
C     Premiere version compatible avec les fichiers standards 1997.
C
C     Revision 3.5  1997/02/17  03:50:04  armnrbd
C     Ajouter le mode I/O 64 bits.
C
C     Revision 3.4  1996/10/15  17:00:25  armnrbd
C     Modifier RECGET pour supporter plus d'un type de grille
C     a la fois. Le parametre KIND peut contenir 8 caracteres.
C
C     Revision 3.3  1995/09/12  17:13:38  armnrbd
C     Corriger une inconsistance entre les fichiers PK92 et PK84 lors
C     de l'ecriture directe de LABL dans la routine RECPUT.
C
C     Revision 3.2  1995/02/13  19:42:26  armnrbd
C     Modifier l'appel a la routine READSQI dans RECGET.
C
C     Revision 3.1  94/11/17  14:14:05  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:56:07  13:56:07  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.4  94/08/16  20:59:33  armnrbd
C     Enlever certaines references aux routines I/O Fortran.
C     
C     Revision 2.3  94/06/21  23:19:25  armnrbd
C     Faire appel a GETMACH dans RECPK2 et RECUP2.
C     Modifier le traitement du cas PACK=0 dans ces routines.
C     Commencer a y implanter le suOspport de plateformes 
C     de type non IEEE selon le code de Stacey.
C     
C     Revision 2.2  94/05/09  10:52:55  armnrbd
C     Ne pas verifier MAXWRD pour type LABL dans la routine RECGET.
C     
C     Revision 2.1  93/10/26  13:27:33  armnrbd
C     Implanter le support de la variable DEBUG_MODE.
C     
C     Revision 2.0  93/10/13  13:32:12  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.6  93/02/22  20:21:05  armnrbd
C     Mettre MAXWRD a zero en meme temps que MAXPK.
C     
C     Revision 1.5  92/11/13  11:06:01  armnrbd
C     Troisieme iteration PKTYP.
C     
C     Revision 1.4  92/11/11  12:29:27  armnrbd
C     Deuxieme iteration de l'implantation de PKTYP.
C     
C     Revision 1.3  92/11/02  21:47:25  armnrbd
C     Implanter l'appel a GETYP.
C     
C     Revision 1.2  92/10/30  12:26:58  armnrbd
C     Valeur de defaut de PKTYP est ' ' dans RECPK2.
C     
C     Revision 1.1  92/10/28  13:45:46  armnrbd
C     Premier jeux de modification pour l'implantation du PK92.
C     
C     Revision 1.0  92/02/21  11:34:29  armnrbd
C     Initial revision
C     

      SUBROUTINE recget (NFL,KIND,STEP,NAME,LEVEL,IBUF,MAXPK,OK)

***    MAI 25/91 - B.Dugas, RPN (VERIFIER MAXPK A L'ENTREE)
***    FEV 19/91 - B.Dugas, RPN (AJOUTER LE BLOC RECABT).
***    FEB 11/81 - J.D.HENDERSON

***    SCANS FILE NF FOR A RECORD WHOSE FIRST FOUR LABEL WORDS ARE...
***     1) KIND  = ONE OR TWO CHARACTER*4 FIELD TYPES ('SPEC', 'GRID', ETC)
***     2) STEP  = TIMESTEP NUMBER
***     3) NAME  = CHARACTER STRING (CAN BE SPLIT INTO TWO SUB-FIELDS)
***     4) LEVEL = LEVEL NUMBER

***    NONE OF THESE ARE CHECKED IF THEY ARE SET TO -1. THE ORDER OF
***    PRIORITY IN THAT CASE IS KIND, NAME, STEP, LEVEL.

***    IF NAME IS 0 OR 'NEXT' THE NEXT FIELD OF THE REQUESTED KIND
***    IS READ AND STEP, LEVEL ARE NOT CHECKED.

***    MAXPK = INPUT BUFFER LENGTH FOR (PACKED) FIELDS.

***    IF NFL IS NEGATIVE THE FILE IS REWOUND FIRST. UPON RETURNING 
***    IBUF CONTAINS THE 8 WORD LABEL FOLLOWED BY THE DATA (WHICH MAY 
***    BE PACKED).

*--------------------------------------------------------------------
      IMPLICIT      none

      INTEGER,      PARAMETER :: HEAD = taille_entete

      CHARACTER*(*) NAME,KIND
      LOGICAL       OK,GETOK,ERROR,ZSET
      CHARACTER     ZHOLD*10,NOM1*10,NOM2*9
      CHARACTER(4)  RECABT,TYP1,TYP2,TYP3,PKTYP
      INTEGER       NFL,STEP,LEVEL,IBUF(*),MAXPK,IER,
     +              ITYP1,ITYP2,ITYP3,INOM1,INOM2,PACK,
     +              LON,NR,NT,NF,LENGTH,NWDS,I

      INTEGER,      SAVE :: INEXT = 0
      CHARACTER(4), SAVE ::  NEXT = 'NEXT'

      INTEGER               ZZMAXWRD
      COMMON       /MAXWRD/ ZZMAXWRD

      LOGICAL                INFO,DEBUG
      COMMON       /ZZVERBO/ INFO
      COMMON       /ZZDEBUG/      DEBUG

#     include      "zlabel.cdk"
#     include      "machtype.cdk" 

      INTEGER,      EXTERNAL :: GETHIGH,MEMOIRC
      CHARACTER(4), EXTERNAL :: SETNAM,GETYP
      EXTERNAL      GETBUF2,GETRABT,SUIVANT,PRECEDE,
     +              READF,LEADBLK,READSTD,SKIPREC,XIT
*---------------------------------------------------------------------

      IF (INEXT == 0) READ(NEXT,'(A)') INEXT
      CALL GETRABT( RECABT )

      NR    = 0
      NF    = ABS( NFL )
      PKTYP = GETYP( NF )

      OK    = .FALSE.
      ZSET  = .FALSE.
      ZHOLD = ' '
      LON   = HEAD/(MOD( MACHINE,2 )+1)

      IF (MAXPK.LE.0)                                          THEN
          IF (RECABT.EQ.'&NON') RETURN
          CALL                                     XIT(' RECGET ',-1 )
      END IF

      IF (NFL.LT.0) CALL PRECEDE( NF,-1 )

***    POSSIBLY SPLIT KIND INTO TWO TYPE FIELDS AND
***    REMOVE ANY LEADING BLANKS IN THE TYPE FIELDS.

      NT = LEN( KIND )

      IF (NT.LE.4)                                             THEN
          TYP1 = KIND(1:NT)
          TYP2 = TYP1
          TYP3 = TYP1
      ELSE IF (NT.LE.8)                                        THEN
          TYP1 = KIND(1:4)
          TYP2 = KIND(5:NT)
          TYP3 = TYP2
      ELSE
          TYP1 = KIND(1:4)
          TYP2 = KIND(5:8)
          TYP3 = KIND(9:NT)
      END IF

      IF (TYP1 .NE.' ') CALL LEADBLK( TYP1 ) 
      IF (TYP2 .NE.' ') CALL LEADBLK( TYP2 )
      IF (TYP3 .NE.' ') CALL LEADBLK( TYP3 )

***    POSSIBLY SPLIT THE FIRST 10 CHARACTERS OF NAME
***    INTO TWO FIELDS, ALSO REMOVING ALL LEADING BLANKS.

      NOM1 = NAME(1:LEN( NAME )) ; INOM1 = 0

      IF (NOM1 .NE.'    ') CALL LEADBLK( NOM1 )
      IF (NOM1 .EQ.'NEXT') INOM1 = INEXT
      IF (NOM1 .EQ.'NEXT') NOM1  = ' '
                           NOM2  = ' '

***    IF NOM1 IS BLANK AND ZNAME IS NOT, TRY DECODING ZNAME.

      IF (PKTYP(1:2).EQ.'SQ'  .AND.
     +    NOM1      .EQ.' '   .AND.
     +    ZNAME     .NE.' '   )                                THEN
          NOM1  = ZNAME
          ZHOLD = ZNAME
          ZNAME = ' '
      END IF

      IF (NOM1 .NE.'    ')                                     THEN

***        NOM1 WILL GENERALLY END AT THE FIRST BLANK,
***        BUT CAN NEVER BE MORE THAN 4 CHARACTERS LONG.

          NT = MIN( 4, INDEX( NOM1 // ' ' , ' ' )-1 )

***        NOM2 TAKES UP THE REST, IF ANY, BUT AGAIN
***        HAS TO BE NO MORE THAN 4 CHARACTERS LONG.

          IF (NOM1(1:NT).NE.NOM1)                              THEN

              NOM2 = NOM1(NT+1:10)
              NOM1 = NOM1(1:NT)

              CALL LEADBLK( NOM2 )

              NT   = MIN( 4, INDEX( NOM2 // ' ' , ' ' )-1 )
              NOM2 = NOM2(1:NT)

          END IF

      END IF

      IF (NOM1 .NE.' ' .AND.
     +    NOM2 .EQ.' ') CALL EQVNOM( NOM1,NOM2 )

      IF (NOM2 .NE.' ') NOM2 = SETNAM( NF,NOM2 )
      IF (NOM1 .NE.' ') NOM1 = SETNAM( NF,NOM1 )

***    POSSIBLY DEFINE ZSET AND ZNAME.

                          READ( TYP1,4 ) ITYP1
                          READ( TYP2,4 ) ITYP2
                          READ( TYP3,4 ) ITYP3
                          READ( NOM2,4 ) INOM2
      IF (INOM1.NE.INEXT) READ( NOM1,4 ) INOM1

      IF (PKTYP(1:2).EQ.'SQ' .AND. NOM2.EQ.' ')                THEN
          IF (ZNAME.EQ.' ' )                                   THEN
              ZNAME =  NOM1
              ZSET  = .TRUE.
          END IF
      END IF

***    READ THE NEXT RECORD FROM FILE NF INTO IBUF.
***    IF END-<OF-FILE ENCOUNTERED, RETURN WITH OK=.FALSE.

  160 IF (NR.GT.0)                                             THEN

          CALL SUIVANT( NF, IBUF,ERROR,GETOK )

          IF (ERROR .OR. .NOT.GETOK)                           THEN
              IF (ZSET)         ZNAME = ' '
              IF (ZHOLD.NE.' ') ZNAME = ZHOLD
              RETURN
          END IF

      END IF

      CALL GETBUF2( -NF ,IBUF,LON, GETOK )

      IF (.NOT.GETOK)                                          THEN
          IF (ZSET)         ZNAME = ' '
          IF (ZHOLD.NE.' ') ZNAME = ZHOLD
          RETURN
      END IF

      NR = NR+1

      IF ( TYP1 .NE.' ' .AND. ITYP1.NE.IBUF(1) .AND.
     +     TYP2 .NE.' ' .AND. ITYP2.NE.IBUF(1) .AND.
     +     TYP3 .NE.' ' .AND. ITYP3.NE.IBUF(1)) GOTO 160
      IF (                    INOM1.EQ.INEXT  ) GOTO 190

      IF ((STEP .NE.-1  .AND. STEP .NE.IBUF(2)) .OR.
     +    (NOM1 .NE.' ' .AND. INOM1.NE.IBUF(3)
     +                  .AND. INOM2.NE.IBUF(3)) .OR.
     +    (LEVEL.NE.-1  .AND. LEVEL.NE.IBUF(4))    ) GOTO 160

***    RETURN WITH OK=.TRUE. WHEN THE REQUESTED RECORD IS FOUND.
***    STOP IF THE RECORD FOUND IS TOO LARGE FOR THE BUFFERS.

  190 CALL LBLCHK( LENGTH,NWDS,PACK, IBUF )

      WRITE( TYP1,4 ) IBUF(1)

      IF (LENGTH   .GT. MAXPK+HEAD .OR.
     +   (NWDS     .GT. ZZMAXWRD   .AND.
     +    ZZMAXWRD .NE. -1         .AND.
     +    TYP1     .NE.'LABL'  )   )                           THEN
          IF (INFO)                                            THEN
              IF (NWDS > ZZMAXWRD)                             THEN
                  WRITE(6,6001) ZZMAXWRD,NWDS
              ELSE
                  WRITE(6,6002) MAXPK+HEAD,LENGTH
              END IF
              CALL PRTLAB( IBUF )
          END IF
          IF (DEBUG) IER = MEMOIRC( 0 )
          IF (RECABT.EQ.'&NON')                                THEN
              IF (ZSET)         ZNAME = ' '
              IF (ZHOLD.NE.' ') ZNAME = ZHOLD
              MAXPK    = 0
              ZZMAXWRD = 0
              RETURN
          END IF
          CALL                                     XIT(' Recget ',-2 )
      END IF

      IF (PKTYP(1:2).EQ.'SQ')                                  THEN

          CALL READSTD( NF,IBUF,MAXPK+HEAD, GETOK )

      ELSE

***        THE REAL LENGTH IS STORED IN IBUF.

          LENGTH = GETHIGH('LEN',IBUF )

          IF (PKTYP.EQ.' ' .OR. PKTYP.EQ.'PK92')               THEN
              CALL SKIPREC( NF,1, GETOK )
              IF (GETOK) 
     +        CALL READF( NF ,IBUF(HEAD+1),LENGTH-LON, GETOK )
          ELSE IF (PKTYP.EQ.'PK84')                            THEN
              CALL GETBUF2( NF, IBUF,LENGTH, GETOK )
          END IF

      END IF

      IF (ZSET)         ZNAME = ' '
      IF (ZHOLD.NE.' ') ZNAME = ZHOLD
      IF (GETOK)        OK    = .TRUE.

      RETURN

*---------------------------------------------------------------------
    4 FORMAT(A4)
 6001 FORMAT(' MaxWord =',I9,' too small. Nwds =',I9,' for...')
 6002 FORMAT(' Maxpk+Head ',I9,' too small. Length =',I9,' for...')

      END 

      SUBROUTINE recpk2 (IBUF,MAXPK,LCM)

***    JAN 20/84 - R.LAPRISE, J.F.FORTIN.
***    NOV 06/90 - B.DUGAS/RPN : VERSION 32 BITS.

***    PREPARES RECORD IMAGE IN IBUF (LABEL+DATA).
***    LCM CONTAINS THE FLOATING POINT DATA.

***    IBUF(1-8) CONTAINS THE LABEL (WHICH MUST BE PREVIOUSLY SET)...
***     1 = TYPE ('SPEC','FOUR','GRID','ZONL') (SPEC,FOUR = COMPLEX).
***     2 = TIMESTEP NUMBER. 
***     3 = NAME OF THE VARIABLE (EG. ' PHI').
***     4 = LEVEL NUMBER.
***     5,6 = SIZE (COMPLEX = (LA,1), REAL = (LI,LJ)  ).
***     7 = KHEM (GRIDS OR FOUR) OR LRLMT (SPEC).
***     8 = NPACK (PACKING DENSITY).
***    THIS IS FOLLOWED BY MAXPK WORDS. THIS MUST BE ENOUGH TO
***    HOLD THE DATA AS IT IS TO BE WRITTEN TO THE FILE.
***    (EITHER PACKED OR UNPACKED).

*---------------------------------------------------------------------
      IMPLICIT      none

      INTEGER,      PARAMETER :: HEAD = taille_entete

      CHARACTER*4   TYPE
      CHARACTER     LINE*ligne_maximale
      LOGICAL       SF,     E64OK
      REAL           XMIN,  XSCAL,XMAX
      INTEGER       IXMIN,  IXSC,        IXMEAN, MAXPK,I
      INTEGER       LCM(3), IBUF(HEAD+1),LEN,NWDS,PACK,NBW,N,BITS,
     +                                   J,KIND,FWRD, CENDI

      INTEGER       IVAL,IVAL8, IER, DATYP
      REAL*8         VAL8
      REAL           VAL, AMIN,AMAX,AMEAN
      POINTER     ( IV8, IVAL8(2) ),( IV4, IVAL(1) )

      INTEGER,      DIMENSION(:), ALLOCATABLE :: LCMO

      CHARACTER*4   PKTYP,GETYP

#     include      "machtype.cdk" 

      LOGICAL       IBM,CRAY,IEEE
      SAVE          IBM,CRAY,IEEE

      LOGICAL                IO64B,INFO,DEBUG,E64OUT
      COMMON       /ZZVERBO/       INFO
      COMMON       /ZZDEBUG/            DEBUG
      COMMON       /ZZZE64O/                  E64OUT

      LOGICAL,      EXTERNAL :: GETIO64
      INTEGER,      EXTERNAL :: GETHIGH
      EXTERNAL      GETYP,LBLCHK,ENCODR,ENCODR2,
     +              GETMACH,PACCRN,PACC92,FMMM2

      DATA          IBM,CRAY,IEEE / 3*.FALSE. /
* ------------------------------------------------------------------

      IV8 = LOC( VAL8 ) ; IV4 = LOC( VAL ) !!! EQUIVALENCE ( IVAL8,VAL8 ),( IVAL,VAL )

      IO64B = GETIO64( IO64B )

***    USE THE DEFAULT PACKING PACKING TYPE.
***    STORE IT IN IBUF.

      PKTYP = GETYP( 0 )
      CALL PUTHIC( PKTYP,'PKTYP',IBUF )

      E64OK = (E64OUT .AND. (PKTYP.NE.'PK89'))

      IF (MACHINE.EQ.2)                                        THEN

                            NBW = 32
          IF (PKTYP.EQ.' ') NBW = 64

      ELSE IF (MACHINE.EQ.1)                                   THEN

          NBW = 64

      END IF

***    GET LABEL INFORMATION. STOP IF IBUF IS TOO SMALL.

      WRITE(TYPE,4) IBUF(1)
      CALL LBLCHK( LEN,NWDS,PACK, IBUF ) 

      IF (TYPE.EQ.'CHAR')                                      THEN

***       SIMPLY MOVE THE CHARACTER INFORMATION FROM LCM TO IBUF.

          DO  N=1,NWDS
              IBUF(HEAD+N) = LCM(N)
          END DO

          CALL GET_CENDIAN( CENDI )
          IF (BIGENDI /= CENDI) 
     +      CALL swap_endianness( IBUF(HEAD+1),NWDS )

          RETURN

      END IF

      IF (LEN - HEAD .GT. MAXPK)                               THEN
          IF (INFO)                                            THEN
              WRITE(6,6000) LEN-HEAD
              CALL PRTLAB(  IBUF )
              WRITE(6,6001) MAXPK
          END IF
          CALL                                     XIT(' Recpk2 ',-1 )
      END IF

      IF (DEBUG)                                               THEN
          IF (TYPE.EQ.'LABL')                                  THEN
              WRITE(LINE,6100) (LCM(I),I=1,NWDS)
          ELSE
              CALL FMMM2( AMIN,AMAX,AMEAN, LCM,NWDS )
              WRITE(LINE,6200) PKTYP, AMIN,AMAX,AMEAN
          END IF
          CALL PRTLAB2( TRIM( LINE )//' ',IBUF )
      END IF

      IF (PKTYP.EQ.'SQ89' .OR. PKTYP.EQ.'SQ98')                THEN

          DATYP = GETHIGH( 'DATYP',IBUF )

          IF (IAND( DATYP,64 ) > 0) DATYP = DATYP-64  ! Account for missing values
          IF (IAND( DATYP,128) > 0) DATYP = DATYP-128 ! Account for turbo packing

***        MOVE THE STRAIGHT DATA TO IBUF WHEN FILE IS RPN
***        TYPE AS ANY NECESSARY PACKING IS DONE DOWNSTREAM.
***        CONSIDER THAT REAL AND INTEGER DATA MAY BE WRITTEN.

          IF (IO64B)                                           THEN

***            64-BIT REAL INPUT.

              IF (DATYP.EQ.0   .OR.
     +            DATYP.EQ.1   .OR.
     +            DATYP.EQ.5   .OR.
     +            DATYP.EQ.6   .OR.
     +            DATYP.EQ.8   )                               THEN

                  IF (MACHINE.EQ.  2  .AND.
     +               (PACK   .GE.-NBW ))                       THEN
!!!  +               (DATYP  .EQ.  8  .OR. TYPE .EQ.'SPEC')))  THEN

***                    Case: 32-BIT OUTPUT, 32-BIT DATA WORDS.

!!!                    Complex words (DATYP=8) are always kept
!!!                    at machine precision (here 32-BIT).

                      DO  N=1,NWDS
                          IVAL8(1)     = LCM(N+N-1)
                          IVAL8(2)     = LCM(N+N  )
                          IF (IOR( IVAL8(1),IVAL8(2) ).NE.0 )  THEN
                              VAL      = SIGN( 
     +                                   MAX( 
     +                                   ABS( VAL8 ), 1.19D-38 ), VAL8 )
                          ELSE
                              VAL      = 0.0
                          END IF
                          IBUF(HEAD+N) = IVAL(1)
                      END DO

                  ELSE

***                    Case: 64-BIT OUTPUT, 64-BIT WORDS.

                      IF (E64OK         .OR.
     +                    BIGENDI.EQ. 1 .OR.
     +                    MACHINE.EQ. 1     )                  THEN

***                        Case : PACKER WILL HANDLE ENDIAN-ness
***                        **OR** BIG-ENDIAN MACHINE
***                        **OR** 64-BIT MACHINE.

                          DO  N=1,NWDS*MACHINE
                              IBUF(HEAD+N) = LCM(N)
                          END DO

                      ELSE

***                        Case: LITTLE-ENDIAN 32-BIT MACHINE.

                          DO  N=1,2*NWDS,2
                              IBUF(HEAD+N+1) = LCM(N)
                              IBUF(HEAD+N  ) = LCM(N+1)
                          END DO

                      END IF

                  END IF

              ELSE IF (DATYP.EQ.2 .OR. DATYP.EQ.4)             THEN

***                Case:  REAL8 WORDS CONVERTED TO INTEGER.

                  IF (DEBUG .AND. MACHINE.EQ.1) WRITE(6,6300)

                  DO  N=1,NWDS
                      IF (MACHINE.EQ.1)                        THEN
                          IVAL8(1)   = LCM(N)
                      ELSE
                          IVAL8(1)   = LCM(N+N-1)
                          IVAL8(2)   = LCM(N+N  )
                      END IF
                      IBUF(HEAD+N)   = VAL8
                  END DO

              END IF

          ELSE

***            32-BIT REAL INPUT (WHICH IMPLIES MACHINE=2).

!!!           IF (TYPE.EQ.'SPEC' .OR. DATYP.EQ.8)              THEN
!!!
!!!                Case: COMPLEX WORDS ARE KEPT AT MACHINE PRECISION.
!!!
!!!               DO  N=1,NWDS
!!!                   IBUF(HEAD+N) = LCM(N)
!!!               END DO
!!!
!!!           ELSE
              IF (DATYP.EQ.0   .OR.
     +            DATYP.EQ.1   .OR.
     +            DATYP.EQ.5   .OR.
     +            DATYP.EQ.6   .OR.
     +            DATYP.EQ.8   )                               THEN

                  IF (PACK.EQ.-(NBW*MACHINE))                  THEN

***                    Case: 64-BIT OUTPUT.

                      IF (E64OK .OR. BIGENDI.EQ.1)             THEN

***                        Case : PACKER WILL HANDLE ENDIAN-ness
***                        **OR** BIG-ENDIAN MACHINE.

                          DO  N=1,NWDS
                              IVAL(1)          = LCM(N)
                              VAL8             = VAL
                              IBUF(HEAD+N+N-1) = IVAL8(1)
                              IBUF(HEAD+N+N  ) = IVAL8(2)
                          END DO

                      ELSE

***                        Case: LITTLE-ENDIAN MACHINE.

                          DO  N=1,NWDS
                              IVAL(1)          = LCM(N)
                              VAL8             = VAL
                              IBUF(HEAD+N+N-1) = IVAL8(2)
                              IBUF(HEAD+N+N  ) = IVAL8(1)
                          END DO

                      END IF

                  ELSE

***                    Case: 32-BIT INPUT AND OUTPUT

                      DO  N=1,NWDS
                          IBUF(HEAD+N)     = LCM(N)
                      END DO

                  END IF

              ELSE IF (DATYP.EQ.2 .OR. DATYP.EQ.4)             THEN

***                Case: REAL WORDS CONVERTED TO INTEGER.

                  IF (DEBUG) WRITE(6,6300)

                  DO  N=1,NWDS
                      IVAL(1)      = LCM(N)
                      IBUF(HEAD+N) = VAL
                  END DO

              END IF

          END IF

          RETURN

      END IF

***    FIND NATIVE INPUT FORMAT.

      IF (.NOT. (IBM.OR.CRAY.OR.IEEE))
     +    CALL GETMACH( IBM,CRAY,IEEE )

      IF ( PACK.EQ.0 .OR.
     +   ((PACK.EQ.1 .OR. PACK .EQ.-NBW) .AND. IEEE))          THEN

***        NATIVE FORMAT

***        CASE: DATA IS NOT TO BE PACKED ==> MOVE IT TO IBUF.

          IF (PKTYP.EQ.' ')                                    THEN

***            CASE: 64-BIT REAL OUTPUT.

              IF (MACHINE.EQ.2)                                THEN

***                CASE: CODED AS 32-BIT INTEGERS.

                   IF (INTSIZE.EQ.2 .OR. IO64B)                THEN

***                     CASE: 64-BIT REAL INPUT.

                       IF (BIGENDI.EQ.1)                       THEN

***                        CASE: BIG-ENDIAN MACHINE.

                          DO N=1,NWDS*2,2
                              IBUF(HEAD+N)   = LCM(N)
                              IBUF(HEAD+N+1) = LCM(N+1)
                          END DO

                       ELSE

***                        CASE: LITTLE-ENDIAN 32-BIT MACHINE.

                          DO N=1,NWDS*2,2
                              IBUF(HEAD+N)   = LCM(N+1)
                              IBUF(HEAD+N+1) = LCM(N)
                          END DO

                      END IF

                  ELSE IF (INTSIZE.EQ.1)                       THEN

***                    CASE: 32-BIT REAL INPUT.

                      IF (BIGENDI.EQ.1)                        THEN

***                        CASE: BIG-ENDIAN MACHINE.

                          DO N=1,NWDS
                              IVAL(1) = LCM(N)
                              VAL8    = VAL
                              IBUF(HEAD+2*N-1) = IVAL8(1)
                              IBUF(HEAD+2*N  ) = IVAL8(2)
                          END DO

                      ELSE

***                        CASE: LITTLE-ENDIAN 32-BIT MACHINE.

                          DO N=1,NWDS
                              IVAL(1) = LCM(N)
                              VAL8    = VAL
                              IBUF(HEAD+2*N-1) = IVAL8(2)
                              IBUF(HEAD+2*N  ) = IVAL8(1)
                          END DO

                      END IF

                  END IF

              ELSE IF (INTSIZE.EQ.1)                           THEN

***             CASE: 64-BIT INTEGERS AND 64-BIT REALS.

                  DO N=1,NWDS
                      IBUF(HEAD+N) = LCM(N)
                  END DO

              END IF

          ELSE IF (PKTYP.EQ.'PK84')                            THEN

***            CASE: DATA IS NOT TO BE PACKED ==> MOVE IT TO IBUF.

              IF (IO64B)                                       THEN
                  DO  N=1,NWDS
                      IVAL8(1)     = LCM(N+N-1)
                      IVAL8(2)     = LCM(N+N  )
                      IF (IOR( IVAL8(1),IVAL8(2) ).NE.0 )  THEN
                          VAL      = SIGN( 
     +                               MAX( 
     +                               ABS( VAL8 ), 1.19D-38 ), VAL8 )
                      ELSE
                          VAL      = 0.0
                      END IF
                      IBUF(HEAD+N) = IVAL(1)
                  END DO
              ELSE
                  DO N=1,NWDS
                      IBUF(HEAD+N) = LCM(N)
                  END DO
              END IF

          END IF

      ELSE IF (PACK.EQ.1 .OR. PACK .EQ.-NBW)                   THEN

***        NON-NATIVE IEEE-754 OUTPUT FORMAT.

          IF (PKTYP.EQ.' ')                                    THEN

              IF (INTSIZE.EQ.1 .OR. IO64B)                     THEN

***                CASE: 64-BIT INPUT/OUTPUT.

                  IF (IBM)  CALL BF1BI64( LCM,IBUF(HEAD+1),NWDS )
                  IF (CRAY) CALL CF1CI64( LCM,IBUF(HEAD+1),NWDS )

              ELSE IF (MACHINE.EQ.2)                           THEN

***                CASE: 64-BIT OUTPUT/32-BIT INPUT.

                  CALL BF2BI64( LCM,IBUF(HEAD+1),NWDS )

              END IF

          ELSE IF (PKTYP.EQ.'PK84')                            THEN

***            CASE: THIS MODE IS NOT YET SUPPORTED.

              CALL DABORT

          END IF

      ELSE

          IF (IEEE .AND. PKTYP.EQ. 'PK84'
     +             .AND. PACK .EQ. -NBW-NBW)                   THEN

***            TWO OTHER CASES OF TRANSPARENT DATA.

              IF (IO64B)                                       THEN

***                CASE: 64-BIT OUTPUT FROM 64-BIT REAL NUMBERS.

                  IF (BIGENDI.EQ.1)                            THEN

***                    CASE: BIG-ENDIAN MACHINE

                      DO  N=1,LEN-HEAD
                          IBUF(HEAD+N) = LCM(N)
                      END DO

                  ELSE

***                    CASE: LITTLE-ENDIAN MACHINE.

                      DO  N=1,LEN-HEAD,2
                          IBUF(HEAD+N+1) = LCM(N)
                          IBUF(HEAD+N  ) = LCM(N+1)
                      END DO

                  END IF

              ELSE
                      
***                CASE: 64-BIT OUTPUT FROM 32-BIT REAL NUMBERS.

                  IF (BIGENDI.EQ.1)                            THEN

***                    CASE: BIG-ENDIAN MACHINE.

                      DO  N=1,NWDS
                          IVAL(1)          = LCM(N)
                          VAL8             = VAL
                          IBUF(HEAD+N+N-1) = IVAL8(1)
                          IBUF(HEAD+N+N  ) = IVAL8(2)
                      END DO

                  ELSE

***                    Case: LITTLE-ENDIAN MACHINE.

                      DO  N=1,NWDS
                          IVAL(1)          = LCM(N)
                          VAL8             = VAL
                          IBUF(HEAD+N+N-1) = IVAL8(2)
                          IBUF(HEAD+N+N  ) = IVAL8(1)
                      END DO

                  END IF

              END IF

              RETURN

          END IF

***        PACK THE FIELD INTO IBUF IF NPACK .NE. 0 .AND. NPACK .NE. 1.
***        SPECTRAL MEAN IS NOT PACKED. FOURIER IS PACKED LIKE SPECTRAL. 

          SF         = (TYPE.EQ.'SPEC' .OR.
     +                  TYPE.EQ.'FOUR')

          IF (PACK.GT.0)                                       THEN
              BITS   = NBW/PACK
          ELSE IF (PACK.LT.0)                                  THEN
              BITS   = -PACK
          END IF

          J          =  1
          KIND       = +1

          IXMIN      = HEAD   + 1
          IXSC       = IXMIN  + MACHINE

          IF (SF)                                              THEN
              IXMEAN = IXSC   + MACHINE
              FWRD   = IXMEAN + MACHINE
          ELSE
              FWRD   = IXSC   + MACHINE
          END IF

          ALLOCATE( LCMO(NWDS) )

          IF (IO64B .AND. MACHINE.EQ.2)                        THEN
              DO  N=1,NWDS
                  IVAL8(1) = LCM(N+N-1)
                  IVAL8(2) = LCM(N+N  )
                  VAL      = VAL8
                  LCMO(N)  = IVAL(1)
              END DO
          ELSE
              DO  N=1,NWDS
                  LCMO(N) = LCM(N)
              END DO
          END IF

          IF (SF)                                              THEN
              J      = J    + INTSIZE
              NWDS   = NWDS - 1
          END IF

          IF (PKTYP.EQ.'PK84')                                 THEN

              CALL PACCRN( LCMO(J),LCMO(J),IBUF(FWRD),
     +                     NWDS,BITS,XMIN,XSCAL,KIND )

              CALL          ENCODR ( XMIN,   IBUF(IXMIN)  )
              CALL          ENCODR ( XSCAL,  IBUF(IXSC)   )
              IF (SF)  CALL ENCODR ( LCMO(1),IBUF(IXMEAN) )

          ELSE IF (PKTYP.EQ.' ')                               THEN

              CALL PACC92( LCMO(J),LCMO(J),IBUF(FWRD),
     +                     NWDS,BITS,XMIN,XMAX,KIND )

                       CALL ENCODR2( IBUF(IXMIN), XMIN   )
                       CALL ENCODR2( IBUF(IXSC),  XMAX   )
              IF (SF)  CALL ENCODR2( IBUF(IXMEAN),LCMO(1) )

          END IF

          DEALLOCATE( LCMO )

      END IF

      RETURN

*-------------------------------------------------------------------
    4 FORMAT(A4)

 6000 FORMAT(' Recpk2 needs ',I6,' words to pack ')
 6001 FORMAT(' Only ',I6,' words are provided ...')

 6100 FORMAT('*DEBUG:RECPK2',6X,64A4)
 6200 FORMAT('*DEBUG:RECPK2',6X,A4,3(1PE15.6))
 6300 FORMAT('*DEBUG:RECPK2',6X,'Current record written',
     +       ' into a same precision (integer) array.')

      END 

      SUBROUTINE recput (NF,IBUF)

***    FEB 11/81 - J.D.HENDERSON

***    WRITES RECORD IMAGE IN IBUF TO FILE NF.
***    LABEL IS IN IBUF(1-8) FOLLOWED BY THE DATA (POSSIBLY PACKED). 

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      INTEGER     NF,IBUF(HEAD+1),LEN,LENGTH,NWDS,PACK,I
      LOGICAL     OK,INFORM,HYPER

      CHARACTER*4 PKTYP,TYPE,NAME

      INTEGER,    DIMENSION(:), ALLOCATABLE :: CHAINE

#     include    "machtype.cdk" 

      LOGICAL              INFO
      COMMON     /ZZVERBO/ INFO

      CHARACTER(4),EXTERNAL :: GETHIC
      INTEGER,     EXTERNAL :: GETHIGH
      EXTERNAL     LBLCHK,PUTBUF2,WRITEF,WRITSTD,PUTLAB

*---------------------------------------------------------------------
***    CHECK THE RECORD TYPE

      WRITE(TYPE,0004) IBUF(1)

      IF (TYPE.NE.'LABL')                                      THEN

***        USE THE PACKING TYPE STORED IN IBUF.

          PKTYP  = GETHIC('PKTYP',IBUF )

***        GET RECORD LENGTH. NOTE THAT THE
***        REAL LENGTH IS ALSO STORED IN IBUF.

          CALL LBLCHK( LEN,NWDS,PACK, IBUF )

          LEN    = GETHIGH('LEN',IBUF )
          LENGTH = HEAD/(MOD( MACHINE,2 )+1)

***        WRITE THE LABEL AND DATA ONTO FILE NF.

          IF (PKTYP.EQ.' ')                                    THEN
              CALL PUTBUF2( NF ,IBUF,        LENGTH , OK )
              CALL WRITEF ( NF ,IBUF(HEAD+1),LEN-LENGTH  )
          ELSE IF (PKTYP.EQ.'PK84')                            THEN
              CALL PUTBUF2( NF ,IBUF,LEN,OK )
          ELSE IF (PKTYP.EQ.'SQ98' .OR. PKTYP.EQ.'SQ89')       THEN
              CALL WRITSTD( NF ,IBUF,NWDS+HEAD,OK )
          END IF

      ELSE

***        USE PUTLAB TO WRITE THIS RECORD.

          LEN = IBUF(5)*IBUF(6)

          ALLOCATE( CHAINE(LEN*MACHINE) )

          DO  I=1,LEN*MACHINE
              CHAINE(I) = IBUF(HEAD+I)
          END DO

          WRITE(NAME,0004) IBUF(1)

                              HYPER  = .FALSE.
                              INFORM = .FALSE.
          IF (NAME.EQ.'FILE') HYPER  = .TRUE.
          IF (NAME.EQ.'INFO') INFORM = .TRUE.

          CALL PUTLAB( NF, CHAINE, IBUF,LEN, HYPER,INFORM )

          DEALLOCATE( CHAINE )

          OK = .TRUE.

      END IF

      IF (.NOT.OK)                                             THEN
          IF (INFO)                                            THEN
              WRITE(6,6000)
              CALL PRTLAB2('          ',IBUF)
          END IF
          CALL                                       XIT(' Recput ',-1)
      END IF

      RETURN

*---------------------------------------------------------------------
 0004 FORMAT(A4)

 6000 FORMAT('   Recput aborting on IBUF =')

      END

      SUBROUTINE recup2 (LCM,IBUF)

***    JAN 20/83 - R.LAPRISE, J.F.FORTIN.
***    NOV 06/90 - B.DUGAS/RPN : VERSION 32/64 BITS.

***    IBUF CONTAINS A RECORD IMAGE (LABEL + DATA), WHERE LABEL IS
***    AN 8 WORD INFORMATION BUFFER.  THE DATA IS MOVED TO LCM AND 
***    UNPACKED IF NECESSARY. 

      IMPLICIT      none

      INTEGER,      PARAMETER :: HEAD = taille_entete

      CHARACTER*4   TYPE,  NAME,  PKTYP
      LOGICAL       SF,    ALLOC
      REAL          XMIN,  XSCAL, XMAX
      INTEGER       IXMIN, IXSC,  IXMEAN,  DATYP
      INTEGER       LCM(3),IBUF(HEAD+1),LEN,NWDS,PACK,NBW,N,BITS,
     +              I,J,L,KIND,FWRD,LSR,LA,LR,LM,LM2,LNT,KTR, CENDI

      INTEGER       IVAL,IVAL8
      REAL*8         VAL8
      REAL           VAL, AMIN,AMAX,AMEAN
      POINTER     ( IV8, IVAL8(2) ),( IV4, IVAL(1) )

      INTEGER       IZERO
      REAL,         SAVE :: ZERO = 0.0
      POINTER     ( IZ, IZERO(1) )

      LOGICAL                DEBUG,INFO,IO64B
      COMMON       /ZZDEBUG/ DEBUG
      COMMON       /ZZVERBO/       INFO

#     include      "machtype.cdk" 

      LOGICAL       IBM,CRAY,IEEE
      SAVE          IBM,CRAY,IEEE

      INTEGER       MAXLIGNE
      PARAMETER   ( MAXLIGNE = ligne_maximale )

      CHARACTER     FORMC*26,LINE*ligne_maximale
      INTEGER       LAC,LEN1,LEN2

      LOGICAL,      EXTERNAL :: GETIO64
      INTEGER,      EXTERNAL :: GETHIGH
      CHARACTER(4), EXTERNAL :: GETHIC
      EXTERNAL      LBLCHK,DECODR,DECODR2,INFNAN,WRDSWP,
     +              PACCRN,PACC92,DIMGT2,FMMM2,GETMACH

      DATA          IBM,CRAY,IEEE / 3*.FALSE. /
* ---------------------------------------------------------------------

      IV8 = LOC( VAL8 ) ; IV4 = LOC( VAL ) !!! EQUIVALENCE ( IVAL8,VAL8 ),( IVAL,VAL )
      IZ  = LOC( ZERO ) !!! EQUIVALENCE ( IZERO,ZERO )

      IO64B = GETIO64( IO64B )

***    THE PACKING TYPE IS CONTAINED IN IBUF.

      PKTYP = GETHIC('PKTYP',IBUF )

      IF (MACHINE.EQ.2)                                        THEN

                            NBW = 32
          IF (PKTYP.EQ.' ') NBW = 64

      ELSE IF (MACHINE.EQ.1)                                   THEN

          NBW = 64

      END IF

***    FIND NATIVE OUTPUT FORMAT.

      IF (.NOT. (IBM.OR.CRAY.OR.IEEE))
     +    CALL GETMACH( IBM,CRAY,IEEE )

***    GET LABEL INFORMATION.

      WRITE(TYPE,4) IBUF(1)
      CALL LBLCHK( LEN,NWDS,PACK,IBUF ) 

      IF (TYPE.EQ.'CHAR')                                      THEN

          IF (PACK.NE.-64 .AND. PACK.NE.-32)                   THEN
              WRITE(NAME,4) IBUF(3)
              IF (INFO) WRITE(6,6001) NAME
              CALL                                 XIT(' Recup2 ',-1)
          END IF


***        SIMPLY MOVE THE CHARACTER INFO FROM IBUF TO LCM.

          DO  N=1,NWDS
              LCM(N) = IBUF(HEAD+N)
          END DO
 
          CALL GET_CENDIAN( CENDI )
          IF (BIGENDI /= CENDI) CALL swap_endianness( LCM,NWDS )

          IF (DEBUG)                                           THEN

              CALL PRTLAB2('*DEBUG:RECUP2 ', IBUF )

***            ***(CODE BORROWED FROM GGSTAT)***

              IF      (IBUF(8).EQ.-64)                         THEN
                  LAC  = NWDS*MACHINE
                  LEN1 = MIN( IBUF(5)*8, MAXLIGNE )
                  IF (INTSIZE*MACHINE.EQ.1)                    THEN
                      LEN2 = MIN( IBUF(5), MAXLIGNE/8 )
                      WRITE(FORMC,"(I3,'A8)')") LEN2
                  ELSE
                      LEN2 = MIN( 2*IBUF(5), MAXLIGNE/4 )
                      WRITE(FORMC,"(I3,'A4)')") LEN2
                  END IF
              ELSE IF (IBUF(8).EQ.-32)                         THEN
                  LAC  = NWDS
                  LEN1 = MIN( IBUF(5)*4, MAXLIGNE )
                  LEN2 = MIN( IBUF(5), MAXLIGNE/4 )
                  WRITE(FORMC,"(I3,'A4)')") LEN2
              END IF

              FORMC = "('*DEBUG:RECUP2',6X," // FORMC

              DO  I=1,LAC,LEN2
                  WRITE(LINE,FORMC) (LCM(L),L=I,MIN( LAC,I+LEN2-1 ))
                  WRITE(6,'(A)') LINE(1:LEN1)
              END DO

          END IF

          RETURN

      END IF

      IF (PKTYP.EQ.'SQ89' .OR. PKTYP.EQ.'SQ98')                THEN

          DATYP = GETHIGH('DATYP',IBUF)

          IF (IAND( DATYP,64 ) > 0) DATYP = DATYP-64  ! Account for missing values
          IF (IAND( DATYP,128) > 0) DATYP = DATYP-128 ! Account for turbo packing

***        MOVE THE DATA FROM IBUF WHEN FILE IS RPN TYPE
***        AS ANY NECESSARY UNPACKING WAS DONE UPSTREAM.
***        CONSIDER THAT REAL AND INTEGER DATA MAY BE READ.

          IF (IO64B)                                           THEN

***            64-BIT REAL OUTPUT.

              IF (DATYP.EQ.0   .OR.
     +            DATYP.EQ.1   .OR.
     +            DATYP.EQ.5   .OR.
     +            DATYP.EQ.6   .OR.
     +            DATYP.EQ.8   )                               THEN

                  IF (PACK.GE.-NBW .AND. MACHINE.EQ.2)         THEN

                      CALL INFNAN( IBUF(HEAD+1),NWDS, IBUF,.FALSE. )

***                    Case: 32-BIT INPUT, 32-BIT DATA WORDS.

                      DO  N=1,NWDS
                          IVAL(1)    = IBUF(HEAD+N)
                          VAL8       = VAL
                          LCM(N+N-1) = IVAL8(1)
                          LCM(N+N  ) = IVAL8(2)
                      END DO

                  ELSE

***                    Case: 64-BIT INPUT, 64-BIT WORDS.

                      IF (BIGENDI.EQ.1 .OR. MACHINE.EQ.1)      THEN

***                        Case: BIG-ENDIAN OR 64-BIT MACHINE.

                          DO  N=1,NWDS*MACHINE
                              LCM(N) = IBUF(HEAD+N)
                          END DO

                      ELSE

***                        Case: LITTLE-ENDIAN 32-BIT MACHINE.

                          IF (DATYP.EQ.0)                      THEN
                              DO  N=1,2*NWDS,2
                                  LCM(N)   = IBUF(HEAD+N+1)
                                  LCM(N+1) = IBUF(HEAD+N  )
                              END DO
                          ELSE
                              DO  N=1,2*NWDS
                                  LCM(N)   = IBUF(HEAD+N)
                              END DO
                          END IF

                      END IF

                      CALL INFNAN( LCM,NWDS, IBUF,.TRUE. ) 

                  END IF

              ELSE IF (DATYP.EQ.2 .OR. DATYP.EQ.4)             THEN

***                Case: INTEGERS CONVERTED TO REAL8.

                  IF (DEBUG .AND. MACHINE.EQ.1) WRITE(6,6300)

                  DO  N=1,NWDS
                      VAL8           = IBUF(HEAD+N)
                      IF (MACHINE.EQ.1)                        THEN
                          LCM(N)     = IVAL8(1)
                      ELSE
                          LCM(N+N-1) = IVAL8(1)
                          LCM(N+N  ) = IVAL8(2)
                      END IF
                  END DO

              END IF

          ELSE

***            32-BIT REAL OUTPUT (WHICH IMPLIES MACHINE=2).

              IF (DATYP.EQ.0   .OR.
     +            DATYP.EQ.1   .OR.
     +            DATYP.EQ.5   .OR.
     +            DATYP.EQ.6   .OR.
     +            DATYP.EQ.8   )                               THEN

                  IF (PACK.EQ.-(NBW*MACHINE))                  THEN

***                    Case: 64-BIT INPUT.

                      IF (BIGENDI.EQ.0 .AND. DATYP.EQ.0)
     +                    CALL WRDSWP( IBUF(HEAD+1),NWDS )

                      CALL INFNAN( IBUF(HEAD+1),NWDS, IBUF,.TRUE. ) 
                              
                      DO  N=1,NWDS
                          IVAL8(1)   = IBUF(HEAD+N+N-1)
                          IVAL8(2)   = IBUF(HEAD+N+N  )
                          IF (IOR( IVAL8(1),IVAL8(2) ).NE.0 )  THEN
                              VAL    = SIGN( 
     +                                 MAX( 
     +                                 ABS( VAL8 ), 1.19D-38 ), VAL8 )
                              LCM(N) = IVAL(1)
                          ELSE
                              LCM(N) = 0
                          END IF
                      END DO

                      IF (BIGENDI.EQ.0 .AND. DATYP.EQ.0)
     +                    CALL WRDSWP( IBUF(HEAD+1),NWDS )

                  ELSE

***                    Case: 32-BIT INPUT AND OUTPUT

                      DO  N=1,NWDS
                          LCM(N)     = IBUF(HEAD+N)
                      END DO

                      CALL INFNAN( LCM,NWDS, IBUF,.FALSE. ) 

                  END IF

              ELSE IF (DATYP.EQ.2 .OR. DATYP.EQ.4)             THEN

***                Case: INTEGERS CONVERTED TO REAL.

                  IF (DEBUG) WRITE(6,6300)

                  DO  N=1,NWDS
                      VAL            = IBUF(HEAD+N)
                      LCM(N)         = IVAL(1)
                  END DO

              END IF

          END IF

          GOTO 300

      END IF

      IF ( PACK.EQ.0 .OR.
     +   ((PACK.EQ.1 .OR. PACK .EQ.-NBW) .AND. IEEE))          THEN

***        NATIVE FORMAT

***        CASE: DATA IS NOT PACKED ==> MOVE IT TO LCM.

          IF (PKTYP.EQ.' ')                                    THEN

***            CASE: 64-BIT REAL INPUT.

              IF (MACHINE.EQ.2)                                THEN

***                CASE: CODED AS 32-BIT INTEGERS.

                  IF (INTSIZE.EQ.2 .OR. IO64B)                 THEN

***                    CASE: 64-BIT REAL OUTPUT.

                       IF (BIGENDI.EQ.1)                       THEN

***                        Case: BIG-ENDIAN MACHINE.

                          DO N=1,NWDS*2,2
                              LCM(N)   = IBUF(HEAD+N)
                              LCM(N+1) = IBUF(HEAD+N+1)
                          END DO

                      ELSE

***                        CASE: LITTLE-ENDIAN 32-BIT MACHINE.

                          DO N=1,NWDS*2,2
                              LCM(N)   = IBUF(HEAD+N+1)
                              LCM(N+1) = IBUF(HEAD+N)
                          END DO

                      END IF

                      CALL INFNAN( LCM,NWDS, IBUF,.TRUE. ) 

                  ELSE IF (INTSIZE.EQ.1)                       THEN

***                    CASE: 32-BIT REAL OUTPUT.

                      IF (BIGENDI.EQ.0) CALL WRDSWP( IBUF(HEAD+1),NWDS )

                      CALL INFNAN( IBUF(HEAD+1),NWDS, IBUF,.TRUE. ) 
                              
                      DO  N=1,NWDS
                          IVAL8(1)   = IBUF(HEAD+N+N-1)
                          IVAL8(2)   = IBUF(HEAD+N+N  )
                          IF (IOR( IVAL8(1),IVAL8(2) ).NE.0 )  THEN
                              VAL    = SIGN( 
     +                                 MAX( 
     +                                 ABS( VAL8 ), 1.19D-38 ), VAL8 )
                              LCM(N) = IVAL(1)
                          ELSE
                              LCM(N) = 0
                          END IF
                      END DO

                      IF (BIGENDI.EQ.0) CALL WRDSWP( IBUF(HEAD+1),NWDS )

                  END IF

              ELSE IF (INTSIZE.EQ.1)                           THEN

***             CASE: 64-BIT INTEGERS AND 64-BIT REALS.

                  DO N=1,NWDS
                      LCM(N) = IBUF(HEAD+N)
                  END DO

              END IF

          ELSE IF (PKTYP.EQ.'PK84')                            THEN

              CALL INFNAN( IBUF(HEAD+1),NWDS, IBUF,.FALSE. )

***            CASE: DATA IS NOT PACKED ==> MOVE IT TO LCM.

              IF (IO64B)                                       THEN
                  DO  N=1,NWDS
                      IVAL(1)    = IBUF(HEAD+N)
                      VAL8       = VAL
                      LCM(N+N-1) = IVAL8(1)
                      LCM(N+N  ) = IVAL8(2)
                  END DO
              ELSE
                  DO  N=1,NWDS
                      LCM(N) = IBUF(HEAD+N)
                  END DO
              END IF

          END IF

      ELSE IF (PACK.EQ.1 .OR. PACK .EQ.-NBW)                   THEN

***        NON-NATIVE IEEE-754 INPUT FORMAT.

          IF (PKTYP.EQ.' ')                                    THEN

               IF (INTSIZE.EQ.1 .OR. IO64B)                    THEN

***                CASE: 64-BIT INPUT/OUTPUT.

                  IF (IBM)  CALL BF1I64B( IBUF(HEAD+1),LCM,NWDS )
                  IF (CRAY) CALL CF1I64C( IBUF(HEAD+1),LCM,NWDS )

              ELSE IF (MACHINE.EQ.2)                           THEN

***                CASE: 64-BIT INPUT/32-BIT IBM OUTPUT.

                  CALL BF2I64B( IBUF(HEAD+1),LCM,NWDS )

              END IF

          ELSE IF (PKTYP.EQ.'PK84')                            THEN

***            CASE: THIS MODE IS NOT SUPPORTED.

              CALL DABORT

          END IF

      ELSE

          IF (IEEE .AND. PKTYP.EQ.'PK84'
     +             .AND. PACK .EQ. -NBW-NBW)                   THEN 

***            TWO OTHER CASES OF TRANSPARENT DATA.

              IF (IO64B)                                       THEN

***                CASE: 64-BIT INPUT TO 64-BIT REAL NUMBERS.

                  IF (BIGENDI.EQ.1)                            THEN

***                    CASE: BIG-ENDIAN MACHINE

                      DO  N=1,LEN-HEAD
                          LCM(N)   = IBUF(HEAD+N)
                      END DO

                  ELSE

***                    CASE: LITTLE-ENDIAN MACHINE.

                      DO  N=1,LEN-HEAD,2
                          LCM(N)   = IBUF(HEAD+N+1)
                          LCM(N+1) = IBUF(HEAD+N  )
                      END DO

                  END IF

                  CALL INFNAN( LCM,NWDS, IBUF,.TRUE. ) 
                              
              ELSE

***                CASE: 64-BIT INPUT TO 32-BIT REAL NUMBERS.

                  IF (BIGENDI.EQ.0) CALL WRDSWP( IBUF(HEAD+1),NWDS )

                  CALL INFNAN( IBUF(HEAD+1),NWDS, IBUF,.TRUE. ) 

                  DO  N=1,NWDS
                      IVAL8(1)   = IBUF(HEAD+N+N-1)
                      IVAL8(2)   = IBUF(HEAD+N+N  )
                      IF (IOR( IVAL8(1),IVAL8(2) ).NE.0 )      THEN
                          VAL    = SIGN( 
     +                             MAX( 
     +                             ABS( VAL8 ), 1.19D-38 ), VAL8 )
                          LCM(N) = IVAL(1)
                      ELSE
                          LCM(N) = 0
                      END IF
                  END DO

                  IF (BIGENDI.EQ.0) CALL WRDSWP( IBUF(HEAD+1),NWDS )

              END IF

              GOTO 300

          END IF

***        IF DATA IS PACKED, UNPACK IT INTO LCM.

          SF         = (TYPE.EQ.'SPEC' .OR.
     +                  TYPE.EQ.'FOUR')

          IF (PACK.GT.0)                                       THEN
              BITS   = NBW/PACK
          ELSE IF (PACK.LT.0)                                  THEN
              BITS   = -PACK
          END IF

          J          =  1
          KIND       = -1

          IXMIN      = HEAD   + 1
          IXSC       = IXMIN  + MACHINE
          IF (SF)                                              THEN
              IXMEAN = IXSC   + MACHINE
              FWRD   = IXMEAN + MACHINE
          ELSE
              FWRD   = IXSC   + MACHINE
          END IF

          IF (SF)                                              THEN
              J      = J    + INTSIZE
              NWDS   = NWDS - 1
          END IF

          IF (PKTYP.EQ.'PK84')                                 THEN

              CALL          DECODR ( XMIN,  IBUF(IXMIN)  )
              CALL          DECODR ( XSCAL, IBUF(IXSC)   )
              IF (SF)  CALL DECODR ( LCM(1),IBUF(IXMEAN) )

              CALL PACCRN( LCM(J),LCM(J),IBUF(FWRD),
     +                     NWDS,BITS,XMIN,XSCAL,KIND )

          ELSE IF (PKTYP.EQ.' ')                               THEN

              CALL          DECODR2( IBUF(IXMIN),  XMIN   )
              CALL          DECODR2( IBUF(IXSC),   XMAX   )
              IF (SF)  CALL DECODR2( IBUF(IXMEAN), LCM(1) )

              CALL PACC92( LCM(J),LCM(J),IBUF(FWRD),
     +                     NWDS,BITS,XMIN,XMAX,KIND )
          END IF

***        RESET IMAGINARY PART OF M=0 COMPONENTS TO ZERO.

          IF (TYPE.EQ.'SPEC')                                  THEN

              CALL DIMGT2( LSR,LA,LR, LM, KTR, IBUF(7), 0,-1 )
              DO 200 N=2,2*LM,2
                  LCM(N) = IZERO(1)
  200         CONTINUE

          ELSE IF(TYPE.EQ.'FOUR')                              THEN

              LM2 = 2*IBUF(5) 
              LNT = LM2*IBUF(6)
              DO 250 N=2,LNT,LM2
                  LCM(N) = IZERO(1)
  250         CONTINUE

          END IF

          IF (IO64B .AND. MACHINE.EQ.2)                        THEN

              IF (SF) NWDS   = NWDS+1

***        CONVERT SINGLE-PRECISION TO DOUBLE-PRECISION IN PLACE.

              DO  N=NWDS,1,-1
                  IVAL(1)    = LCM(N)
                  VAL8       = VAL
                  LCM(N+N-1) = IVAL8(1)
                  LCM(N+N  ) = IVAL8(2)
              END DO

          END IF

      END IF

  300 CONTINUE

      IF (DEBUG)                                               THEN
          IF (TYPE.EQ.'LABL')                                  THEN
              WRITE(LINE,6100) (LCM(I),I=1,NWDS)
          ELSE
              CALL FMMM2( AMIN,AMAX,AMEAN, LCM,NWDS )
              WRITE(LINE,6200) PKTYP, AMIN,AMAX,AMEAN
          END IF
          CALL PRTLAB2( TRIM( LINE )//' ',IBUF )
      END IF

      RETURN

* ------------------------------------------------------------
 0004 FORMAT(A4)

 6001 FORMAT(' Recup2 : Aborting on CHAR record ',A)

 6100 FORMAT('*DEBUG:RECUP2',6X,64A4)
 6200 FORMAT('*DEBUG:RECUP2',6X,A4,3(1PE15.6))
 6300 FORMAT('*DEBUG:RECUP2',6X,'Next (integer) record read',
     +       ' into a same precision real array.')

      END 
