#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <MQTTClient.h>

#define ADDRESS "tcp://localhost:1883"
#define CLIENTID "Server"
#define TOPIC "test"
#define QOS 1
#define TIMEOUT 10000L

// 添加回调函数: 添加一个回调函数来处理发布完成后的操作
void messageDelivered(void *context, MQTTClient_deliveryToken dt)
{
    printf("MessageDelivered with delivery token %d delivered.\n", dt);
}

// 空的消息到达回调函数
int messageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message)
{
    // 如果不需要处理消息，可以返回 1，表示消息已经被处理
    return 1;
}

// 空的连接丢失回调函数
void connectionLost(void *context, char *cause)
{
    printf("Connection lost, cause: %s\n", cause);
}

int main()
{
    // 声明 MQTT 客户端实例
    MQTTClient client;
    // 定义了一个连接选项结构体，并初始化为默认值
    MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
    int rc;

    // 创建一个 MQTT 客户端实例，指定连接的代理地址、客户端 ID、持久化选项（这里选择不持久化）
    rc = MQTTClient_create(&client, ADDRESS, CLIENTID, MQTTCLIENT_PERSISTENCE_NONE, NULL);
    if (rc != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to create client, return code %d\n", rc);
        return EXIT_FAILURE;
    }

    conn_opts.keepAliveInterval = 20;
    conn_opts.cleansession = 1;

    // 连接 MQTT 代理
    if ((rc = MQTTClient_connect(client, &conn_opts)) != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to connect, return code %d\n", rc);
        return EXIT_FAILURE;
    }

    /*
    回调函数通常是在 MQTT 建立连接后 设置的。
    通常的流程是先建立与 MQTT 代理的连接，然后设置回调函数，以确保当连接建立后，
    客户端能够正确处理从代理接收到的事件（如消息到达、连接丢失、消息传递完成等）。

    为什么要在连接后设置回调函数？
    确保连接成功：在设置回调函数之前，先确保与代理的连接是成功的。这样可以避免由于连接问题导致回调函数无法正常触发。
    事件处理：回调函数的主要作用是处理在连接建立之后从代理接收到的事件。如果在连接之前设置，回调函数没有机会处理这些事件。
    */

    // 设置回调函数，提供完整的回调函数集
    // rc = MQTTClient_setCallbacks(client, NULL, NULL, NULL, messageDelivered);
    rc = MQTTClient_setCallbacks(client, NULL, connectionLost, messageArrived, messageDelivered);
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

    while (1)
    {
        char message[1024];
        printf("Enter message (type 'exit' to quit): ");
        fgets(message, sizeof(message), stdin);
        message[strcspn(message, "\n")] = '\0';

        if (strcmp(message, "exit") == 0)
        {
            break;
        }

        //  初始化一个 MQTT 消息结构体，配置消息内容（payload）、长度、QoS 等参数
        MQTTClient_message pubmsg = MQTTClient_message_initializer;
        pubmsg.payload = message;
        pubmsg.payloadlen = strlen(message);
        pubmsg.qos = QOS;
        pubmsg.retained = 0; // 设置为 0，表示不保留该消息

        MQTTClient_deliveryToken token;                                     //发布消息到指定的主题，并获取一个传递令牌（token）
        int rc = MQTTClient_publishMessage(client, TOPIC, &pubmsg, &token); //阻塞程序，直到消息传递完成或达到超时
        if (rc != MQTTCLIENT_SUCCESS)
        {
            printf("Failed to publish message, return code %d\n", rc);
            // 在这里可以执行其他错误处理逻辑，比如重试发布或者退出程序
        }

        printf("Waiting for up to %d seconds for publication of %s\n"
               "on topic %s for client with ClientID: %s\n",
               (int)(TIMEOUT / 1000), message, TOPIC, CLIENTID);

        rc = MQTTClient_waitForCompletion(client, token, TIMEOUT);
        if (rc != MQTTCLIENT_SUCCESS)
        {
            printf("Failed to wait for message delivery, return code %d\n", rc);
            // 在这里可以处理等待失败的情况，比如记录日志或者重试等待
        }
        else
        {
            printf("Message with delivery token %d delivered\n", token);
        }
    }

    MQTTClient_disconnect(client, 10000); // 断开与代理的连接，等待最多 10 秒以确保所有未传递的消息都发送完毕
    MQTTClient_destroy(&client);          // 销毁 MQTT 客户端实例，释放资源
    return rc;
}