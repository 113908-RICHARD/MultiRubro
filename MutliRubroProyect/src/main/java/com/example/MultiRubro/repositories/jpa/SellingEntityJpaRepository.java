package com.example.MultiRubro.repositories.jpa;

import com.example.MultiRubro.entities.SellingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SellingEntityJpaRepository extends JpaRepository<SellingEntity,Long> {
}
