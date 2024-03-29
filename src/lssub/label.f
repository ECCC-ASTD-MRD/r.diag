#     if !defined (mantisse_mot_reel)
#         define   mantisse_mot_reel 23
#     endif
#     if !defined (taille_entete_io)
#         define   taille_entete_io 16
#     endif
#     if !defined (bytesperword)
#         define   bytesperword 4
#     endif

C     $Log: label.ftn,v $
C     Revision 3.36  2021/02/10 22:22  dugas
C     Verifier que SLEV2 est non-nul dans PRTLAB/2/3
C
C     Revision 3.35  2021/01/30 17:17  dugas
C     Les enregistrements de renvois ne sont pas
C     pris en charge par les routines PRTLAB*
C
C     Revision 3.34  2019/07/12 13:13  dugas
C     S'assurer que SLEV est toujours defini dans PRTLAB3
C
C     Revision 3.33  2019/04/15 07:08  dugas
C     Definir NPAS via GETHIGH au debut de
C     PRTLAB3, avant l'appel a PDATE2.
C
C     Revision 3.32  2017/12/18 17:18  dugas
C     Corriger une erreur d'omission d'initialisation
C     de la variable LOVAL dans la routine PRTLAB3
C
C     Revision 3.31  2017/10/02 20:20  dugas
C     Tenir compte des differentes signatures d'operations temporelles
C      qui pourraient se retrouver dans le deuxieme caracteres du TYPVAR
C      lors du traitement de la routine PRTLAB3. Ces signatures sont
C      fournies via via le nouveau module stats_signatures
C
C     Revision 3.30  2016/10/26 15:30  dugas
C     Modifications syntaxiques F77 --> F90
C
C     Revision 3.29  2014/10/16 12:00:41  dugas
C     Modifications commandees par la compilation avec GFORTRAN et IFORT.
C
C     Revision 3.28  2014/09/25 18:42:03  dugas
C     Inserer le texte de la licence LPGPL 2.1 pour R.DIAG
C
C     Revision 3.27  2013/12/10 22:09:34  dugas
C     Ajouter message DEBUG a PDATE.
C
C     Revision 3.26  2013/10/08 01:06:32  bernard
C      - Ajouter le support des "-na" dans CMPLBL.
C      - Les routines PRTLAB(2/3) impriment IBUF(7) en format I10
C        pour permettre d'identifier les LRLMT a 9 chiffres.
C
C     Revision 3.25  2012/05/17 18:21:55  dugas
C     - Meilleur support des dates pour les fichiers CCC
C       dans les routines PRTLAB2 et PRTLAB3.
C     - Nouvelle routine PDATE2 utilisees par ces deux routines.
C     - PDATE devient ainsi un point d'entree de cette derniere.
C
C     Revision 3.24  2010/10/23 16:19:16  dugas
C     Tenir compte de DATE_CONVERSION_FACTOR dans PRTLAB2 et PDATE.
C
C     Revision 3.23  2010/03/27 21:17:22  dugas
C     Modifier PDATE lorsque STAMP n'en n'est pas un.
C
C     Revision 3.22  2010/02/22 19:32:52  dugas
C     Correction a PDATE lorsque STAMP n'en n'est pas un (suite).
C
C     Revision 3.21  2010/02/20 20:41:36  dugas
C     Correction a PDATE lorsque STAMP n'en n'est pas un.
C
C     Revision 3.20  2010/02/12 22:33:18  dugas
C     - Puisque IBUF(2) contient maintenant un DATETIMESTAMP CMC/RPN lors des
C       traitements internes, on utilise NEWDATE(mode=-3) pour le decoder.
C     - Ajout de la routine PRTLAB3 pour coder cette information en
C       format @ 18 caracteres.
C
C     Revision 3.19  2008/04/28 21:41:56  dugas
C     Corriger l'usage des macros pour r.gppf (passe 2).
C
C     Revision 3.18  2008/04/28 14:23:15  dugas
C     Ne plus tenir compte du cas non-SQ98.
C
C     Revision 3.17  2007/12/19 19:26:14  dugas
C     - Utiliser ALLOCATE/DEALLOCATE plutot que HPALLOC/HPDEALLC.
C     - PRTLAB devient un point d'entree a PRTLAB2.
C
C     Revision 3.16  2006/07/04 16:08:45  dugas
C     Modification pour usage de DATYP=8 avec les donnees spectrales.
C
C     Revision 3.15  2004/09/13 17:23:27  dugas
C     Ajouter du code pour les donnees CHAR dans LBLCHK.
C
C     Revision 3.14  2003/01/22 21:49:45  dugas
C     Remplacer MOVE832 par MOV832.
C
C     Revision 3.13  2000/05/30 01:55:53  armnrbd
C     Corriger l'usage de NBR a la fin de GETLAB.
C
C     Revision 3.12  2000/05/30 01:33:17  armnrbd
C     Tenir compte de BIGENDI dans GETLAB et PUTLAB.
C     Mettre du code DEBUG dans GETLAB.
C
C     Revision 3.11  2000/05/29 19:35:48  armnrbd
C     Initialiser la partie haute du tampon avec SETLAB
C      dans le cas des fichiers standards RPN.
C
C     Revision 3.10  1999/04/08 19:26:38  armnrbd
C     Utiliser le comdeck MACHTYPE.CDK.
C
C     Revision 3.9  1998/06/08 03:40:23  armnrbd
C     Utiliser (GET/PUT)HIGH et (GET/PUT)HIC pour faire la gestion
C      des codes entreposes dans la section haute de IBUF (NEWL, etc...).
C
C     Revision 3.8  1998/02/19  17:34:59  armnrbd
C     Passer de SQ97 a SQ98.
C
C     Revision 3.7  1997/10/10  20:18:45  armnrbd
C     Implanter le macro taille_entete_io pour PUTLAB.
C
C     Revision 3.6  1997/06/06  17:03:31  armnrbd
C     Enlever le traitement de IO dans la routine PUTLAB.
C
C     Revision 3.5  1997/06/02  14:29:44  armnrbd
C     Ajouter la routine PRTLAB.
C
C     Revision 3.4  1997/05/27  18:53:19  armnrbd
C     Premiere version compatible avec les fichiers standards 1997.
C
C     Revision 3.3  1997/02/17  03:50:04  armnrbd
C     Ajouter le mode I/O 64 bits.
C
C     Revision 3.2  1995/02/13  19:41:10  armnrbd
C     Modifier le calcul de LEN dans la routine LBLCHK.
C
C     Revision 3.1  94/11/17  14:13:37  armnrbd
C     Messages informatifs quand au passage de la version 2.x a 3.1...
C     1) Les espaces en debut des noms de variables de sont plus pertinents.
C     2) Les grilles complexes de type CMPL sont maintenant supportees.
C     3) Les fichiers SQI sont reconnus, lus et ecrit directements.
C     4) Plusieurs nouvelles cles sont disponibles au demarrage.
C     
C     Revision 3.0  94/11/17  13:55:43  13:55:43  armnrbd (Bernard Dugas)
C     *** empty log message ***
C     
C     Revision 2.3  94/08/16  20:58:39  armnrbd
C     Enlever certaines references aux routines I/O Fortran.
C     
C     Revision 2.2  94/06/21  23:18:24  armnrbd
C     Modifier le traitement du cas PACK=0 dans LBLCHK.
C     
C     Revision 2.1  94/05/09  11:54:32  armnrbd
C     Ne pas verifier IBUF(6) dans les cas ZONL.
C     
C     Revision 2.0  93/10/13  13:31:51  armnrbd
C     Premiere version compatible HP-UX.
C     
C     Revision 1.11  93/08/04  15:14:31  armnrbd
C     Utiliser CLRLMT dans les calculs de lrlmt.
C     
C     Revision 1.10  92/11/23  22:03:45  armnrbd
C     Modification...
C     
C     Revision 1.9  92/11/15  16:02:32  armnrbd
C     Troisieme iteration PKTYP.
C     
C     Revision 1.8  92/11/11  12:29:22  armnrbd
C     Deuxieme iteration de l'implantation de PKTYP.
C     
C     Revision 1.7  92/11/03  11:23:24  armnrbd
C     Correction a PUTLAB.
C     
C     Revision 1.6  92/11/02  21:47:06  armnrbd
C     Implanter l'appel a GETYP.
C     
C     Revision 1.5  92/10/28  17:12:12  armnrbd
C     Deuxieme passe de PK92.
C     
C     Revision 1.4  92/10/28  15:41:28  armnrbd
C     Verifier si PKTYP='****' dans GETLAB.
C     
C     Revision 1.3  92/10/28  15:14:08  armnrbd
C     Verifier si PKTYP='****' dans PUTLAB.
C     
C     Revision 1.2  92/10/28  13:45:36  armnrbd
C     Premier jeux de modification pour l'implantation du PK92.
C     
C     Revision 1.1  92/04/01  13:09:54  armnrbd
C     Le traitement de npak=-32 est identique a celui de 
C     npak=1 dans la routine LBLCHK.
C     
C     Revision 1.0  92/02/21  11:33:30  armnrbd
C     Initial revision
C     
      SUBROUTINE cmplbl (NF1,KBUF,NF2,LBUF,OK)

