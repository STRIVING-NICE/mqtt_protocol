# 从源文件创建库
add_library(mqtt
    mqtt.cpp
    mqtt_client.cpp
)

include_directories(${CMAKE_SOURCE_DIR}/third_party/paho.mqtt.c/src)

# 链接 OpenSSL 库
target_link_libraries(mqtt eclipse-paho-mqtt-c::paho-mqtt3a OpenSSL::SSL OpenSSL::Crypto)

# 包含当前目录以访问头文件
target_include_directories(mqtt PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
