

#### Inputs

# input freetype
set(INPUT_freetype "undefined" CACHE STRING "")
set_property(CACHE INPUT_freetype PROPERTY STRINGS undefined no qt system)

# input libjpeg
set(INPUT_libjpeg "undefined" CACHE STRING "")
set_property(CACHE INPUT_libjpeg PROPERTY STRINGS undefined no qt system)

# input libmd4c
set(INPUT_libmd4c "undefined" CACHE STRING "")
set_property(CACHE INPUT_libmd4c PROPERTY STRINGS undefined no qt system)

# input libpng
set(INPUT_libpng "undefined" CACHE STRING "")
set_property(CACHE INPUT_libpng PROPERTY STRINGS undefined no qt system)



#### Libraries

qt_find_package(ATSPI2 PROVIDED_TARGETS PkgConfig::ATSPI2)
qt_find_package(DirectFB PROVIDED_TARGETS PkgConfig::DirectFB)
qt_find_package(Libdrm PROVIDED_TARGETS Libdrm::Libdrm)
qt_find_package(EGL PROVIDED_TARGETS EGL::EGL)
qt_find_package(WrapFreetype PROVIDED_TARGETS WrapFreetype::WrapFreetype)
set_package_properties(WrapFreetype PROPERTIES TYPE REQUIRED)
qt_find_package(Fontconfig PROVIDED_TARGETS Fontconfig::Fontconfig)
qt_find_package(gbm PROVIDED_TARGETS gbm::gbm)
qt_find_package(WrapHarfbuzz PROVIDED_TARGETS WrapHarfbuzz::WrapHarfbuzz)
qt_find_package(Libinput PROVIDED_TARGETS Libinput::Libinput)
qt_find_package(JPEG PROVIDED_TARGETS JPEG::JPEG)
qt_find_package(PNG PROVIDED_TARGETS PNG::PNG)
qt_find_package(Mtdev PROVIDED_TARGETS PkgConfig::Mtdev)
qt_find_package(OpenGL PROVIDED_TARGETS OpenGL::GL)
qt_find_package(GLESv2 PROVIDED_TARGETS GLESv2::GLESv2)
qt_find_package(Tslib PROVIDED_TARGETS PkgConfig::Tslib)
qt_find_package(Vulkan PROVIDED_TARGETS Vulkan::Vulkan)
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(Wayland PROVIDED_TARGETS Wayland::Server)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(X11 PROVIDED_TARGETS X11::XCB)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(X11 PROVIDED_TARGETS ${X11_SM_LIB} ${X11_ICE_LIB})
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB 1.9 PROVIDED_TARGETS XCB::XCB)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS ICCCM PROVIDED_TARGETS XCB::ICCCM)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS IMAGE PROVIDED_TARGETS XCB::IMAGE)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS KEYSYMS PROVIDED_TARGETS XCB::KEYSYMS)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS RENDERUTIL PROVIDED_TARGETS XCB::RENDERUTIL)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS RANDR PROVIDED_TARGETS XCB::RANDR)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS SHAPE PROVIDED_TARGETS XCB::SHAPE)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS SHM PROVIDED_TARGETS XCB::SHM)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS SYNC PROVIDED_TARGETS XCB::SYNC)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS XFIXES PROVIDED_TARGETS XCB::XFIXES)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS XINERAMA PROVIDED_TARGETS XCB::XINERAMA)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS XKB PROVIDED_TARGETS XCB::XKB)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS RENDER PROVIDED_TARGETS XCB::RENDER)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS GLX PROVIDED_TARGETS XCB::GLX)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XCB COMPONENTS XINPUT PROVIDED_TARGETS XCB::XINPUT)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XKB 0.4.1 PROVIDED_TARGETS XKB::XKB)
endif()
if((LINUX) OR QT_FIND_ALL_PACKAGES_ALWAYS)
    qt_find_package(XRender PROVIDED_TARGETS PkgConfig::XRender)
endif()


#### Tests

# angle_d3d11_qdtd
qt_config_compile_test(angle_d3d11_qdtd
    LABEL "D3D11_QUERY_DATA_TIMESTAMP_DISJOINT"
    CODE
"
#include <d3d11.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
D3D11_QUERY_DATA_TIMESTAMP_DISJOINT qdtd;
(void) qdtd;
    /* END TEST: */
    return 0;
}
")

# drm_atomic
qt_config_compile_test(drm_atomic
    LABEL "DRM Atomic API"
    LIBRARIES
        Libdrm::Libdrm
    CODE
"#include <stdlib.h>
#include <stdint.h>
extern \"C\" {
#include <xf86drmMode.h>
#include <xf86drm.h>
}
int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
drmModeAtomicReq *request;
    /* END TEST: */
    return 0;
}
")

