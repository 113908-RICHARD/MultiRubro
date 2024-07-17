package com.example.multirubroproyectproducts.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.amqp.core.Queue;

@Configuration
public class RabbitConfig {

    @Bean
    public Queue queue(){return new Queue("UpdateStockQueue");}
}
