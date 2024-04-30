package com.example.MultiRubro.repositories.jpa;

import com.example.MultiRubro.entities.BillEntity;
import com.example.MultiRubro.models.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BillJpaRepository extends JpaRepository<BillEntity,Long> {
    Optional<BillEntity> getBillEntityById(Long id);
    Optional<List<BillEntity>> getBillEntityByClient_Id(Long id);
}
