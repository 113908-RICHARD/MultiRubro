package com.example.MultiRubro.repositories.jpa;

import com.example.MultiRubro.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserEntityJpaRepository extends JpaRepository<UserEntity,Long> {
}
