package com.example.MultiRubro.controllers;

import com.example.MultiRubro.models.Selling;
import com.example.MultiRubro.services.SellingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sellings")
public class SellingController {

    @Autowired
    private SellingService sellingService;

    @GetMapping("")
    public ResponseEntity<List<Selling>> getSellings(){
        return ResponseEntity.ok(sellingService.getSellings());
    }
}
