package com.example.MultiRubro.userServiceTests;


import com.example.MultiRubro.Requests.CreateUserRequest;
import com.example.MultiRubro.entities.UserEntity;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.repositories.jpa.UserEntityJpaRepository;
import com.example.MultiRubro.services.KeycloakService;
import com.example.MultiRubro.services.UserService;
import com.example.MultiRubro.services.imp.KeycloakServiceImp;
import com.example.MultiRubro.services.imp.UserServiceImp;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.mockito.ArgumentMatchers;
import org.mockito.junit.jupiter.MockitoExtension;
import org.modelmapper.ModelMapper;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;


@SpringBootTest(properties = {
        "app.url=http://localhost:8085",
        "app.dev-name=Developer Name",
        "app.dev-email=developer@example.com",
        "app.name=My Application",
        "app.desc=This is a description of my application.",
        "app.version=1.0.0"
})
@ExtendWith(MockitoExtension.class)
public class UserServiceTests {


    @InjectMocks
    private UserServiceImp userService;

    @Mock
    private ModelMapper modelMapper;

    @Mock
    private UserEntityJpaRepository userJpaRepository;

    @Mock
    private KeycloakServiceImp keycloakService;

    @BeforeEach
    public void setUp(){
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testCreateUser(){
        UserEntity userEntity = new UserEntity();
        userEntity.setUserName("prueba");
        CreateUserRequest userRequest = new CreateUserRequest();
        userRequest.setUserName("prueba");

        User user = new User();
        user.setUserName("prueba");

        Mockito.when(userJpaRepository.findByUserName(userEntity.getUserName())).thenReturn(Optional.empty());

        Mockito.when(userJpaRepository.save(any(UserEntity.class))).thenReturn(userEntity);
        Mockito.when(modelMapper.map(any(UserEntity.class), eq(User.class))).thenReturn(user);

        Mockito.when(userService.createKeyCloakUser(any(CreateUserRequest.class))).thenReturn(true);

        User response = userService.createUser(userRequest);
        Assertions.assertEquals(userEntity.getUserName(), response.getUserName());





    }

    @Test
    public void testCreateKeyCloakUser(){
        Mockito.when(userService.createKeyCloakUser(any(CreateUserRequest.class))).thenReturn(true);
        Boolean response = userService.createKeyCloakUser(new CreateUserRequest());
        Assertions.assertTrue(response);

    }


}
