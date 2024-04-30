package com.example.MultiRubro.repositories.jpa;

import com.example.MultiRubro.entities.SellingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@Repository
public interface SellingEntityJpaRepository extends JpaRepository<SellingEntity,Long> {
    Optional<List<SellingEntity>> findByBillId(Long id);
}
