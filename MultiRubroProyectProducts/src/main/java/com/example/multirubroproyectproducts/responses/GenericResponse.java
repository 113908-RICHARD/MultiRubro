package com.example.multirubroproyectproducts.responses;

import lombok.*;
import org.springframework.http.HttpStatus;


@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class GenericResponse<T> {
    private HttpStatus status;
    private String message;
    private T data;
}
