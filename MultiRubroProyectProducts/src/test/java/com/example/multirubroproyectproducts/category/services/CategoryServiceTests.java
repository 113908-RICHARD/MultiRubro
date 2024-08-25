package com.example.multirubroproyectproducts.category.services;

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
import com.example.multirubroproyectproducts.services.Implementation.CategoryService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.*;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;
import org.modelmapper.ModelMapper;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.util.*;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@SpringBootTest(properties = {
        "app.url=http://localhost:8085",
        "app.dev-name=Developer Name",
        "app.dev-email=developer@example.com",
        "app.name=My Application",
        "app.desc=This is a description of my application.",
        "app.version=1.0.0"
})
@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
public class CategoryServiceTests {


    @InjectMocks
    private CategoryService categoryService;

    @Mock
    private CategoryRepository categoryRepository;
    @Mock
    private ModelMapper modelMapper;

    @Mock
    private ProductRepository productRepository;

    @BeforeEach
    public void setUp(){
        MockitoAnnotations.openMocks(this);
        GenericResponseConfig genericResponseConfig = new GenericResponseConfig();
        categoryService.setGenericResponse(genericResponseConfig);

    }

    @Test
    public void createSuccessfullyCategoryTest(){

        List<CategoryEntity> categories = new ArrayList<>();
        categories.add(new CategoryEntity(new ArrayList<>(),"Books"));
        categories.add(new CategoryEntity(new ArrayList<>(),"Electronic"));
        categories.add(new CategoryEntity(new ArrayList<>(),"Sports"));

        CategoryRequest categoryRequest = new CategoryRequest();
        categoryRequest.setDescription("Garden");

        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity.setDescription("Garden");

        when(modelMapper.map(categoryRequest, CategoryEntity.class)).thenReturn(categoryEntity);
        when(categoryRepository.findAll()).thenReturn(categories);
        doReturn(categoryEntity).when(categoryRepository).save(any(CategoryEntity.class));

        GenericResponse<Category> response = categoryService.createCategory(categoryRequest);

        Assertions.assertEquals("Category created successfully",response.getMessage());


    }
    @Test
    public void createCategoryDuplicateFailsTest()
    {
        List<CategoryEntity> categories = new ArrayList<>();
        categories.add(new CategoryEntity(new ArrayList<>(),"Books"));
        categories.add(new CategoryEntity(new ArrayList<>(),"Electronic"));
        categories.add(new CategoryEntity(new ArrayList<>(),"Sports"));

        CategoryRequest categoryRequest = new CategoryRequest();
        categoryRequest.setDescription("Electronic");
        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity.setDescription("Electronic");

        when(modelMapper.map(categoryRequest, CategoryEntity.class)).thenReturn(categoryEntity);
        when(categoryRepository.findAll()).thenReturn(categories);


        GenericResponse<Category> response = categoryService.createCategory(categoryRequest);

        Assertions.assertEquals("Description already exists",response.getMessage());

    }
    @Test
    public void createCategoryInternalServerErrorTest(){

        List<CategoryEntity> categories = new ArrayList<>();
        categories.add(new CategoryEntity(new ArrayList<>(),"Books"));
        categories.add(new CategoryEntity(new ArrayList<>(),"Electronic"));
        categories.add(new CategoryEntity(new ArrayList<>(),"Sports"));

        CategoryRequest categoryRequest = new CategoryRequest();
        categoryRequest.setDescription("Garden");

        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity.setDescription("Garden");

        when(modelMapper.map(categoryRequest, CategoryEntity.class)).thenReturn(categoryEntity);
        when(categoryRepository.findAll()).thenReturn(categories);

        when(categoryRepository.save(any(CategoryEntity.class))).thenThrow(new RuntimeException("Database error"));

        GenericResponse<Category> response = categoryService.createCategory(categoryRequest);

        Assertions.assertEquals("Database error",response.getMessage());
    }

