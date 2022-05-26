set( JSD_SSC_BASE_NAME tpa-cppunit )
set( JSD_SSC_LAST_NAME test-lib )


set( JSD_SSC_FULL_NAME "${JSD_SSC_BASE_NAME}-${JSD_SSC_LAST_NAME}" )


JSD_CMAKE_CURRENT_FILE_IN( "${JSD_SSC_FULL_NAME}-set-compiler-settings.cmake" )


if ( UNIX )
	JSD_SHOW_BUILD_MESSAGE( "${JSD_SSC_FULL_NAME} COMPILER SETTINGS: Linux" )
	include( ${JSD_SSC_CMAKE_PATH}/compiler-settings/${JSD_SSC_BASE_NAME}-common-set-linux-compiler-settings.cmake )
	include( ${JSD_SSC_CMAKE_PATH}/compiler-settings/${JSD_SSC_FULL_NAME}-set-linux-compiler-settings.cmake )
elseif( WIN32 )
	JSD_SHOW_BUILD_MESSAGE( "${JSD_SSC_FULL_NAME} COMPILER SETTINGS: Windows" )
	include( ${JSD_SSC_CMAKE_PATH}/compiler-settings/${JSD_SSC_BASE_NAME}-common-set-windows-compiler-settings.cmake )
	include( ${JSD_SSC_CMAKE_PATH}/compiler-settings/${JSD_SSC_FULL_NAME}-set-windows-compiler-settings.cmake )
else()
	message( STATUS "[JSD] ${JSD_SSC_FULL_NAME} COMPILER SETTINGS: Unsupported platform. Default settings are used." )
endif()


JSD_CMAKE_CURRENT_FILE_OUT( "${JSD_SSC_FULL_NAME}-set-compiler-settings.cmake" )
