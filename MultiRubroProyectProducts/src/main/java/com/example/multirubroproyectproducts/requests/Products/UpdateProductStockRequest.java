package com.example.multirubroproyectproducts.requests.Products;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Data
@Setter
@Getter
public class UpdateProductStockRequest {

    UUID id;
    Integer stock;
    Boolean subtract;
}
