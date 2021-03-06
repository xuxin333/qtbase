# Generated from hellogl.pro.

cmake_minimum_required(VERSION 3.14)
project(hellogl LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(INSTALL_EXAMPLEDIR "examples/opengl/legacy/hellogl")

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)
find_package(Qt6 COMPONENTS OpenGL)
find_package(Qt6 COMPONENTS Widgets)

add_qt_gui_executable(hellogl
    ../shared/qtlogo.cpp ../shared/qtlogo.h
    glwidget.cpp glwidget.h
    main.cpp
    window.cpp window.h
)
target_include_directories(hellogl PUBLIC
    ../shared
)

target_link_libraries(hellogl PUBLIC
    Qt::Core
    Qt::Gui
    Qt::OpenGL
    Qt::Widgets
)

install(TARGETS hellogl
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
