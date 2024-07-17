package com.example.multirubroproyectproducts.services.Implementation;

import com.example.multirubroproyectproducts.configs.GenericResponseConfig;
import com.example.multirubroproyectproducts.entities.ProductEntity;
import com.example.multirubroproyectproducts.entities.ProviderEntity;
import com.example.multirubroproyectproducts.repositories.ProductRepository;
import com.example.multirubroproyectproducts.repositories.ProviderRepository;
import com.example.multirubroproyectproducts.requests.Providers.ProviderRequest;
import com.example.multirubroproyectproducts.requests.Providers.UpdateProviderProductsRequest;
import com.example.multirubroproyectproducts.requests.Providers.UpdateProviderRequest;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.responses.Product.SimpleProductResponse;
import com.example.multirubroproyectproducts.responses.Provider.SimpleProviderResponse;
import com.example.multirubroproyectproducts.services.IProviderService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ProviderService implements IProviderService {

    @Autowired
    private ProviderRepository providerRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private GenericResponseConfig genericResponse;

    @Override
    public GenericResponse<List<SimpleProviderResponse>> getAllProviders() {

        List<ProviderEntity> providers = providerRepository.findAll();
        if (providers.isEmpty()) {

            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"No providers found", null);

        }else{
            List<SimpleProviderResponse> providersList = providers.stream()
                    .map(providerEntity -> modelMapper.map(providerEntity, SimpleProviderResponse.class))
                    .toList();
            return genericResponse.createResponse(HttpStatus.OK,"Found "+providers.size()+" providers", providersList);

        }

    }

    @Override
    public GenericResponse<SimpleProviderResponse> getProviderById(UUID id) {

        Optional<ProviderEntity> provider = providerRepository.findById(id);
        if (provider.isPresent()) {
            return genericResponse.createResponse(HttpStatus.OK,"Found "+ provider.get().getName(),(modelMapper.map(provider.get(), SimpleProviderResponse.class)));
        }else{

            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"No provider found with id "+ id,null);
        }

    }

    @Override
    @Transactional
    public GenericResponse<SimpleProviderResponse> createProvider(ProviderRequest provider) {

        ProviderEntity providerEntity = modelMapper.map(provider, ProviderEntity.class);
        providerEntity.setProducts(new ArrayList<>());
        try {
            providerRepository.save(providerEntity);
            return genericResponse.createResponse(HttpStatus.CREATED,providerEntity.getName(),modelMapper.map(providerEntity, SimpleProviderResponse.class));
        }catch (Exception e) {

            return genericResponse.createResponse(HttpStatus.INTERNAL_SERVER_ERROR,"Error creating provider",null);
        }

    }

    @Override
    @Transactional
    public GenericResponse<SimpleProviderResponse> updateProvider(UpdateProviderRequest request) {

        Optional<ProviderEntity> providerEntity = providerRepository.findById(request.getId());
        if (providerEntity.isEmpty()) {
            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"No provider found with id " + request.getId(),null);
        }
        ProviderEntity providerEntityToUpdate = providerEntity.get();
        providerEntityToUpdate.setName(request.getName());
        providerEntityToUpdate.setAddress(request.getAddress());
        providerEntityToUpdate.setCellphone(request.getCellphone());
        providerEntityToUpdate.setProducts(getProducts(request.getProducts()));
        try {
            providerRepository.save(providerEntityToUpdate);
            return genericResponse.createResponse(HttpStatus.OK,providerEntityToUpdate.getName(),modelMapper.map(providerEntityToUpdate, SimpleProviderResponse.class));
        }catch (Exception e) {

            return genericResponse.createResponse(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage(),null);
        }

    }

    @Override
    @Transactional
    public GenericResponse<String> updateProviderProducts(UpdateProviderProductsRequest request) {
        Optional<ProviderEntity> provider = providerRepository.findById(request.getProviderId());

        if (provider.isPresent()) {
            ProviderEntity providerEntity = provider.get();
            List<ProductEntity> productsSaved = provider.get().getProducts();
            List<ProductEntity> productEntitiesToSave = productRepository.findAllById(request.getProductIds());
            productsSaved.addAll(productEntitiesToSave);
            providerEntity.setProducts(productsSaved);
            try {
                providerRepository.save(providerEntity);
                return genericResponse.createResponse(HttpStatus.OK,"Updated "+providerEntity.getName(),"success");
            }catch (Exception e) {

                return genericResponse.createResponse(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage(),null);
            }

        }else{

            return genericResponse.createResponse(HttpStatus.NOT_FOUND,"No provider found with id " + request.getProviderId(),"error");

        }

    }

    @Override
    public GenericResponse<List<SimpleProviderResponse>> getProvidersByProduct(UUID id) {

        ProductEntity product = productRepository.getReferenceById(id);

        List<SimpleProviderResponse> providersList = product.getProviders().stream()
                .map(providerEntity -> modelMapper.map(providerEntity, SimpleProviderResponse.class))
                .toList();

        return genericResponse.createResponse(HttpStatus.OK,"Found "+providersList.size() +" providers", providersList);


    }



    private List<ProductEntity> getProducts(List<UUID> productIds) {
        List<ProductEntity> products = new ArrayList<>();
        for (UUID productId : productIds) {
            ProductEntity productEntity = productRepository.findById(productId).get();
            products.add(productEntity);
        }
        return products;
    }
}
