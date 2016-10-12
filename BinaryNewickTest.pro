CONFIG += console debug_and_release
CONFIG -= app_bundle
QT -= core gui
TEMPLATE = app

CONFIG(release, debug|release) {
  DEFINES += NDEBUG
}

include(BinaryNewickVector.pri)
include(../RibiLibraries/BigInteger.pri)
include(../Newick/Newick.pri)
include(../RibiClasses/CppFuzzy_equal_to/CppFuzzy_equal_to.pri)
include(../RibiClasses/CppSortedBinaryNewickVector/CppSortedBinaryNewickVector.pri)


SOURCES += *_test.cpp

unix:!macx{
  # Linux only
  message("Console application, built for Linux")
  message(Host name: $$QMAKE_HOST.name)
  contains(QMAKE_HOST.name,pc-157-103) {
    message("Host is student computer")
    QMAKE_CXX = g++-5
    QMAKE_LINK = g++-5
    QMAKE_CC = gcc-5
    QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror -std=c++14
  }
  !contains(QMAKE_HOST.name,pc-157-103) {
    message("Host is not student computer")
    QMAKE_CXX = g++-5
    QMAKE_LINK = g++-5
    QMAKE_CC = gcc-5
    QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror -std=c++14

    # gcov
    QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
    LIBS += -lgcov
  }

  # Boost.Test
  LIBS += -lboost_unit_test_framework

  # Boost.Graph and GraphViz, only needed in tests
  LIBS += -lboost_graph

}

win32 {
  # Windows
  message(compiling on Windows)
  # Boost.Test
  INCLUDEPATH += C:/local/boost_1_62_0
  LIBS += -LC:/local/boost_1_62_0/lib64-msvc-14.0 -llibboost_unit_test_framework-vc140-mt-gd-1_62
}

