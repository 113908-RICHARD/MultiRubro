package com.example.MultiRubro.services.imp;


import com.example.MultiRubro.Requests.CreateUserRequest;
import com.example.MultiRubro.services.KeycloakService;
import jakarta.ws.rs.core.Response;
import org.keycloak.admin.client.resource.*;
import org.keycloak.representations.idm.ClientRepresentation;
import org.keycloak.representations.idm.RoleRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.keycloak.admin.client.Keycloak;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class KeycloakServiceImp implements KeycloakService {

    @Autowired
    private Keycloak keyCloak;

    @Autowired
    private ModelMapper modelMapper;

    @Value("${keycloak.realm}")
    private String realm;

    @Value("${keycloak.client-id}")
    private String clientId;

    @Override
    public Boolean createUser(CreateUserRequest keyCloakUser) {
        UserRepresentation user = getUserRepresentation(keyCloakUser);

        UsersResource usersResource = getUsersResource();

        Response response = usersResource.create(user);


        if (response.getStatus() != 201) {
            String errorMessage = response.readEntity(String.class);
            throw new RuntimeException("HTTP " + response.getStatus() + ": " + errorMessage);
        }

        UserRepresentation createdUser = usersResource.search(keyCloakUser.getUserName()).get(0);
        String userId = createdUser.getId();
        assignRole(userId,"multirubro-user");



        return true;
    }

    @Override
    public UserResource getKeyCloakUser(String id) {
        return getUsersResource().get(id);
    }


    /*AUXILIARY METHODS FOR USER CREATION*/

    private UsersResource getUsersResource() {
        RealmResource realmResource = keyCloak.realm(realm);
        UsersResource usersResource = realmResource.users();
        return usersResource;
    }
    private UserRepresentation getUserRepresentation(CreateUserRequest request) {
        UserRepresentation userRepresentation = new UserRepresentation();
        userRepresentation.setUsername(request.getUserName());
        userRepresentation.setFirstName(request.getFirstName());
        userRepresentation.setLastName(request.getLastName());
        userRepresentation.setEmail(request.getEmail());
        userRepresentation.setEmailVerified(true);
        userRepresentation.setEnabled(true);

        CredentialRepresentation credentialRepresentation = new CredentialRepresentation();
        credentialRepresentation.setType(CredentialRepresentation.PASSWORD);
        credentialRepresentation.setValue(request.getPassword());
        credentialRepresentation.setTemporary(false);

        List<CredentialRepresentation> credentialRepresentations = new ArrayList<>();
        credentialRepresentations.add(credentialRepresentation);
        userRepresentation.setCredentials(credentialRepresentations);
        return userRepresentation;
    }

    private ClientResource getClientResource() {

        RealmResource realmResource = keyCloak.realm(realm);
        List<ClientRepresentation> clients = realmResource.clients().findByClientId(clientId)  ;
        if (clients.isEmpty()){
                throw new RuntimeException("No client found");
        }
        ClientResource clientResource = realmResource.clients().get(clients.get(0).getId());
        RolesResource rolesResource = clientResource.roles();
        List<RoleRepresentation> roles = rolesResource.list();
        return realmResource.clients().get(clients.get(0).getId());

    }

    public void assignRole(String userId, String roleName){

        UserResource keyCloakUser = getKeyCloakUser(userId);
        ClientResource clientResource = getClientResource();
        RolesResource clientRoles = clientResource.roles();

        try{

            RoleRepresentation roleRepresentation;
            roleRepresentation = clientRoles.get(roleName).toRepresentation();
            keyCloakUser.roles().clientLevel(clientResource.toRepresentation().
                    getId()).add(Collections.singletonList(roleRepresentation));

        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }

}
