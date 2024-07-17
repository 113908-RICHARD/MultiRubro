package com.example.multirubroproyectproducts.configs;

import com.example.multirubroproyectproducts.responses.GenericResponse;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

@Component
public class GenericResponseConfig {

    public <T> GenericResponse<T> createResponse(HttpStatus status, String message, T data) {
        GenericResponse<T> response = new GenericResponse<>();
        response.setStatus(status);
        response.setMessage(message);
        response.setData(data);
        return response;
    }
}
