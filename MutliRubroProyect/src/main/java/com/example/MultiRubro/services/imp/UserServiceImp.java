package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.Requests.CreateUserRequest;
import com.example.MultiRubro.entities.UserEntity;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.repositories.jpa.UserEntityJpaRepository;
import com.example.MultiRubro.services.KeycloakService;
import com.example.MultiRubro.services.UserService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    private UserEntityJpaRepository userEntityJpaRepository;
    @Autowired
    private ModelMapper modelMapper;


    @Autowired
    private KeycloakService keycloakService;

    @Override
    @Transactional
    public User createUser(CreateUserRequest user) {


        Optional<UserEntity> userEntityOptional = userEntityJpaRepository.findByUserName(user.getUserName());
        if (userEntityOptional.isPresent()) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Username already exists");
        }

        try {
            UserEntity userToCreate = new UserEntity();
            userToCreate.setUserName(user.getUserName());
            userToCreate.setPassword(user.getPassword());
            createKeyCloakUser(user);
            return modelMapper.map(userEntityJpaRepository.save(userToCreate), User.class);
        }catch (Exception e) {
            throw e;
        }

    }

    @Override
    public User updateUser(User user) {
        return null;
    }


    @Override
    public Boolean createKeyCloakUser(CreateUserRequest userRequest) {
        return keycloakService.createUser(userRequest);
    }


}
