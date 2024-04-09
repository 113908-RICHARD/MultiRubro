package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.entities.UserEntity;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.repositories.jpa.UserEntityJpaRepository;
import com.example.MultiRubro.services.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    private UserEntityJpaRepository userEntityJpaRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public User createUser(User user) {
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
