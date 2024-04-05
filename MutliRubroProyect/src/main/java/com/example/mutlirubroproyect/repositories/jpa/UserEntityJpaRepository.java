package com.example.mutlirubroproyect.repositories.jpa;

import com.example.mutlirubroproyect.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserEntityJpaRepository extends JpaRepository<UserEntity,Long> {
}
