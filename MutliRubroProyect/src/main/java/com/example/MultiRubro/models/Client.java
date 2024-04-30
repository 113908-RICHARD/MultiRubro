package com.example.MultiRubro.models;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Client {

    Long clientId;
    String name;
    String address;
    String cellphone;

    User user;
}
