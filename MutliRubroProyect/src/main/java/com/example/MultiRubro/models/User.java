package com.example.MultiRubro.models;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class User {

    private Long userId;
    private String userName;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
}