***    NOV 14/79 - J.D.HENDERSON

***    THE  LABEL OF THE NEXT  RECORD IN FILE NF1 IS COMPARED TO
***    THE LABEL OF THE NEXT RECORD IN FILE NF2.  IF EITHER FILE 
***    NUMBER IS ZERO IT IS ASSUMED THAT THE CORRESPONDING LABEL 
***    IS ALREADY AVAILABLE. FIELDS MUST BE OF THE SAME KIND AND
***    SIZE. IF NOT, THE VARIABLE OK IS RETURNED AS FALSE.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete

      LOGICAL     OK
      INTEGER     NF1,NF2,KBUF(HEAD),LBUF(HEAD)

      
      LOGICAL              INFO,NA
      COMMON     /ZZVERBO/ INFO
      COMMON     /ZZABORT/      NA

      CHARACTER   TYPE*4
      INTEGER     LSR,LR,LM,LA,KTR

      INTEGER,    EXTERNAL :: CLRLMT
      EXTERNAL    DIMGT2,GETBUF2

*--------------------------------------------------------------------
      OK=.FALSE.

***    GET THE  FIRST LABEL (KBUF) IF NECESSARY.
***    RETURN IF THE  FIRST FILE IS EMPTY.

      IF (NF1.NE.0)                                            THEN
          CALL getbuf2( NF1, KBUF,HEAD, OK )
          IF (OK) GOTO 100
  
  050     IF (INFO) WRITE(6,6011)
          RETURN
      END IF

***    GET THE SECOND LABEL (LBUF) IF NECESSARY.
***    RETURN IF THE SECOND FILE IS EMPTY.

  100 IF (NF2.NE.0)                                            THEN
          CALL getbuf2( NF2, LBUF,HEAD, OK )
          IF (OK) GOTO 200

  150     IF (INFO) WRITE(6,6012)
          RETURN
      END IF

***    RETURN IF THE FIELDS ARE OF DIFFERENT KIND OR SIZE.

  200 WRITE(TYPE,'(A4)') KBUF(1)

      IF (KBUF(5).NE.LBUF(5)                        .OR.
     +   (KBUF(1).NE.LBUF(1) .AND. .NOT.NA)         .OR.
     +   (KBUF(6).NE.LBUF(6) .AND. TYPE.NE.'ZONL')  .OR.
     +   (KBUF(7).NE.LBUF(7) .AND. TYPE.NE.'SPEC')) RETURN

***    CONSIDER THE TWO POSSIBLE LRLMT REPRESENTATIONS.

      IF (KBUF(7).NE.LBUF(7)   .AND. TYPE.EQ.'SPEC')          THEN
          CALL DIMGT2( LSR,LA,LR,LM,KTR, LBUF(7), 0,-1 )
          IF (KBUF(7).NE.CLRLMT(LR,LM,KTR,.TRUE. ) .AND.
     +        KBUF(7).NE.CLRLMT(LR,LM,KTR,.FALSE.) ) RETURN
      END IF

      OK=.TRUE.

      RETURN

*--------------------------------------------------------------------
 6011 FORMAT('  First file empty in Cmplbl.')
 6012 FORMAT(' Second file empty in Cmplbl.')

      END
      Subroutine getlab (nf, chaine, ibuf,len,ok)

