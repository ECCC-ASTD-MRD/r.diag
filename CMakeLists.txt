cmake_minimum_required(VERSION 3.15)

#----- Append EC specific module path
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake_rpn)

include(ec_init)           # Initialise compilers and ec specific functions
ec_git_version()           # Get version from git state
ec_parse_manifest()        # Parse MANIFEST file

project(${NAME} DESCRIPTION "${DESCRIPTION}")
set(PROJECT_VERSION ${VERSION}${STATE} CACHE STRING "Define the version of r.diag that will be baked into the various artifacts of this build" FORCE)

ec_build_info()            # Generate build information

enable_language(C Fortran)

include(ec_compiler_presets)

set(CMAKE_Fortran_PREPROCESS ON)
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include)

# Need to extend line length     gfortran            ifort
set(CMAKE_Fortran_FLAGS "-ffixed-line-length-none -extend-source ${CMAKE_Fortran_FLAGS} ")

include(CTest)
add_custom_target(check COMMAND CTEST_OUTPUT_ON_FAILURE=TRUE ${CMAKE_CTEST_COMMAND})

find_package(rmn REQUIRED)
find_package(LAPACK REQUIRED)
find_package(BLAS REQUIRED)
find_package(NetCDF COMPONENTS Fortran REQUIRED)

include_directories(${CMAKE_SOURCE_DIR}/src/include)

#set(NETCDF_C_BASE /fs/ssm/hpco/exp/netcdf-4.4.1.1/ubuntu-18.04-amd64-64)
#set(NETCDF_C_LIBRARY ${NETCDF_C_BASE}/lib/libnetcdf.a)
#set(NETCDF_C_INCLUDE_DIR ${NETCDF_C_BASE}/include)

#set(NETCDF_Fortran_BASE /fs/ssm/hpco/exp/hdf5-netcdf4/master/netcdf-fortran_4.4.5-intel-19.0.3.199-openmpi-3.1.2-static_ubuntu-18.04-amd64-64)
#set(NETCDF_Fortran_LIBRARY ${NETCDF_Fortran_BASE}/lib/libnetcdff.a)
#set(NETCDF_Fortran_INCLUDE_DIR ${NETCDF_Fortran_BASE}/include)

add_subdirectory(src/man)
add_subdirectory(src/extras)
add_subdirectory(src/cdf2ccc)
add_subdirectory(src/lssub)
add_subdirectory(src/lspgm)

install(DIRECTORY src/bin     DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)
install(DIRECTORY src/include DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)
install(DIRECTORY src/lib     DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/src/man DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)

# Packaging
ec_package_name()                 # Define package prefix  
ec_build_config()                 # Create build configuration script
ec_prepare_ssm()                  # Prepare ssm packaging files

set(CPACK_GENERATOR "TGZ")
set(CPACK_PACKAGE_VENDOR "ECCC")
set(CPACK_PACKAGE_CONTACT "${MAINTAINER}")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.org")
set(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/package")
set(CPACK_PACKAGE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
set(CPACK_PACKAGE_FILE_NAME "${PACKAGE_NAME}")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${NAME}_${PROJECT_VERSION}")
include(CPack)
