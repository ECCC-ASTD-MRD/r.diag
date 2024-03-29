
      INTEGER*8 FUNCTION NEWTIM (ITIME,DTM,OK)

      IMPLICIT none

      LOGICAL   OK
      INTEGER   DTM
      INTEGER*8 ITIME

!**    AUTHOR: F. ZWIERS -- DEC 27/84

!**    Modifications...
!**    Dugas B. January 18, 2018 : Add the DTM=4 option

!**   
!**    PURPOSE -- TO CONVERT ONE OF FIVE TIME FORMATS INTO COUNT TYPE UNITS.
!**   
!**    IF DTM=0 THEN TIME IS IN COUNT UNITS SO RETURN
!**    IF DTM=1 THEN TIME IS IN FORMAT YYMMDDHH. TIME IS CONVERTED TO HOURS.
!**    IF DTM=2 THEN TIME IS IN FORMAT YYMMDDHHmm. TIME IS CONVERTED TO
!**             MINUTES.
!**    IF DTM=3 THEN TIME IS IN FORMAT YYMMDDHH. TIME IS CONVERTED TO
!**             HOURS AND LEAP YEARS ARE TAKEN INTO ACCOUNT.
!**    IF DTM=4 THEN TIME IS IN FORMAT YYMMDDHHmm. TIME IS CONVERTED TO
!**             MINUTES AND LEAP YEARS ARE ALSO TAKEN INTO ACCOUNT.
!**
!**    YEARS ARE COUNTED AS YEARS SINCE 00 AD.
!**   
!**    CONSISTENCY CHECKING IS PERFORMED AND OK IS RETURNED FALSE IF
!**    AN INCONSISTENCY IS DETECTED.

      LOGICAL   OBS
      INTEGER*8 TIME
      INTEGER   YY,MM,DD,HH,MIN,JDAYS(12),JD

      INTEGER*8 :: ANNE=365,JOUR=24,HEUR=60

      EXTERNAL CHECKT,JDATEC

      DATA     JDAYS / 0,31,59,90,120,151,181,212,243,273,304,334 /
!-------------------------------------------------------------------------

      OBS    =.FALSE.
      MIN    = 0
      TIME   = ITIME
      NEWTIM =-999999999

      IF (DTM.EQ.0)                                            THEN

!**    IF DTM=0 THEN TIME IS IN COUNT UNITS.

          NEWTIM = TIME
          OK     =.TRUE.

      ELSE IF (DTM.EQ.1)                                       THEN

!**    IF DTM=1 THEN TIME IS IN FORMAT YYYYMMDDHH. 
!**                  TIME IS CONVERTED TO HOURS.

          YY   = TIME/1000000
          TIME = TIME-YY*1000000
          MM   = TIME/10000
          TIME = TIME-MM*10000
          DD   = TIME/100
          HH   = TIME-DD*100

          CALL CHECKT( ITIME, YY,MM,DD,HH,MIN,OBS, OK )

          IF (OK) NEWTIM = HH + (DD - 1 + JDAYS(MM) + YY*ANNE)*JOUR

      ELSE IF (DTM.EQ.2)                                       THEN

!**    IF DTM=2 THEN TIME IS IN FORMAT YYMMDDHHMM. 
!**                  TIME IS CONVERTED TO MINUTES.

          YY   = TIME/100000000
          TIME = TIME-YY*100000000
          MM   = TIME/1000000
          TIME = TIME-MM*1000000
          DD   = TIME/10000
          TIME = TIME-DD*10000
          HH   = TIME/100
          MIN  = TIME-HH*100

          CALL CHECKT( ITIME, YY,MM,DD,HH,MIN,OBS, OK )

          IF(OK)                                               THEN
             NEWTIM = MIN + 
     +             (HH + (DD - 1 + JDAYS(MM) + YY*ANNE)*JOUR)*HEUR
          END IF

      ELSE IF (DTM.EQ.3)                                       THEN

