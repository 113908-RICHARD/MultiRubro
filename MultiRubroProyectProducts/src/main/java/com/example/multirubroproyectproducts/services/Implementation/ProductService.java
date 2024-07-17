package com.example.multirubroproyectproducts.services.Implementation;

import com.example.multirubroproyectproducts.configs.GenericResponseConfig;
import com.example.multirubroproyectproducts.entities.CategoryEntity;
import com.example.multirubroproyectproducts.entities.ProductEntity;
import com.example.multirubroproyectproducts.entities.ProviderEntity;
import com.example.multirubroproyectproducts.models.Category;
import com.example.multirubroproyectproducts.models.Product;
import com.example.multirubroproyectproducts.repositories.CategoryRepository;
import com.example.multirubroproyectproducts.repositories.ProductRepository;
import com.example.multirubroproyectproducts.repositories.ProviderRepository;
import com.example.multirubroproyectproducts.requests.Products.*;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.responses.Product.SimpleProductResponse;
import com.example.multirubroproyectproducts.services.IProductService;
import com.example.multirubroproyectproducts.services.IProviderService;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigInteger;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProductService implements IProductService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private ProviderRepository providerRepository;
    @Autowired
    private GenericResponseConfig genericResponse;


    @Override
    @Transactional(readOnly = true)
    public GenericResponse<List<SimpleProductResponse>> getAllProducts() {

        List<ProductEntity> productsEntities = productRepository.findAllWithoutProviders();
        if (productsEntities.isEmpty()) {
            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"no products found",null);
        }
        List<SimpleProductResponse> productsList = productsEntities.stream()
                .map(productEntity -> modelMapper.map(productEntity, SimpleProductResponse.class))
                .toList();
        return genericResponse.createResponse(HttpStatus.OK,"Found "+productsList.size()+" products",productsList);
    }

    @Override
    public GenericResponse<SimpleProductResponse> getProductById(UUID id) {

        Optional<ProductEntity> productEntityOptional = productRepository.findById(id);
        if (productEntityOptional.isPresent()) {

            return genericResponse.createResponse(HttpStatus.OK,"Product found",modelMapper.map(productEntityOptional.get(), SimpleProductResponse.class));
        }

        return genericResponse.createResponse(HttpStatus.NOT_FOUND,"No product with id " + id + " found",null);
    }

    @Override
    @Transactional
    public GenericResponse<SimpleProductResponse> createProduct(ProductRequest product) {

        ProductEntity productEntity = getProductEntity(product);
        try {

            ProductEntity productSaved = productRepository.save(productEntity);
            return genericResponse.createResponse(HttpStatus.CREATED,"Product created",modelMapper.map(productSaved, SimpleProductResponse.class));

        }catch (Exception e) {
            return genericResponse.createResponse(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage(),null);
        }


    }


    protected ProductEntity getProductEntity(ProductRequest productRequest) {
        ProductEntity productEntity = modelMapper.map(productRequest, ProductEntity.class);
        productEntity.setProviders(new ArrayList<>());
        productEntity.setCategories(new ArrayList<>());
        return  productEntity;
    }


    @Override
    public GenericResponse<Product> updateProduct(UpdateProductRequest product) {
        return null;
    }

    @Override
    @Transactional
    public GenericResponse<Boolean> updateProductStock(UpdateProductStockRequest request) {

        Optional<ProductEntity> productEntityOptional = productRepository.findById(request.getId());
        if (productEntityOptional.isPresent()) {
            try{
                ProductEntity product = productEntityOptional.get();
                if (request.getSubtract())
                    product.setStock(product.getStock() + request.getStock());
                product.setStock(product.getStock() - request.getStock());

                productRepository.save(product);

                return genericResponse.createResponse(HttpStatus.OK,"Product stock updated",true);

            }catch (Exception e) {

                return genericResponse.createResponse(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage(),false);
            }
        }else {

            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"No product with id " + request.getId() + " found",false);
        }

    }

    @Override
    public GenericResponse<List<SimpleProductResponse>> getProductsByProvider(UUID id) {

        Optional<ProviderEntity> provider = providerRepository.findById(id);
        if (provider.isPresent()) {

            List<SimpleProductResponse> productsList = provider.get().getProducts().stream()
                    .map(productEntity -> modelMapper.map(productEntity, SimpleProductResponse.class))
                    .toList();

            return genericResponse.createResponse(HttpStatus.OK,"Found "+productsList.size()+" products",productsList);
        }else{

            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"no provider found with that id",null);
        }



    }

    @Override
    public GenericResponse<List<Product>> getProductsByCategories(List<Category> categories) {
        return null;
    }

    @Override
    public GenericResponse<List<Product>> getProductsByCategoriesAndProviderId(List<Category> categories, UUID providerId) {
        return null;
    }

    @Override
    public GenericResponse<List<SimpleProductResponse>> getProductByDescription(String description) {

        Optional<List<ProductEntity>> products = productRepository.findByDescriptionContainingIgnoreCase(description);
        if (products.isPresent()) {
            List<SimpleProductResponse> productsList = new ArrayList<>();
            products.get().forEach(product -> { productsList.add(modelMapper.map(product, SimpleProductResponse.class));});
            return genericResponse.createResponse(HttpStatus.FOUND,productsList.size()+" products found",productsList);

        }else {
            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"products not found ",null );
        }

    }

    @Override
    public GenericResponse<Integer> getProductStock(UUID productId) {
        GenericResponse<SimpleProductResponse> productResponse = getProductById(productId);
        if (productResponse.getStatus().equals(HttpStatus.OK))
            return genericResponse.createResponse(HttpStatus.OK,"stock for product "+ productResponse.getData().getDescription(),productResponse.getData().getStock());
        return genericResponse.createResponse(productResponse.getStatus(),productResponse.getMessage(),null);
    }


}
