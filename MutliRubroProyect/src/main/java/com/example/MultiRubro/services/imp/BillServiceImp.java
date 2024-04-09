package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.models.Bill;
import com.example.MultiRubro.services.BillService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillServiceImp implements BillService {
    @Override
    public Bill getBillById(Long id) {
        return null;
    }

    @Override
    public Bill getBillByClient(String userName) {
        return null;
    }

    @Override
    public List<Bill> getAllBills() {
        return null;
    }

    @Override
    public Bill createBill(Bill bill) {
        return null;
    }
}
