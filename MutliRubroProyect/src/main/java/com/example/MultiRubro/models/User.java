package com.example.MultiRubro.models;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class User {

    Long userId;
    String userName;
    String password;
}
