package com.example.MultiRubro.feignClients;


import com.example.MultiRubro.feignClients.feignModels.GenericResponse;
import com.example.MultiRubro.feignClients.feignModels.UpdateProductStockRequest;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@FeignClient(name = "multi-rubro-project-products",path = "/products")

public interface ProductsFeignClient {

    @GetMapping("/stock/{id}")
    GenericResponse<Integer> getProductStockById(@PathVariable UUID id);
    @PutMapping
    GenericResponse<Boolean> updateProductStock(@RequestBody UpdateProductStockRequest product);
}
