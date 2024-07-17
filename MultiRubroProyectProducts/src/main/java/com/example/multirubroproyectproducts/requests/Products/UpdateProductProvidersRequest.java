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
public class UpdateProductProvidersRequest {

    @JsonProperty("provider-ids")
    private List<UUID> providerIds;
    @JsonProperty("product-id")
    private UUID productId;
}
