    package com.springboot.gatewayservice.security;


    import org.springframework.context.annotation.Bean;
    import org.springframework.context.annotation.Configuration;
    import org.springframework.http.HttpMethod;
    import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
    import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
    import org.springframework.security.config.web.server.ServerHttpSecurity;
    import org.springframework.security.web.server.SecurityWebFilterChain;

    import static org.springframework.security.config.Customizer.withDefaults;

    @Configuration
    @EnableWebFluxSecurity
    @EnableMethodSecurity
    public class SecurityConfig {

        @Bean
        public SecurityWebFilterChain springSecurityFilterChain(ServerHttpSecurity http) {
            http
                    .csrf(ServerHttpSecurity.CsrfSpec::disable)
                    .authorizeExchange(authorizeExchangeSpec -> authorizeExchangeSpec

                            .anyExchange().authenticated())
                    .oauth2Login(withDefaults());


            return http.build();
        }
    }
