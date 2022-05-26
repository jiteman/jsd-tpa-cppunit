JSD_CMAKE_CURRENT_FILE_IN( "${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake" )

if ( UNIX )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	# list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-W" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-float-equal" ) # comparing floating point with == or != is unsafe
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-missing-declarations" ) # no previous declaration for ‘’
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-conversion" ) # conversion from ‘’ {aka ‘’} to ‘’ may change value
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-inline" ) # inlining failed in call to '' call is unlikely and code size would grow

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
else()
	message( SEND_ERROR "[JSD] ${JSD_SSC_FULL_NAME} COMPILER SETTINGS: ${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake is included while not on linux" )

endif()

JSD_CMAKE_CURRENT_FILE_OUT( "${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake" )
