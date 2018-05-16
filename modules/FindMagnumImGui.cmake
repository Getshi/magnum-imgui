# include imgui headers (rel to prefix path i assume)

# add imgui library

find_library(MAGNUMIMGUI_LIBRARY NAMES MagnumImGui) # standard naming conventions: libImGui.a/.so

# Include dir --> FIND DIRs TO INCLUDE (RELTOPREFIXPATH)
find_path(MAGNUMIMGUI_INCLUDE_DIR NAMES
    MagnumImGui.h
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MagnumImGui REQUIRED_VARS MAGNUMIMGUI_LIBRARY MAGNUMIMGUI_INCLUDE_DIR)

if(TARGET Magnum::ImGui)
   set(MAGNUMIMGUI_FOUND TRUE)
else()
        # Work around BUGGY framework support on macOS
        # http://public.kitware.com/pipermail/cmake/2016-April/063179.html
        #if(CORRADE_TARGET_APPLE AND ${IMGUI_LIBRARY} MATCHES "\\.framework$")
        #    add_library(ImGui INTERFACE IMPORTED)
        #    set_property(TARGET ImGui APPEND PROPERTY
        #        INTERFACE_LINK_LIBRARIES ${IMGUI_LIBRARY})
        #else()
            add_library(Magnum::ImGui UNKNOWN IMPORTED)
            set_property(TARGET Magnum::ImGui APPEND PROPERTY
                IMPORTED_LOCATION ${MAGNUMIMGUI_LIBRARY})
        #endif()

    # include directories
    set_property(TARGET Magnum::ImGui APPEND PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${MAGNUMIMGUI_INCLUDE_DIR})

    # dependency links and includes (at least find magnum appears to link its header to the includes, similar to here?
find_package(ImGui REQUIRED)
set_property(TARGET Magnum::ImGui APPEND PROPERTY
    INTERFACE_LINK_LIBRARIES ImGui)
find_package(Magnum REQUIRED Shaders)
set_property(TARGET Magnum::ImGui APPEND PROPERTY
    INTERFACE_LINK_LIBRARIES Magnum::Shaders)


endif()
