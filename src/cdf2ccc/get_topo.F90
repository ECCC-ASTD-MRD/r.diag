      subroutine get_topo(PHIS_UNIT,IBUF,varid)

      implicit none

      include 'cdf2ccc.h'
      include 'dimmem.h'
      include 'varmem.h'
      include 'workmem.h'

      integer  phis_unit,ibuf(*)
      integer  varid


!*****
!
! AUTEUR Guy Bergeron   juin 2003
!
!     Extraire le champ de topographie h0 du fichier CCC/RPN phis_unit.
!
! REVISIONS
!
!  Bernard Dugas mai 2017 : 
!  - Convertir en fichier .F90 pour traiter
!    le macro taille_entete avec s.f90
!  Bernard Dugas fevrier 2008 :
!  - La lecture du champs de montagne se fait
!    maintenant sur l'unite I/O PHIS_UNIT plutot que FUNIT
!  - Le nom de variable de recherche est 'PHIS' ou 'ZS'
!
!*****

      integer, parameter :: head = taille_entete

      character(len=4) phis_name
      integer  i,j,k,ij,ni,nj, jbuf(head)
      real    grav,rgas
      logical OK

!-----------------------------------------------------------------------
      jbuf(1:head) = ibuf(1:head)

  100 call recget( phis_unit, ' ',-1,' ',-1, ibuf,maxpk,OK )
      if(.not.ok) call                                xit('get_topo',-1)  

      write(phis_name,'(A4)') ibuf(3)
      call cmplbl( 0,ibuf, 0,jbuf, OK )

!     On a trouve un champs topo avec la bonne taille ?

      if (.not.OK  .or. &
         (phis_name.ne.'PHIS' .and. phis_name.ne.'ZS')) goto 100

      call recup2(dval,ibuf) 

      grav=1.0   
      if(phis_name.eq.'PHIS') call defcphy(grav,rgas)

      ni=dim(xdid)%len
      nj=dim(ydid)%len

      do j=1,nj
         do i=1,ni
            ij = i + (nj-j)*(ni+dim(xdid)%duplic) !inversion des latitudes
            k = i + (j-1)*ni
            variable(k,varid)=dval(ij)/grav
         enddo
      enddo

!-----------------------------------------------------------------------
      end subroutine get_topo
