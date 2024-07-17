package com.example.multirubroproyectproducts.models;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Provider {
    UUID id;
    String name;
    String address;
    String cellphone;
    List<Product> products;
}
