package com.example.MultiRubro.models;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Selling {
    Long sellingId;
    Bill bill;

    Long productId;
    Integer productQuantity;
}
