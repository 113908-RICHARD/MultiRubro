package com.example.multirubroproyectproducts.services.Implementation;

import com.example.multirubroproyectproducts.configs.GenericResponseConfig;
import com.example.multirubroproyectproducts.entities.CategoryEntity;
import com.example.multirubroproyectproducts.entities.ProductEntity;
import com.example.multirubroproyectproducts.models.Category;
import com.example.multirubroproyectproducts.repositories.CategoryRepository;
import com.example.multirubroproyectproducts.repositories.ProductRepository;
import com.example.multirubroproyectproducts.requests.Categories.CategoryRequest;
import com.example.multirubroproyectproducts.requests.Categories.UpdateCategoryRequest;
import com.example.multirubroproyectproducts.requests.Products.UpdateProductCategoriesRequest;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.services.ICategoryService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class CategoryService  implements ICategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private GenericResponseConfig genericResponse;


    @Override
    @Transactional
    public GenericResponse<Category> createCategory(CategoryRequest request) {

        List<CategoryEntity> categories = categoryRepository.findAll();
        for (CategoryEntity category : categories) {
            if (category.getDescription().equals(request.getDescription())) {
                return genericResponse.createResponse(HttpStatus.CONFLICT, "Description already exists", null);
            }
        }
        try {
            CategoryEntity categoryEntity = categoryRepository.save(modelMapper.map(request, CategoryEntity.class));
            return genericResponse.createResponse(HttpStatus.OK, "Category created successfully", modelMapper.map(categoryEntity, Category.class));
        } catch (Exception e) {
            return genericResponse.createResponse(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), null);

        }

    }

    @Override
    @Transactional
    public GenericResponse<Category> updateCategory(UpdateCategoryRequest request) {

        Optional<CategoryEntity> categoryEntity = categoryRepository.findById(request.getId());
        if (categoryEntity.isEmpty())
           return genericResponse.createResponse(HttpStatus.NOT_FOUND, "Category not found", null);
        try {
            CategoryEntity category = categoryEntity.get();
            category.setDescription(request.getDescription());
            categoryRepository.save(category);
            return genericResponse.createResponse(HttpStatus.OK, "Category updated successfully", modelMapper.map(category, Category.class));
        } catch (Exception e) {
            return genericResponse.createResponse(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), null);
        }


    }

    @Override
    public GenericResponse<List<Category>> getCategories() {

        List<CategoryEntity> categoryEntities = categoryRepository.findAll();
        if (categoryEntities.isEmpty()){
           return genericResponse.createResponse(HttpStatus.NOT_FOUND, "No categories found", null);
        }
        List<Category> categories = new ArrayList<>();
        for (CategoryEntity categoryEntity : categoryEntities){
            categories.add(modelMapper.map(categoryEntity, Category.class));
        }
        return genericResponse.createResponse(HttpStatus.OK,categoryEntities.size() + "Categories found", categories);
    }

    @Override
    public GenericResponse<Category> getCategoryById(UUID uuid) {

       Optional<CategoryEntity> categoryEntity = categoryRepository.findById(uuid);
       if (categoryEntity.isPresent()){
           return genericResponse.createResponse(HttpStatus.OK,"Category found", modelMapper.map(categoryEntity.get(), Category.class));
       }else {

           return genericResponse.createResponse(HttpStatus.NOT_FOUND, "Category not found", null);
       }

    }

    @Override
    public GenericResponse<String> updateCategoryProduct(UpdateProductCategoriesRequest request) {

        Optional<CategoryEntity> categoryEntity = categoryRepository.findById(request.getCategoryId());
        if (categoryEntity.isPresent()){
            CategoryEntity category = categoryEntity.get();

            category.getProducts().addAll(getProductEntity(request.getProducts()));
            try {
                categoryRepository.save(category);
                return genericResponse.createResponse(HttpStatus.OK, "Category updated successfully", "SUCCESS");
            }catch (Exception e){
                throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage());
            }

        }else {
            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"Category not found", "ERROR");
        }

    }
    protected List<ProductEntity> getProductEntity(List<UUID> productIds) {
        List<ProductEntity> productEntities = new ArrayList<>();
        for (UUID productId : productIds) {
            productEntities.add(productRepository.findById(productId).get());
        }
        return productEntities;
    }
}
