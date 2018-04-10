# Build library
find_package(Magnum REQUIRED
  Shaders
  Sdl2Application)
include_directories(${SDL2_INCLUDE_DIR})

add_library(MagnumImGui MagnumImGui.cpp)


find_package(ImGui REQUIRED)
target_link_libraries(MagnumImGui
ImGui
)

install(TARGETS MagnumImGui DESTINATION "lib/")
install(FILES MagnumImGui.h DESTINATION "include/")

# Build exmaple
if(BUILD_EXAMPLE)
add_executable(Example Example.cpp)


#find_library(IMGUI_LIB ImGui)
target_link_libraries(Example
  Magnum::Application
  Magnum::Magnum
  Magnum::Shaders
  MagnumImGui
#  ImGui
)
endif()
