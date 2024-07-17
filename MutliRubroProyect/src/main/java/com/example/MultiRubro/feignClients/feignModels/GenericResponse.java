package com.example.MultiRubro.feignClients.feignModels;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.http.HttpStatus;

@Data
@Setter
@Getter
public class GenericResponse<T> {
    private HttpStatus status;
    private String message;
    private T data;
}