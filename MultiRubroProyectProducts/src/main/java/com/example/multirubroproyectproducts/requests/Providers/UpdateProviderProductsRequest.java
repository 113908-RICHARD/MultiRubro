package com.example.multirubroproyectproducts.requests.Providers;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Data
@Setter
@Getter
@Builder
public class UpdateProviderProductsRequest {

    @JsonProperty("product-ids")
    private List<UUID> productIds;
    @JsonProperty("provider-id")
    private UUID providerId;
}
