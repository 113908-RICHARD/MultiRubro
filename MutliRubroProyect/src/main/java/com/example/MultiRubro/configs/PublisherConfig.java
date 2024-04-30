package com.example.MultiRubro.configs;


import com.rabbitmq.client.AMQP;
import lombok.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.amqp.core.Queue;


@Configuration
public class PublisherConfig {



    @Bean
    public Queue queue() {
        return new Queue("cola1");
    }
}
