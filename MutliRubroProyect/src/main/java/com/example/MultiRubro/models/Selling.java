package com.example.MultiRubro.models;

import lombok.*;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Selling {
    Long sellingId;
    Bill bill;

    UUID productId;
    Integer productQuantity;
}
