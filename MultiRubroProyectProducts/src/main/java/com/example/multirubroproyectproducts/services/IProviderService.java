package com.example.multirubroproyectproducts.services;

import com.example.multirubroproyectproducts.requests.Providers.ProviderRequest;
import com.example.multirubroproyectproducts.requests.Providers.UpdateProviderProductsRequest;
import com.example.multirubroproyectproducts.requests.Providers.UpdateProviderRequest;
import com.example.multirubroproyectproducts.responses.GenericResponse;
import com.example.multirubroproyectproducts.responses.Provider.SimpleProviderResponse;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.List;
import java.util.UUID;

@Service
public interface IProviderService {

    GenericResponse<List<SimpleProviderResponse>> getAllProviders();
    GenericResponse<SimpleProviderResponse> getProviderById(UUID id);
    GenericResponse<SimpleProviderResponse> createProvider(ProviderRequest provider);
    GenericResponse<SimpleProviderResponse> updateProvider(UpdateProviderRequest request);
    GenericResponse<String> updateProviderProducts(UpdateProviderProductsRequest request);
    GenericResponse<List<SimpleProviderResponse>> getProvidersByProduct(UUID id);



}
