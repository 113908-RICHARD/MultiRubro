package com.example.MultiRubro.models;

import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Bill {

    Long billId;
    Date billingDate;
    Client client;

    List<Selling> sellingList;

}
