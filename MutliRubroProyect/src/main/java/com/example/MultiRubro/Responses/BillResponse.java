package com.example.MultiRubro.Responses;


import com.example.MultiRubro.models.Selling;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class BillResponse {

    String billingDate;
    String clientName;
    List<SellingResponse> sellingList;
}
