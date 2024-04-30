package com.example.MultiRubro.services.rabbitMQ;

import com.example.MultiRubro.consumerRabbitMQ.Consumer;
import com.example.MultiRubro.models.Client;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.publisherRabbitMQ.Publisher;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.init.UncategorizedScriptException;
import org.springframework.stereotype.Service;

@Service
public class messageManager {

    @Autowired
    private Publisher publisher;

    @Autowired
    private ObjectMapper objectMapper;
    private static final Logger logger = LoggerFactory.getLogger(Consumer.class);
    public void sendMessage(String message){
        logger.info("Message '{}' will be send ... " + message);
        User user = new User(1L,"genagamer1234","huevoduro13");
        Client client = new Client(1L,"genaro","montevideo 869","3513189089",user);
        try {
            String jsonMessage = objectMapper.writeValueAsString(client); // Convert Client object to JSON string
            this.publisher.sendMessage(jsonMessage);
        } catch (JsonProcessingException e) {
            logger.error("Error converting object to JSON: " + e.getMessage());
        }
    }
}