***    Auteur: B.Dugas - RPN, le 18 septembre 1990

***    Objet(getlab):
*         - Lire une chaine de caracteres. version a 32/64 bits
*           d'un archivage a 64 bits.

***    Arguments:
*         in  - nf     -  numero d'unite d'e/s. 
*                         a) si nf < 0, l'unite est rembobinnee; 
*                         b) si nf = 0, chaine est directement
*                            lue de ibuf et non pas d'un fichier 
*                            externe.
*         in  - len    -  nombre de caracteres a lire/8.
*         in  - ibuf   -  tampon d'E/S ccrn de 64 octets.
*                         contient deja le descripteur a l'entree.
*         out - chaine -  chaine de caracteres a produire.
*         out - ok     -  variable logique indiquant le succes (vrai)
*                         ou l'echec (faux) de l'operation.

      implicit    none

      integer     head
      parameter ( head = taille_entete )

      logical     ok
      integer     len,nf,ibuf(*)
      character*8 chaine(len)

      character*8 blanc
      character*4 pktyp
      integer     i,nbr,nf0

#     include    "machtype.cdk"

      logical              info,debug
      common     /zzverbo/ info
      common     /zzdebug/      debug

      character*4 getyp
      external    getyp,precede,getbuf2,readf,
     +            puthic,mov832,movlev

      data        blanc / ' ' /
*----------------------------------------------------------------------

      ok = .true.

      if (nf.ne.0)                                             then

***        Aller chercher l'information sur nf s'il le faut.

          nf0   = nf
          pktyp = getyp( nf )

          if (nf.lt.0)                                         then
              nf0 = -nf
              call precede( nf0,-1 )
          end if

***        Lire le bon nombre de caracteres dans ibuf.

                            nbr = len
          if (machine.eq.2) nbr = len*2

          if (pktyp.eq.' ')                                    then

              call getbuf2( nf0, ibuf,head,ok )
              if (.not.ok) return
              call readf( nf0, ibuf(head+1),nbr,ok )
              if (.not.ok) return

          else if (pktyp.eq.'PK84')                            then

              call getbuf2( nf0, ibuf,head+nbr,ok )
              if (.not.ok) return

          end if

***        Possiblement garder une copie de pktyp dans ibuf.

          if (machine.eq.2)
     +        call puthic( pktyp,'pktyp',ibuf )

      end if

***    Remplir chaine de 8*len caracteres.

      nbr = min( ibuf(5)*ibuf(6), len )

      if (debug)                                               then
          write(6,6100) (ibuf(i),i=1,8),
     +                  (ibuf(i),i=head+1,head+nbr*machine)
      end if

      if (machine.eq.2 .and.
     +    bigendi.eq.0)                                        then
          call mov832( ibuf(head+1),chaine,nbr*machine )
          call movlev( chaine,ibuf(head+1),nbr*machine )
      end if

      if (machine.eq.2)                                        then
          do  i=1,nbr
              write(chaine(i),44) ibuf(head+2*i-1),ibuf(head+2*i)
          end do
       else if (machine.eq.1)                                  then
          do  i=1,nbr
              write(chaine(i),08) ibuf(head+i)
          end do
      end if

      do  i=nbr+1,len
          chaine(i) = blanc
      end do
          
      return
*----------------------------------------------------------------------

   04 format( a4)
   44 format(2a4)
   08 format( a8)

 6100 format('*DEBUG:GETLAB',6X,A4,I12,2X,A4,5I8/
     +       '*DEBUG:GETLAB beg =',64A4)

      end
      SUBROUTINE lblchk (LEN,NWDS,PACK,IBUF)

***    NOV 18/82 - R.LAPRISE.
***    MODIFIEE LE 06 NOV. 1990 (B.DUGAS, RPN):  PACK < 0 OK.

***    CHECKS STANDARD 8 WORD FILE LABEL (IBUF) AND RETURNS...

***    LEN  = TOTAL LENGTH OF THE RECORD (IN 32 BIT WORDS).
***    NWDS = LENGTH OF THE UNPACKED FIELD (REAL WORDS).
***    PACK = PACKING DENSITY IF POSITIVE. -NUMBER OF BITS
***           PER PACKED WORD IF NEGATIVE.

      IMPLICIT    none

      INTEGER,    PARAMETER :: HEAD = taille_entete
      INTEGER,    PARAMETER :: NSIGN = mantisse_mot_reel

      CHARACTER*4 TYPE,PKTYP,GETYP
      INTEGER     LEN,NWDS,PACK,PK32,PK64
      INTEGER     IBUF(8),NI,NJ,NK,MAN,NBW,BITS
      LOGICAL     OK,FOUR,SPEC,LABL,CMPL,CHAR

      CHARACTER*4 GETHIC
      EXTERNAL    GETHIC,PUTHIGH,XIT,GETYP,FIXNINJ

      LOGICAL              INFO
      COMMON     /ZZVERBO/ INFO

#     include    "machtype.cdk"

*-----------------------------------------------------------------------
      PACK = IBUF(8) 

      IF (MACHINE.EQ.1) NBW = 64
      IF (MACHINE.EQ.2) NBW = 32

      MAN  = NSIGN

***    DETERMINE THE SIZE OF THE FIELD IN REAL WORDS.
***    (FOURIER AND SPECTRAL ARE COMPLEX WHILE LABL
***    ARE IN 8 CHARACTER UNITS)

      WRITE(TYPE,'(A4)') IBUF(1)

      CMPL = (TYPE.EQ.'CMPL') 
      FOUR = (TYPE.EQ.'FOUR') 
      LABL = (TYPE.EQ.'LABL') 
      SPEC = (TYPE.EQ.'SPEC') 
      CHAR = (TYPE.EQ.'CHAR') 

          NWDS = IBUF(5)*IBUF(6)
      IF (CMPL .OR.
     +    FOUR )   
     +    NWDS = NWDS*2

      IF (SPEC)                                                THEN
          NI   = NWDS
          NWDS = NWDS*2
          NJ   = 1
          NK   = 1
      END IF

      IF (LABL .OR. CHAR)                                      THEN

