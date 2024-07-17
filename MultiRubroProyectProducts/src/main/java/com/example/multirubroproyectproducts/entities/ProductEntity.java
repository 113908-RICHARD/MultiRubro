package com.example.multirubroproyectproducts.entities;


import jakarta.persistence.*;
import jdk.jfr.Name;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = ProductEntity.TABLE_NAME)
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder
@NamedEntityGraph(
        name = "ProductEntity.withoutProviders",
        attributeNodes = {
                @NamedAttributeNode("description"),
                @NamedAttributeNode("price"),
                @NamedAttributeNode("categories"),
                @NamedAttributeNode("stock")
        }
)
public class ProductEntity extends BaseEntity{

    static final String TABLE_NAME = "PRODUCTS";


    @Column(name = "DESCRIPTION")
    String description;

    @Column(name = "PRICE")
    Double price;


    @ManyToMany(mappedBy = "products",fetch = FetchType.LAZY)
    List<CategoryEntity> categories;

    @ManyToMany(mappedBy = "products",fetch = FetchType.LAZY)
    List<ProviderEntity> providers;

    @Column(name = "STOCK")
    Integer stock;
}
