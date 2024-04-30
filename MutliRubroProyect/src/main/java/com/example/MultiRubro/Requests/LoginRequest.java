package com.example.MultiRubro.Requests;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class LoginRequest {

    String userName;
    String password;
}
