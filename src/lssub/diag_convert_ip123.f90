
module diag_convert_ip123

use ISO_C_BINDING
implicit none

! DESCRIPTION
!
!  set of generic IP123 conversion functions (IP123 from RPN standard files)
!  (ip1,ip2,ip3) triplet <-> 3 (real value,kind) pairs
!
!  the Fortran user will call the generic functions
!  - encode_ip   (real value,kind) pairs -> (ip1,ip2,ip3) triplet
!  - decode_ip   (ip1,ip2,ip3) triplet   -> (real value,kind) pairs
!  the kind of arguments will determine which specific conversion function will be used
!  (see description of specific functions)
!  encode_ip_0, encode_ip_1, encode_ip_2, encode_ip_3
!  decode_ip_0, decode_ip_1, decode_ip_2, decode_ip_3
!
! AUTHOR
!  M.Valin 2013, 2014
!
! MODIFICATIONS
!  B.Dugas, October 2016 : Stand-alone (more limited) version for use in
!                          R.DIAG based on the latest RMNLIB version
!  M.Valin, September 2017 : Patches for climate-mode IP2 values and 
!                          ensure that different "valid" configurations
!                          of IP1&3=0 can still generate a GOOD_GUESS
!  B.Dugas, October 2017 :- Rename all of the internal routines to diag_...
!                         - Account for the (legal) possibility that the
!                           IP1/2 pair contains a level range when IP3
!                           holds a coded sample
!  Dugas/Valin, Aug 2018 : - Corrections to is_level_int, ascending and descending
!                          - Ensure that KIND(2) is defined in diag_decode_ip_0
!
! EXAMPLES
!   use ISO_C_BINDING
!   implicit none
!   include 'convert_ip123.inc'
!   integer :: ip1, ip2, ip3, stat
!   integer, dimension(3) :: vip123
!   integer :: k1, k2, k3
!   integer, dimension(3) :: vk123
!   real    :: v1, v2, v3
!   real, dimension(3)    :: v123
!   type(FLOAT_IP) :: RP1,RP2,RP3
!   type(FLOAT_IP), dimension(3) :: VRP123
!
!   stat = diag_encode_ip(ip1,ip2,ip3,RP1,RP2,RP3)        ! ip <- multiple FLOAT_IP (diag_encode_ip_0)
!   stat = diag_encode_ip(vip123,VRP123)                  ! vector version of above (diag_encode_ip_1)
!   stat = diag_encode_ip(ip1,ip2,ip3,v1,k1,v2,k2,v3,k3)  ! everything explicit     (diag_encode_ip_2)
!   stat = diag_encode_ip(vip123,v123,vk123)              ! vector version of above (diag_encode_ip_3)
!
!   stat = diag_decode_ip(RP1,RP2,RP3,ip1,ip2,ip3)        ! ip -> multiple FLOAT_IP (diag_decode_ip_0)
!   stat = diag_decode_ip(VRP123,vip123)                  ! vector version of above (diag_decode_ip_1)
!   stat = diag_decode_ip(v1,k1,v2,k2,v3,k3,ip1,ip2,ip3)  ! everything explicit     (diag_decode_ip_2)
!   stat = diag_decode_ip(v123,vk123,vip123)              ! vector version of above (diag_decode_ip_3)
!
! NOTES
!  the FORTRAN user must include
!    use ISO_C_BINDING
!    include 'convert_ip123.inc'
!  in order to access this package
!
!  individual IP to real value + kind conversions are performed by function diag_convip_plus
!  real value to formatted string encoding is performed by function value_to_string
!******

public  :: diag_encode_ip, diag_decode_ip

private :: diag_encode_ip_0, diag_encode_ip_1, diag_decode_ip_0, diag_decode_ip_1
private :: diag_encode_ip_2, diag_encode_ip_3, diag_decode_ip_2, diag_decode_ip_3

! SYNOPSIS
! Also defined in "convert_ip123.inc"
!  as provided by rmnlib
  type, BIND(C)  :: FLOAT_IP
   real(C_FLOAT)  :: lo         ! low bound
   real(C_FLOAT)  :: hi         ! high bound
   integer(C_INT) :: kind       ! type code (see table below)
  end type
