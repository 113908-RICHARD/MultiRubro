package com.example.MultiRubro.controllers;


import com.example.MultiRubro.models.Client;
import com.example.MultiRubro.services.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/clients")
public class ClientController {


    @Autowired
    private ClientService clientService;

    @GetMapping("")
    public ResponseEntity<List<Client>>getClients(
            @RequestParam(name = "client name",required = false) String clientName
    ){
        if(clientName == null){
            return ResponseEntity.ok(clientService.getClientsByNameOrAll(null));
        }else{
            return ResponseEntity.ok(clientService.getClientsByNameOrAll(clientName));
        }


    }

    @PostMapping("")
    private ResponseEntity<Client> postClient(@RequestBody Client client){
        return  ResponseEntity.ok(clientService.createClient(client));
    }
}
