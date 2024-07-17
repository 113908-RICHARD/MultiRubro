package com.example.MultiRubro.feignClients.feignModels;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Data
@Setter
@Getter
@Builder
public class UpdateProductStockRequest {

    UUID id;
    Integer stock;
    Boolean subtract;
}
