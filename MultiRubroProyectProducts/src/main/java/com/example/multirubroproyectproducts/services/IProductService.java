package com.example.multirubroproyectproducts.services;

import com.example.multirubroproyectproducts.models.Category;
import com.example.multirubroproyectproducts.models.Product;
import com.example.multirubroproyectproducts.requests.Products.*;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.responses.Product.SimpleProductResponse;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.List;
import java.util.UUID;

@Service
public interface IProductService {
    @Transactional
    GenericResponse<List<SimpleProductResponse>> getAllProducts();

    GenericResponse<SimpleProductResponse> getProductById(UUID id);
    GenericResponse<SimpleProductResponse> createProduct(ProductRequest product);
    GenericResponse<Product> updateProduct(UpdateProductRequest product);
    GenericResponse<Boolean> updateProductStock(UpdateProductStockRequest request);
    GenericResponse<List<SimpleProductResponse>> getProductsByProvider(UUID id);
    GenericResponse<List<Product>> getProductsByCategories(List<Category> categories);
    GenericResponse<List<Product>> getProductsByCategoriesAndProviderId(List<Category> categories, UUID providerId);
    GenericResponse<List<SimpleProductResponse>> getProductByDescription(String description);
    GenericResponse<Integer> getProductStock(UUID productId);
}
