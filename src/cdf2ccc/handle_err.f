
      subroutine handle_err2(status,name)

      implicit none

!!!   Version R.DIAG par B. Dugas

      include 'netcdf.inc'
      character*(*) name
      integer status

      if(status .ne. nf_noerr) then
        write(6,1111)nf_strerror(status),'status=', status
        print *,'detected error - stopped in ',trim(name)
        call xit('handle_err',-1)
      endif
!-----------------------------------------------------------------------
 1111 format(/,a80,a7,i4,/)

      end
