package com.example.MultiRubro.Requests;

import lombok.*;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SellingRequest {

    Long billId ;
    UUID productNumber;
    Integer quantity;

}
