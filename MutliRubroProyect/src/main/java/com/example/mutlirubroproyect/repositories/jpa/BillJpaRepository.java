package com.example.mutlirubroproyect.repositories.jpa;

import com.example.mutlirubroproyect.entities.BillEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BillJpaRepository extends JpaRepository<BillEntity,Long> {
}