***        CONSIDER LABEL OR. CHARACTER RECORDS.

          IF (CHAR .AND. NBW.LT.-PACK)
     +        NWDS = NWDS*2

          IF (LABL)
     +        NWDS = NWDS*MACHINE
     
              LEN  = NWDS+HEAD
          
              CALL PUTHIGH( LEN,'LEN',IBUF )

              RETURN

      END IF

      IF (MACHINE.EQ.2)                                        THEN

***        CHECK PACKING TYPE IN IBUF,GETYP(0).
***        ADJUST NBW ACCORDINGLY.

          PKTYP = GETHIC('PKTYP',IBUF )

          IF   (PKTYP.NE.'    '  .AND.
     +          PKTYP.NE.'SQ98'  .AND.
     +          PKTYP.NE.'SQ89'  .AND.
     +          PKTYP.NE.'PK84') PKTYP = GETYP( 0 )

          IF   (PKTYP.EQ.' ')                                  THEN
                NBW = NBW*2
                MAN = 32
          END IF

      ELSE IF (MACHINE.EQ.1)                                   THEN

***        ONLY THE PK92 PACKING IS SUPPORTED IN THIS CASE.

          PKTYP = ' '

      END IF

***    IF WE REQUEST MORE THAN THE MAXIMUM NUMBER OF 
***    SIGNIFICANT BITS (MAN), RESET KPACK TO 1.

      IF (PACK.LT.-MAN .AND. PACK.NE.-NBW
     +                 .AND. PACK.NE.-NBW*MACHINE)             THEN
          PACK = -NBW
          IF (INFO) WRITE(6,6010) MAN
      END IF
      
      IF (PACK.EQ.0 .OR. PACK.EQ.-NBW .OR.
     +    PACK.EQ.1 .OR. PACK.EQ.-NBW*MACHINE)                 THEN

***        PACK = 0
***        NATIVE FORMAT. NO PACKING WHATSOEVER BUT
***        PK92 ALWAYS USES 64 BIT REPRESENTATION.

          IF (PKTYP.EQ.' ')                                    THEN
              LEN  = NWDS*MACHINE + HEAD
          ELSE IF (PKTYP.EQ.'PK84'.OR.
     +             PKTYP.EQ.'SQ98'.OR.
     +             PKTYP.EQ.'SQ89')                            THEN
              IF (PACK.EQ.-NBW*MACHINE)                        THEN
                  LEN  = NWDS*MACHINE + HEAD
              ELSE
                  LEN  = NWDS         + HEAD + MOD(NWDS,2)
              END IF
          END IF

***        ACCOUNT FOR LIMITATIONS IN NI,NJ SIZES.

          IF (SPEC .AND. PKTYP.EQ.'SQ89')                      THEN

              CALL FIXNINJ( NI,NJ,NK )
              LEN = (NI*NJ*NK) + HEAD

              IF (PACK.EQ.-NBW*MACHINE) 
     +        LEN = (NI*NJ*NK)*MACHINE + HEAD

          END IF

***        ACCOUNT FOR LABEL RECORDS AND SAVE LEN IN IBUF.

          IF (TYPE.NE.'LABL' .AND.
     +        PACK.NE. 0   ) IBUF(08) = PACK
                             CALL PUTHIGH( LEN,'LEN',IBUF )

          RETURN

      ELSE IF (PACK.LT.0)                                      THEN

          BITS = -PACK

      ELSE IF (PACK.GT.0)                                      THEN

          BITS = NBW/PACK

      END IF

***    FORCE BIT NUMBER REPRESENTATION OF PACKING DENSITY.

      IBUF(8) = -BITS

***    STOP IF PACKING IS NOT BETWEEN 1 AND NBW (INCLUSIVE).

      OK = (BITS.GE.1 .AND. BITS.LE.NBW) 

      IF (.NOT.OK) THEN
          IF (INFO) WRITE(6,6025) IBUF
          CALL                                   XIT(' Lblchk ',-1)
      END IF

***    COMPUTE THE MINIMUM LENGTH OF THE COMPLETE RECORD
***    IMAGE, THAT IS THE SPACE IT TAKES ON DISK...

                             PK32 = (NWDS-1)/(32/BITS)+1
                             PK64 = (PK32-1)/  2      +1

                             LEN  = HEAD/(MOD( MACHINE,2 )+1)
                             LEN  = LEN +(PK64+2)*MACHINE
      IF ( SPEC )            LEN  = LEN +         MACHINE

***    SAVE THIS IN IBUF AND PROCEED TO LIE ABOUT LEN.

                             CALL PUTHIGH( LEN,'LEN',IBUF )

                             PK64 = (NWDS-1)/  2      +1
                             LEN  = HEAD+(PK64+2)*MACHINE
      IF ( SPEC )            LEN  = LEN +         MACHINE
      IF ( SPEC .AND. PKTYP.EQ.'SQ89')                         THEN

***        AGAIN, ACCOUNT FOR LIMITATIONS IN NI,NJ SIZES.

          CALL FIXNINJ( NI,NJ,NK )
          LEN = (NI*NJ*NK) + HEAD

      END IF

      RETURN

*-----------------------------------------------------------------------
 6010 FORMAT(' *** NOTE:'/
     +       ' *** Packing de-selected, as there are only ',I3,
     +       ' available significant bits.')
 6025 FORMAT(3X,A4,I10,2X,A4,5I8)

      END 
      Subroutine putlab (nf, chaine, ibuf,len, hyper,inform)

***    Auteur: B.Dugas - RPN, le 18 septembre 1990

***    Objet(putlab):
*         - Ecrire une chaine de caracteres. Version a 32/64 bits
*           d'un archivage a 64 bits.

***    Arguments:
*         in  - nf     -  numero d'unite d'e/s. 
*         in  - len    -  nombre de caracteres a ecrire/8.
*         in  - chaine -  chaine de caracteres.
*         in  - hyper  -  ecrire un hyper-label de fichier?
*         in  - inform -  ecrire un tampon de parametres?
*         out - ibuf   -  tampon d'e/s ccrn de 64 octets.

      implicit    none

      integer     head
      parameter ( head = taille_entete )
      integer     iohead
      parameter ( iohead = taille_entete_io )

      logical     hyper, inform
      integer     blanc,labl,file,info, iolen,
     +            ibuf(head), nf, len
      character*8 chaine(len)
      character*8 hold

      integer,    dimension(:), allocatable :: jbuf

      character*4 pktyp,getyp
      integer     ipktyp,ier,i

