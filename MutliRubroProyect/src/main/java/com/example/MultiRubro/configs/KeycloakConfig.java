package com.example.MultiRubro.configs;

import org.keycloak.OAuth2Constants;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource("classpath:Keycloak.properties")
public class KeycloakConfig {

    @Value("${keycloak.url}")
    private String url;

    @Value("${keycloak.realm}")
    private String realm;

    @Value("${keycloak.client-id}")
    private String clientId;

    @Value("${keycloak.client-secret}")
    private String clientSecret;


    @Bean
    public Keycloak keycloak() {
        return KeycloakBuilder
                .builder()
                .serverUrl(url)
                .clientId(clientId)
                .clientSecret(clientSecret)
                .realm(realm)
                .grantType(OAuth2Constants.CLIENT_CREDENTIALS)
                .build();
    }
}
