package com.example.MultiRubro.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "sellings")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SellingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "bill_id")
    private BillEntity bill;

    @Column
    private int quantity;
}
