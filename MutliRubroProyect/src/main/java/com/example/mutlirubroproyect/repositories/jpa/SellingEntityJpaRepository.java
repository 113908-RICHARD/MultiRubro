package com.example.mutlirubroproyect.repositories.jpa;

import com.example.mutlirubroproyect.entities.SellingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SellingEntityJpaRepository extends JpaRepository<SellingEntity,Long> {
}
