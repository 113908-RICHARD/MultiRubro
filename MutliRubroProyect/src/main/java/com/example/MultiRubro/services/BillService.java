package com.example.MultiRubro.services;

import com.example.MultiRubro.Requests.CreateBillRequest;
import com.example.MultiRubro.Responses.BillResponse;
import com.example.MultiRubro.models.Bill;
import com.example.MultiRubro.models.Selling;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BillService {

    BillResponse getBillById(Long id);
    List<BillResponse> getBillsByClient(String userName);

    List<BillResponse> getAllBills();
    BillResponse createBill(CreateBillRequest request);
}
