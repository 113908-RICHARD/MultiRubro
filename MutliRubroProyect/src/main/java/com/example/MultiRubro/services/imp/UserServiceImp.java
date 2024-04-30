package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.Requests.LoginRequest;
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
import java.util.Objects;
import java.util.Optional;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    private UserEntityJpaRepository userEntityJpaRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public User createUser(User user) {

        List<UserEntity> usersEntities = userEntityJpaRepository.findAll();

        for (UserEntity userItem :
                usersEntities) {
            if (userItem.getUserName().equals(user.getUserName())){
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST,("Theres is already a user with that username"));
            }
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

    @Override
    public User loginService(LoginRequest user) {
        Optional<UserEntity> userEntity = userEntityJpaRepository.findByUserName(user.getUserName());
        if(userEntity.isEmpty() || !Objects.equals(userEntity.get().getPassword(), user.getPassword())){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,("The user or the password are incorrect"));
        }


        return modelMapper.map(userEntity.get(),User.class);
    }
}
