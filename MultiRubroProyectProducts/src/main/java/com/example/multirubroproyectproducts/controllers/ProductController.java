package com.example.multirubroproyectproducts.controllers;

import com.example.multirubroproyectproducts.requests.Categories.UpdateCategoryRequest;
import com.example.multirubroproyectproducts.requests.Products.ProductRequest;
import com.example.multirubroproyectproducts.requests.Products.UpdateProductCategoriesRequest;
import com.example.multirubroproyectproducts.requests.Products.UpdateProductProvidersRequest;
import com.example.multirubroproyectproducts.requests.Products.UpdateProductStockRequest;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.responses.Product.SimpleProductResponse;
import com.example.multirubroproyectproducts.services.Implementation.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/by-provider/{id}")
    public ResponseEntity<GenericResponse<List<SimpleProductResponse>>> getProductsByProviderId(@PathVariable UUID id) {
        return ResponseEntity.ok(productService.getProductsByProvider(id));
    }
    @PostMapping
    public ResponseEntity<GenericResponse<SimpleProductResponse>> addProduct(@RequestBody ProductRequest product) {
        return ResponseEntity.ok(productService.createProduct(product));
    }

    @GetMapping
    public ResponseEntity<GenericResponse<List<SimpleProductResponse>>> getProducts() {
        return ResponseEntity.ok(productService.getAllProducts());
    }
    @GetMapping("/{id}")
    public ResponseEntity<GenericResponse<SimpleProductResponse>> getProductById(@PathVariable UUID id) {
        return ResponseEntity.ok(productService.getProductById(id));
    }
    @PutMapping
    public ResponseEntity<GenericResponse<Boolean>> updateProductStock(@RequestBody UpdateProductStockRequest product) {
        return ResponseEntity.ok(productService.updateProductStock(product));
    }
    @GetMapping("/stock/{id}")
    public ResponseEntity<GenericResponse<Integer>> getProductStockById(@PathVariable UUID id) {
        return ResponseEntity.ok(productService.getProductStock(id));
    }

}
