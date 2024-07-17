package com.example.multirubroproyectproducts.repositories;

import com.example.multirubroproyectproducts.entities.CategoryEntity;
import com.example.multirubroproyectproducts.entities.ProductEntity;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, UUID> {

    @EntityGraph(value = "ProductEntity.withoutProviders", type = EntityGraph.EntityGraphType.FETCH)
    @Query("SELECT p FROM ProductEntity p")
    List<ProductEntity> findAllWithoutProviders();

    Optional<List<ProductEntity>> findByDescriptionContainingIgnoreCase(String description);

}