# egl-x11
qt_config_compile_test(egl_x11
    LABEL "EGL on X11"
    LIBRARIES
        EGL::EGL
        X11::XCB
    CODE
"// Check if EGL is compatible with X. Some EGL implementations, typically on
// embedded devices, are not intended to be used together with X. EGL support
// has to be disabled in plugins like xcb in this case since the native display,
// window and pixmap types will be different than what an X-based platform
// plugin would expect.
#include <EGL/egl.h>
#include <X11/Xlib.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
Display *dpy = EGL_DEFAULT_DISPLAY;
EGLNativeDisplayType egldpy = XOpenDisplay(\"\");
dpy = egldpy;
EGLNativeWindowType w = XCreateWindow(dpy, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
XDestroyWindow(dpy, w);
XCloseDisplay(dpy);
    /* END TEST: */
    return 0;
}
")

# egl-brcm
qt_config_compile_test(egl_brcm
    LABEL "Broadcom EGL (Raspberry Pi)"
    LIBRARIES
        EGL::EGL
    CODE
"
#include <EGL/egl.h>
#include <bcm_host.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
vc_dispmanx_display_open(0);
    /* END TEST: */
    return 0;
}
"# FIXME: use: unmapped library: bcm_host
)

# egl-egldevice
qt_config_compile_test(egl_egldevice
    LABEL "EGLDevice"
    LIBRARIES
        EGL::EGL
    CODE
"
#include <EGL/egl.h>
#include <EGL/eglext.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
EGLDeviceEXT device = 0;
EGLStreamKHR stream = 0;
EGLOutputLayerEXT layer = 0;
(void) EGL_DRM_CRTC_EXT;
    /* END TEST: */
    return 0;
}
")

# egl-mali
qt_config_compile_test(egl_mali
    LABEL "Mali EGL"
    LIBRARIES
        EGL::EGL
    CODE
"
#include <EGL/fbdev_window.h>
#include <EGL/egl.h>
#include <GLES2/gl2.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
fbdev_window *w = 0;
    /* END TEST: */
    return 0;
}
")

# egl-mali-2
qt_config_compile_test(egl_mali_2
    LABEL "Mali 2 EGL"
    LIBRARIES
        EGL::EGL
    CODE
"
#include <EGL/egl.h>
#include <GLES2/gl2.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
mali_native_window *w = 0;
    /* END TEST: */
    return 0;
}
")

# egl-viv
qt_config_compile_test(egl_viv
    LABEL "i.Mx6 EGL"
    LIBRARIES
        EGL::EGL
    CODE
"
#include <EGL/egl.h>
#include <EGL/eglvivante.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
#ifdef __INTEGRITY
fbGetDisplay();
#else
// Do not rely on fbGetDisplay(), since the signature has changed over time.
// Stick to fbGetDisplayByIndex().
fbGetDisplayByIndex(0);
#endif
    /* END TEST: */
    return 0;
}
"# FIXME: qmake: ['DEFINES += EGL_API_FB=1', '!integrity: DEFINES += LINUX=1']
)

# egl-openwfd
qt_config_compile_test(egl_openwfd
    LABEL "OpenWFD EGL"
    LIBRARIES
        EGL::EGL
    CODE
"
#include <wfd.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
wfdEnumerateDevices(nullptr, 0, nullptr);
    /* END TEST: */
    return 0;
}
")

# egl-rcar
qt_config_compile_test(egl_rcar
    LABEL "RCAR EGL"
    LIBRARIES
        EGL::EGL
        GLESv2::GLESv2
    CODE
"
#include <EGL/egl.h>
extern \"C\" {
extern unsigned long PVRGrfxServerInit(void);
}
int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
PVRGrfxServerInit();
    /* END TEST: */
    return 0;
}
")

# evdev
qt_config_compile_test(evdev
    LABEL "evdev"
    CODE
"#if defined(__FreeBSD__)
#  include <dev/evdev/input.h>
#else
#  include <linux/input.h>
#  include <linux/kd.h>
#endif
enum {
    e1 = ABS_PRESSURE,
    e2 = ABS_X,
    e3 = REL_X,
    e4 = SYN_REPORT,
};


int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
input_event buf[32];
(void) buf;
    /* END TEST: */
    return 0;
}
")

# integrityfb
qt_config_compile_test(integrityfb
    LABEL "INTEGRITY framebuffer"
    CODE
"
#include <device/fbdriver.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
FBDriver *driver = 0;
    /* END TEST: */
    return 0;
}
")

# linuxfb
qt_config_compile_test(linuxfb
    LABEL "LinuxFB"
    CODE
"
#include <linux/fb.h>
#include <sys/kd.h>
#include <sys/ioctl.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
fb_fix_screeninfo finfo;
fb_var_screeninfo vinfo;
int fd = 3;
ioctl(fd, FBIOGET_FSCREENINFO, &finfo);
ioctl(fd, FBIOGET_VSCREENINFO, &vinfo);
    /* END TEST: */
    return 0;
}
")

# opengles3
qt_config_compile_test(opengles3
    LABEL "OpenGL ES 3.0"
    LIBRARIES
        GLESv2::GLESv2
    CODE
"#ifdef __APPLE__
#  include <OpenGLES/ES3/gl.h>
#else
#  define GL_GLEXT_PROTOTYPES
#  include <GLES3/gl3.h>
#endif


int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
static GLfloat f[6];
glGetStringi(GL_EXTENSIONS, 0);
glReadBuffer(GL_COLOR_ATTACHMENT1);
glUniformMatrix2x3fv(0, 0, GL_FALSE, f);
glMapBufferRange(GL_ARRAY_BUFFER, 0, 0, GL_MAP_READ_BIT);
    /* END TEST: */
    return 0;
}
")

# opengles31
qt_config_compile_test(opengles31
    LABEL "OpenGL ES 3.1"
    LIBRARIES
        GLESv2::GLESv2
    CODE
"
#include <GLES3/gl31.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
glDispatchCompute(1, 1, 1);
glProgramUniform1i(0, 0, 0);
    /* END TEST: */
    return 0;
}
")

