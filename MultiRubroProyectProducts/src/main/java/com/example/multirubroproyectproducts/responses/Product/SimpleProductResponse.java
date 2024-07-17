package com.example.multirubroproyectproducts.responses.Product;

import com.example.multirubroproyectproducts.models.Category;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Data
@Setter
@Getter
public class SimpleProductResponse {

    UUID id;
    String description;
    Double price;
    Integer stock;
    List<Category> categories;
}
