package com.example.MultiRubro.Requests;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SellingRequest {

    Long billId ;
    Integer productNumber;
    Integer quantity;

}
