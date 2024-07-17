package com.example.multirubroproyectproducts.controllers;

import com.example.multirubroproyectproducts.requests.Providers.ProviderRequest;
import com.example.multirubroproyectproducts.requests.Providers.UpdateProviderProductsRequest;
import com.example.multirubroproyectproducts.requests.Providers.UpdateProviderRequest;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.responses.Provider.SimpleProviderResponse;
import com.example.multirubroproyectproducts.services.IProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/providers")
public class ProviderController {
    @Autowired
    private IProviderService providerService;

    @GetMapping
    public ResponseEntity<GenericResponse<List<SimpleProviderResponse>>> getAllProviders() {
        return ResponseEntity.ok(providerService.getAllProviders());
    }
    @GetMapping("/{id}")
    public ResponseEntity<GenericResponse<SimpleProviderResponse>> getProviderById(@PathVariable UUID id) {
        return ResponseEntity.ok(providerService.getProviderById(id));
    }
    @PostMapping
    public ResponseEntity<GenericResponse<SimpleProviderResponse>> addProvider(@RequestBody ProviderRequest provider) {
        return ResponseEntity.ok(providerService.createProvider(provider));
    }
    @PutMapping
    public ResponseEntity<GenericResponse<SimpleProviderResponse>> updateProvider(@RequestBody UpdateProviderRequest provider) {
        return ResponseEntity.ok(providerService.updateProvider(provider));
    }
    @PutMapping("/update-products")
    public ResponseEntity<GenericResponse<String>> updateProviderProducts(@RequestBody UpdateProviderProductsRequest request){
        return ResponseEntity.ok(providerService.updateProviderProducts(request));
    }
    @GetMapping("/by-product/{id}")
    public ResponseEntity<GenericResponse<List<SimpleProviderResponse>>> getProviderByProduct(@PathVariable UUID id) {
        return ResponseEntity.ok(providerService.getProvidersByProduct(id));
    }
}
