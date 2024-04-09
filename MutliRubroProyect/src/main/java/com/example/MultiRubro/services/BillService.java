package com.example.MultiRubro.services;

import com.example.MultiRubro.models.Bill;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BillService {

    Bill getBillById(Long id);
    Bill getBillByClient(String userName);

    List<Bill> getAllBills();
    Bill createBill(Bill bill);
}
