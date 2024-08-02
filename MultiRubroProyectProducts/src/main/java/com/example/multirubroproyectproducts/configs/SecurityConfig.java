package com.example.multirubroproyectproducts.configs;

import com.example.multirubroproyectproducts.components.JwtAuthConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.web.service.invoker.AbstractReactorHttpExchangeAdapter;

import static org.springframework.security.config.Customizer.withDefaults;
@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final JwtAuthConverter jwtAuthConverter;

    @Bean
    public SecurityFilterChain configure(HttpSecurity http) throws Exception {

        return http
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(auth ->auth.anyRequest().authenticated())
                .oauth2ResourceServer(oauth2 ->oauth2.jwt(jwt -> jwt.jwtAuthenticationConverter(jwtAuthConverter))).build();
    }
}
