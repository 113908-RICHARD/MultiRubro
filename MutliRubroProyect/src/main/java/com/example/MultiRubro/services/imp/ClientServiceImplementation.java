package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.entities.ClientEntity;
import com.example.MultiRubro.entities.UserEntity;
import com.example.MultiRubro.models.Client;
import com.example.MultiRubro.models.User;
import com.example.MultiRubro.repositories.jpa.ClientEntityJpaRepository;
import com.example.MultiRubro.repositories.jpa.UserEntityJpaRepository;
import com.example.MultiRubro.services.ClientService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClientServiceImplementation implements ClientService {

    @Autowired
    private ClientEntityJpaRepository clientEntityJpaRepository;

    @Autowired
    private UserEntityJpaRepository userEntityJpaRepository;

    @Autowired
    private ModelMapper modelMapper;


    @Override
    public Client createClient(Client client) {
        UserEntity userEntity = new UserEntity();
        userEntity.setUserName("TRYAL USER");
        userEntity.setPassword("PASSWORD");
        ClientEntity clientEntity = modelMapper.map(client,ClientEntity.class);
        clientEntity.setUser(userEntity);
        userEntityJpaRepository.save(userEntity);

        return modelMapper.map(clientEntityJpaRepository.save(clientEntity),Client.class);


    }

    @Override
    public Client updateClient(Client client) {
        return null;
    }

    @Override
    public Client getClient(Long id) {
        return null;
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
    public Client deleteClient(Long id) {
        return null;
    }
}