!**    IF DTM=3 THEN TIME IS IN FORMAT YYYYMMDDHH. TIME IS CONVERTED
!**                  TO HOURS AND LEAP YEARS ARE TAKEN INTO ACCOUNT.
!**                  YEARS ARE COUNTED AS YEARS SINCE 00 AD.

          OBS  =.TRUE.
          YY   = TIME/1000000
          TIME = TIME-YY*1000000
          MM   = TIME/10000
          TIME = TIME-MM*10000
          DD   = TIME/100
          HH   = TIME-DD*100

          CALL CHECKT( ITIME, YY,MM,DD,HH,MIN,OBS, OK )

          IF (OK)                                              THEN
              CALL JDATEC( JD,YY,MM,DD )
              NEWTIM = HH + JD*JOUR
          END IF

      ELSE IF (DTM.EQ.4)                                       THEN

!**    IF DTM=4 THEN TIME IS IN FORMAT YYYYMMDDHHmm. TIME IS CONVERTED
!**                  TO MINUTES AND LEAP YEARS ARE TAKEN INTO ACCOUNT.
!**                  YEARS ARE COUNTED AS YEARS SINCE 00 AD.

          OBS  =.TRUE.
          YY   = TIME/100000000
          TIME = TIME-YY*100000000
          MM   = TIME/1000000
          TIME = TIME-MM*1000000
          DD   = TIME/10000
          TIME = TIME-DD*10000
          HH   = TIME/100
          MIN  = TIME-HH*100

          CALL CHECKT( ITIME, YY,MM,DD,HH,MIN,OBS, OK )

          IF (OK)                                              THEN
              CALL JDATEC( JD,YY,MM,DD )
              NEWTIM = ( ( HH + JD * JOUR ) * HEUR ) + MIN
          END IF

      ELSE

          OK=.FALSE.

      END IF

      RETURN
*--------------------------------------------------------------------------

      END

      INTEGER*8 FUNCTION ADDTIM( TIME,ADD, DTM )

      IMPLICIT none

      INTEGER*8 TIME,ADD
      INTEGER   DTM

!**    AUTHOR: B.DUGAS -- AUG 10/94

!**    ADD TIME UNITS OF TYPE DTM TO TIME.
!**    DTM IS ITSELF CONSISTENT WITH FUNCTION NEWTIM.

      LOGICAL   OK
      INTEGER*8 :: HH,NT,NY,HEUR=60,JOUR=24,CENT=100
      INTEGER   DD,JD,MM,MIN,YY,I,JDAYS(0:12)

      INTEGER*8,EXTERNAL :: NEWTIM
      EXTERNAL  DATEC

      DATA     JDAYS / 0,31,59,90,120,151,181,212,243,273,304,334,365 /
!--------------------------------------------------------------------------
      ADDTIM = -999999999

      IF (DTM.EQ.0)                                            THEN

          ADDTIM = TIME+ADD

      ELSE

***        CONVERT TIME TO DTM UNITS.

          NT = NEWTIM( TIME,DTM,OK )

          IF (OK)                                              THEN

              NT = NT+ADD

!**            CODE NT ACCORDING TO DTM.

              IF (DTM == 1 .OR. DTM == 3)                      THEN
                  HH = NT
              ELSE IF (DTM == 2 .OR. DTM == 4)                 THEN
                  MIN = MOD( NT,HEUR )
                  HH = NT/HEUR
              END IF

              DD = HH/JOUR +1
              HH = MOD( HH,JOUR )

              IF (.NOT.(DTM == 3 .OR. DTM == 4))               THEN

                 YY = (DD-1)/365
                 DD = MOD( DD-1,365 )+1

                 DO  I=1,12
                     IF (DD.LE.JDAYS(I))                       THEN
                         MM = I
                         DD = DD-JDAYS(MM-1)
                         GOTO 100
                     END IF
                 END DO

              ELSE

                 JD = DD-1
                 CALL DATEC( JD, YY,MM,DD )

              END IF

  100         ADDTIM = ((YY*CENT+MM)*CENT+DD)*CENT+HH
              IF (DTM == 2 .OR. DTM == 4) ADDTIM = ADDTIM*CENT+MIN
                 
          END IF

      END IF

      RETURN
