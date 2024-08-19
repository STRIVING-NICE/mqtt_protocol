
# MQTT 协议项目
MQTT（Message Queuing Telemetry Transport，消息队列遥测传输协议），是一种基于发布/订阅（publish/subscribe）模式的“轻量级”通讯协议，该协议构建于TCP/IP协议上。MQTT最大优点在于，可以以极少的代码和有限的带宽，为连接远程设备提供实时可靠的消息服务。做为一种低开销、低带宽占用的即时通讯协议，使其在物联网、小型设备、移动应用等方面有较广泛的应用。

该项目使用 Paho MQTT C 库实现了一个 MQTT 客户端和服务器。项目中包含了客户端和服务器应用程序，以及用于验证功能的测试用例。

## 目录结构

```bash
mqtt_protocol/
├── build                    # 包含构建产物的目录
│   ├── CMakeCache.txt
│   ├── CMakeFiles
│   ├── cmake_install.cmake
│   ├── Makefile
│   ├── mqtt
│   ├── mqtt_client_test
│   └── mqtt_server_test
├── CMakeLists.txt           
├── LICENSE                   
├── mqtt/
│   ├── CMakeLists.txt        # MQTT 组件的 CMake 配置
│   ├── mqtt_client.cpp       # MQTT 客户端实现(暂未用)
│   ├── mqtt.cpp              # 核心 MQTT 实现
│   ├── mqtt.h                # MQTT 组件的头文件
│   └── mqtt_server.cpp       # MQTT 服务器实现(暂未用)
├── mqtt_client_test.cpp      # MQTT 客户端测试用例
├── mqtt_server_test.cpp      # MQTT 服务器测试用例
├── README.md               
└── third_party/
    └── paho.mqtt.c           # Paho MQTT C 库（第三方依赖）
```

## 入门指南

### 先决条件

- CMake
- C++ 编译器（例如，GCC、Clang）
- Paho MQTT C 库（已包含在 `third_party/paho.mqtt.c` 中）

### 构建项目

1. 克隆代码库：

   ```bash
   git clone <repository_url>
   cd mqtt_protocol
   ```

2. 创建一个构建目录并进入该目录：

   ```bash
   mkdir build
   cd build
   ```

3. 运行 CMake 以生成 Makefile：

   ```bash
   cmake ..
   ```

4. 构建项目：

   ```bash
   make
   ```

### 运行应用程序

#### MQTT 服务器

运行 MQTT 服务器：

```bash
./build/mqtt_server_test
```

#### MQTT 客户端

运行 MQTT 客户端：

```bash
./build/mqtt_client_test
```

### 测试

项目中包含了用于 MQTT 客户端和服务器的测试用例。构建项目后，你可以使用生成的二进制文件运行测试：

- 运行 MQTT 客户端测试：

  ```bash
  ./build/mqtt_client_test
  ```

- 运行 MQTT 服务器测试：

  ```bash
  ./build/mqtt_server_test
  ```

### 许可证

该项目的许可证信息请参阅代码库中的 [LICENSE](/LICENSE) 文件。
