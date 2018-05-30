# Attempt to find the header
find_path(MPFR_INCLUDE_DIR
    NAMES mpfr.h
    PATHS ${MPFR_ROOT}/include
)

if(MPFR_INCLUDE_DIR)
    # Find the library file
    find_library(MPFR_LIBRARIES mpfr
        PATHS ${MPFR_ROOT}/lib)

    # Detect MPFR version
    file(READ "${MPFR_INCLUDE_DIR}/mpfr.h" _mpfr_version_header)

    string(REGEX MATCH
        "define[ \t]+MPFR_VERSION_MAJOR[ \t]+([0-9]+)"
        _mpfr_major_version_match "${_mpfr_version_header}")
    set(MPFR_MAJOR_VERSION
        "${CMAKE_MATCH_1}")
    string(REGEX MATCH
        "define[ \t]+MPFR_VERSION_MINOR[ \t]+([0-9]+)"
        _mpfr_minor_version_match "${_mpfr_version_header}")
    set(MPFR_MINOR_VERSION "${CMAKE_MATCH_1}")
    string(REGEX MATCH
        "define[ \t]+MPFR_VERSION_PATCHLEVEL[ \t]+([0-9]+)"
        _mpfr_patchlevel_version_match "${_mpfr_version_header}")
    set(MPFR_PATCHLEVEL_VERSION "${CMAKE_MATCH_1}")

    set(MPFR_VERSION
        ${MPFR_MAJOR_VERSION}.${MPFR_MINOR_VERSION}.${MPFR_PATCHLEVEL_VERSION})

    set(MPFR_FOUND ON)
else()
    set(MPFR_FOUND OFF)
endif()

include(FindPackageHandleStandardArgs)
mark_as_advanced(MPFR_FOUND MPFR_MAJOR_VERSION MPFR_MINOR_VERSION
    MPFR_PATHLEVEL_VERSION MPFR_VERSION MPFR_INCLUDE_DIR MPFR_LIBRARIES)

find_package_handle_standard_args(MPFR
    FOUND_VAR MPFR_FOUND
    REQUIRED_VARS MPFR_INCLUDE_DIR MPFR_LIBRARIES
    VERSION_VAR MPFR_VERSION)

if(MPFR_FOUND)
    set(MPFR_INCLUDE_DIRS ${MPFR_INCLUDE_DIR})
endif()

if(MPFR_FOUND AND NOT TARGET mpfr::mpfr)
    add_library(mpfr::mpfr INTERFACE IMPORTED)
    set_target_properties(mpfr::mpfr PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES ${MPFR_INCLUDE_DIR}
        INTERFACE_LINK_LIBRARIES ${MPFR_LIBRARIES})
endif()
