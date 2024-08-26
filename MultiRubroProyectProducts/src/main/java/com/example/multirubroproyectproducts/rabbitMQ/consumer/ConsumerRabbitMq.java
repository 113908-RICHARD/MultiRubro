package com.example.multirubroproyectproducts.rabbitMQ.consumer;


import com.example.multirubroproyectproducts.requests.Products.UpdateProductStockRequest;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.services.Implementation.ProductService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import org.slf4j.Logger;

@Component
public class ConsumerRabbitMq {


    @Autowired
    private ProductService productService;

    private static final Logger logger = LoggerFactory.getLogger(ConsumerRabbitMq.class);

    @RabbitListener(queues = {"UpdateStockQueue"})
    public void  receiveMessage(UpdateProductStockRequest message) {
        try {
            if (message == null) {
                throw new IllegalArgumentException("Invalid message received");
            }

            GenericResponse<Boolean> response = productService.updateProductStock(message);
            logger.info(response.getMessage());
        } catch (Exception e) {
            logger.error("Failed to process the message", e);
        }
    }
}
