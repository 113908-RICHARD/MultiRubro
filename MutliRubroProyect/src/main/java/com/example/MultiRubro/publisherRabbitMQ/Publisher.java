package com.example.MultiRubro.publisherRabbitMQ;


import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@EnableRabbit
public class Publisher {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private Queue queue;


    public void sendMessage(Object message) {
        rabbitTemplate.convertAndSend("", queue.getName(), message);
        System.out.println("Message sent to RabbitMQ: " + message);
    }
}
