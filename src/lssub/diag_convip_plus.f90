
! successeur de convip

SUBROUTINE Diag_CONVIP_plus( ip, p, ikind, mode, string, flagv )
  ! use diag_convert_ip123, only : diag_is_invalid_kind
  implicit none
  integer, intent(INOUT) :: ip, ikind
  integer, intent(IN) :: mode
  real, intent(INOUT) :: p
  character *(*), intent(OUT) :: string 
  logical, intent(IN) :: flagv
  
  call CONVIP_plus( ip, p, ikind, mode, string, flagv )

  if (mode /= -2 .and. .not. (ikind == 3 .and. ip == 32767) .and. &
     (ikind <= 6 .or. ikind == 21)) call setkindi(ikind)

   return
end SUBROUTINE Diag_CONVIP_plus

SUBROUTINE ENCODE_RANGE( HIVAL,LOVAL,KIND, IBUF )

! Converts the (HIVAL,LOVAL,KIND) range into the appropriate (IP1,IP2,IP3)
! values following the the KIND value and puts the results into the HIGHBUF
! section of the IBUF information vector.

! Author: B. Dugas, August 2016

   use convert_ip123_int

   implicit none

   INTEGER, PARAMETER :: HEAD = taille_entete

   ! Arguments declarations

   integer, INTENT(IN)  :: KIND
   real,    INTENT(IN)  :: HIVAL,LOVAL
   integer, INTENT(OUT) :: IBUF(*)

   ! Local variables declarations

   integer  stat, ip1,ip2,ip3, k1,k2,k3, lkind
   real     v1,v2,v3

   if (KIND > 999) then
       lkind = KIND/1000
   else
       lkind = KIND
   end if

   if (lkind == KIND_HOURS) then

      ! TIME range, uses IP2,IP3. V1 set to 0.0
       v1 = 0.0   ; k1 = KIND_PRESSURE
       V2 = HIVAL ; k2 = lkind
       v3 = LOVAL ; k3 = lkind
       stat = encode_ip( ip1,ip2,ip3, v1,k1, v2,k2, v3,k3 )

      ! Case: Old style IP1 and new style IP2.
      !       As we are interested in the IP2,IP3 pair
      ! ==>   Change the output status to OK
      if (ip2 >= 32768 .and. stat == CONVERT_GOOD_GUESS) &
          stat = CONVERT_OK 

      if (stat == CONVERT_ERROR) then
         write(6,'("ENCODE error = ",I3)') stat
         call xit('ENCODE_RANGE',-1 )
      end if

      ! Transfer IP2,IP3 to IBUF. IP1 is not set.
      call puthigh( ip2,'IP2',IBUF )
      call puthigh( ip3,'IP3',IBUF )
      
   else

      ! VERTICAL range, uses IP1,IP3. V2 set to 0.0
      v1 = HIVAL ; k1 = lkind
      v2 = 0.0   ; k2 = KIND_HOURS
      v3 = LOVAL ; k3 = lkind
      stat = encode_ip( ip1,ip2,ip3, v1,k1, v2,k2, v3,k3 )

      ! Case: New style IP1 and old style IP2.
      !       As we are interested in the IP1,IP3 pair
      ! ==>   Change the output status to OK
      if (ip1 >= 32768 .and. stat == CONVERT_GOOD_GUESS) &
          stat = CONVERT_OK 

      if (stat == CONVERT_ERROR) then
         write(6,'("ENCODE error = ",I3)') stat
         call xit('ENCODE_RANGE',-2 )
      end if
      
      ! Transfer IP1,IP3 to IBUF. IP2 is not set.
      call puthigh( ip1,'IP1',IBUF )
      call puthigh( ip3,'IP3',IBUF )
      
   end if

return

end SUBROUTINE ENCODE_RANGE
SUBROUTINE DECODE_RANGE( IBUF, HIVAL,LOVAL,KIND )

! Converts the (IP1,IP2,IP3) values found in the HIGHBUF section of the
! IBUF information vector into the appropriate (HIVAL,LOVAL,KIND) range,
! if applicable. Otherwise, KIND=-1 on output.

! Author: B. Dugas, August 2016

   use convert_ip123_int

   implicit none

   INTEGER, PARAMETER :: HEAD = taille_entete

   ! Arguments declarations

   integer, INTENT(IN)  :: IBUF(*)
   integer, INTENT(OUT) :: KIND ! = -1 when no ranges are found
   real,    INTENT(OUT) :: HIVAL,LOVAL

   ! Local variables declarations

   integer  stat, ip1,ip2,ip3, k1,k2,k3
   type(FLOAT_IP) :: RP1,RP2,RP3
   integer, external :: gethigh

   ! Get IP1,IP2,IP3 from IBUF.
   ip1 = ibuf(4) ! au lieu de gethigh('IP1',IBUF )
   ip2 = gethigh('IP2',IBUF )
   ip3 = gethigh('IP3',IBUF )

   ! Decode/Check for ranges
   stat = decode_ip( RP1,RP2,RP3,ip1,ip2,ip3 )

   if (stat == CONVERT_ERROR) then
      write(6,'("DECODE error = ",I3)') stat
      call xit('DECODE_RANGE',-1 )
   end if

   k1 = RP1%kind ; k2 = RP2%kind

   if (stat == CONVERT_OK) then
      ! Time or level range ?
      if (RP1%hi /= RP1%lo) then ! level range found
         HIVAL = RP1%hi ; LOVAL = RP1%lo ; KIND = k1
      else if (RP2%hi /= RP2%lo) then ! time range found
         HIVAL = RP2%hi ; LOVAL = RP2%lo ; KIND = k2
      else ! No range found
         KIND = -1
      end if
   else
      KIND = -1
   end if

return

end SUBROUTINE DECODE_RANGE
