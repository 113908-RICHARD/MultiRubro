package com.example.multirubroproyectproducts.entities;


import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.GenericGenerator;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = CategoryEntity.TABLE_NAME)
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder

public class CategoryEntity extends BaseEntity {

    static final String TABLE_NAME  = "CATEGORIES";

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "category_product",
            joinColumns = @JoinColumn(name = "category_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    List<ProductEntity> products;

    @Column(name = "DESCRIPTION")
    String description;



}
