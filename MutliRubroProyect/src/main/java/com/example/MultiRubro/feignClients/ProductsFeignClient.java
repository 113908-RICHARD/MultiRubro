package com.example.MultiRubro.feignClients;


import com.example.MultiRubro.feignClients.feignModels.GenericResponse;
import com.example.MultiRubro.feignClients.feignModels.UpdateProductStockRequest;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.UUID;

@FeignClient(name = ("MultiRubroProyectProducts"),url = "http://localhost:8081/products")
public interface ProductsFeignClient {

    @GetMapping("/stock/{id}")
    GenericResponse<Integer> getProductStockById(@PathVariable UUID id);
    @PutMapping
    GenericResponse<Boolean> updateProductStock(@RequestBody UpdateProductStockRequest product);
}
