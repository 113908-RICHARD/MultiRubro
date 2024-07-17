package com.example.MultiRubro.Responses;

import lombok.*;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SellingResponse {
    Long billId;

    UUID productNumber;
    Integer quantity;
}
