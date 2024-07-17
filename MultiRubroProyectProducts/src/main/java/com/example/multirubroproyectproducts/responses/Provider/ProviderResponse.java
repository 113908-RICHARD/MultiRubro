package com.example.multirubroproyectproducts.responses.Provider;

import com.example.multirubroproyectproducts.models.Product;
import com.example.multirubroproyectproducts.responses.Product.SimpleProductResponse;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Data
@Getter
@Setter
public class ProviderResponse {

    UUID id;
    String name;
    String address;
    String cellphone;
    List<SimpleProductResponse> products;
}
