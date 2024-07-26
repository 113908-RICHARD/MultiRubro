package com.example.MultiRubro.consumerRabbitMQ;



import com.example.MultiRubro.models.Client;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
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
    @RabbitListener(queues = {"UpdateStockQueue"})
    public void recieveMessage(@Payload String message) throws JsonProcessingException {
        try {
            Client client = objectMapper.readValue(message, Client.class);
            logger.info("Received message: {}", client);

        } catch (JsonParseException e) {
            logger.error("Error converting JSON to Client object: {}", e.getMessage());
        }
    }


}
