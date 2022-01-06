cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(minecraft_upscale)

set(Torch_DIR "/libtorch/share/cmake/Torch")
find_package(Torch REQUIRED)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${TORCH_CXX_FLAGS}")

add_executable(minecraft_upscale src/main.cpp)
target_link_libraries(minecraft_upscale "${TORCH_LIBRARIES}")
target_include_directories(minecraft_upscale PUBLIC
                           "${PROJECT_BINARY_DIR}"
                          )

set_property(TARGET minecraft_upscale PROPERTY CXX_STANDARD 20)