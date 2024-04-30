package com.example.MultiRubro.controllers;

import com.example.MultiRubro.Requests.CreateBillRequest;
import com.example.MultiRubro.Responses.BillResponse;
import com.example.MultiRubro.models.Bill;
import com.example.MultiRubro.models.Selling;
import com.example.MultiRubro.services.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bills")
public class BillController {

    @Autowired
    private BillService billService;

    @PostMapping("/create")
    public ResponseEntity<BillResponse> createBill(@RequestBody CreateBillRequest request) {
        return ResponseEntity.ok(billService.createBill(request));
    }

    @GetMapping("/id/{id}")  // Change the mapping path to "/bills/id/{id}"
    public ResponseEntity<BillResponse> getBillById(@PathVariable Long id) {
        return ResponseEntity.ok(billService.getBillById(id));
    }

    @GetMapping("/client/{userName}")  // Change the mapping path to "/bills/client/{userName}"
    public ResponseEntity<List<BillResponse>> getBillsByClient(@PathVariable String userName) {
        return ResponseEntity.ok(billService.getBillsByClient(userName));
    }

    @GetMapping("")  // Add a new mapping for "/bills" to get all bills
    public ResponseEntity<List<BillResponse>> getAllBills() {
        return ResponseEntity.ok(billService.getAllBills());
    }
}
