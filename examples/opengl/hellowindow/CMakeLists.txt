# Generated from hellowindow.pro.

cmake_minimum_required(VERSION 3.14)
project(hellowindow LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(INSTALL_EXAMPLEDIR "examples/opengl/hellowindow")

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)

add_qt_gui_executable(hellowindow
    hellowindow.cpp hellowindow.h
    main.cpp
)
target_link_libraries(hellowindow PUBLIC
    Qt::Core
    Qt::CorePrivate
    Qt::Gui
    Qt::GuiPrivate
)

install(TARGETS hellowindow
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
