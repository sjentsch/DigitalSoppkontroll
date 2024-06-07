project(qtwebengine C CXX)
cmake_minimum_required(VERSION 3.0.0)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(Qt5Core)
find_package(Qt5Qml)
find_package(Qt5Quick)
#find_package(Qt5WebEngine)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# Components PATH
execute_process(
    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
    OUTPUT_VARIABLE ARCH_TRIPLET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(QT_IMPORTS_DIR "lib/${ARCH_TRIPLET}")

set(PROJECT_NAME "DigitalSoppkontroll")
set(FULL_PROJECT_NAME "digitalsoppkontroll.sjentsch")
set(CMAKE_INSTALL_PREFIX /)
set(DATA_DIR /)
set(DESKTOP_FILE_NAME ${PROJECT_NAME}.desktop)

# This command figures out the target architecture for use in the manifest file
execute_process(
    COMMAND dpkg-architecture -qDEB_HOST_ARCH
    OUTPUT_VARIABLE CLICK_ARCH
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

configure_file(manifest.json.in ${CMAKE_CURRENT_BINARY_DIR}/manifest.json)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/manifest.json DESTINATION ${CMAKE_INSTALL_PREFIX})
install(FILES ${PROJECT_NAME}.apparmor DESTINATION ${DATA_DIR})
install(FILES ${PROJECT_NAME}.qml      DESTINATION ${DATA_DIR})
install(FILES ${PROJECT_NAME}.svg      DESTINATION ${DATA_DIR})
install(FILES ${DESKTOP_FILE_NAME}     DESTINATION ${DATA_DIR})

set(
    SRCS
    DigitalSoppkontroll.cpp
    DigitalSoppkontroll.qrc
)

add_executable(${PROJECT_NAME} ${SRCS} ${RSCS} ${qqc2-gallery_SRC})
qt5_use_modules(${PROJECT_NAME} Gui Qml Quick QuickControls2) # WebEngine)
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${DATA_DIR})

# Make source files visible in qtcreator
# We don't need to add plugin sources here as they get exposed
# via the library target.
file(GLOB_RECURSE PROJECT_SRC_FILES
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    *.qml
    *.json
    *.json.in
    *.apparmor
    *.desktop
)

add_custom_target(${PROJECT_NAME}_FILES ALL SOURCES ${PROJECT_SRC_FILES})
