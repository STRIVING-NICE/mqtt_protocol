cmake_minimum_required(VERSION 3.10)

# 项目名称
project(mqtt_protocol)

# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 查找 OpenSSL
find_package(OpenSSL REQUIRED)

# 添加 CMake 模块路径，以找到 PahoMqttC
list(APPEND CMAKE_PREFIX_PATH "/usr/local/lib/cmake/eclipse-paho-mqtt-c")

# 查找 PahoMqttC 库
find_package(eclipse-paho-mqtt-c REQUIRED)

# 添加包含实际库和源文件的子目录
add_subdirectory(mqtt)

# 添加 mqtt_client_test 可执行文件
# add_executable(mqtt_client_test mqtt_client_test.cpp)
# add_executable(mqtt_server_test mqtt_server_test.cpp)

# 自动查找所有的测试源文件
file(GLOB TEST_SOURCES "${CMAKE_SOURCE_DIR}/*.cpp")

# 为每个测试源文件创建可执行文件并链接 mqtt 库
foreach(test_src ${TEST_SOURCES})
    get_filename_component(test_name ${test_src} NAME_WE)
    add_executable(${test_name} ${test_src})
    # 将 mqtt 库和 PahoMqttC 库链接到测试可执行文件
    target_link_libraries(${test_name} mqtt eclipse-paho-mqtt-c::paho-mqtt3c OpenSSL::SSL OpenSSL::Crypto)
endforeach()

# 将 mqtt 库和 PahoMqttC 库链接到测试可执行文件
# target_link_libraries(mqtt_client_test mqtt eclipse-paho-mqtt-c::paho-mqtt3c OpenSSL::SSL OpenSSL::Crypto)

