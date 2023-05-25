cmake_minimum_required(VERSION 3.16)

project(vlibrary VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

## Dodaj pliki czcionek do projektu
#set(FONT_FILES
#    "fonts/BrunoAce-Regular.ttf"
#)

## Skopiuj pliki czcionek do katalogu zbudowanego projektu
#foreach(FONT_FILE ${FONT_FILES})
#    configure_file(${FONT_FILE} ${CMAKE_CURRENT_BINARY_DIR}/${FONT_FILE} COPYONLY)
#endforeach()

#RESOURCES(
#    fonts/BrunoAce-Regular.ttf)
qt_add_executable(appvlibrary
    main.cpp
    ksiazka.h
    ksiazka.cpp
    polka.h
    polka.cpp
    szafa.h
    szafa.cpp
    biblioteka.h
    biblioteka.cpp
#    fonts/BrunoAce-Regular.ttf
)

qt_add_qml_module(appvlibrary
    URI vlibrary
    VERSION 1.0
    QML_FILES Main.qml
)

set_target_properties(appvlibrary PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appvlibrary
    PRIVATE Qt6::Quick
)

install(TARGETS appvlibrary
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
#    fonts/BrunoAce-Regular.ttf