#     include    "machtype.cdk"

      external    getyp,xit,writef,swapa4

      data        blanc / z'20202020' /,
     +            labl  / z'4c41424c' /,
     +            file  / z'46494c45' /,
     +            info  / z'494e464f' /

*----------------------------------------------------------------------
***    Utiliser le type de compaction par defaut.

           pktyp  =  getyp( 0 )
      read(pktyp,04) ipktyp

***    Contruire le tampon d'information ibuf.

      if (machine.eq.2)                                        then

          ibuf(16) = 1
          ibuf(15) = 0
          ibuf(14) = 0
          ibuf(13) = 0
          ibuf(12) = 1
          ibuf(11) = 0
          ibuf(10) = len
          ibuf(9)  = 0
          ibuf(8)  = 0
          ibuf(7)  = 0
          ibuf(6)  = blanc
          ibuf(5)  = labl
          ibuf(4)  = 0
          ibuf(3)  = 0
          ibuf(2)  = ipktyp
          ibuf(1)  = labl

          if (hyper)  ibuf(5) = file
          if (inform) ibuf(5) = info

          if (bigendi.eq.0)                                    then
CCC           call swapa4( ibuf(5) )
              call swapa4( ibuf(2) )
CCC           call swapa4( ibuf(1) )
          end if

          iolen    = iohead

      else if (machine.eq.1)                                   then

          ibuf(8)  = 1
          ibuf(7)  = 0
          ibuf(6)  = 1
          ibuf(5)  = len
          ibuf(4)  = 0
          ibuf(3)  = labl
          ibuf(2)  = 0

          write(hold,44) labl,pktyp
          read (hold,08) ibuf(1)

          if (hyper)  ibuf(3) = file
          if (inform) ibuf(3) = info

          iolen    = iohead/2

      end if

***    Ecrire ibuf et les 8*len caracteres de chaine.

      allocate( jbuf(iohead+len*machine) )

      if (pktyp.eq.'PK84')                                     then

          do  i=1,iohead
              jbuf(i) = ibuf(i)
          end do

          if (machine.eq.2)                                    then
              do  i=1,len
                  read(chaine(i),44) jbuf(iohead+2*i-1),jbuf(iohead+2*i)
                  if (bigendi.eq.0)                            then
                      call swapa4( jbuf(iohead+2*i-1) )
                      call swapa4( jbuf(iohead+2*i  ) )
                  end if
              end do
          else if (machine.eq.1)                               then
              do  i=1,len
                  read(chaine(i),08) jbuf(iohead+i)
              end do
          end if

          call writef( nf, jbuf,iolen+len*machine )

      else if (pktyp.eq.' ')                                   then

          call writef( nf, ibuf,iolen )

          if (machine.eq.2 .and. bigendi.eq.0)                 then
              call mov832( chaine,jbuf,len*2 )
          else
              call movlev( chaine,jbuf,len*machine )
          end if

          call writef( nf, jbuf,len*machine )

      else

          call                                     xit(' Putlab ' ,-1 )

      end if

      deallocate( jbuf )

***    Restaurer ibuf(1 a 8).

      if (machine.eq.2)                                        then

          if (bigendi.eq.0)                                    then
CCC           call swapa4( ibuf(5) )
CCC           call swapa4( ibuf(1) )
          end if

          ibuf(2) = ibuf(4)
          ibuf(3) = ibuf(5)
          ibuf(4) = ibuf(8)
          ibuf(5) = ibuf(10)
          ibuf(6) = ibuf(12)
          ibuf(7) = ibuf(14)
          ibuf(8) = ibuf(16)

      else if (machine.eq.1)                                   then

          write(hold,04) ibuf(1)
          read (hold,04) ibuf(1)

      end if

      return
*----------------------------------------------------------------------

   04 format( a4)
   44 format(2a4)
   08 format( a8)

 6000 format('   Putlab retourne iostat= ',i5)

      end
      SUBROUTINE setlab (IBUF, C1,I2,C3,I4,I5,I6,I7,I8) 
 
***    JAN 30/78 - J.D.HENDERSON 

***    THIS ROUTINE FILLS THE FIRST 8 WORDS OF THE DIAGNOSTIC LABEL
***    IBUF FROM I1, I2, ... I8.  NOTE THAT IBUF(N) IS NOT SET IF
***    I(N) IS -1 OR BLANK.
 
      IMPLICIT      none

      CHARACTER*(*) C1,C3
      CHARACTER*4   L1,L3
      
      INTEGER       IBUF(8), I2,I4,I5,I6,I7,I8

      integer       head
      parameter   ( head = taille_entete )

      character     etiket*16

      integer       getpari,i
      character*4   getyp,pktyp,getparc*128
      external      getyp,puthic,puthigh
      external      getpari,getparc

*-------------------------------------------------------------------- 
***    Determiner le type de compaction par defaut.

      pktyp = getyp( 0 )

      if (pktyp(1:2).eq.'SQ')                                  then

***        Verifier s'il y a quelque chose
***        dans la partie haute du tampon.

          do  i=12,head
              if (IBUF(i).ne.0) goto 100
          end do

***        Sinon, y mettre les valeurs courantes de /fstparm/.

          call puthigh( getpari( 'DEET'   ) , 'DEET'   , IBUF )
          call puthigh( getpari( 'NPAS'   ) , 'NPAS'   , IBUF )
          call puthigh( getpari( 'DATEO'  ) , 'DATEO'  , IBUF )

          call puthigh( getpari( 'IG1'    ) , 'IG1'    , IBUF )
          call puthigh( getpari( 'IG2'    ) , 'IG2'    , IBUF )
          call puthigh( getpari( 'IG3'    ) , 'IG3'    , IBUF )
          call puthigh( getpari( 'IG4'    ) , 'IG4'    , IBUF )

          call puthic(  getparc( 'GRTYP'  ),  'GRTYP'  , IBUF )
          call puthic(  getparc( 'TYPVAR' ),  'TYPVAR' , IBUF )

          etiket = getparc( 'ETIKET' )

          call puthic(  etiket(1:4)  , 'ETIK1', IBUF )
          call puthic(  etiket(5:8)  , 'ETIK2', IBUF )
          call puthic(  etiket(9:12) , 'ETIK3', IBUF )
          call puthic(  etiket(13:16), 'ETIK4', IBUF )

 100      continue

      end if

