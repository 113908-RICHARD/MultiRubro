package com.example.multirubroproyectproducts.requests.Products;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data
public class ProductRequest {

    String description;
    Double price;
    Integer stock;


}
