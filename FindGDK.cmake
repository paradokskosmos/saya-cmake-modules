# - Try to find GDK 3.0
# Once done, this will define
#
#  GDK_FOUND - system has GDK
#  GDK_INCLUDE_DIR - the GDK include directories
#  GDK_LIBRARY - link these to use GDK

include(LibFindMacros)

# Dependencies
libfind_package(GDK GDK-PixBuf)
libfind_package(GDK Pango)
libfind_package(GDK GIO)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(GDK_PKGCONF gdk-3.0)

# Main include dir
find_path(GDK_INCLUDE_DIR
  NAMES gdk/gdk.h
  HINTS ${GDK_PKGCONF_INCLUDE_DIRS}
  PATH_SUFFIXES gtk-3.0
)

# Glib-related libraries also use a separate config header, which is in lib dir
find_path(GDKConfig_INCLUDE_DIR
  NAMES gdkconfig.h
  HINTS ${GDK_PKGCONF_INCLUDE_DIRS} /usr
  PATH_SUFFIXES lib/gtk-3.0/include include/gtk-3.0/gdk
)

# Finally the library itself
find_library(GDK_LIBRARY
  # NAMES gdk-x11-3.0
  NAMES gdk-3
  HINTS ${GDK_PKGCONF_LIBRARY_DIRS}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(GDK_PROCESS_INCLUDES GDK_INCLUDE_DIR GDKConfig_INCLUDE_DIR GDK-PixBuf_INCLUDE_DIR Pango_INCLUDE_DIR GIO_INCLUDE_DIR)
set(GDK_PROCESS_LIBS GDK_LIBRARY GDK-PixBuf_LIBRARY Pango_LIBRARY GIO_LIBRARY)
libfind_process(GDK)

