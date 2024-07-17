package com.example.multirubroproyectproducts.responses.Provider;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Data
@Setter
@Getter
public class SimpleProviderResponse {
    UUID id;
    String name;
    String address;
    String cellphone;
}
