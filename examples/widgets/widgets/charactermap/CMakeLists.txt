# Generated from charactermap.pro.

cmake_minimum_required(VERSION 3.14)
project(charactermap LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(INSTALL_EXAMPLEDIR "examples/widgets/widgets/charactermap")

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)
find_package(Qt6 COMPONENTS Widgets)

add_qt_gui_executable(charactermap
    characterwidget.cpp characterwidget.h
    main.cpp
    mainwindow.cpp mainwindow.h
)
target_link_libraries(charactermap PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Widgets
)

install(TARGETS charactermap
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
