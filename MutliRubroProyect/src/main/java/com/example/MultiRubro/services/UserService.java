package com.example.MultiRubro.services;

import com.example.MultiRubro.models.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    User createUser(User user);
    User updateUser(User user);




}
