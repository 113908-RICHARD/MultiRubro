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
import org.mockito.*;
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
        UpdateProductStockRequest updateProductStockRequest = new UpdateProductStockRequest
                (UUID.fromString("6ff89c57-0012-4c2f-9a3c-e75960065b38"),4,true );
        try{
            consumerRabbitMq.receiveMessage(updateProductStockRequest);
            assert true;
        }catch (Exception e){
            assert false;
        }




    }
    @Test
    public void testReceiveMessageFails() throws JsonProcessingException {



    }
}
