package com.example.multirubroproyectproducts.rabbitMq;

import com.example.multirubroproyectproducts.rabbitMQ.consumer.ConsumerRabbitMq;
import com.example.multirubroproyectproducts.requests.Products.UpdateProductStockRequest;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.services.IProductService;
import com.example.multirubroproyectproducts.services.Implementation.ProductService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;

import java.io.IOException;
import java.util.UUID;

import static org.mockito.Mockito.*;

@SpringBootTest(properties = {
        "app.url=http://localhost:8085",
        "app.dev-name=Developer Name",
        "app.dev-email=developer@example.com",
        "app.name=My Application",
        "app.desc=This is a description of my application.",
        "app.version=1.0.0"
})
@ExtendWith(MockitoExtension.class)

public class RabbitMqTests {

    @Autowired
    @Mock
    private ObjectMapper objectMapper;

    @Mock
    private ProductService productService;


    @InjectMocks
    private ConsumerRabbitMq consumerRabbitMq;

    @Mock
    private Logger logger = LoggerFactory.getLogger(ConsumerRabbitMq.class);

    @BeforeEach
    public void setUp(){
        MockitoAnnotations.openMocks(this);

    }



    @Test
    public void testReceiveMessage() throws Exception{

        /* Sets the update product request object and make it
        return it when the object mapper converts the json from the rabbit queue */
        UUID productId = UUID.fromString("6ff89c57-0012-4c2f-9a3c-e75960065b38");
        String message = "{\"productId\": 6ff89c57-0012-4c2f-9a3c-e75960065b38, \"quantity\": 10}";
        UpdateProductStockRequest request = new UpdateProductStockRequest(productId,10,true);
        when(objectMapper.readValue(message, UpdateProductStockRequest.class)).thenReturn(request);

        /* Mock the product service response since im not testing that service */
        when(productService.updateProductStock(request)).thenReturn(new GenericResponse<>(HttpStatus.OK,"Stock updated",null));

        /* execute the method */
        consumerRabbitMq.recieveMessage(message);

        /* Assertions */
        verify(objectMapper).readValue(message, UpdateProductStockRequest.class);
        verify(productService).updateProductStock(request);


    }
    @Test
    public void testReceiveMessageFails() throws JsonProcessingException {

        String message = "{ invalid json ";
        Boolean error = false;

       try{
           consumerRabbitMq.recieveMessage(message);
       }catch (JsonParseException e){
           error = true;
       }

        Assertions.assertTrue(error);

    }
}
