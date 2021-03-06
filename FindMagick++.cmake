#-*-cmake-*-
#
# Test for ImageMagick libraries, unlike CMake's FindImageMagick.cmake which
# tests for ImageMagick's binary utilities
#
# Once loaded this will define
#  [disabled] MAGICK_FOUND        - system has ImageMagick
#  [disabled] MAGICK_INCLUDE_DIR  - include directory for ImageMagick
#  [disabled] MAGICK_LIBRARY_DIR  - library directory for ImageMagick
#  [disabled] MAGICK_LIBRARIES    - libraries you need to link to
#
#  MAGICK++_FOUND        - system has ImageMagick
#  MAGICK++_INCLUDE_DIR  - include directory for ImageMagick
#  MAGICK++_LIBRARY_DIR  - library directory for ImageMagick
#  MAGICK++_LIBRARIES    - libraries you need to link to
#

# SET(MAGICK_FOUND   "NO" )
SET(MAGICK++_FOUND "NO" )

# FIND_PATH( MAGICK_INCLUDE_DIR magick.h
  # "$ENV{MAGICK_LOCATION}/magick"
  # "$ENV{MAGICK_LOCATION}/include/magick"
  # "$ENV{MAGICK_HOME}/include/magick"
  # /usr/include/ImageMagick-6
  # /usr/include/magick
  # /usr/include/
  # )

FIND_PATH( MAGICK++_INCLUDE_DIR Magick++.h
  "$ENV{MAGICK++_LOCATION}/Magick++"
  "$ENV{MAGICK++_LOCATION}/include/"
  "$ENV{MAGICK_LOCATION}/Magick++"
  "$ENV{MAGICK_LOCATION}/include/Magick++"
  "$ENV{MAGICK_LOCATION}/include/"
  "$ENV{MAGICK_HOME}/include/"
  /usr/include/ImageMagick-6
  /usr/include/Magick++
  /usr/include/
)
FIND_PATH( MAGICK++_BASECONFIG_DIR magick/magick-baseconfig.h
  "$ENV{MAGICK++_LOCATION}/Magick++"
  "$ENV{MAGICK++_LOCATION}/include/"
  "$ENV{MAGICK_LOCATION}/Magick++"
  "$ENV{MAGICK_LOCATION}/include/Magick++"
  "$ENV{MAGICK_LOCATION}/include/"
  "$ENV{MAGICK_HOME}/include/"
  /usr/include/ImageMagick-6
  /usr/include/Magick++
  /usr/include
  /usr/include/x86_64-linux-gnu/ImageMagick-6
)

# TODO: HACK
STRING(REGEX REPLACE "/magick$" "" MAGICK++_BASECONFIG_DIR ${MAGICK++_BASECONFIG_DIR})
SET(MAGICK++_INCLUDE_DIR ${MAGICK++_INCLUDE_DIR} ${MAGICK++_BASECONFIG_DIR})

# FIND_LIBRARY( Magick Magick
  # PATHS
  # "$ENV{MAGICK_LOCATION}/magick/.libs"
  # "$ENV{MAGICK_LOCATION}/lib"
  # "$ENV{MAGICK_HOME}/lib"
  # "/usr/lib/x86_64-linux-gnu"
  # DOC   "ImageMagick magic library"
# )

FIND_LIBRARY(
  Magick++
  Magick++
  Magick++-6.Q16
  MagickWand-6.Q16
  MagickCore-6.Q16
  PATHS
  "$ENV{MAGICK++_LOCATION}/.libs"
  "$ENV{MAGICK_LOCATION}/.libs"
  "$ENV{MAGICK++_LOCATION}/lib"
  "$ENV{MAGICK_LOCATION}/lib"
  "$ENV{MAGICK_HOME}/lib"
  "/usr/lib/x86_64-linux-gnu"
  DOC   "ImageMagick Magick++ library"
)
FIND_LIBRARY(
  MagickWand
  MagickWand
  MagickWand-6.Q16
  PATHS
  "$ENV{MAGICK++_LOCATION}/.libs"
  "$ENV{MAGICK_LOCATION}/.libs"
  "$ENV{MAGICK++_LOCATION}/lib"
  "$ENV{MAGICK_LOCATION}/lib"
  "$ENV{MAGICK_HOME}/lib"
  "/usr/lib/x86_64-linux-gnu"
  DOC   "ImageMagick MagickWand library"
)
FIND_LIBRARY(
  MagickCore
  MagickCore
  MagickCore-6.Q16
  PATHS
  "$ENV{MAGICK++_LOCATION}/.libs"
  "$ENV{MAGICK_LOCATION}/.libs"
  "$ENV{MAGICK++_LOCATION}/lib"
  "$ENV{MAGICK_LOCATION}/lib"
  "$ENV{MAGICK_HOME}/lib"
  "/usr/lib/x86_64-linux-gnu"
  DOC   "ImageMagick MagickCore library"
)


# SET(MAGICK_LIBRARIES ${Magick} )
SET(MAGICK++_LIBRARIES ${Magick++} ${MagickWand} ${MagickCore})


# IF (MAGICK_INCLUDE_DIR)
  # IF(MAGICK_LIBRARIES)
    # SET(MAGICK_FOUND "YES")
    # GET_FILENAME_COMPONENT(MAGICK_LIBRARY_DIR ${Magick}   PATH)
  # ENDIF(MAGICK_LIBRARIES)
# ENDIF(MAGICK_INCLUDE_DIR)

IF (MAGICK++_INCLUDE_DIR)
  IF(MAGICK++_LIBRARIES)
    SET(MAGICK++_FOUND "YES")
    GET_FILENAME_COMPONENT(MAGICK++_LIBRARY_DIR ${Magick++} PATH)
  ENDIF(MAGICK++_LIBRARIES)
ENDIF(MAGICK++_INCLUDE_DIR)


IF(NOT MAGICK++_FOUND)
  # make FIND_PACKAGE friendly
  IF(NOT Magick_FIND_QUIETLY)
    IF(Magick_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR
              "ImageMagick required, please specify it's location with MAGICK_HOME, MAGICK_LOCATION or MAGICK++_LOCATION")
    ELSE(Magick_FIND_REQUIRED)
      MESSAGE(STATUS "ImageMagick was not found.")
    ENDIF(Magick_FIND_REQUIRED)
  ENDIF(NOT Magick_FIND_QUIETLY)
ENDIF(NOT MAGICK++_FOUND)


#####

