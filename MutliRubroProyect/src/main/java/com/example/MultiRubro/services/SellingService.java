package com.example.MultiRubro.services;

import com.example.MultiRubro.entities.SellingEntity;
import com.example.MultiRubro.models.Selling;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SellingService {

    SellingEntity createSelling(SellingEntity sellingEntity);
    List<Selling> getSellingsByBill(Long billId);

    List<Selling> getSellings();

}
