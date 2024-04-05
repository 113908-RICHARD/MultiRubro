package com.example.mutlirubroproyect.repositories.jpa;

import com.example.mutlirubroproyect.entities.ClientEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientEntityJpaRepository extends JpaRepository<ClientEntity, Long> {
}