***    CONSIDER CHARACTER VARIABLES FIRST ...

      L1 = C1(1:LEN( C1 ))
      L3 = C3(1:LEN( C3 ))

      IF (L1.NE.'-1' .AND. 
     +    L1.NE.'  ' )     READ( L1,'(A4)') IBUF(1)
      IF (L3.NE.'-1' .AND. 
     +    L3.NE.'  ' )     READ( L3,'(A4)') IBUF(3)

***    ... AND THEN INTEGER VARIABLES.

      IF (I2.NE.-1) IBUF(2) = I2 
      IF (I4.NE.-1) IBUF(4) = I4 
      IF (I5.NE.-1) IBUF(5) = I5 
      IF (I6.NE.-1) IBUF(6) = I6 
      IF (I7.NE.-1) IBUF(7) = I7 
      IF (I8.NE.-1) IBUF(8) = I8 
 
      RETURN
*-------------------------------------------------------------------- 

      END 
      SUBROUTINE prtlab2 (PREFIX,IBUF)

      use           convert_ip123_int, only : KIND_HOURS

      IMPLICIT      none

***    THIS ROUTINE WRITES OUT THE 8-WORD LABEL IN IBUF TO UNIT 6.

      CHARACTER*(*) PREFIX
      INTEGER       IBUF(8)

***    JUL 20/93 - S.PIGGOTT

***    Modified June 26/2007 - B.Dugas:
***      1) Rename to PRTLAB2 and add prefix argument
***      2) Use GET_IP1_STRING to decode IBUF(4) and print result
***      3) Add ENTRY PRTLAB for cases without prefix arguments

      INTEGER   I,J,J2,NPAS,err,IP3,RKIND, HIV,LOV, ikind
      CHARACTER(LEN=4)  :: NOM
      CHARACTER(LEN=6)  :: HICA,LOCA
      CHARACTER(LEN=12) :: SLEV,SLEV2
      CHARACTER(LEN=36) :: SDAT

      INTEGER(8) :: DATE_CONVERSION_FACTOR
      integer    :: YYYYMMDD,HHMMSSHH

      integer, external :: newdate,gethigh
      real,    external :: gethir

      INTEGER, SAVE :: LEN_PREFIX=0

*-------------------------------------------------------------------- 
      LEN_PREFIX = LEN( PREFIX )

      ENTRY prtlab (IBUF)

      Write(NOM,'(A4)') IBUF(3)

      If (NOM == '>>' .or. ! Do NOT print the labels of
     +    NOM == '^^' .or. ! these reference records !
     +    NOM == '^>' .or.
     +    NOM == '!!' .or.
     +    NOM == 'HY' ) RETURN

      call GET_DCF( DATE_CONVERSION_FACTOR )

***    DECODE IBUF(2).

      NPAS = GETHIGH('NPAS',IBUF )

      if (DATE_CONVERSION_FACTOR >= 0 .AND. 
     +   (IBUF(2) < 0 .OR.
     +   (IBUF(2) > 01 01 30 00 0 .AND. IBUF(2) /= NPAS)))     THEN

          err = newdate( IBUF(2), YYYYMMDD,HHMMSSHH, -3 )

          IF      (MOD( HHMMSSHH , 1 00 00 00 ) == 0)          THEN
              WRITE(SDAT,'(I10,I2.2)') YYYYMMDD,HHMMSSHH / 1 00 00 00
          ELSE IF (MOD( HHMMSSHH , 1 00 00 )    == 0)          THEN
              WRITE(SDAT,'(I10,I4.4)') YYYYMMDD,HHMMSSHH / 1 00 00
          ELSE IF (MOD( HHMMSSHH , 1 00 )       == 0)          THEN
              WRITE(SDAT,'(I10,I6.6)') YYYYMMDD,HHMMSSHH / 1 00
          ELSE
              WRITE(SDAT,'(I10,I8.8)') YYYYMMDD,HHMMSSHH
          END IF

      ELSE

          WRITE(SDAT,'(I10)') IBUF(2)
          IF (SDAT(1:1) /= ' ') SDAT = ' '//SDAT

      ENDIF

      rkind = GETHIGH( 'RKIND',IBUF )

***    DECODE IBUF(4).

      CALL GET_IP1_STRING( IBUF(4),SLEV )

***    REMOVE UNITS STRING FROM SLEV.

      DO  J=LEN_TRIM( SLEV ),1,-1
          IF (SLEV(J:J) == ' ') EXIT
      END DO

      IF (J == 0) J = LEN_TRIM( SLEV )

      IF (rkind /= -1)                                         THEN
          IF (rkind == KIND_HOURS)                             THEN
              HIV = NINT( GETHIR( 'HIVAL',IBUF ) )
              LOV = NINT( GETHIR( 'LOVAL',IBUF ) )
              IF (LOV < 1000000. .AND. HIV < 1000000.)         THEN
                  WRITE(LOCA,'(I6)') LOV
                  DO  J=1,LEN_TRIM( LOCA )
                      IF (LOCA(J:J) /= ' ') EXIT
                  END DO
                  SDAT = TRIM( SDAT ) // ' ('
     +                                // LOCA(J:LEN_TRIM( LOCA ))
                  WRITE(HICA,'(I6)') HIV
                  DO  J=1,LEN_TRIM( HICA )
                      IF (HICA(J:J) /= ' ') EXIT
                  END DO
                  SDAT = TRIM( SDAT ) // ' -> '
     +                                // HICA(J:LEN_TRIM( HICA ))
     +                                // ' H)'
              END IF
          ELSE
              IP3 = GETHIGH( 'IP3',IBUF )
              CALL GET_IP1_STRING( IP3,SLEV2 )
              IF (SLEV2 /= ' ')                                THEN
                  DO  J2=1,LEN_TRIM( SLEV2 )
                     IF (SLEV2(J2:J2) == ' ') EXIT
                  END DO
                  SLEV2 = SLEV2(J2:LEN_TRIM( SLEV2 ))
                  SLEV  = SLEV(1:J) // '-> ' // TRIM( SLEV2 )
              END IF
              J = LEN_TRIM( SLEV )
          END IF
      END IF

