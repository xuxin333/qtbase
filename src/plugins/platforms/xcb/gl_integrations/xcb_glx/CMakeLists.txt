# Generated from xcb_glx.pro.

#####################################################################
## QXcbGlxIntegrationPlugin Plugin:
#####################################################################

qt_add_plugin(QXcbGlxIntegrationPlugin
    OUTPUT_NAME qxcb-glx-integration
    TYPE xcbglintegrations
    SOURCES
        qglxintegration.cpp qglxintegration.h
        qxcbglxintegration.cpp qxcbglxintegration.h
        qxcbglxmain.cpp
        qxcbglxnativeinterfacehandler.cpp qxcbglxnativeinterfacehandler.h
        qxcbglxwindow.cpp qxcbglxwindow.h
    DEFINES
        QT_NO_FOREACH
    INCLUDE_DIRECTORIES
        ..
        ../..
    PUBLIC_LIBRARIES
        Qt::Core
        Qt::CorePrivate
        Qt::GlxSupportPrivate
        Qt::Gui
        Qt::GuiPrivate
        Qt::XcbQpaPrivate
)

## Scopes:
#####################################################################

qt_extend_target(QXcbGlxIntegrationPlugin CONDITION QT_FEATURE_xcb_glx
    PUBLIC_LIBRARIES
        XCB::GLX
)

qt_extend_target(QXcbGlxIntegrationPlugin CONDITION QT_FEATURE_dlopen AND NOT static
    PUBLIC_LIBRARIES
        ${CMAKE_DL_LIBS}
)
