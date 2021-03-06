# - Try to find GDKmm 3.0
# Once done, this will define
#
#  GDKmm_FOUND - system has GDKmm
#  GDKmm_INCLUDE_DIR - the GDKmm include directories
#  GDKmm_LIBRARY - link these to use GDKmm

include(LibFindMacros)

# Dependencies
libfind_package(GDKmm GDK)
libfind_package(GDKmm Glibmm)
libfind_package(GDKmm Pangomm)
libfind_package(GDKmm Cairomm)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(GDKmm_PKGCONF gdkmm-3.0)

# Main include dir
find_path(GDKmm_INCLUDE_DIR
  NAMES gdkmm.h
  HINTS ${GDKmm_PKGCONF_INCLUDE_DIRS}
  PATH_SUFFIXES gdkmm-3.0
)

# Glib-related libraries also use a separate config header, which is in lib dir
find_path(GDKmmConfig_INCLUDE_DIR
  NAMES gdkmmconfig.h
  HINTS ${GDKmm_PKGCONF_INCLUDE_DIRS} /usr
  PATH_SUFFIXES lib/gdkmm-3.0/include
)

# Finally the library itself
find_library(GDKmm_LIBRARY
  NAMES gdkmm-3.0
  HINTS ${GDKmm_PKGCONF_LIBRARY_DIRS}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(GDKmm_PROCESS_INCLUDES GDKmm_INCLUDE_DIR GDKmmConfig_INCLUDE_DIR GDK_INCLUDE_DIR Glibmm_INCLUDE_DIR Pangomm_INCLUDE_DIR Cairomm_INCLUDE_DIR)
set(GDKmm_PROCESS_LIBS GDKmm_LIBRARY GDK_LIBRARY Glibmm_LIBRARY Pangomm_LIBRARY Cairomm_LIBRARY)
libfind_process(GDKmm)

