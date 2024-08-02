package com.example.MultiRubro.services;

import com.example.MultiRubro.Requests.CreateUserRequest;
import com.example.MultiRubro.models.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    User createUser(CreateUserRequest user);
    User updateUser(User user);
    Boolean createKeyCloakUser(CreateUserRequest userRequest);




}
