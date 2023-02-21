
      integer function nblen (string)
!
!     given a character string, nblen returns the length of the string
!     to the last non-blank character, presuming the string is left-
!     justified, i.e. if string = '   xs  j   ', nblen = 8.
!
!     called non-library routines: none
!     language: standard fortran 77
!
      integer ls,i
      character*(*) string, blank*1, null*1
      data blank /' '/
!
      null = char(0)
      nblen = 0
      ls = len(string)
      if (ls .eq. 0) return
      do i = ls, 1, -1
         if (string(i:i) .ne. blank .and. string(i:i) .ne. null) go to 2
      enddo
      return
    2 nblen = i
      return
!-----------------------------------------------------------------------
      end
