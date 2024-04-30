package com.example.MultiRubro.controllers;

import com.example.MultiRubro.Requests.LoginRequest;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.services.UserService;
import com.rabbitmq.client.Return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.RecursiveTask;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<User> Login(@RequestBody LoginRequest request){
        return ResponseEntity.ok(userService.loginService(request));
    }
}
