package com.example.multirubroproyectproducts.requests.Providers;

import jakarta.validation.constraints.NotNull;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Setter
@Getter
@Data
@Builder
public class  UpdateProviderRequest {
    @NotNull
    UUID id;
    String name;
    String address;
    String cellphone;
    List<UUID> products;
}
