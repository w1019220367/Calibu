# - Find TinyXML
# Find the native TinyXML includes and library
#
#   TINYXML_FOUND        - True if TinyXML found.
#   TINYXML_INCLUDE_DIRS - where to find tinyxml.h, etc.
#   TINYXML_LIBRARIES    - List of libraries when using TinyXML.
#
#   TINYXML_VERSION       - Full version of TinyXML.
#   TINYXML_VERSION_MAJOR - Major version of TinyXML.
#   TINYXML_VERSION_MINOR - Minor version of TinyXML.
#   TINYXML_VERSION_PATCH - Patch version of TinyXML.
#

LIST( APPEND TINYXML_NAMES "tinyxml" )

FIND_PATH(
  TINYXML_INCLUDE_DIR
  "tinyxml.h"
  )
FIND_LIBRARY(
  TINYXML_LIBRARY
  NAMES ${TINYXML_NAMES}
  )
MARK_AS_ADVANCED(
  TINYXML_INCLUDE_DIR
  TINYXML_LIBRARY
  )

IF( TINYXML_INCLUDE_DIR AND EXISTS "${TINYXML_INCLUDE_DIR}/tinyxml.h" )
  FILE(
    STRINGS "${TINYXML_INCLUDE_DIR}/tinyxml.h"
    TINYXML_VERSION_MAJOR
    REGEX "^const int TIXML_MAJOR_VERSION = [0-9]+;$"
    )
  FILE(
    STRINGS "${TINYXML_INCLUDE_DIR}/tinyxml.h"
    TINYXML_VERSION_MINOR
    REGEX "^const int TIXML_MINOR_VERSION = [0-9]+;$"
    )
  FILE(
    STRINGS "${TINYXML_INCLUDE_DIR}/tinyxml.h"
    TINYXML_VERSION_PATCH
    REGEX "^const int TIXML_PATCH_VERSION = [0-9]+;$"
    )

  STRING(
    REGEX REPLACE "^.*TIXML_MAJOR_VERSION = ([0-9]+).*$" "\\1"
    TINYXML_VERSION_MAJOR "${TINYXML_VERSION_MAJOR}"
    )
  STRING(
    REGEX REPLACE "^.*TIXML_MINOR_VERSION = ([0-9]+).*$" "\\1"
    TINYXML_VERSION_MINOR "${TINYXML_VERSION_MINOR}"
    )
  STRING(
    REGEX REPLACE "^.*TIXML_PATCH_VERSION = ([0-9]+).*$" "\\1"
    TINYXML_VERSION_PATCH "${TINYXML_VERSION_PATCH}"
    )

  SET( TINYXML_VERSION "${TINYXML_VERSION_MAJOR}.${TINYXML_VERSION_MINOR}.${TINYXML_VERSION_PATCH}" )
ENDIF()

SET( TINYXML_INCLUDE_DIRS "${TINYXML_INCLUDE_DIR}" )
SET( TINYXML_LIBRARIES "${TINYXML_LIBRARY}" )

# handle the QUIETLY and REQUIRED arguments and set TINYXML_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE( "FindPackageHandleStandardArgs" )
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
  "TinyXML"
  REQUIRED_VARS TINYXML_LIBRARIES TINYXML_INCLUDE_DIRS
  VERSION_VAR TINYXML_VERSION
  )

