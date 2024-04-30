package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.entities.ClientEntity;
import com.example.MultiRubro.entities.UserEntity;
import com.example.MultiRubro.models.Client;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.repositories.jpa.ClientEntityJpaRepository;
import com.example.MultiRubro.repositories.jpa.UserEntityJpaRepository;
import com.example.MultiRubro.services.ClientService;
import com.example.MultiRubro.services.UserService;
import jakarta.persistence.EntityNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ClientServiceImplementation implements ClientService {

    @Autowired
    private ClientEntityJpaRepository clientEntityJpaRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private ModelMapper modelMapper;


    @Override
    public Client createClient(Client client) {

        ClientEntity clientEntity = modelMapper.map(client,ClientEntity.class);
        User user = userService.createUser(client.getUser());
        clientEntity.setUser(modelMapper.map(user,UserEntity.class));



        return modelMapper.map(clientEntityJpaRepository.save(clientEntity),Client.class);


    }

    @Override
    public Client updateClient(Client client) {
        Client clientToUpdate = getClient(client.getClientId());
        ClientEntity clientEntity = modelMapper.map(clientToUpdate,ClientEntity.class);
        return modelMapper.map(clientEntityJpaRepository.save(clientEntity),Client.class);

    }

    @Override
    public Client getClient(Long id) {
        Optional<ClientEntity> clientToFind = clientEntityJpaRepository.findById(id);
        if (clientToFind.isEmpty()){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,"There isnt a client with that id");
        }else{
            return modelMapper.map(clientToFind,Client.class);
        }
    }

    @Override
    public List<Client> getClientsByNameOrAll(String name) {
        List<Client>clients = new ArrayList<>();
        List<ClientEntity>clientEntities;

        if (name == null){
            clientEntities = clientEntityJpaRepository.findAll();
        }else{
            clientEntities = clientEntityJpaRepository.findByNameContainingIgnoreCase(name);
        }


        if (clientEntities.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No clients found");
        }
        clientEntities.forEach(c ->clients.add(modelMapper.map(c,Client.class)));
        return  clients;
    }

    @Override
    public Client getClientByUser(String userName) {
        Optional<ClientEntity> clientToFind = clientEntityJpaRepository.findByUserUserName(userName);
        if (clientToFind.isPresent()){
            return modelMapper.map(clientToFind,Client.class);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Not found");
        }
    }

    @Override
    public Client deleteClient(Long id) {
        Client clientToDelete = getClient(id);
        clientEntityJpaRepository.delete(modelMapper.map(clientToDelete,ClientEntity.class));
        return clientToDelete;

    }
}
