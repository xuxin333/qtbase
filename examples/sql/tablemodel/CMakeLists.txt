# Generated from tablemodel.pro.

cmake_minimum_required(VERSION 3.14)
project(tablemodel LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(INSTALL_EXAMPLEDIR "examples/sql/tablemodel")

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)
find_package(Qt6 COMPONENTS Sql)
find_package(Qt6 COMPONENTS Widgets)

add_qt_gui_executable(tablemodel
    ../connection.h
    tablemodel.cpp
)
target_link_libraries(tablemodel PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Sql
    Qt::Widgets
)

install(TARGETS tablemodel
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
