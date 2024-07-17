package com.example.MultiRubro.consumerRabbitMQ;



import com.example.MultiRubro.models.Client;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.DataInput;


@Component
public class Consumer {

    @Autowired
    private ObjectMapper objectMapper;
    private static final Logger logger = LoggerFactory.getLogger(Consumer.class);
    @RabbitListener(queues = {"cola1"})
    public void recieveMessage(@Payload String message){
        try {
            Client client = objectMapper.readValue(message, Client.class);
            logger.info("Received message: {}", client);
            makeSlow();
        } catch (Exception e) {
            logger.error("Error converting JSON to Client object: {}", e.getMessage());
        }
    }

    private void makeSlow(){
            try{
                Thread.sleep(500);
            }catch (InterruptedException e){
                e.printStackTrace();
            }

    }
}
