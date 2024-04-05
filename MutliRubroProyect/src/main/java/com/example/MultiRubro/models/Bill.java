package com.example.MultiRubro.models;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Bill {

    Long billId;
    Date billingDate;
    Client client;

}