***    PRINT WITH APPROPRIATE FORMAT.

      IF (LEN_PREFIX > 0)                                      THEN
          WRITE(6,6000) PREFIX,IBUF(1),TRIM(SDAT),IBUF(3),
     +                         SLEV(1:J),(IBUF(I),I=5,8)
      ELSE
          WRITE(6,6001)        IBUF(1),TRIM(SDAT),IBUF(3),
     +                         SLEV(1:J),(IBUF(I),I=5,8)
      END IF

      LEN_PREFIX = 0

      RETURN
*-------------------------------------------------------------------- 

 6000 FORMAT(A,A4,A,1X,A4,1X,A,2I6,I10,I8)
 6001 FORMAT(3X,A4,A,1X,A4,1X,A,2I6,I10,I8)

      END 
      SUBROUTINE prtlab3 (CHAINE,IBUF)

      use           convert_ip123_int
      use           stats_signatures

      IMPLICIT      none

***    THIS ROUTINE WRITES OUT THE 8-WORD LABEL IN IBUF TO CHAINE.

      CHARACTER*(*) :: CHAINE
      INTEGER       :: IBUF(8)

***   SEPT 10/2009 - B.Dugas

      REAL    :: HIVAL,LOVAL
      LOGICAL :: lMeanVar,is_a_level
      INTEGER :: I,J, deet,npas, iKind, RKIND,HIV,LOV, status
      CHARACTER(LEN=2)  :: typvr
      CHARACTER(LEN=4)  :: NOM
      CHARACTER(LEN=6)  :: HICA,LOCA
      CHARACTER(LEN=15) :: SLEV1,SLEV2
      CHARACTER(LEN=36) :: SDAT,SLEV,nuls
      CHARACTER(LEN=100) :: ICHAINE

      integer        :: ip1,ip2,ip3
      type(FLOAT_IP) :: RP1,RP2,RP3

      real,    external :: GETHIR
      integer, external :: GETHIGH
      character(len=4),external  :: GETHIC

      LOGICAL              INFO
      COMMON     /ZZVERBO/ INFO

*-------------------------------------------------------------------- 
      Write(NOM,'(A4)') IBUF(3)

      If (NOM == '>>' .or. ! Do NOT print the labels of
     +    NOM == '^^' .or. ! these reference records !
     +    NOM == '^>' .or.
     +    NOM == '!!' .or.
     +    NOM == 'HY' ) RETURN

***    DECODE IBUF(2).

      typvr = GETHIC ('TYPVAR',IBUF )
      npas  = GETHIGH('NPAS'  ,IBUF )
      rkind = GETHIGH('RKIND' ,IBUF )

      is_a_level = is_level( rkind )

      ! Signature d'une operation temporelle ?
      lMeanVar = .false.
      if (typvr(2:2) == time_mean_signature .OR.
     +    typvr(2:2) == variance_signature .OR.
     +    typvr(2:2) == median_signature .OR.
     +    typvr(2:2) == stdev_signature .OR.
     +    typvr(2:2) == timmax_signature .OR.
     +    typvr(2:2) == timmin_signature ) lMeanVar = .true.

      CALL PDATE2( SDAT,IBUF(2),npas )

***    DECODE IBUF(4).

      CALL GET_IP1_STRING( IBUF(4),SLEV1 ) ; SLEV = SLEV1
      
      IF (rkind /= -1)                                         THEN

          IF (is_a_level)                                      THEN
              ! Vertical level pair
              IP1  = IBUF(4)
              IP2  = GETHIGH('IP2',IBUF )
              IP3  = GETHIGH('IP3',IBUF )
              status = decode_ip( RP1,RP2,RP3,ip1,ip2,ip3 )
              if (status == CONVERT_ERROR)                     THEN
                  if (info) write(6,6001) status,ip1,ip2,ip3
                  call xit(' Prtlab3',-1 )
              end if
              if (RP3%kind == KIND_SAMPLES)                    THEN
                  CALL GET_IP1_STRING( IP2,SLEV2 )
              ELSE
                  CALL GET_IP1_STRING( IP3,SLEV2 )
              END IF
              IF (SLEV2 /= ' ')                                THEN
                  ! Remove leading blanks
                  DO  J=1,LEN_TRIM( SLEV2 )
                      IF (SLEV2(J:J) /= ' ') EXIT
                  END DO
                  SLEV2 = SLEV2(J:LEN_TRIM( SLEV2 ))
                  DO  J=LEN_TRIM( SLEV1 ),1,-1
                      ! Remove trailing units
                      IF (SLEV1(J:J) == ' ') EXIT
                  END DO
                  IF (J == 0) J = LEN_TRIM( SLEV1 )
                  SLEV = SLEV1(1:J) // '-> ' // TRIM( SLEV2 )
              ELSE
                  SLEV = SLEV1
              END IF
          ELSE IF (rkind == KIND_HOURS .and. .not.lMeanVar)    THEN
              ! Time pair
              HIV = NINT( GETHIR( 'HIVAL',IBUF ) )
              LOV = NINT( GETHIR( 'LOVAL',IBUF ) )
              IF (LOV /= HIV     .AND.
     +            LOV < 1000000. .AND.
     +            HIV < 1000000.)                              THEN
                  WRITE(LOCA,'(I6)') LOV
                  DO  J=1,LEN_TRIM( LOCA )
                      IF (LOCA(J:J) /= ' ') EXIT
                  END DO
                  SDAT = TRIM( SDAT ) // ' ('
     +                                // LOCA(J:LEN_TRIM( LOCA ))
                  WRITE(HICA,'(I6)') HIV
                  DO  J=1,LEN_TRIM( HICA )
                      IF (HICA(J:J) /= ' ') EXIT
                  END DO
                  SDAT = TRIM( SDAT ) // ' -> '
     +                                // HICA(J:LEN_TRIM( HICA ))
     +                                // ' H)'
              END IF
          END IF
      END IF

      IF (lMeanVar)                                            THEN

          ! Time mean or variance. Check for validity interval.

          npas = GETHIGH('NPAS',IBUF )
          deet = GETHIGH('DEET',IBUF )

          IF (.not.is_a_level)                                 THEN
              IP2  = GETHIGH('IP2' ,IBUF )
              IF (IP2*720_8 == NINT( DEET*DBLE( NPAS )/5,8 ))  THEN
                  HIVAL  = IP2 ; iKind = KIND_HOURS
              ELSE
                  call diag_convip_plus(ip2,HIVAL,iKind,-2,nuls,.false.)
              END IF
              IF (iKind == KIND_HOURS)                         THEN
                  LOVAL = HIVAL - NINT( npas*DBLE( deet )/5 )/720.0_8
              ELSE
                  LOVAL = 0
              END IF
          ELSE
              HIVAL = NINT( npas*DBLE( deet )/5 )/720.0_8
              LOVAL = 0
          END IF

          HIV = NINT( HIVAL )
          LOV = NINT( LOVAL )

          IF (LOV /= HIV     .AND.
     +        LOV < 1000000. .AND.
     +        HIV < 1000000.)                                  THEN
              WRITE(LOCA,'(I6)') LOV
              DO  J=1,LEN_TRIM( LOCA )
                  IF (LOCA(J:J) /= ' ') EXIT
              END DO
              SDAT = TRIM( SDAT ) // ' ('
     +                            // LOCA(J:LEN_TRIM( LOCA ))
              WRITE(HICA,'(I6)') HIV
              DO  J=1,LEN_TRIM( HICA )
                  IF (HICA(J:J) /= ' ') EXIT
              END DO
              SDAT = TRIM( SDAT ) // ' -> '
     +                            // HICA(J:LEN_TRIM( HICA ))
     +                            // ' H)'
          END IF

      END IF

