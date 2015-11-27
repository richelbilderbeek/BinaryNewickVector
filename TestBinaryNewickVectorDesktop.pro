include(../RibiLibraries/DesktopApplicationNoWeffcpp.pri)
include(../RibiLibraries/Boost.pri)
include(../RibiLibraries/BigInteger.pri)
include(../RibiLibraries/GeneralConsole.pri)
include(../RibiLibraries/GeneralDesktop.pri)

#Specific
include(../RibiClasses/CppBinaryNewickVector/CppBinaryNewickVector.pri)
include(../RibiClasses/CppFuzzy_equal_to/CppFuzzy_equal_to.pri)
include(../RibiClasses/CppNewick/CppNewick.pri)
include(../RibiClasses/CppSortedBinaryNewickVector/CppSortedBinaryNewickVector.pri)

#Specific
include(../TestBinaryNewickVector/TestBinaryNewickVectorDesktop.pri)

SOURCES += qtmain.cpp
