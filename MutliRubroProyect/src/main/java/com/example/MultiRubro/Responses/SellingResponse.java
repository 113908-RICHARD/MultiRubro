package com.example.MultiRubro.Responses;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SellingResponse {
    Long billId;

    Integer productNumber;
    Integer quantity;
}
