cmake_minimum_required(VERSION 3.15)

#----- Append EC specific module path
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake_rpn)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)

include(ec_init)           # Initialise compilers and ec specific functions
ec_git_version()           # Get version from git state
ec_parse_manifest()        # Parse MANIFEST file

project(${NAME} DESCRIPTION "${DESCRIPTION}")
set(PROJECT_VERSION ${VERSION}${STATE} CACHE STRING "Define the version of fsst-tools that will be baked into the various artifacts of this build" FORCE)

ec_build_info()            # Generate build information

enable_language(C Fortran)

# configure_file(version.in.inc version.inc @ONLY)
include(CTest)
add_custom_target(check COMMAND CTEST_OUTPUT_ON_FAILURE=TRUE ${CMAKE_CTEST_COMMAND})

find_package(RMN REQUIRED)

# TODO : Check if this is OK or if we would prefer that each target
#        does target_include_directories(...) even for this.
include_directories(${CMAKE_SOURCE_DIR}/include)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include)
set(NETCDF_C_BASE /fs/ssm/hpco/exp/netcdf-4.4.1.1/ubuntu-18.04-amd64-64)
set(NETCDF_C_LIBRARY ${NETCDF_C_BASE}/lib/libnetcdf.a)
set(NETCDF_C_INCLUDE_DIR ${NETCDF_C_BASE}/include)

set(NETCDF_Fortran_BASE /fs/ssm/hpco/exp/hdf5-netcdf4/master/netcdf-fortran_4.4.5-intel-19.0.3.199-openmpi-3.1.2-static_ubuntu-18.04-amd64-64)
set(NETCDF_Fortran_LIBRARY ${NETCDF_Fortran_BASE}/lib/libnetcdff.a)
set(NETCDF_Fortran_INCLUDE_DIR ${NETCDF_Fortran_BASE}/include)

add_subdirectory(src/extras)
add_subdirectory(src/cdf2ccc)
add_subdirectory(src/lssub)
add_subdirectory(src/lspgm)


install(DIRECTORY bin DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)
install(DIRECTORY include DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)
install(DIRECTORY lib DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)
