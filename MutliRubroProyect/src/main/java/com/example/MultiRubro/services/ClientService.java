package com.example.MultiRubro.services;

import com.example.MultiRubro.models.Client;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ClientService {

    Client createClient(Client client);
    Client updateClient(Client client);
    Client getClient(Long id);
    List<Client> getClientsByNameOrAll(String name);
    Client deleteClient(Long id);
}
