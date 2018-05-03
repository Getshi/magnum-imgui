# include imgui headers (rel to prefix path i assume)

# add imgui library

find_library(IMGUI_LIBRARY NAMES ImGui) # standard naming conventions: libImGui.a/.so

# Include dir --> FIND DIRs TO INCLUDE (RELTOPREFIXPATH)
find_path(IMGUI_INCLUDE_DIR NAMES
    imgui.h
    imconfig.h
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ImGui REQUIRED_VARS IMGUI_LIBRARY IMGUI_INCLUDE_DIR)


if(TARGET ImGui)
   set(IMGUI_FOUND TRUE)
else(NOT TARGET ImGui)
        # Work around BUGGY framework support on macOS
        # http://public.kitware.com/pipermail/cmake/2016-April/063179.html
        #if(CORRADE_TARGET_APPLE AND ${IMGUI_LIBRARY} MATCHES "\\.framework$")
        #    add_library(ImGui INTERFACE IMPORTED)
        #    set_property(TARGET ImGui APPEND PROPERTY
        #        INTERFACE_LINK_LIBRARIES ${IMGUI_LIBRARY})
        #else()
            add_library(ImGui UNKNOWN IMPORTED)
            set_property(TARGET ImGui APPEND PROPERTY
                IMPORTED_LOCATION ${IMGUI_LIBRARY})
        #endif()

    # include directories
    set_property(TARGET ImGui APPEND PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${IMGUI_INCLUDE_DIR})



endif()
