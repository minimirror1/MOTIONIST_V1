cmake_minimum_required(VERSION 3.18)

project(MOTIONIST_V1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

set(app_icon_resource_windows "${CMAKE_CURRENT_SOURCE_DIR}/src/iconloc.rc")

find_package(Qt6 COMPONENTS Gui Qml Quick)
add_executable(MOTIONIST_V1App WIN32 src/main.cpp ${app_icon_resource_windows})

qt_add_resources(MOTIONIST_V1App "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

target_link_libraries(MOTIONIST_V1App PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
)

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)
