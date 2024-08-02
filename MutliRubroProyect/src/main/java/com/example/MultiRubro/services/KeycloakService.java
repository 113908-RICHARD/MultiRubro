package com.example.MultiRubro.services;


import com.example.MultiRubro.Requests.CreateUserRequest;
import org.springframework.stereotype.Service;
import org.keycloak.admin.client.resource.UserResource;

@Service
public interface KeycloakService {

    Boolean createUser(CreateUserRequest keyCloakUser);
    UserResource getKeyCloakUser(String id);
}
