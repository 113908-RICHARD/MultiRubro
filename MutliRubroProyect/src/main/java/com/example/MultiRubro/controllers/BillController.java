package com.example.MultiRubro.controllers;

import com.example.MultiRubro.Requests.CreateBillRequest;
import com.example.MultiRubro.Responses.BillResponse;
import com.example.MultiRubro.models.Bill;
import com.example.MultiRubro.models.Selling;
import com.example.MultiRubro.services.BillService;
import feign.Response;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bills")
public class BillController {

    @Autowired
    private BillService billService;



    @CircuitBreaker(name = "productsCB",fallbackMethod = "fallBackCreateBill")
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


    public ResponseEntity<String> fallBackCreateBill(CreateBillRequest request, Throwable throwable) {

        String errorMessage = "Error creating bill for client: " + request.getClientId();
        if (throwable != null) {
            errorMessage += ". Reason: " + throwable.getMessage();
            System.out.println(errorMessage);
        }

        return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body("Service is currently unavailable. Please try again later.");
    }
}
