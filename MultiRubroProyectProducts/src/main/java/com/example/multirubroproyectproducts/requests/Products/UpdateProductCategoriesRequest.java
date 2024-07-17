package com.example.multirubroproyectproducts.requests.Products;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Data
@Setter
@Getter
public class UpdateProductCategoriesRequest {
    @JsonProperty("category-id")
    private UUID categoryId;
    @JsonProperty("products")
    private List<UUID> products;
}
