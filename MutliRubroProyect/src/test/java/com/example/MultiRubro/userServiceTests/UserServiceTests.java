package com.example.MultiRubro.userServiceTests;


import com.example.MultiRubro.entities.UserEntity;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.repositories.jpa.UserEntityJpaRepository;
import com.example.MultiRubro.services.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.mockito.junit.jupiter.MockitoExtension;
import org.modelmapper.ModelMapper;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;




@SpringBootTest
@ExtendWith(MockitoExtension.class)
public class UserServiceTests {


    @InjectMocks
    private UserService userService;

    @Mock
    private ModelMapper modelMapper;

    @Mock
    private UserEntityJpaRepository userJpaRepository;

    @BeforeEach
    public void setUp(){
        MockitoAnnotations.openMocks(this);
    }

//    @Test
//    public void testCreateUser(){
//        UserEntity user = new UserEntity();
//        user.setUserName("prueba");
//
//        Mockito.when(userJpaRepository.findByUserName(user.getUserName())).thenReturn(Optional.empty());
//
//        Mockito.when(userJpaRepository.save(user)).thenReturn(user);
//        Mockito.when(modelMapper.map(any(UserEntity.class), User.class).thenReturn(user);
//    }

}
