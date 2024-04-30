package com.example.MultiRubro.repositories.jpa;

import com.example.MultiRubro.entities.ClientEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClientEntityJpaRepository extends JpaRepository<ClientEntity, Long> {
    List<ClientEntity> findByNameContainingIgnoreCase(String name);
    Optional<ClientEntity> findById(Long id);

    Optional<ClientEntity>findByUserUserName(String userName);
}
