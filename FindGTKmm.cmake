# - Try to find GTKmm 3.0
# Once done, this will define
#
#  GTKmm_FOUND - system has GTKmm
#  GTKmm_INCLUDE_DIRS - the GTKmm include directories
#  GTKmm_LIBRARY - link these to use GTKmm

include(LibFindMacros)

# Dependencies
libfind_package(GTKmm GTK)
libfind_package(GTKmm Glibmm)
libfind_package(GTKmm GIOmm)
libfind_package(GTKmm GDKmm)
libfind_package(GTKmm Pangomm)
libfind_package(GTKmm Atkmm)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(GTKmm_PKGCONF gtkmm-3.0)

# Main include dir
find_path(GTKmm_INCLUDE_DIR
  NAMES gtkmm.h
  HINTS ${GTKmm_PKGCONF_INCLUDE_DIRS}
  PATH_SUFFIXES gtkmm-3.0
)

# Glib-related libraries also use a separate config header, which is in lib dir
find_path(GTKmmConfig_INCLUDE_DIR
  NAMES gtkmmconfig.h
  HINTS ${GTKmm_PKGCONF_INCLUDE_DIRS} /usr
  PATH_SUFFIXES lib/gtkmm-3.0/include
)

# Finally the library itself
find_library(GTKmm_LIBRARY
  NAMES gtkmm-3.0
  HINTS ${GTKmm_PKGCONF_LIBRARY_DIRS}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(GTKmm_PROCESS_INCLUDES GTKmm_INCLUDE_DIR GTKmmConfig_INCLUDE_DIR GTK_INCLUDE_DIR Glibmm_INCLUDE_DIR GIOmm_INCLUDE_DIR GDKmm_INCLUDE_DIR Pangomm_INCLUDE_DIR Atkmm_INCLUDE_DIR)
set(GTKmm_PROCESS_LIBS GTKmm_LIBRARY GTK_LIBRARY Glibmm_LIBRARY GIOmm_LIBRARY GDKmm_LIBRARY Pangomm_LIBRARY Atkmm_LIBRARY)
libfind_process(GTKmm)

