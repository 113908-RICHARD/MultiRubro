package com.example.MultiRubro.repositories.jpa;

import com.example.MultiRubro.entities.ClientEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientEntityJpaRepository extends JpaRepository<ClientEntity, Long> {
    List<ClientEntity> findByNameContainingIgnoreCase(String name);
}
