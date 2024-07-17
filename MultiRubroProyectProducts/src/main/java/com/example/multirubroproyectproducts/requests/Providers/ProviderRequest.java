package com.example.multirubroproyectproducts.requests.Providers;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Setter
@Getter
@Data
public class ProviderRequest {

    String name;
    String address;
    String cellphone;
    List<UUID> products;
}
