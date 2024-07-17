package com.example.MultiRubro.feignClients.feignModels;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.UUID;

@Data
@Setter
@Getter
@Builder
public class UpdateProductStockRequest implements Serializable {

    UUID id;
    Integer stock;
    Boolean subtract;
}