# opengles32
qt_config_compile_test(opengles32
    LABEL "OpenGL ES 3.2"
    LIBRARIES
        GLESv2::GLESv2
    CODE
"
#include <GLES3/gl32.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
glFramebufferTexture(GL_TEXTURE_2D, GL_DEPTH_STENCIL_ATTACHMENT, 1, 0);
    /* END TEST: */
    return 0;
}
")

# xcb_syslibs
qt_config_compile_test(xcb_syslibs
    LABEL "XCB (extensions)"
    LIBRARIES
        XCB::ICCCM
        XCB::IMAGE
        XCB::KEYSYMS
        XCB::RANDR
        XCB::RENDER
        XCB::RENDERUTIL
        XCB::SHAPE
        XCB::SHM
        XCB::SYNC
        XCB::XFIXES
        XCB::XINERAMA
        XCB::XKB
        XCB::XCB
    CODE
"// xkb.h is using a variable called 'explicit', which is a reserved keyword in C++
#define explicit dont_use_cxx_explicit
#include <xcb/xcb.h>
#include <xcb/xcb_image.h>
#include <xcb/xcb_keysyms.h>
#include <xcb/randr.h>
#include <xcb/render.h>
#include <xcb/shape.h>
#include <xcb/shm.h>
#include <xcb/sync.h>
#include <xcb/xfixes.h>
#include <xcb/xinerama.h>
#include <xcb/xcb_icccm.h>
#include <xcb/xcb_renderutil.h>
#include <xcb/xkb.h>
#undef explicit
int main(int argc, char **argv)
{
    (void)argc; (void)argv;
    /* BEGIN TEST: */
int primaryScreen = 0;
xcb_connection_t *c = xcb_connect(\"\", &primaryScreen);
/* RENDER */
xcb_generic_error_t *error = nullptr;
xcb_render_query_pict_formats_cookie_t formatsCookie =
    xcb_render_query_pict_formats(c);
xcb_render_query_pict_formats_reply_t *formatsReply =
    xcb_render_query_pict_formats_reply(c, formatsCookie, &error);
/* RENDERUTIL: xcb_renderutil.h include won't compile unless version >= 0.3.9 */
xcb_render_util_find_standard_format(nullptr, XCB_PICT_STANDARD_ARGB_32);
/* XKB: This takes more arguments in xcb-xkb < 1.11 */
xcb_xkb_get_kbd_by_name_replies_key_names_value_list_sizeof(nullptr, 0, 0, 0, 0, 0, 0, 0, 0);
    /* END TEST: */
    return 0;
}
")



#### Features

qt_feature("accessibility-atspi-bridge" PUBLIC PRIVATE
    LABEL "ATSPI Bridge"
    CONDITION QT_FEATURE_accessibility AND QT_FEATURE_xcb AND QT_FEATURE_dbus AND ATSPI2_FOUND
)
qt_feature_definition("accessibility-atspi-bridge" "QT_NO_ACCESSIBILITY_ATSPI_BRIDGE" NEGATE VALUE "1")
qt_feature("angle" PUBLIC
    LABEL "ANGLE"
    AUTODETECT QT_FEATURE_opengles2 OR QT_FEATURE_opengl_dynamic
    CONDITION NOT QT_FEATURE_opengl_desktop AND QT_FEATURE_dxguid AND tests.fxc AND ( QT_FEATURE_direct3d9 OR ( WINRT AND QT_FEATURE_direct3d11 AND libs.d3dcompiler ) ) OR FIXME
)
qt_feature_definition("angle" "QT_OPENGL_ES_2_ANGLE")
qt_feature("angle_d3d11_qdtd" PRIVATE
    LABEL "D3D11_QUERY_DATA_TIMESTAMP_DISJOINT"
    CONDITION QT_FEATURE_angle AND TEST_angle_d3d11_qdtd
)
qt_feature("combined-angle-lib" PUBLIC
    LABEL "Combined ANGLE Library"
    AUTODETECT OFF
    CONDITION QT_FEATURE_angle
)
qt_feature("directfb" PRIVATE
    SECTION "Platform plugins"
    LABEL "DirectFB"
    AUTODETECT OFF
    CONDITION DirectFB_FOUND
)
qt_feature("directwrite" PRIVATE
    LABEL "DirectWrite"
    CONDITION libs.dwrite OR FIXME
    EMIT_IF WIN32
)
qt_feature("directwrite1" PRIVATE
    LABEL "DirectWrite 1"
    CONDITION libs.dwrite_1 OR FIXME
    EMIT_IF WIN32
)
qt_feature("directwrite3" PRIVATE
    LABEL "DirectWrite 3"
    CONDITION QT_FEATURE_directwrite1 AND libs.dwrite_3 OR FIXME
    EMIT_IF WIN32
)
qt_feature("directwrite2" PRIVATE
    LABEL "DirectWrite 2"
    CONDITION QT_FEATURE_directwrite1 AND libs.dwrite_2 OR FIXME
    EMIT_IF WIN32
)
qt_feature("dxguid" PRIVATE
    LABEL "DirectX GUID"
    CONDITION WIN32 AND libs.dxguid OR FIXME
)
qt_feature("direct3d9" PRIVATE
    LABEL "Direct 3D 9"
    CONDITION WIN32 AND NOT WINRT AND libs.d3d9 OR FIXME
)
qt_feature("dxgi" PRIVATE
    LABEL "DirectX GI"
    CONDITION WIN32 AND libs.dxgi OR FIXME
)
qt_feature("dxgi1_2" PRIVATE
    LABEL "DirectX GI 1.2"
    CONDITION QT_FEATURE_dxgi AND libs.dxgi1_2 OR FIXME
)
qt_feature("direct3d11" PRIVATE
    LABEL "Direct 3D 11"
    CONDITION QT_FEATURE_dxgi AND libs.d3d11 OR FIXME
)
qt_feature("direct3d11_1" PRIVATE
    LABEL "Direct 3D 11.1"
    CONDITION QT_FEATURE_direct3d11 AND QT_FEATURE_dxgi1_2 AND libs.d3d11_1 OR FIXME
)
qt_feature("direct2d" PRIVATE
    LABEL "Direct 2D"
    CONDITION WIN32 AND NOT WINRT AND QT_FEATURE_direct3d11 AND libs.d2d1 OR FIXME
)
qt_feature("direct2d1_1" PRIVATE
    LABEL "Direct 2D 1.1"
    CONDITION QT_FEATURE_direct2d AND libs.d2d1_1 OR FIXME
)
qt_feature("evdev" PRIVATE
    LABEL "evdev"
    CONDITION QT_FEATURE_thread AND TEST_evdev
)
qt_feature("freetype" PUBLIC PRIVATE
    SECTION "Fonts"
    LABEL "FreeType"
    PURPOSE "Supports the FreeType 2 font engine (and its supported font formats)."
)
qt_feature_definition("freetype" "QT_NO_FREETYPE" NEGATE VALUE "1")
qt_feature("fontconfig" PUBLIC PRIVATE
    LABEL "Fontconfig"
    AUTODETECT NOT APPLE
    CONDITION NOT MSVC AND ON AND FONTCONFIG_FOUND
)
qt_feature_definition("fontconfig" "QT_NO_FONTCONFIG" NEGATE VALUE "1")
qt_feature("gbm"
    LABEL "GBM"
    CONDITION gbm_FOUND
)
qt_feature_config("gbm" QMAKE_PUBLIC_QT_CONFIG)
qt_feature("harfbuzz" PUBLIC PRIVATE
    LABEL "HarfBuzz"
    CONDITION harfbuzz_FOUND
)
qt_feature_definition("harfbuzz" "QT_NO_HARFBUZZ" NEGATE VALUE "1")
qt_feature("qqnx_imf" PRIVATE
    LABEL "IMF"
    CONDITION libs.imf OR FIXME
    EMIT_IF QNX
)
qt_feature("integrityfb" PRIVATE
    SECTION "Platform plugins"
    LABEL "INTEGRITY framebuffer"
    CONDITION INTEGRITY AND TEST_integrityfb
)
qt_feature("kms" PRIVATE
    LABEL "KMS"
    CONDITION Libdrm_FOUND
)
qt_feature_config("kms" QMAKE_PUBLIC_QT_CONFIG)
qt_feature("drm_atomic" PRIVATE
    LABEL "DRM Atomic API"
    CONDITION Libdrm_FOUND AND TEST_drm_atomic
)
qt_feature("libinput" PRIVATE
    LABEL "libinput"
    CONDITION QT_FEATURE_libudev AND Libinput_FOUND
)
qt_feature("integrityhid" PRIVATE
    LABEL "INTEGRITY HID"
    CONDITION INTEGRITY AND libs.integrityhid OR FIXME
)
qt_feature("libinput-axis-api" PRIVATE
    LABEL "axis API in libinput"
    CONDITION QT_FEATURE_libinput AND ON
)
qt_feature("lgmon"
    LABEL "lgmon"
    CONDITION libs.lgmon OR FIXME
    EMIT_IF QNX
)
qt_feature_config("lgmon" QMAKE_PRIVATE_CONFIG)
qt_feature("linuxfb" PRIVATE
    SECTION "Platform plugins"
    LABEL "LinuxFB"
    CONDITION TEST_linuxfb AND QT_FEATURE_regularexpression
)
qt_feature("vsp2" PRIVATE
    LABEL "VSP2"
    AUTODETECT OFF
    CONDITION libs.v4l2 OR FIXME
)
qt_feature("vnc" PRIVATE
    SECTION "Platform plugins"
    LABEL "VNC"
    CONDITION ( UNIX AND NOT ANDROID AND NOT APPLE ) AND ( QT_FEATURE_regularexpression AND QT_FEATURE_network )
)
qt_feature("mtdev" PRIVATE
    LABEL "mtdev"
    CONDITION Mtdev_FOUND
)
qt_feature("opengles2" PUBLIC
    LABEL "OpenGL ES 2.0"
    CONDITION NOT WIN32 AND ( NOT APPLE_WATCHOS AND NOT QT_FEATURE_opengl_desktop AND GLESv2_FOUND )
    ENABLE INPUT_opengl STREQUAL 'es2' OR INPUT_angle STREQUAL 'yes'
    DISABLE INPUT_opengl STREQUAL 'desktop' OR INPUT_opengl STREQUAL 'dynamic' OR INPUT_opengl STREQUAL 'no'
)
qt_feature_definition("opengles2" "QT_OPENGL_ES")
qt_feature_definition("opengles2" "QT_OPENGL_ES_2")
qt_feature_config("opengles2" QMAKE_PUBLIC_QT_CONFIG)
qt_feature("opengles3" PUBLIC
    LABEL "OpenGL ES 3.0"
    CONDITION QT_FEATURE_opengles2 AND NOT QT_FEATURE_angle AND TEST_opengles3
)
qt_feature_definition("opengles3" "QT_OPENGL_ES_3")
qt_feature("opengles31" PUBLIC
    LABEL "OpenGL ES 3.1"
    CONDITION QT_FEATURE_opengles3 AND TEST_opengles31
)
qt_feature_definition("opengles31" "QT_OPENGL_ES_3_1")
qt_feature("opengles32" PUBLIC
    LABEL "OpenGL ES 3.2"
    CONDITION QT_FEATURE_opengles31 AND TEST_opengles32
)
qt_feature_definition("opengles32" "QT_OPENGL_ES_3_2")
qt_feature("opengl-desktop"
    LABEL "Desktop OpenGL"
    CONDITION ( WIN32 AND NOT WINRT AND NOT QT_FEATURE_opengles2 AND ( MSVC OR OpenGL_OpenGL_FOUND ) ) OR ( NOT APPLE_WATCHOS AND NOT WIN32 AND NOT WASM AND OpenGL_OpenGL_FOUND )
    ENABLE INPUT_opengl STREQUAL 'desktop'
    DISABLE INPUT_opengl STREQUAL 'es2' OR INPUT_opengl STREQUAL 'dynamic' OR INPUT_opengl STREQUAL 'no'
)
qt_feature("opengl-dynamic"
    LABEL "Dynamic OpenGL"
    AUTODETECT OFF
    CONDITION WIN32 AND NOT WINRT
    DISABLE INPUT_angle STREQUAL 'yes' OR INPUT_opengl STREQUAL 'no' OR INPUT_opengl STREQUAL 'desktop'
)
qt_feature("dynamicgl" PUBLIC
    LABEL "Dynamic OpenGL: dynamicgl"
    CONDITION QT_FEATURE_opengl_dynamic
    DISABLE INPUT_angle STREQUAL 'yes' OR INPUT_opengl STREQUAL 'no' OR INPUT_opengl STREQUAL 'desktop'
)
qt_feature_definition("opengl-dynamic" "QT_OPENGL_DYNAMIC")
qt_feature("opengl" PUBLIC
    LABEL "OpenGL"
    CONDITION QT_FEATURE_opengl_desktop OR QT_FEATURE_opengl_dynamic OR QT_FEATURE_opengles2
)
qt_feature_definition("opengl" "QT_NO_OPENGL" NEGATE VALUE "1")
qt_feature("vkgen" PRIVATE
    LABEL "vkgen"
    CONDITION QT_FEATURE_xmlstreamreader
)
qt_feature("vulkan" PUBLIC
    LABEL "Vulkan"
    CONDITION QT_FEATURE_vkgen AND Vulkan_FOUND
)
qt_feature("openvg" PUBLIC
    LABEL "OpenVG"
    CONDITION libs.openvg OR FIXME
)
qt_feature("egl" PUBLIC PRIVATE
    LABEL "EGL"
    CONDITION ( QT_FEATURE_opengl OR QT_FEATURE_openvg ) AND ( QT_FEATURE_angle OR EGL_FOUND ) AND ( QT_FEATURE_dlopen OR NOT UNIX OR INTEGRITY )
)
qt_feature_definition("egl" "QT_NO_EGL" NEGATE VALUE "1")
qt_feature("egl_x11" PRIVATE
    LABEL "EGL on X11"
    CONDITION QT_FEATURE_thread AND QT_FEATURE_egl AND TEST_egl_x11
)
qt_feature("eglfs" PRIVATE
    SECTION "Platform plugins"
    LABEL "EGLFS"
    CONDITION NOT ANDROID AND NOT APPLE AND NOT WIN32 AND NOT WASM AND QT_FEATURE_egl
)
qt_feature("eglfs_brcm" PRIVATE
    LABEL "EGLFS Raspberry Pi"
    CONDITION QT_FEATURE_eglfs AND TEST_egl_brcm
)
qt_feature("eglfs_egldevice" PRIVATE
    LABEL "EGLFS EGLDevice"
    CONDITION QT_FEATURE_eglfs AND TEST_egl_egldevice AND QT_FEATURE_kms
)
qt_feature("eglfs_gbm" PRIVATE
    LABEL "EGLFS GBM"
    CONDITION QT_FEATURE_eglfs AND gbm_FOUND AND QT_FEATURE_kms
)
qt_feature("eglfs_vsp2" PRIVATE
    LABEL "EGLFS VSP2"
    CONDITION QT_FEATURE_eglfs AND gbm_FOUND AND QT_FEATURE_kms AND QT_FEATURE_vsp2
)
qt_feature("eglfs_mali" PRIVATE
    LABEL "EGLFS Mali"
    CONDITION QT_FEATURE_eglfs AND ( TEST_egl_mali OR TEST_egl_mali_2 )
)
qt_feature("eglfs_viv" PRIVATE
    LABEL "EGLFS i.Mx6"
    CONDITION QT_FEATURE_eglfs AND TEST_egl_viv
)
qt_feature("eglfs_rcar" PRIVATE
    LABEL "EGLFS RCAR"
    CONDITION INTEGRITY AND QT_FEATURE_eglfs AND TEST_egl_rcar
)
qt_feature("eglfs_viv_wl" PRIVATE
    LABEL "EGLFS i.Mx6 Wayland"
    CONDITION QT_FEATURE_eglfs_viv AND Wayland_FOUND
)
qt_feature("eglfs_openwfd" PRIVATE
    LABEL "EGLFS OpenWFD"
    CONDITION INTEGRITY AND QT_FEATURE_eglfs AND TEST_egl_openwfd
)
qt_feature("eglfs_x11" PRIVATE
    LABEL "EGLFS X11"
    CONDITION QT_FEATURE_eglfs AND QT_FEATURE_xcb_xlib AND QT_FEATURE_egl_x11
)
qt_feature("gif" PRIVATE
    LABEL "GIF"
    CONDITION QT_FEATURE_imageformatplugin
)
qt_feature_definition("gif" "QT_NO_IMAGEFORMAT_GIF" NEGATE)
qt_feature("ico" PUBLIC PRIVATE
    LABEL "ICO"
    CONDITION QT_FEATURE_imageformatplugin
)
qt_feature_definition("ico" "QT_NO_ICO" NEGATE VALUE "1")
qt_feature("jpeg" PRIVATE
    LABEL "JPEG"
    CONDITION QT_FEATURE_imageformatplugin AND JPEG_FOUND
    DISABLE INPUT_libjpeg STREQUAL 'no'
)
qt_feature_definition("jpeg" "QT_NO_IMAGEFORMAT_JPEG" NEGATE)
qt_feature("png" PRIVATE
    LABEL "PNG"
    DISABLE INPUT_libpng STREQUAL 'no'
)
qt_feature_definition("png" "QT_NO_IMAGEFORMAT_PNG" NEGATE)
qt_feature("sessionmanager" PUBLIC
    SECTION "Kernel"
    LABEL "Session Management"
    PURPOSE "Provides an interface to the windowing system's session management."
)
qt_feature_definition("sessionmanager" "QT_NO_SESSIONMANAGER" NEGATE VALUE "1")
qt_feature("tslib" PRIVATE
    LABEL "tslib"
    CONDITION Tslib_FOUND
)
qt_feature("tuiotouch" PRIVATE
    LABEL "TuioTouch"
    PURPOSE "Provides the TuioTouch input plugin."
    CONDITION QT_FEATURE_network AND QT_FEATURE_udpsocket
)
qt_feature("xcb" PRIVATE
    SECTION "Platform plugins"
    LABEL "XCB"
    AUTODETECT NOT APPLE
    CONDITION QT_FEATURE_thread AND TARGET XCB::XCB AND TEST_xcb_syslibs AND QT_FEATURE_xkbcommon_x11
)
qt_feature("xcb-glx-plugin" PRIVATE
    LABEL "GLX Plugin"
    CONDITION QT_FEATURE_xcb_xlib AND QT_FEATURE_opengl AND NOT QT_FEATURE_opengles2
    EMIT_IF QT_FEATURE_xcb
)
qt_feature("xcb-glx" PRIVATE
    LABEL "  XCB GLX"
    CONDITION XCB_GLX_FOUND
    EMIT_IF QT_FEATURE_xcb AND QT_FEATURE_xcb_glx_plugin
)
qt_feature("xcb-egl-plugin" PRIVATE
    LABEL "EGL-X11 Plugin"
    CONDITION QT_FEATURE_egl_x11 AND QT_FEATURE_opengl
    EMIT_IF QT_FEATURE_xcb
)
qt_feature("xcb-native-painting" PRIVATE
    LABEL "Native painting (experimental)"
    AUTODETECT OFF
    CONDITION QT_FEATURE_xcb_xlib AND QT_FEATURE_fontconfig AND XRender_FOUND
    EMIT_IF QT_FEATURE_xcb
)
qt_feature("xrender" PRIVATE
    LABEL "XRender for native painting"
    CONDITION QT_FEATURE_xcb_native_painting
    EMIT_IF QT_FEATURE_xcb AND QT_FEATURE_xcb_native_painting
)
qt_feature("xcb-xlib" PRIVATE
    LABEL "XCB Xlib"
    CONDITION QT_FEATURE_xlib AND X11_XCB_FOUND
)
qt_feature("xcb-sm" PRIVATE
    LABEL "xcb-sm"
    CONDITION QT_FEATURE_sessionmanager AND X11_SM_FOUND
    EMIT_IF QT_FEATURE_xcb
)
qt_feature("system-xcb-xinput" PRIVATE
    LABEL "Using system-provided xcb-xinput"
    CONDITION XCB_XINPUT_FOUND
    ENABLE INPUT_bundled_xcb_xinput STREQUAL 'no'
    DISABLE INPUT_bundled_xcb_xinput STREQUAL 'yes'
    EMIT_IF QT_FEATURE_xcb
)
qt_feature("xkbcommon" PRIVATE
    LABEL "xkbcommon"
    CONDITION XKB_FOUND
)
qt_feature("xkbcommon-x11" PRIVATE
    LABEL "xkbcommon-x11"
    CONDITION QT_FEATURE_xkbcommon AND XKB_FOUND
)
qt_feature("xlib" PRIVATE
    LABEL "XLib"
    AUTODETECT NOT APPLE OR QT_FEATURE_xcb
    CONDITION X11_FOUND
)
qt_feature("texthtmlparser" PUBLIC
    SECTION "Kernel"
    LABEL "HtmlParser"
    PURPOSE "Provides a parser for HTML."
)
qt_feature_definition("texthtmlparser" "QT_NO_TEXTHTMLPARSER" NEGATE VALUE "1")
qt_feature("textmarkdownreader" PUBLIC
    SECTION "Kernel"
    LABEL "MarkdownReader"
    PURPOSE "Provides a Markdown (CommonMark and GitHub) reader"
    ENABLE INPUT_libmd4c STREQUAL 'system' OR INPUT_libmd4c STREQUAL 'qt' OR INPUT_libmd4c STREQUAL 'yes'
    DISABLE INPUT_libmd4c STREQUAL 'no'
)
qt_feature("system-textmarkdownreader" PUBLIC
    SECTION "Kernel"
    LABEL "  Using system libmd4c"
    CONDITION libs.libmd4c OR FIXME
    ENABLE INPUT_libmd4c STREQUAL 'system'
    DISABLE INPUT_libmd4c STREQUAL 'qt'
)
qt_feature("textmarkdownwriter" PUBLIC
    SECTION "Kernel"
    LABEL "MarkdownWriter"
    PURPOSE "Provides a Markdown (CommonMark) writer"
)
qt_feature("textodfwriter" PUBLIC
    SECTION "Kernel"
    LABEL "OdfWriter"
    PURPOSE "Provides an ODF writer."
    CONDITION QT_FEATURE_xmlstreamwriter
)
qt_feature_definition("textodfwriter" "QT_NO_TEXTODFWRITER" NEGATE VALUE "1")
qt_feature("cssparser" PUBLIC
    SECTION "Kernel"
    LABEL "CssParser"
    PURPOSE "Provides a parser for Cascading Style Sheets."
)
qt_feature_definition("cssparser" "QT_NO_CSSPARSER" NEGATE VALUE "1")
qt_feature("draganddrop" PUBLIC
    SECTION "Kernel"
    LABEL "Drag and Drop"
    PURPOSE "Supports the drag and drop mechansim."
    CONDITION QT_FEATURE_imageformat_xpm
)
qt_feature_definition("draganddrop" "QT_NO_DRAGANDDROP" NEGATE VALUE "1")
qt_feature("action" PUBLIC
    SECTION "Kernel"
    LABEL "Q(Gui)Action(Group)"
    PURPOSE "Provides abstract user interface actions."
)
qt_feature_definition("action" "QT_NO_ACTION" NEGATE VALUE "1")
qt_feature("cursor" PUBLIC
    SECTION "Kernel"
    LABEL "QCursor"
    PURPOSE "Provides mouse cursors."
)
qt_feature_definition("cursor" "QT_NO_CURSOR" NEGATE VALUE "1")
qt_feature("clipboard" PUBLIC
    SECTION "Kernel"
    LABEL "QClipboard"
    PURPOSE "Provides cut and paste operations."
    CONDITION NOT INTEGRITY AND NOT QNX AND NOT rtems
)
qt_feature_definition("clipboard" "QT_NO_CLIPBOARD" NEGATE VALUE "1")
qt_feature("wheelevent" PUBLIC
    SECTION "Kernel"
    LABEL "QWheelEvent"
    PURPOSE "Supports wheel events."
)
qt_feature_definition("wheelevent" "QT_NO_WHEELEVENT" NEGATE VALUE "1")
qt_feature("tabletevent" PUBLIC
    SECTION "Kernel"
    LABEL "QTabletEvent"
    PURPOSE "Supports tablet events."
)
qt_feature_definition("tabletevent" "QT_NO_TABLETEVENT" NEGATE VALUE "1")
qt_feature("im" PUBLIC
    SECTION "Kernel"
    LABEL "QInputContext"
    PURPOSE "Provides complex input methods."
    CONDITION QT_FEATURE_library
)
qt_feature_definition("im" "QT_NO_IM" NEGATE VALUE "1")
qt_feature("highdpiscaling" PUBLIC
    SECTION "Kernel"
    LABEL "High DPI Scaling"
    PURPOSE "Provides automatic scaling of DPI-unaware applications on high-DPI displays."
)
qt_feature_definition("highdpiscaling" "QT_NO_HIGHDPISCALING" NEGATE VALUE "1")
qt_feature("validator" PUBLIC
    SECTION "Widgets"
    LABEL "QValidator"
    PURPOSE "Supports validation of input text."
)
qt_feature_definition("validator" "QT_NO_VALIDATOR" NEGATE VALUE "1")
qt_feature("standarditemmodel" PUBLIC
    SECTION "ItemViews"
    LABEL "QStandardItemModel"
    PURPOSE "Provides a generic model for storing custom data."
    CONDITION QT_FEATURE_itemmodel
)
qt_feature_definition("standarditemmodel" "QT_NO_STANDARDITEMMODEL" NEGATE VALUE "1")
qt_feature("imageformatplugin" PUBLIC
    SECTION "Images"
    LABEL "QImageIOPlugin"
    PURPOSE "Provides a base for writing a image format plugins."
)
qt_feature_definition("imageformatplugin" "QT_NO_IMAGEFORMATPLUGIN" NEGATE VALUE "1")
qt_feature("movie" PUBLIC
    SECTION "Images"
    LABEL "QMovie"
    PURPOSE "Supports animated images."
)
qt_feature_definition("movie" "QT_NO_MOVIE" NEGATE VALUE "1")
qt_feature("imageformat_bmp" PUBLIC
    SECTION "Images"
    LABEL "BMP Image Format"
    PURPOSE "Supports Microsoft's Bitmap image file format."
)
qt_feature_definition("imageformat_bmp" "QT_NO_IMAGEFORMAT_BMP" NEGATE VALUE "1")
qt_feature("imageformat_ppm" PUBLIC
    SECTION "Images"
    LABEL "PPM Image Format"
    PURPOSE "Supports the Portable Pixmap image file format."
)
qt_feature_definition("imageformat_ppm" "QT_NO_IMAGEFORMAT_PPM" NEGATE VALUE "1")
qt_feature("imageformat_xbm" PUBLIC
    SECTION "Images"
    LABEL "XBM Image Format"
    PURPOSE "Supports the X11 Bitmap image file format."
)
qt_feature_definition("imageformat_xbm" "QT_NO_IMAGEFORMAT_XBM" NEGATE VALUE "1")
qt_feature("imageformat_xpm" PUBLIC
    SECTION "Images"
    LABEL "XPM Image Format"
    PURPOSE "Supports the X11 Pixmap image file format."
)
qt_feature_definition("imageformat_xpm" "QT_NO_IMAGEFORMAT_XPM" NEGATE VALUE "1")
qt_feature("imageformat_png" PUBLIC
    SECTION "Images"
    LABEL "PNG Image Format"
    PURPOSE "Supports the Portable Network Graphics image file format."
)
qt_feature_definition("imageformat_png" "QT_NO_IMAGEFORMAT_PNG" NEGATE VALUE "1")
qt_feature("imageformat_jpeg" PUBLIC
    SECTION "Images"
    LABEL "JPEG Image Format"
    PURPOSE "Supports the Joint Photographic Experts Group image file format."
)
qt_feature_definition("imageformat_jpeg" "QT_NO_IMAGEFORMAT_JPEG" NEGATE VALUE "1")
qt_feature("image_heuristic_mask" PUBLIC
    SECTION "Images"
    LABEL "QImage::createHeuristicMask()"
    PURPOSE "Supports creating a 1-bpp heuristic mask for images."
)
qt_feature_definition("image_heuristic_mask" "QT_NO_IMAGE_HEURISTIC_MASK" NEGATE VALUE "1")
qt_feature("image_text" PUBLIC
    SECTION "Images"
    LABEL "Image Text"
    PURPOSE "Supports image file text strings."
)
qt_feature_definition("image_text" "QT_NO_IMAGE_TEXT" NEGATE VALUE "1")
qt_feature("picture" PUBLIC
    SECTION "Painting"
    LABEL "QPicture"
    PURPOSE "Supports recording and replaying QPainter commands."
)
qt_feature_definition("picture" "QT_NO_PICTURE" NEGATE VALUE "1")
qt_feature("colornames" PUBLIC
    SECTION "Painting"
    LABEL "Color Names"
    PURPOSE "Supports color names such as \"red\", used by QColor and by some HTML documents."
)
qt_feature_definition("colornames" "QT_NO_COLORNAMES" NEGATE VALUE "1")
qt_feature("pdf" PUBLIC
    SECTION "Painting"
    LABEL "QPdf"
    PURPOSE "Provides a PDF backend for QPainter."
    CONDITION QT_FEATURE_temporaryfile
)
qt_feature_definition("pdf" "QT_NO_PDF" NEGATE VALUE "1")
qt_feature("desktopservices" PUBLIC
    SECTION "Utilities"
    LABEL "QDesktopServices"
    PURPOSE "Provides methods for accessing common desktop services."
)
qt_feature_definition("desktopservices" "QT_NO_DESKTOPSERVICES" NEGATE VALUE "1")
qt_feature("systemtrayicon" PUBLIC
    SECTION "Utilities"
    LABEL "QSystemTrayIcon"
    PURPOSE "Provides an icon for an application in the system tray."
    CONDITION QT_FEATURE_temporaryfile
)
qt_feature_definition("systemtrayicon" "QT_NO_SYSTEMTRAYICON" NEGATE VALUE "1")
qt_feature("accessibility" PUBLIC
    SECTION "Utilities"
    LABEL "Accessibility"
    PURPOSE "Provides accessibility support."
    CONDITION QT_FEATURE_properties
)
qt_feature_definition("accessibility" "QT_NO_ACCESSIBILITY" NEGATE VALUE "1")
qt_feature("multiprocess" PRIVATE
    SECTION "Utilities"
    LABEL "Multi process"
    PURPOSE "Provides support for detecting the desktop environment, launching external processes and opening URLs."
    CONDITION NOT INTEGRITY AND NOT rtems
)
qt_feature("whatsthis" PUBLIC
    SECTION "Widget Support"
    LABEL "QWhatsThis"
    PURPOSE "Supports displaying \"What's this\" help."
)
qt_feature_definition("whatsthis" "QT_NO_WHATSTHIS" NEGATE VALUE "1")
qt_feature("raster-64bit" PRIVATE
    SECTION "Painting"
    LABEL "QPainter - 64 bit raster"
    PURPOSE "Internal painting support for 64 bit (16 bpc) rasterization."
)
