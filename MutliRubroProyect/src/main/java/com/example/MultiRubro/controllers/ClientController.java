package com.example.MultiRubro.controllers;


import com.example.MultiRubro.models.Client;
import com.example.MultiRubro.services.ClientService;

import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

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
    @DeleteMapping("")
    private ResponseEntity<Client>deleteClient(@RequestParam Long id){
        return ResponseEntity.ok(clientService.deleteClient(id));
    }
    @PutMapping
    private ResponseEntity<Client>updateClient(@RequestBody Client clientToUpdate){
        return ResponseEntity.ok(clientService.updateClient(clientToUpdate));
    }
    @GetMapping("/getClient")
    private ResponseEntity<Client>getClient(@RequestParam Long id){
        return ResponseEntity.ok(clientService.getClient(id));
    }

    @GetMapping("/getClientByUser")
    private ResponseEntity<Client> getClientByUser(@RequestParam String userName){
        return  ResponseEntity.ok(clientService.getClientByUser(userName));
    }
}
