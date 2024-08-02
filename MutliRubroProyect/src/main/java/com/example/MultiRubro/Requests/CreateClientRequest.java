package com.example.MultiRubro.Requests;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Service;

@Data
@Setter
@Getter
public class CreateClientRequest {

    String name;
    String address;
    String cellphone;

    CreateUserRequest userRequest;
}
