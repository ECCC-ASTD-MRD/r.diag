The files under this directory have a GIT relationship with the data base at:
    https://github.com/Bernard-Dugas/r.diag.git

The files found in that remote data base constitute most of the files found here
in the 'development' directory.  However, they were actually cloned from there to
here in the git base directory (the parent of 'development') and then 'git mv'ed
to 'development'.  Therefore, to fetch revisions from the 'Bernard-Dugas' data
base, it should be sufficient to execute a 'git pull' command.

The exceptions are these files which do not exist remotely:
    r.lancer
    Climat*
    extras/*

The files in 'development', together with those in 'extras' are sufficient to
compile r.diag.  To do so, execute these commands:
    cd .../development
    . s.ssmuse.dot rpn/libs/15.2
    eval ". s.ssmuse.dot cmdn/vgrid/3.5.2/\${COMP_ARCH}"
    export PATH=${PWD}/bin:${PATH}  # To access info2html
    make all DIAG_VERSION=6.3.0 CONV_VERSION=2.2.0 RMNLIB=rmn_015.2 \
             FIXES=${PWD}/lib/Linux_x86-64/intel13sp1u2/stubs.o
    cd bin/${BASE_ARCH}
    ln -s r.diag_${DIAG_VERSION} r.diag
    ln -s cdf2ccc${CONV_VERSION} cdf2ccc
    ln -s cdf2rpn${CONV_VERSION} cdf2rpn
    cd -
    make export
