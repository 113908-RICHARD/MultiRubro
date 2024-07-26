package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.entities.UserEntity;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.repositories.jpa.UserEntityJpaRepository;
import com.example.MultiRubro.services.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Override
    public User createUser(User user) {


        Optional<UserEntity> userEntityOptional = userEntityJpaRepository.findByUserName(user.getUserName());
        if (userEntityOptional.isPresent()) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Username already exists");
        }

        UserEntity userToCreate = new UserEntity();
        userToCreate.setUserName(user.getUserName());
        userToCreate.setPassword(user.getPassword());
        return modelMapper.map(userEntityJpaRepository.save(userToCreate),User.class);

    }

    @Override
    public User updateUser(User user) {
        return null;
    }


}