! TABLES
! kind     name              description                  range of values
!
!   0  KIND_ABOVE_SEA   height (m) above mean sea level (-20,000 -> 100,000)
!   1  KIND_SIGMA       sigma coordinates               (0.0 -> 1.0)
!   2  KIND_PRESSURE    pressure (mb)                   (0 -> 1100)
!   3  KIND_ARBITRARY   arbitrary number, no units      (-4.8e8 -> 1.0e10)
!   4  KIND_ABOVE_GND   height (m) above ground         (-20,000 -> 100,000)
!   5  KIND_HYBRID      hybrid coordinates              (0.0 -> 1.0)
!   6  KIND_THETA       theta coordinates               (1 -> 200,000)
!   7  KIND_BELOW_SEA   depth (m) below mean sea level  (0 -> 20,000)
!  10  KIND_HOURS       time (hours)                    (0.0 -> 1.0e10)
!  15  KIND_SAMPLES     samples (integer value)         (0 -> 1 999 999)
!  17  KIND_MTX_IND     conversion matrix x subscript)  (1.0 -> 1.0e10)
!                       (shared with kind=1 
!  21  KIND_M_PRES      pressure-meters                 (0 -> 1,000,000) fact=1E+4
!                       (shared with kind=5)
!
!   1  TO_IP
!  -1  TO_RP
!
! return FLAGS for encode/decode functions (more than one flag may be set)
!   0 CONVERT_OK     (no FLAG set)
!  14 CONVERT_GUESS  (= CONVERT_GOOD_GUESS || CONVERT_BAD_GUESS || CONVERT_TERRIBLE_GUESS)
!   2 CONVERT_GOOD_GUESS
!   4 CONVERT_BAD_GUESS
!   8 CONVERT_TERRIBLE_GUESS
!  32 CONVERT_WARNING
!  64 CONVERT_ERROR

! NOTES
!  the FORTRAN user must include
!    use ISO_C_BINDING
!    include 'convert_ip123.inc'
!  in order to use this derived type and the symbolic names for kind
!******

integer, public, parameter :: TO_IP=1
integer, public, parameter :: TO_RP=-1
integer, public, parameter :: CONVERT_OK=0
integer, public, parameter :: CONVERT_GUESS=14
integer, public, parameter :: CONVERT_GOOD_GUESS=2
integer, public, parameter :: CONVERT_BAD_GUESS=4
integer, public, parameter :: CONVERT_TERRIBLE_GUESS=8
integer, public, parameter :: CONVERT_WARNING=32
integer, public, parameter :: CONVERT_ERROR=64

integer, public, parameter :: KIND_ABOVE_SEA=0
integer, public, parameter :: KIND_SIGMA=1
integer, public, parameter :: KIND_PRESSURE=2
integer, public, parameter :: KIND_ARBITRARY=3
integer, public, parameter :: KIND_ABOVE_GND=4
integer, public, parameter :: KIND_HYBRID=5
integer, public, parameter :: KIND_THETA=6
integer, public, parameter :: KIND_BELOW_SEA=7
integer, public, parameter :: KIND_HOURS=10
integer, public, parameter :: KIND_SAMPLES=15
integer, public, parameter :: KIND_MTX_IND=17
integer, public, parameter :: KIND_M_PRES=21

interface diag_encode_ip
module procedure diag_encode_ip_0
module procedure diag_encode_ip_1
module procedure diag_encode_ip_2
module procedure diag_encode_ip_3
end interface

interface diag_decode_ip
module procedure diag_decode_ip_0
module procedure diag_decode_ip_1
module procedure diag_decode_ip_2
module procedure diag_decode_ip_3
end interface

integer, public, parameter :: Max_Kind=31

!  1 means coordinate of type kind is ascending ( larger value = higher in the atmosphere )
! -1 means coordinate of type kind is descending ( larger value = lower in the atmosphere )
!  0 means coordinate of type kind cannot be deemed ascending nor descending
! kind = 0, 4, 21 ascending ( meters above ground, meters above msl, galchen meters )
! kind = 1, 2     descending (pressure, sigma)
! kind = 3, 5, 6  neither (arbitrary, hybrid, theta)
! non level coordinates are considered as neutral

integer, private, save, dimension(0:Max_Kind) :: order = &
  (/  1, -1, -1,  0,  1,  0,  0, -1,  0,  0,  0,  0,  0,  0,  0,  0, &
      0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0  /)

integer, private, save, dimension(0:Max_Kind) :: islevel = &
  (/  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0, &
      0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0  /)

private :: swap, swapi, ascending, descending
public :: is_level_int, is_invalid_kind_int

contains
!=========================== start of private functions ========================================
!===============================================================================================
function is_level_int(kind) result(status)  ! is this kind a level ?
  implicit none
  logical :: status
  integer, intent(IN) :: kind
  status = .false.
  if(kind >= 0 .and. kind < Max_Kind) status = islevel(kind)==1
end function is_level_int
!===============================================================================================
function ascending(kind) result(status) ! is this kind "ascending" (larger value higher in atmosphere) ?
  implicit none
  logical :: status
  integer, intent(IN) :: kind
  status = .false.
  if(kind >= 0 .and. kind < Max_Kind) status = order(kind)==1
end function ascending
!===============================================================================================
function descending(kind) result(status) ! is this kind "descending" (larger value lower in atmosphere) ?
  implicit none
  logical :: status
  integer, intent(IN) :: kind
  status = .false.
  if(kind >= 0 .and. kind < Max_Kind) status = order(kind)==-1
end function descending
!===============================================================================================
function is_invalid_kind_int(kind) result(status) ! is this kind invalid ?
  implicit none
  logical :: status
  integer, intent(IN) :: kind
  status=.false.
  if(kind<0) status=.true.
  if(kind>Max_Kind .and. iand(kind,15)/=15) status=.true.
end function is_invalid_kind_int
!===============================================================================================
subroutine swapi(a,b)  ! swap a pair of integer values
  implicit none
  integer(C_INT), intent(INOUT) :: a,b
  integer(C_INT) :: t
  t = a ; a = b ; b = t
  return
end subroutine swapi
!===============================================================================================
subroutine swap(a,b)  ! swap a pair of real values
  implicit none
  real(C_FLOAT), intent(INOUT) :: a,b
  real(C_FLOAT) :: t
  t = a ; a = b ; b = t
  return
end subroutine swap
!============================= end of private functions ========================================
!===============================================================================================
!****f* rmnlib/encode_ip_0
! SUMMARY
! produce a valid (ip1,ip2,ip3) triplet from (real value,kind) pairs
! SYNOPSIS
 FUNCTION diag_encode_ip_0(IP1,IP2,IP3,RP1,RP2,RP3) RESULT(status) BIND (C,name='DiagEncodeIp')
! INPUTS
! RP1 must contain a level (or a pair of levels) in the atmosphere
! RP2 must contain  a time (or a pair of times)
! RP3 may contain anything, RP3%hi will be ignored (if RP1 or RP2 contains a pair, RP3 is ignored)
! OUTPUTS
! IP1,IP2,IP3 will contain the encoded values in case of success, and are undefined otherwise
! RESULT
! the function returns CONVERT_ERROR in case of error, CONVERT_OK otherwise
! NOTES
! - this function is C interoperable
! - reordering may happen if RP1 or RP2 contain a pair of values
! - levels: ip1 will be lower in atmosphere than ip2
! - times:  ip2 will be the end of the time range, ip3 will be the start of the time range
! - RP1 not a level or RP2 not a time will be flagged as an error
! - RP1 and RP2 both containing a range will be flagged as an error
! - in case of error, one or more of ip1,2,3 may be returned as -1
! the FORTRAN user must
!    use ISO_C_BINDING
!    include 'convert_ip123.inc'
! in order to access this function
  implicit none  ! coupled (rp1,rp2,rp3) to (ip1,ip2,ip3) conversion with type enforcement
! ARGUMENTS
  integer(C_INT) :: status
  integer(C_INT), intent(OUT) :: IP1,IP2,IP3
  type(FLOAT_IP), intent(IN)  :: RP1,RP2,RP3
!******

  real*4, dimension(3) :: P
  integer, dimension(3) ::kind
  character(len=1) :: dummy
  integer :: i

  status=CONVERT_ERROR
  i=0
  IP1=-1 ; IP2=-1 ; IP3=-1
  P = 0
  kind = -1
  if(is_invalid_kind_int(RP1%kind) .or. is_invalid_kind_int(RP2%kind)) return   ! OOPS, invalid kind for RP1 or RP2

  if( is_level_int(RP1%kind) ) then  !  RP1 is a valid level kind
    P(1)=RP1%lo ; kind(1)=RP1%kind ; i=i+1
    if (RP1%hi /= RP1%lo) then       ! RP1 is a range
      P(3)=RP1%hi ; kind(3)=RP1%kind ; i=i+1
      if(RP1%hi < RP1%lo .and. ascending(RP1%kind)) call swap(P(1),p(3))  ! keep lo, hi in atmospheric ascending order
      if(RP1%hi > RP1%lo .and. descending(RP1%kind)) call swap(P(1),p(3))  ! i.e. level lo lower in atmosphere than level hi
    endif
  else
    return  ! ERROR, RP1 must be a level
  endif
  
  if(i == 2 .and. RP2%kind == KIND_SAMPLES) then     ! SPECIAL case : 2 levels and number of samples
    P(2)    = P(3)  ;  kind(2) = kind(3)             ! move p3/kind3 to p2/kind2
    P(3)    = RP2%lo                                 ! nb of samples to p3
    kind(3) = KIND_SAMPLES
    i = 3
  endif

  if(RP2%kind == KIND_HOURS) then             !  RP2 is a valid time kind
    P(2)=RP2%lo ; kind(2)=RP2%kind ; i=i+1
    if (RP2%hi /= RP2%lo) then  ! time range
      P(3)=RP2%hi ; kind(3)=RP2%kind ; i=i+1
      if(RP2%hi > RP2%lo) call swap(P(2),P(3)) ! keep times in descending order p(2) > p(3) => ip2 > ip3
    endif
    if(i>3) return  ! OOPS, we have 2 ranges
  else
    if(RP2%kind /= KIND_SAMPLES) return  ! ERROR, RP2 must be a time (or a number of samples)
  endif
  
  if(i < 3) then   !  no range was found, RP3 comes into play
    if(is_invalid_kind_int(RP3%kind)) return ! OOPS, invalid kind for RP3
    P(3)=RP3%lo ; kind(3)=RP3%kind ; i=i+1
  endif
  
  call diag_convip_plus(IP1,P(1),kind(1),+2,dummy,.false.)  ! NEW style encoding not negotiable
  call diag_convip_plus(IP2,P(2),kind(2),+2,dummy,.false.)
  call diag_convip_plus(IP3,P(3),kind(3),+2,dummy,.false.)
  status=CONVERT_OK

  return
end function diag_encode_ip_0
!===============================================================================================
!****f* rmnlib/decode_ip_0
! SUMMARY
! produce valid (real value,kind) pairs from (ip1,ip2,ip3) triplet
! AUTHOR
!  M.Valin 2013
! SYNOPSIS
function diag_decode_ip_0(RP1,RP2,RP3,IP1V,IP2V,IP3V) result(status) BIND (C,name='DiagDecodeIp')
!
! INPUTS
!  ip1/2/3 should be encoded "new style" but old style encoding is accepted
! OUTPUTS
!  RP1 will contain a level (or a pair of levels in atmospheric ascending order) in the atmosphere
!  RP2 will contain a time (or a pair of times in ascending order)
!  RP3%hi will be the same as RP3%lo (if RP1 or RP2 contains a pair, RP3 is ignored)
! RESULT
!   CONVERT_ERROR          error, (ip1 not level, ip2 not time, etc...)
!   CONVERT_OK             everything is OK
!   CONVERT_GOOD_GUESS     old style ip1 and/or ip2 are present
!   CONVERT_BAD_GUESS      old style ip3, interpreted as time
!   CONVERT_TERRIBLE_GUESS old style ip3, interpreted as arbitrary code
!
! in case of error, RP1/2/3 are undefined (may contain anything)
! NOTES
! - this function is C interoperable
! - some reordering may take place when RP1 or RP2 contains a pair
! - levels: ip1 will be lower in atmosphere than ip2
! - times:  ip2 will be the end of the time range, ip3 will be the start of the time range
! - ip1 not a level or ip2 not a time will be flagged as an error
! - RP1 and RP2 both containing a range will be flagged as an error
! - in case of error, ip1,2,3 will be returned as -1
! the FORTRAN user must
!    use ISO_C_BINDING
!    include 'convert_ip123.inc'
! in order to access this function
  implicit none ! coupled (ip1,ip2,ip3) to (rp1,rp2,rp3) conversion with type enforcement
! ARGUMENTS
  integer(C_INT) :: status
  integer(C_INT), value, intent(IN)  :: IP1V,IP2V,IP3V
  type(FLOAT_IP), intent(OUT) :: RP1,RP2,RP3
!******

  real*4, dimension(3) :: P
  integer, dimension(3) ::kind
  character(len=1) :: dummy
  integer :: IP1, IP2, IP3

  IP1=IP1V ; IP2=IP2V ; IP3=IP3V
  status = CONVERT_OK
  if(ip1 < 0 .or. ip2 < 0 .or. ip3 < 0 ) goto 777

  call diag_convip_plus(IP1,P(1),kind(1),-2,dummy,.false.)  ! kind of ip1 should be a level
  if(.not. is_level_int(kind(1))) goto 777                   ! ip1 is not a level
  if(0 < IP1 .and. IP1 < 32768) status = ior(status , CONVERT_GOOD_GUESS)  ! reasonable guess if old style level > 0 (0 is considered NOT_A_GUESS)
  RP1%lo=P(1) ; RP1%hi=P(1) ; RP1%kind=kind(1)
  
  if(0 < IP3 .and. IP3 < 32768) then            ! IP3 is old style (0 is considered "new style")
    RP3%lo = IP3 ; RP3%hi = IP3
    if(IP3 <= 240) then                         ! time in hours ?
      RP3%kind = KIND_HOURS
      status = ior(status,CONVERT_BAD_GUESS)    ! unreliable guess
    else                                        ! arbitraty value ?
      RP3%kind = KIND_ARBITRARY
      status = ior(status,CONVERT_TERRIBLE_GUESS)  ! highly unreliable guess
    endif
    kind(3) = RP3%kind
  else
    call diag_convip_plus(IP3,P(3),kind(3),-2,dummy,.false.)  ! kind of ip3 may be anything new style
    if(kind(3)==-1) goto 777
    RP3%lo=P(3) ; RP3%hi=P(3) ; RP3%kind=kind(3)
  endif
  
  if(IP2 < 32768 .or. (IP3 == 0 .and. IP2 < 999999)) then   ! IP2 is old style, probably a time value
    RP2%lo = IP2 ; RP2%hi = IP2
    kind(2) = KIND_HOURS ; RP2%kind = kind(2)    ! time in hours ?
    status = ior(status , CONVERT_GOOD_GUESS)    ! reasonable guess
  else
    call diag_convip_plus(IP2,P(2),kind(2),-2,dummy,.false.)  ! kind of ip2 should be new style time
     if(kind(2) == KIND_HOURS) then
      RP2%lo=P(2) ; RP2%hi=P(2) ; RP2%kind=kind(2)
    else
      if(is_level_int(kind(2)) .and. kind(2) == kind(1) .and. kind(3) == KIND_SAMPLES) then
        RP1%hi=P(2)
        RP2%lo=P(3) ; RP2%hi=P(3) ; RP2%kind=kind(3)
        RP3%kind=-1
      else
        goto 777            ! ip2 not a time (or a level if ip3 is a nb of samples)
      endif
    endif 
  endif

  if(kind(3) == KIND_HOURS .and. kind(2) == kind(3)) then   ! time in ip2 and ip3
    RP2%hi=P(3)
    RP3%lo=0.0 ; RP3%hi=0.0 ; RP3%kind=-1
    if(RP2%hi < RP2%lo) call swap(RP2%lo,RP2%hi)
  elseif(kind(1) == kind(3) .and. IP1 > 0 .and. IP3 > 0) then ! levels in ip1 and ip3 (but not both zero)
    RP1%hi=P(3)
    RP3%lo=0.0 ; RP3%hi=0.0 ; RP3%kind=-1
    if(RP1%hi < RP1%lo .and. ascending(kind(3))) call swap(RP1%lo,RP1%hi)
    if(RP1%hi > RP1%lo .and. descending(kind(3))) call swap(RP1%lo,RP1%hi)
  elseif(kind(1) == kind(2) .and. IP1 > 0 .and. IP2 > 0) then ! levels in ip1 and ip2 (but not both zero)
    if(RP1%hi < RP1%lo .and. ascending(kind(2))) call swap(RP1%lo,RP1%hi)
    if(RP1%hi > RP1%lo .and. descending(kind(2))) call swap(RP1%lo,RP1%hi)
  endif

  if( .not. is_level_int(kind(1)) ) status=ior(status,CONVERT_ERROR)  ! ip1 must always be a level
  if( is_level_int(kind(2)) .and. kind(1) /= kind(2) .and. ip2 /= 0 ) status=ior(status,CONVERT_ERROR)  ! invalid level pair
  if( is_level_int(kind(3)) .and. kind(1) /= kind(3) .and. ip3 /= 0 ) status=ior(status,CONVERT_ERROR)  ! invalid level pair
  if(kind(2) /= KIND_HOURS) then                        ! ip2 should be a time (ip2 level, ip3 nb of samples is also OK)
    if(.not. (is_level_int(kind(2)) .and. kind(3) == KIND_SAMPLES)) status=ior(status,CONVERT_ERROR)
  endif

return

777 status=ior(status,CONVERT_ERROR)
  return
end function diag_decode_ip_0
!===============================================================================================
!****f* rmnlib/encode_ip_1
! SUMMARY
! vector version of diag_encode_ip_0
! AUTHOR
!  M.Valin 2013
! SYNOPSIS
function diag_encode_ip_1(IP,RP) result(status) BIND (C,name='DiagEncodeIp_v')
! NOTES
! (see diag_encode_ip_0) 
  implicit none  ! coupled (rp1,rp2,rp3) to (ip1,ip2,ip3) conversion with type enforcement
! ARGUMENTS
  integer(C_INT) :: status
  integer(C_INT), dimension(3), intent(OUT) :: IP
  type(FLOAT_IP), dimension(3), intent(IN)  :: RP
! RESULT
! same as diag_encode_ip_0
!******

  status=diag_encode_ip_0(IP(1),IP(2),IP(3),RP(1),RP(2),RP(3))

  return
end function diag_encode_ip_1
!===============================================================================================
!****f* rmnlib/decode_ip_1
! SUMMARY
! vector version of diag_decode_ip_0
! SYNOPSIS
function diag_decode_ip_1(RP,IP) result(status) BIND (C,name='DiagDecodeIp_v')
! NOTES
! (see diag_decode_ip_0) 
  implicit none ! coupled (ip1,ip2,ip3) to (rp1,rp2,rp3) conversion with type enforcement

! ARGUMENTS
  integer(C_INT) :: status
  integer(C_INT), dimension(3), intent(IN)  :: IP
  type(FLOAT_IP), dimension(3), intent(OUT) :: RP
! RESULT
! same as diag_decode_ip_0
!******

  status=diag_decode_ip_0(RP(1),RP(2),RP(3),IP(1),IP(2),IP(3))

return
end function diag_decode_ip_1
!===============================================================================================
!****f* rmnlib/encode_ip_2
! SUMMARY
! encode three (value,kind) pairs into three ip values
! AUTHOR
!  M.Valin 2013
! SYNOPSIS
function diag_encode_ip_2(IP1,IP2,IP3,P1,kkind1,P2,kkind2,P3,kkind3) result(status) BIND(C,name='DiagConvertPKtoIP')
! INPUTS
!  P1,kkind1 must be a level
!  P2,kkind2 should be a time but a level is accepted (and flagged as a WARNING, unless kkind3 is KIND_SAMPLES)
!  P3,kkind3 may be anything
! OUTPUTS
!  IP1,IP2,IP3 will contain the encoded values in case of success, and are undefined otherwise
! RESULT
!     CONVERT_OK           everything is OK
!     CONVERT_ERROR        error (kind1 not a level, kind2 not level or time)
!     CONVERT_WARNING      coding convention error, corrected
!
! NOTES
! - this function is C interoperable
! - tolerated coding deviations: kind2 a level instead of a time (will be pushed to position 3 and flagged as warning)
! - ip1/ip3 forced to the proper atmospheric ascending order coding (not flagged as warning)
! - ip2/ip3 forced to proper descending order (not flagged as warning)
! - in case of error, the contents of ip1/2/3 is undefined (possibly -1)
! the FORTRAN user must
!    use ISO_C_BINDING
!    include 'convert_ip123.inc'
! in order to access this function
implicit none  ! explicit, almost independent (rp,kind) to (ip) conversion

! ARGUMENTS
  integer(C_INT) :: status
  integer(C_INT),        intent(OUT) :: IP1,IP2,IP3
  real(C_FLOAT), value, intent(IN)   :: P1,P2,P3
  integer(C_INT), value, intent(IN)  :: kkind1,kkind2,kkind3
!******

  character(len=1) :: dummy
  integer(C_INT) :: kind1,kind2,kind3
  real(C_FLOAT)  :: RP1,RP2,RP3

  ip1 = -1       ; ip2 = -1       ; ip3 = -1
  RP1 = P1       ; RP2 = P2       ; RP3 = P3
  kind1 = kkind1 ; kind2 = kkind2 ; kind3 = kkind3

  status=CONVERT_OK
  if(is_invalid_kind_int(kind1) .or. is_invalid_kind_int(kind2) .or. is_invalid_kind_int(kind3)) goto 777

  if(.not. is_level_int(kind1)) goto 777 ! ip1 must be a level

  if(is_level_int(kind2)) then          ! ip2 should be a time, but a level is tolerated
     if(kind1 /= kind2) goto 777    ! invalid level pair
     if(kind3 /= KIND_SAMPLES) status=ior(status,CONVERT_WARNING) ! warning if ip2 is a level and ip3 not a nb of samples
  else
    if(kind2 /= KIND_HOURS) goto 777          ! ip2 must be a time if not a level
  endif

  call diag_convip_plus(IP1,RP1,kind1,+2,dummy,.false.)  ! NEW style encoding not negotiable
  call diag_convip_plus(IP2,RP2,kind2,+2,dummy,.false.)
  call diag_convip_plus(IP3,RP3,kind3,+2,dummy,.false.)

  if(kind1 == kind2 .and. kind3 == KIND_HOURS) then  ! level/level/time
    call swapi(ip2,ip3)  ! second level goes into ip3 and time value into ip2
    call swap(rp2,rp3)
    if(rp1>rp3 .and.  ascending(kind1)) call swapi(ip1,ip3)  ! ip1, ip3 in atmospheric ascending order
    if(rp1<rp3 .and. descending(kind1)) call swapi(ip1,ip3)
  elseif(kind1 == kind2 .and. kind3 == KIND_SAMPLES) then    ! level/level/samples
    if(rp1>rp2 .and.  ascending(kind1)) call swapi(ip1,ip2)  ! ip1, ip2 in atmospheric ascending order
    if(rp1<rp2 .and. descending(kind1)) call swapi(ip1,ip2)
  else
    if(kind2 == KIND_HOURS .and. kind3 == kind2 .and. rp2 < rp3) call swapi(ip2,ip3)  ! level/time/time, put times in descending order
  endif
  return

777 status=ior(status,CONVERT_ERROR)
  return
end function diag_encode_ip_2
!===============================================================================================
!****f* rmnlib/decode_ip_2
! SUMMARY
! decode ip1/2/3 into three (value,kind) pairs
! explicit, independent (ip) to (rp,kind) conversion
! AUTHOR
!  M.Valin 2013
! SYNOPSIS
function diag_decode_ip_2(RP1,kind1,RP2,kind2,RP3,kind3,IP1V,IP2V,IP3V) result(status) BIND(C,name='DiagConvertIPtoPK')
implicit none 

! ARGUMENTS
  integer(C_INT) :: status
  real(C_FLOAT),        intent(OUT)  :: RP1,RP2,RP3
  integer(C_INT),        intent(OUT) :: kind1,kind2,kind3
  integer(C_INT), value, intent(IN)  :: IP1V,IP2V,IP3V
! INPUTS
!  IP1V,IP2V,IP3V IP values to be decoded
! OUTPUTS
!  RP1,kind1  result of IP1V decoding
!  RP2,kind2  result of IP2V decoding
!  RP3,kind3  result of IP3V decoding
! RESULT
!   CONVERT_OK           everything is OK
!   CONVERT_ERROR        error (bad kind, ip1 not a level, etc ....)
!   CONVERT_WARNING      coding convention violations
!   CONVERT_GOOD_GUESS   old style ip1 and/or ip2 are present
!   CONVERT_BAD_GUESS    old style ip3, interpreted as time
!   CONVERT_TERRIBLE_GUESS old style ip3, interpreted as arbitrary code
! NOTES
! - this function is C interoperable
! - in case of error, (value,kind) pairs are undefined (may contain anything)
! the FORTRAN user must
!    use ISO_C_BINDING
!    include 'convert_ip123.inc'
! in order to access this function
!******

  character(len=1) :: dummy
  integer :: IP1, IP2, IP3

  IP1=IP1V ; IP2=IP2V ; IP3 = IP3V
  status=CONVERT_OK
  if(ip1 < 0 .or. ip2 < 0 .or. ip3 < 0 ) goto 777

  call diag_convip_plus(IP1,RP1,kind1,-2,dummy,.false.)   ! IP1 old style translation should be a safe bet
  if(kind1 == KIND_HOURS) then ! try to swap with ip2 if ip1 is time
    call swapi(ip1,ip2)
    call diag_convip_plus(IP1,RP1,kind1,-2,dummy,.false.)
    status = ior(status,CONVERT_WARNING)
  endif
  if(is_invalid_kind_int(kind1)) goto 777  ! bad kind
  if(0 < IP1 .and. IP1 < 32768) status = ior(status,CONVERT_GOOD_GUESS)
  if( .not. is_level_int(kind1)) goto 777      ! ip1 must be a level

  if(0 < IP3 .and. IP3 < 32768) then            ! IP3 is old style, (0 considered "new style")
    RP3 = IP3
    if(IP3 <= 240) then                         ! time in hours ?
      kind3 = KIND_HOURS 
      status = ior(status,CONVERT_BAD_GUESS)    ! unreliable guess
    else                                        ! arbitraty value ?
      kind3 = 3
      status = ior(status,CONVERT_TERRIBLE_GUESS) ! highly unreliable guess
    endif
  else
    call diag_convip_plus(IP3,RP3,kind3,-2,dummy,.false.)
    if(is_invalid_kind_int(kind3)) goto 777  ! bad kind
  endif

  if(IP2 < 32768 .or. (ip3 == 0 .and. IP2 < 999999)) then  ! IP2 is old style, probably a time value
    RP2 = IP2
    kind2 = KIND_HOURS                          ! time in hours ?
    status = ior(status,CONVERT_GOOD_GUESS)     ! reasonable guess
  else
    call diag_convip_plus(IP2,RP2,kind2,-2,dummy,.false.)
    if(is_invalid_kind_int(kind2)) goto 777  ! bad kind
    if(kind2 /= KIND_HOURS) then
      if(is_level_int(kind2)) then
         if (kind3 /= KIND_SAMPLES) status = ior(status,CONVERT_WARNING)  ! ip2 is supposed to be a TIME, a level is tolerated
      else
        goto 777  ! neither time nor level
      endif
    endif
  endif

  if(kind1 == kind2 .and. kind3 == KIND_HOURS) then   ! level/level/time in ip1/ip2/ip3
    call swap(RP2,RP3)       ! level/time/level
    call swapi(kind2,kind3)
  endif
  if(kind1 == kind3 .and. IP1 > 0 .and. IP3 > 0) then   ! level range
    if(ascending(kind1)  .and. RP1>RP3) call swap(RP1,RP3)   ! force increasing values
    if(descending(kind1) .and. RP1<RP3) call swap(RP1,RP3)   ! force decreasing values
  endif
  if(kind2 == kind3 .and. kind2 == KIND_HOURS) then   ! time range
    if(RP2 < RP3) call swap(RP2,RP3)    ! force decreasing time values
  endif

  return

777 status=ior(status,CONVERT_ERROR)
  return
end function diag_decode_ip_2
!===============================================================================================
!****f* rmnlib/encode_ip_3
! SUMMARY
! vector version of diag_encode_ip_2 (Diag_ConvertPKtoIP)
! AUTHOR
!  M.Valin 2013
! SYNOPSIS
function diag_encode_ip_3(IP,RP,kind) result(status) BIND(C,name='DiagConvertPKtoIP_v')
! RESULT
! same as diag_encode_ip_2
! NOTES
! see diag_encode_ip_2
implicit none  ! explicit, independent (rp,kind) to (ip) conversion

! ARGUMENTS
  integer(C_INT) :: status
  integer(C_INT), dimension(3), intent(OUT) :: IP
  real(C_FLOAT), dimension(3), intent(IN)   :: RP
  integer(C_INT), dimension(3), intent(IN)  :: kind
!******

  status=diag_encode_ip_2(IP(1),IP(2),IP(3),RP(1),kind(1),RP(2),kind(2),RP(3),kind(3))

return
end function diag_encode_ip_3
!===============================================================================================
!****f* rmnlib/decode_ip_3
! SUMMARY
!vector version of diag_decode_ip_2
! SYNOPSIS
function diag_decode_ip_3(RP,kind,IP) result(status) BIND(C,name='DiagConvertIPtoPK_v')
! RESULT
! same as diag_decode_ip_2
! NOTES
! see diag_decode_ip_2
implicit none ! explicit, independent (ip) to (rp,kind) conversion
! ARGUMENTS
  integer(C_INT) :: status
  real(C_FLOAT),  dimension(3), intent(OUT) :: RP
  integer(C_INT), dimension(3), intent(OUT) :: kind
  integer(C_INT), dimension(3), intent(IN)  :: IP
!******
  status=diag_decode_ip_2(RP(1),kind(1),RP(2),kind(2),RP(3),kind(3),IP(1),IP(2),IP(3))

return
end function diag_decode_ip_3

end module diag_convert_ip123

function diag_is_a_level (kind) result(status)  ! is this kind a level ?
  use diag_convert_ip123, only : is_level_int, is_invalid_kind_int
  implicit none
  logical :: status
  integer, intent(IN) :: kind
  status=( (.not. is_invalid_kind_int(kind)) .and. is_level_int(kind) )
end function diag_is_a_level

function diag_is_invalid_kind (kind) result(status) ! is this kind invalid ?
  use diag_convert_ip123, only : is_invalid_kind_int
  implicit none
  logical :: status
  integer, intent(IN) :: kind
  status=is_invalid_kind_int(kind)
end function diag_is_invalid_kind
