find_path(MPFR_INCLUDES
    NAMES mpfr.h
    PATHS $ENV{GMPDIR} ${INCLUDE_INSTALL_DIR}
)

if(MPFR_INCLUDES)
    # Set MPFR_VERSION
    file(READ "${MPFR_INCLUDES}/mpfr.h" _mpfr_version_header)

    string(REGEX MATCH "define[ \t]+MPFR_VERSION_MAJOR[ \t]+([0-9]+)" _mpfr_major_version_match "${_mpfr_version_header}")
    set(MPFR_MAJOR_VERSION "${CMAKE_MATCH_1}")
    string(REGEX MATCH "define[ \t]+MPFR_VERSION_MINOR[ \t]+([0-9]+)" _mpfr_minor_version_match "${_mpfr_version_header}")
    set(MPFR_MINOR_VERSION "${CMAKE_MATCH_1}")
    string(REGEX MATCH "define[ \t]+MPFR_VERSION_PATCHLEVEL[ \t]+([0-9]+)" _mpfr_patchlevel_version_match "${_mpfr_version_header}")
    set(MPFR_PATCHLEVEL_VERSION "${CMAKE_MATCH_1}")

    set(MPFR_VERSION ${MPFR_MAJOR_VERSION}.${MPFR_MINOR_VERSION}.${MPFR_PATCHLEVEL_VERSION})

    message(STATUS "MPFR version ${MPFR_VERSION} found in ${MPFR_INCLUDES}")
    set(MPFR_FOUND ON)
else()
    set(MPFR_FOUND OFF)
endif()

find_library(MPFR_LIBRARIES mpfr PATHS $ENV{GMPDIR} ${LIB_INSTALL_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MPFR DEFAULT_MSG MPFR_INCLUDES MPFR_LIBRARIES MPFR_FOUND)
mark_as_advanced(MPFR_INCLUDES MPFR_LIBRARIES)

