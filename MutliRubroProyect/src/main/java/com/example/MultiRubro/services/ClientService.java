package com.example.MultiRubro.services;

import com.example.MultiRubro.Requests.CreateClientRequest;
import com.example.MultiRubro.models.Client;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ClientService {

    Client createClient(CreateClientRequest client);
    Client updateClient(Client client);
    Client getClient(Long id);
    List<Client> getClientsByNameOrAll(String name);
    Client getClientByUser(String userName);

    Client deleteClient(Long id);
}
