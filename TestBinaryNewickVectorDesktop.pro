include(../RibiLibraries/DesktopApplicationNoWeffcpp.pri)
include(../RibiLibraries/Boost.pri)
include(../RibiLibraries/BigInteger.pri)
include(../RibiClasses/CppAbout/CppAbout.pri)
include(../RibiClasses/CppFileIo/CppFileIo.pri)
include(../RibiClasses/CppHelp/CppHelp.pri)
include(../RibiClasses/CppMenuDialog/CppMenuDialog.pri)
include(../RibiLibraries/GeneralDesktop.pri)

#Specific
include(BinaryNewickVector.pri)
include(../Newick/Newick.pri)
include(../RibiClasses/CppFuzzy_equal_to/CppFuzzy_equal_to.pri)
include(../RibiClasses/CppSortedBinaryNewickVector/CppSortedBinaryNewickVector.pri)

#Specific
include(TestBinaryNewickVectorDesktop.pri)

SOURCES += qtmain.cpp

# Thanks to Qt
QMAKE_CXXFLAGS += -Wno-unused-variable

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov
