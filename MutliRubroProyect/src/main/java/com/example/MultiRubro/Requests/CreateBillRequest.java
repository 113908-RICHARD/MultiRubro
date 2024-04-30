package com.example.MultiRubro.Requests;

import com.example.MultiRubro.models.Selling;
import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class CreateBillRequest {

    Long clientId;
    List<SellingRequest> sellingList;
}
