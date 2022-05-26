// //////////////////////////////////////////////////////////////////////////
// Header file ClockerModel.h for class ClockerModel
// (c)Copyright 2000, Baptiste Lepilleur.
// Created: 2002/06/14
// //////////////////////////////////////////////////////////////////////////
#ifndef CLOCKERMODEL_H
#define CLOCKERMODEL_H

#include <cppunit/TestPath.h>
#include <vector>
#include <map>
#include <stack>
#include <string>

#include "jsd/tpa/cppunit_clocker/std_Timer.h"

typedef std_Timer Timer;

/*
#ifdef CLOCKER_USE_WINNTTIMER
#include "WinNtTimer.h"
typedef WinNtTimer Timer;
#else
#include "Timer.h"
#endif
*/


#include "cppunit_clocker.h"


/// Model that represents test timing.
class JSD_TPA_CPPUNIT_CLOCKER_SHARED_INTERFACE ClockerModel
{
public:
  /*! Constructs a ClockerModel object.
   */
  ClockerModel();

  /// Destructor.
  virtual ~ClockerModel();

  void setExpectedTestCount( int count );

  void enterTest( CPPUNIT_NS::Test *test,
                  bool isSuite );

  void exitTest( CPPUNIT_NS::Test *test,
                 bool isSuite );

  double totalElapsedTime() const;

  double averageTestCaseTime() const;

  double testTimeFor( CPPUNIT_NS::Test *test ) const;

  double testTimeFor( int testIndex ) const;

  static std::string timeStringFor( double time );

  bool isSuite( int testIndex ) const;
  bool is_leaf( int test_index ) const;

  const CPPUNIT_NS::TestPath &testPathFor( int testIndex ) const;

  // -1 is none
  int indexOf( CPPUNIT_NS::Test *test ) const;

  int childCountFor( int testIndex ) const;

  int childAtFor( int testIndex,
                  int chidIndex ) const;

private:
  struct TestInfo
  {
    CPPUNIT_NS::TestPath m_path;
    Timer m_timer;
    bool m_isSuite;
    std::vector<int> m_childIndexes;
    bool is_leaf_;
  };

  /// Prevents the use of the copy constructor.
  ClockerModel( const ClockerModel &other );

  /// Prevents the use of the copy operator.
  void operator =( const ClockerModel &other );

private:
  CPPUNIT_NS::TestPath m_currentPath;

  int m_testCaseCount;
  double m_totalTestCaseTime;

  typedef std::map<CPPUNIT_NS::Test *, int> TestToIndexes;

  TestToIndexes m_testToIndexes;
  std::stack<int> m_testIndexes;
  std::vector<TestInfo> m_tests;
};




#endif  // CLOCKERMODEL_H
