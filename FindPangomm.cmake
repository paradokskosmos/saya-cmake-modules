# - Try to find Pangomm 1.4
# Once done, this will define
#
#  Pangomm_FOUND - system has Pangomm
#  Pangomm_INCLUDE_DIR - the Pangomm include directories
#  Pangomm_LIBRARY - link these to use Pangomm

include(LibFindMacros)

# Dependencies
libfind_package(Pangomm Pango)
libfind_package(Pangomm Cairomm)
libfind_package(Pangomm Glibmm)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(Pangomm_PKGCONF pangomm-1.4)

# Main include dir
find_path(Pangomm_INCLUDE_DIR
  NAMES pangomm.h
  HINTS ${Pangomm_PKGCONF_INCLUDE_DIRS}
  PATH_SUFFIXES pangomm-1.4
)

# Finally the library itself
find_library(Pangomm_LIBRARY
  NAMES pangomm-1.4
  HINTS ${Pangomm_PKGCONF_LIBRARY_DIRS}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(Pangomm_PROCESS_INCLUDES Pangomm_INCLUDE_DIR Pango_INCLUDE_DIR Cairomm_INCLUDE_DIR Glibmm_INCLUDE_DIR)
set(Pangomm_PROCESS_LIBS Pangomm_LIBRARY Pango_LIBRARY Cairomm_LIBRARY Glibmm_LIBRARY)
libfind_process(Pangomm)