    @Test
    public void updateSuccessfullyCategoryTest(){
        UpdateCategoryRequest request = new UpdateCategoryRequest();
        request.setDescription("BooksUpdated");
        request.setId(UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e"));

        CategoryEntity categoryToUpdate = new CategoryEntity(new ArrayList<>(),"Books");
        categoryToUpdate.setId(UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e"));
        Mockito.when(categoryRepository.findById(categoryToUpdate.getId())).thenReturn(Optional.of(categoryToUpdate));

        GenericResponse<Category> response = categoryService.updateCategory(request);
        Assertions.assertEquals("Category updated successfully",response.getMessage());


    }

    @Test
    public void updateCategoryNotFoundFailsTest(){
        UpdateCategoryRequest request = new UpdateCategoryRequest();
        request.setDescription("BooksUpdated");
        request.setId(UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e"));

        CategoryEntity categoryToUpdate = new CategoryEntity(new ArrayList<>(),"Books");
        categoryToUpdate.setId(UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e"));
        Mockito.when(categoryRepository.findById(categoryToUpdate.getId())).thenReturn(Optional.empty());

        GenericResponse<Category> response = categoryService.updateCategory(request);
        Assertions.assertEquals("Category not found",response.getMessage());
    }
    @Test
    public void updateCategoryInternalServerErrorTest(){
        UpdateCategoryRequest request = new UpdateCategoryRequest();
        request.setDescription("BooksUpdated");
        request.setId(UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e"));

        CategoryEntity categoryToUpdate = new CategoryEntity(new ArrayList<>(),"Books");
        categoryToUpdate.setId(UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e"));

        Mockito.when(categoryRepository.findById(categoryToUpdate.getId()))
                .thenReturn(Optional.of(categoryToUpdate));

        when(categoryRepository.save(any(CategoryEntity.class)))
                .thenThrow(new RuntimeException("Database error"));

        GenericResponse<Category> response = categoryService.updateCategory(request);

        Assertions.assertEquals("Database error",response.getMessage());
    }
    @Test
    public void getCategoriesSuccessTest(){
        List<CategoryEntity> categories = new ArrayList<>();
        categories.add(new CategoryEntity(new ArrayList<>(),"Books"));
        categories.add(new CategoryEntity(new ArrayList<>(),"Electronic"));
        categories.add(new CategoryEntity(new ArrayList<>(),"Sports"));

        Mockito.when(categoryRepository.findAll())
                .thenReturn(categories);

        GenericResponse<List<Category>> response = categoryService.getCategories();

        Assertions.assertEquals(response.getData().size() + " Categories found", response.getMessage());
    }
    @Test
    public void getCategoriesNotFoundTest(){

        Mockito.when(categoryRepository.findAll())
                .thenReturn(Collections.emptyList());

        GenericResponse<List<Category>> response = categoryService.getCategories();

        Assertions.assertEquals("No categories found", response.getMessage());
    }
    @Test
    public void getCategoryByIdSuccessTest(){
        CategoryEntity category = new CategoryEntity(new ArrayList<>(), "Electric");
        category.setId((UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e")));
        Mockito.when(categoryRepository.findById(any(UUID.class))).thenReturn(Optional.of(category));

        GenericResponse<Category> response = categoryService.getCategoryById(category.getId());
        Assertions.assertEquals("Category found", response.getMessage());
    }
    @Test
    public void getCategoryByIdNotFoundTest(){

        Mockito.when(categoryRepository.findById(any(UUID.class))).thenReturn(Optional.empty());

        GenericResponse<Category> response = categoryService.getCategoryById(UUID.randomUUID());
        Assertions.assertEquals("Category not found", response.getMessage());
    }

    @Test
    public void updateCategoryProductSuccessTest(){
        CategoryEntity category = new CategoryEntity(new ArrayList<>(), "Electric");
        category.setId((UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e")));
        List<ProductEntity> products = new ArrayList<>();
        products.add(new ProductEntity("product 1",33.3,Collections.emptyList(),Collections.emptyList(),33));
        category.setProducts(products);

        List<ProductEntity> productsToAdd = new ArrayList<>();
        productsToAdd.add(new ProductEntity("product 2",33.3,Collections.emptyList(),Collections.emptyList(),33));


        Mockito.when(categoryRepository.findById(any(UUID.class))).thenReturn(Optional.of(category));

        UpdateProductCategoriesRequest request = UpdateProductCategoriesRequest.builder().build();
        request.setCategoryId(category.getId());
        List<UUID> productIds = new ArrayList<>();
        productIds.add(UUID.fromString("9fb38ae1-feda-46ad-9df4-52e11ae2a652"));
        request.setProducts(productIds);

        Mockito.when(productRepository.findById(UUID.fromString("9fb38ae1-feda-46ad-9df4-52e11ae2a652"))).thenReturn(Optional.of(productsToAdd.get(0)));

        GenericResponse<String> response = categoryService.updateCategoryProduct(request);
        Assertions.assertEquals("Category updated successfully",response.getMessage());






    }

    @Test
    public void updateCategoryProductNotFoundTest(){
        Mockito.when(categoryRepository.findById(any(UUID.class))).thenReturn(Optional.empty());

        GenericResponse<String> response = categoryService.updateCategoryProduct(UpdateProductCategoriesRequest
                .builder().categoryId(UUID.fromString("9fb38ae1-feda-46ad-9df4-52e11ae2a652")).build());

        Assertions.assertEquals("Category not found",response.getMessage());




    }

    @Test
    public void updateCategoryProductInternalServerErrorTest(){

        CategoryEntity category = new CategoryEntity(new ArrayList<>(), "Electric");
        category.setId((UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e")));
        List<ProductEntity> products = new ArrayList<>();
        products.add(new ProductEntity("product 1",33.3,Collections.emptyList(),Collections.emptyList(),33));
        category.setProducts(products);

        List<ProductEntity> productsToAdd = new ArrayList<>();
        productsToAdd.add(new ProductEntity("product 2",33.3,Collections.emptyList(),Collections.emptyList(),33));


        Mockito.when(categoryRepository.findById(any(UUID.class))).thenReturn(Optional.of(category));

        UpdateProductCategoriesRequest request = UpdateProductCategoriesRequest.builder().build();
        request.setCategoryId(category.getId());
        List<UUID> productIds = new ArrayList<>();
        productIds.add(UUID.fromString("9fb38ae1-feda-46ad-9df4-52e11ae2a652"));
        request.setProducts(productIds);

        Mockito.when(productRepository.findById(UUID.fromString("9fb38ae1-feda-46ad-9df4-52e11ae2a652"))).thenReturn(Optional.of(productsToAdd.get(0)));
        Mockito.when(categoryRepository.save(any(CategoryEntity.class))).thenThrow(new RuntimeException());

        try {
            GenericResponse<String> response = categoryService.updateCategoryProduct(request);
        }catch (RuntimeException e){
            Assertions.assertEquals("500 INTERNAL_SERVER_ERROR",e.getMessage());
        }


    }




}

