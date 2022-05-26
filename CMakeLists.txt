cmake_minimum_required( VERSION 3.16.3 )

project( tpa-cppunit )


JSD_SHOW_PROJECT_GROUP_HEADER()


set( JSD_SSC_CMAKE_PATH ${PROJECT_SOURCE_DIR}/0-tpa-cmake )
set( JSD_SSC_SOURCE_PATH ${PROJECT_SOURCE_DIR}/1-tpa-sources )


add_subdirectory( 2-tpa-cppunit-clocker )
add_subdirectory( 3-tpa-cppunit-lib )

# tests
#add_subdirectory( 4-tpa-cppunit-test-lib )
#add_subdirectory( 5-tpa-cppunit-tests )
#~tests


JSD_SHOW_PROJECT_GROUP_FOOTER()
