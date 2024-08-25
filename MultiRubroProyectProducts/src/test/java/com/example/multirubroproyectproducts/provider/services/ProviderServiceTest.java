package com.example.multirubroproyectproducts.provider.services;

import com.example.multirubroproyectproducts.configs.GenericResponseConfig;
import com.example.multirubroproyectproducts.entities.ProductEntity;
import com.example.multirubroproyectproducts.entities.ProviderEntity;
import com.example.multirubroproyectproducts.repositories.ProductRepository;
import com.example.multirubroproyectproducts.repositories.ProviderRepository;
import com.example.multirubroproyectproducts.requests.Providers.ProviderRequest;
import com.example.multirubroproyectproducts.requests.Providers.UpdateProviderProductsRequest;
import com.example.multirubroproyectproducts.requests.Providers.UpdateProviderRequest;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.responses.Provider.ProviderResponse;
import com.example.multirubroproyectproducts.responses.Provider.SimpleProviderResponse;
import com.example.multirubroproyectproducts.services.Implementation.ProviderService;
import com.fasterxml.jackson.databind.deser.std.UUIDDeserializer;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.internal.stubbing.answers.DoesNothing;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;

import java.util.*;

import static org.mockito.ArgumentMatchers.any;
import static org.postgresql.hostchooser.HostRequirement.any;

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

public class ProviderServiceTest {


    @InjectMocks
    private ProviderService providerService;

    @Mock
    private ProviderRepository providerRepository;
    @Mock
    private ProductRepository productRepository;


    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        GenericResponseConfig genericResponseConfig = new GenericResponseConfig();
        providerService.setGenericResponse(genericResponseConfig);
        providerService.setModelMapper(new ModelMapper());
    }

    @Test
    public void getAllProvidersTest(){
        List<ProviderEntity> providers = new ArrayList<>();
        ProviderEntity providerEntity = new ProviderEntity();
        providerEntity.setAddress("address");
        providers.add(providerEntity);
        Mockito.when(providerRepository.findAll()).thenReturn(providers);

        GenericResponse<List<SimpleProviderResponse>> response = providerService.getAllProviders();

        Assertions.assertEquals("Found "+providers.size()+" providers",response.getMessage());


    }
    @Test
    public void getAllProvidersEmpty(){

        Mockito.when(providerRepository.findAll()).thenReturn(new ArrayList<>());
        GenericResponse<List<SimpleProviderResponse>> response = providerService.getAllProviders();
    }

    @Test
    public void getProviderByIdTest(){
        ProviderEntity providerEntity = new ProviderEntity();
        providerEntity.setId(UUID.fromString("07580510-f08d-4b35-a323-d1379f29e82e"));
        providerEntity.setName("provider");
        Mockito.when(providerRepository.findById(any(UUID.class))).thenReturn(Optional.of(providerEntity));
        GenericResponse<SimpleProviderResponse> response = providerService.getProviderById(providerEntity.getId());

        Assertions.assertEquals("Found provider",response.getMessage());
    }


    @Test
    public void getProviderByIdEmpty(){
        Mockito.when(providerRepository.findById(any(UUID.class))).thenReturn(Optional.empty());
        GenericResponse<SimpleProviderResponse> response = providerService.getProviderById(UUID.randomUUID());
        Assertions.assertNull(response.getData());
    }


    @Test
    public void createProviderSuccessTest(){
        ProviderRequest providerRequest = ProviderRequest
                .builder()
                .name("provider")
                .build();
      ProviderEntity providerEntity = new ProviderEntity();
      providerEntity.setName("provider");



        Mockito.when(providerRepository.save(any(ProviderEntity.class))).thenReturn(providerEntity);

        GenericResponse<SimpleProviderResponse> response = providerService.createProvider(providerRequest);

        Assertions.assertEquals(HttpStatus.CREATED,response.getStatus());

    }

    @Test
    public void createProviderFailTest(){
        Mockito.when(providerRepository.save(any(ProviderEntity.class))).thenThrow(new RuntimeException());

        GenericResponse<SimpleProviderResponse> response = providerService.createProvider(ProviderRequest.builder().build());
        Assertions.assertNull(response.getData());
        Assertions.assertEquals(HttpStatus.INTERNAL_SERVER_ERROR,response.getStatus());
    }


    @Test
    public void updateProviderSuccessTest(){
        ProviderEntity providerEntity = new ProviderEntity();
        providerEntity.setName("provider");


        ProductEntity productEntity = new ProductEntity();
        providerEntity.setName("productMocked");
        Mockito.when(productRepository.findById(any(UUID.class))).thenReturn(Optional.of(productEntity));
        Mockito.when(providerRepository.findById(any(UUID.class))).thenReturn(Optional.of(providerEntity));

        List<UUID> productIds = new ArrayList<>();
        productIds.add(UUID.randomUUID());
        Mockito.when(providerRepository.save(any(ProviderEntity.class))).thenReturn(providerEntity);
        GenericResponse<SimpleProviderResponse> response = providerService.updateProvider(UpdateProviderRequest
                .builder().products(productIds).id(UUID.randomUUID()).build());

        Assertions.assertEquals(HttpStatus.OK,response.getStatus());

    }
    @Test
    public void updateProviderNotFoundFail(){
        ProviderEntity providerEntity = new ProviderEntity();
        providerEntity.setName("provider");


        ProductEntity productEntity = new ProductEntity();
        providerEntity.setName("productMocked");
        Mockito.when(productRepository.findById(any(UUID.class))).thenReturn(Optional.of(productEntity));
        Mockito.when(providerRepository.findById(any(UUID.class))).thenReturn(Optional.of(providerEntity));

        List<UUID> productIds = new ArrayList<>();
        productIds.add(UUID.randomUUID());
        Mockito.when(providerRepository.save(any(ProviderEntity.class))).thenReturn(providerEntity);
        GenericResponse<SimpleProviderResponse> response = providerService.updateProvider(UpdateProviderRequest
                .builder().products(productIds).build());

        Assertions.assertEquals(HttpStatus.NOT_FOUND,response.getStatus());

    }

    @Test
    public void updateProviderProductsSuccessTest(){
        ProviderEntity providerEntity = new ProviderEntity();
        providerEntity.setName("provider");

        List<ProductEntity> products = new ArrayList<>();
        products.add(ProductEntity.builder().description("productMocked").build());
        providerEntity.setProducts(products);

        List<ProductEntity> productsToAdd = new ArrayList<>();
        productsToAdd.add(ProductEntity.builder().description("productMockedAdded").build());
        Mockito.when(providerRepository.findById(any(UUID.class))).thenReturn(Optional.of(providerEntity));
        Mockito.when(productRepository.findAllById(any(List.class))).thenReturn(productsToAdd);

        List<UUID> productsToFind = new ArrayList<>();
        productsToFind.add(UUID.randomUUID());

        Mockito.when(providerRepository.save(any(ProviderEntity.class))).thenReturn(providerEntity);

        GenericResponse<String> response = providerService.updateProviderProducts(UpdateProviderProductsRequest.builder()
                .providerId(UUID.randomUUID())
                .productIds(productsToFind).build());


        Assertions.assertEquals(HttpStatus.OK,response.getStatus());




    }


}