***    PRINT TO ICHAINE WITH APPROPRIATE FORMAT.

      WRITE(ICHAINE,6000) 
     +    IBUF(1),TRIM(SDAT),IBUF(3),TRIM(SLEV),(IBUF(I),I=5,8)

      CHAINE = ICHAINE

      RETURN
*-------------------------------------------------------------------- 

 6000 FORMAT(2X,A4,A,1X,A4,1X,A,2I6,I10,I8)
 6001 format(/'   Erreur=',I3,' dans DECODE_ip, IP1,IP2,IP3=',3I11/) 

      END 
      SUBROUTINE PDATE2( CHAINE,STAMP,NPAS )

      IMPLICIT      none

***    THIS ROUTINE DECODES THE CMC DATE_TIME-STAMP TO CHARACTER FORMAT

      CHARACTER*(*) CHAINE
      INTEGER  :: STAMP,NPAS

***   SEPT 12/2009 - B.Dugas

      CHARACTER(LEN=18) :: SDAT
      CHARACTER(LEN=6)  :: BL6=' '
      CHARACTER(LEN=4)  :: BL4=' '
      CHARACTER(LEN=2)  :: BL2=' '

      INTEGER(8) DATE_CONVERSION_FACTOR
      integer :: YYYYMMDD,HHMMSSHH,err
      integer, save :: NPAS0=-1,maxlen=-1

      integer, external :: newdate

      logical              info,debug
      common     /zzverbo/ info
      common     /zzdebug/      debug

*-------------------------------------------------------------------- 
      NPAS0 = NPAS

      ENTRY PDATE( CHAINE,STAMP )

***    DECODE STAMP.

      SDAT = ' '

      call GET_DCF( DATE_CONVERSION_FACTOR )

      if (DATE_CONVERSION_FACTOR >= 0 .AND. 
     +   (STAMP < 0 .OR.
     +   (STAMP > 01 01 30 00 0 .AND. STAMP /= NPAS0)))        THEN

          err = newdate( STAMP, YYYYMMDD,HHMMSSHH, -3 )

          IF      (err /= 0)                                   THEN
              WRITE(SDAT,'(I12)') STAMP
CCC           CALL leadblk( SDAT )
          ELSE IF (MOD( HHMMSSHH , 1 00 00 00 ) == 0)          THEN
              WRITE(SDAT,'(I10,I2.2)') YYYYMMDD,HHMMSSHH / 1 00 00 00
              maxlen = max( 12,maxlen )
              IF      (maxlen == 18)                           THEN
                  SDAT = BL6 // SDAT
              ELSE IF (maxlen == 16)                           THEN
                  SDAT = BL4 // SDAT
              ELSE IF (maxlen == 14)                           THEN
                  SDAT = BL2 // SDAT
              END IF
          ELSE IF (MOD( HHMMSSHH , 1 00 00 )    == 0)          THEN
              WRITE(SDAT,'(I10,I4.4)') YYYYMMDD,HHMMSSHH / 1 00 00
              maxlen = max( 14,maxlen )
              IF      (maxlen == 18)                           THEN
                  SDAT = BL4 // SDAT
              ELSE IF (maxlen == 16)                           THEN
                  SDAT = BL2 // SDAT
              END IF
          ELSE IF (MOD( HHMMSSHH , 1 00 )       == 0)          THEN
              WRITE(SDAT,'(I10,I6.6)') YYYYMMDD,HHMMSSHH / 1 00
              maxlen = max( 16,maxlen )
              IF      (maxlen == 18)                           THEN
                  SDAT = BL2 // SDAT
              END IF
          ELSE
              WRITE(SDAT,'(I10,I8.8)') YYYYMMDD,HHMMSSHH
              maxlen = max( 18,maxlen )
          END IF

          if (debug) write(6,6100) err,STAMP,
     +        YYYYMMDD,HHMMSSHH,DATE_CONVERSION_FACTOR,TRIM( SDAT )

      ELSE

          WRITE(SDAT,'(I10)') STAMP
          IF (SDAT(1:1) /= ' ') SDAT = ' '//SDAT

          if (debug) write(6,6110) STAMP,
     +        DATE_CONVERSION_FACTOR,TRIM( SDAT )

      ENDIF

      CHAINE = SDAT ; NPAS0 = -1

      RETURN
*-------------------------------------------------------------------- 

 6100 Format('*DEBUG:PDATE Err,Stamp,P1,P2,DCF,SDAT= ',5I13,1X,A)
 6110 Format('*DEBUG:PDATE Stamp,DCF,SDAT= ',2I13,1X,A)

      END
