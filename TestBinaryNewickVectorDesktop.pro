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

# Qt
QT += core gui widgets

QMAKE_CXXFLAGS += -Wall -Wextra -Werror

# QResources give this error
QMAKE_CXXFLAGS += -Wno-unused-variable

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov

# Thanks QDateTime
QMAKE_CXXFLAGS += -Wno-unused-result

# Qwt
# Normal compiling
LIBS += -lqwt-qt5
INCLUDEPATH += /usr/include/qwt

# For crosscompiling
#INCLUDEPATH += /home/richel/GitHubs/RibiLibraries/mxe/usr/i686-w64-mingw32.static/qt5/include
#LIBS += -lqwt
#QT += svg
