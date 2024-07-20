package com.example.MultiRubro.repositories.jpa;

import com.example.MultiRubro.entities.ImageData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import java.util.Optional;

@Repository
public interface StorageJpaRepository extends JpaRepository<ImageData,Long> {
    Optional<ImageData> findByName(String name);
}
