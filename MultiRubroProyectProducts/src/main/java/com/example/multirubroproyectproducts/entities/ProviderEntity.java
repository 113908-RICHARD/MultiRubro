package com.example.multirubroproyectproducts.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.GenericGenerator;

import javax.naming.Name;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = ProviderEntity.TABLE_NAME)
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder

public class ProviderEntity extends BaseEntity {
    static final String TABLE_NAME = "PROVIDERS";



    @Column(name = "NAME")
    String name;

    @Column(name = "ADDRESS")
    String address;

    @Column(name = "CELLPHONE")
    String cellphone;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "provider_product",
            joinColumns = @JoinColumn(name = "provider_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")

    )
    List<ProductEntity> products;




}