!--------------------------------------------------------------------------

      END

      INTEGER*8 FUNCTION DIFDTM( T2,T1, DTM,OK )

      IMPLICIT none

      LOGICAL   OK
      INTEGER*8 T1,T2
      INTEGER   DTM

!**    AUTHOR: B.DUGAS -- JAN 24/18

!**    DIFFERENCE BETWEEN T2 AND T1 TIME UNITS OF TYPE DTM TO TIME.
!**    DTM IS ITSELF CONSISTENT WITH FUNCTION NEWTIM.

      LOGICAL   OK1,OK2
      INTEGER*8 :: NT1,NT2

      INTEGER*8,EXTERNAL :: NEWTIM

!--------------------------------------------------------------------------
      DIFDTM = -999999999 ; OK = .FALSE.

      IF (DTM.EQ.0)                                            THEN

          DIFDTM = T2-T1 ; OK = .TRUE.

      ELSE

***        CONVERT T2 AND T1 TO DTM UNITS.

          NT1 = NEWTIM( T1,DTM,OK1 )
          NT2 = NEWTIM( T2,DTM,OK2 )

          IF (OK1 .AND. OK2)                                   THEN
              DIFDTM = NT2-NT1 ; OK = .TRUE.
          END IF

      END IF

      RETURN
!--------------------------------------------------------------------------

      END

      SUBROUTINE CHECKT (TIME,YY,MM,DD,HH,MIN,OBS,OK)

      IMPLICIT none

      INTEGER*8 TIME
      LOGICAL   OBS,OK
      INTEGER   YY,MM,DD,HH,MIN

!**    AUTHOR: F. ZWIERS  --  DEC 27/84

!**    DO CONSISTENCY CHECKING ON A TIME GIVEN IN FORMAT YY,DD,MM,HH,MIN.
!**    OK IS RETURNED .TRUE. OR .FALSE. DEPENDING UPON WHETHER OR NOT ALL
!**    VALUES FOUND TO BE CONSISTENT.

!**    TIME IS THE PACKED VERSION OF YY,MM,DD,HH,MIN
!**    THE YY RANGE IS [1900,2146]. THE OBS LOGICAL
!**    PARAMETER CONTROLS THE CALCULATION OF
!**    POSSIBLE LEAP YEARS.

      INTEGER  LMONTH(12),YLOW,YHIGH

      DATA     LMONTH / 31,28,31,30,31,30,31,31,30,31,30,31 /
!---------------------------------------------------------------------------

      IF (OBS)                                                 THEN

          IF (MOD( YY,   4 ) .EQ. 0 .AND. 
     +        (MOD( YY, 100 ) .NE. 0 .OR.  
     +         MOD( YY, 400 ) .EQ. 0 ) )                       THEN
              LMONTH(2) = 29
          ELSE
              LMONTH(2) = 28
          END IF

      ELSE

         LMONTH(2) = 28

      END IF

      YLOW  = 1900
      YHIGH = 2146

      IF ( (YY .LT.YLOW .OR. YY .GT.  YHIGH   ) .OR. 
     +      (MM .LT. 1   .OR. MM .GT.   12     ) .OR. 
     +      (DD .LT. 1   .OR. DD .GT.LMONTH(MM)) .OR. 
     +      (HH .LT. 0   .OR. HH .GT.   23     ) .OR. 
     +      (MIN.LT. 0   .OR. MIN.GT.   59     ) )              THEN

          OK =.FALSE.
          WRITE(6,6010) TIME

      ELSE

          OK = .TRUE.

      END IF

      RETURN
!--------------------------------------------------------------------------
 6010 FORMAT('0********** TIME ',I16,' HAS CONSTITUENTS OUT OF RANGE.')

      END
