#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h> // For sleep()
#include <MQTTClient.h>

#define ADDRESS "tcp://localhost:1883"
#define CLIENTID "Client"
#define TOPIC "test"
#define QOS 1
#define TIMEOUT 10000L

// 发出退出信号的全局变量
volatile int keepRunning = 1;

// Signal handler to set the exit flag
void handle_signal(int signal)
{
    keepRunning = 0;
}

int messageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message)
{
    if (message == NULL)
    {
        printf("Received a NULL message.\n");
        return 0;
    }
    printf("Message arrived callback triggered.\n");

    // 确保缓冲区不溢出
    char payload[1024];
    size_t payload_len = message->payloadlen < sizeof(payload) - 1 ? message->payloadlen : sizeof(payload) - 1;
    strncpy(payload, (char *)message->payload, payload_len);
    payload[payload_len] = '\0';
    printf("Message arrived on topic %s: %s\n", topicName, payload);

    // Set exit flag if message is "Q" or "q"
    if (strcmp(payload, "Q") == 0 || strcmp(payload, "q") == 0)
    {
        printf("Exit command received. Exiting...\n");
        keepRunning = 0;
    }

    MQTTClient_freeMessage(&message);
    MQTTClient_free(topicName);

    return 1; // 确保返回值
}

int main()
{
    MQTTClient client;
    MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
    MQTTClient_message *message = NULL;
    MQTTClient_deliveryToken token;
    int rc;

    // Register signal handler
    signal(SIGINT, handle_signal);

    // 创建客户端
    rc = MQTTClient_create(&client, ADDRESS, CLIENTID, MQTTCLIENT_PERSISTENCE_NONE, NULL);
    if (rc != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to create client, return code %d\n", rc);
        return EXIT_FAILURE;
    }
    conn_opts.keepAliveInterval = 20;
    conn_opts.cleansession = 1;

    // 设置回调函数
    rc = MQTTClient_setCallbacks(client, NULL, NULL, messageArrived, NULL);
    if (rc != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to set callbacks, return code %d\n", rc);
        MQTTClient_disconnect(client, 10000);
        MQTTClient_destroy(&client);
        return EXIT_FAILURE;
    }
    else
    {
        printf("success to set callbacks, return code %d\n", rc);
    }

    // 连接到 MQTT 服务器
    rc = MQTTClient_connect(client, &conn_opts);
    if (rc != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to connect, return code %d\n", rc);
        MQTTClient_destroy(&client);
        return EXIT_FAILURE;
    }

    // 订阅主题
    rc = MQTTClient_subscribe(client, TOPIC, QOS);
    if (rc != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to subscribe to topic %s, return code %d\n", TOPIC, rc);
        MQTTClient_disconnect(client, 10000);
        MQTTClient_destroy(&client);
        return EXIT_FAILURE;
    }
    else
    {
        printf("Subscribed to topic: %s with QoS: %d\n", TOPIC, QOS);
    }

    // 等待消息到来
    // 方法一：信号量
    while (keepRunning)
    {
        sleep(1); // Sleep for a while to reduce CPU usage
                  // Wait for messages to arrive
    }

    // 方法二：
    // printf("Press Q<Enter> to quit.\n");
    // char c;
    // do
    // {
    //     c = getchar();
    // } while (c != 'Q' && c != 'q');

    // 断开连接并销毁客户端
    MQTTClient_unsubscribe(client, TOPIC);
    MQTTClient_disconnect(client, 10000);
    MQTTClient_destroy(&client);
    return EXIT_SUCCESS;
}