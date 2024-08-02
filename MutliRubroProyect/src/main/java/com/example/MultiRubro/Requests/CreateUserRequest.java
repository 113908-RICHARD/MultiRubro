package com.example.MultiRubro.Requests;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter

public class CreateUserRequest
{

    @JsonProperty("user-name")
    private String userName;
    @JsonProperty("first-name")
    private String firstName;
    @JsonProperty("last-name")
    private String lastName;

    private String password;
    private String email;

}
