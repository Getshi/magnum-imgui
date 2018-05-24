# Build library
find_package(Magnum REQUIRED
  Shaders
)

add_library(MagnumImGui MagnumImGui.cpp)
target_link_libraries(MagnumImGui
  Magnum::Shaders
)

find_package(ImGui REQUIRED)
target_link_libraries(MagnumImGui
ImGui
) # nothing to dynamically link from imgui, only header

install(TARGETS MagnumImGui DESTINATION "lib/")
install(FILES MagnumImGui.h DESTINATION "include/")
install(FILES ../modules/FindMagnumImGui.cmake DESTINATION "share/cmake/MagnumImGui")
install(FILES ../modules/MagnumImGuiConfig.cmake DESTINATION "share/cmake/MagnumImGui")
install(FILES ../modules/FindImGui.cmake DESTINATION "share/cmake/ImGui")
install(FILES ../modules/ImGuiConfig.cmake DESTINATION "share/cmake/ImGui")

# Build exmaple
if(BUILD_EXAMPLE)
add_executable(Example Example.cpp)

find_package(Magnum REQUIRED
  Sdl2Application
)
include_directories(${SDL2_INCLUDE_DIR})


#find_library(IMGUI_LIB ImGui)
target_link_libraries(Example
  Magnum::Application
  Magnum::Magnum
  Magnum::Shaders
  Magnum::GL
  MagnumImGui
#  ImGui
)
endif()
