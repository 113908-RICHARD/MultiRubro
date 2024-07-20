package com.example.MultiRubro.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = ImageData.TABLE_NAME)
@FieldDefaults(level = AccessLevel.PRIVATE)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class ImageData {
    static final String TABLE_NAME = "ImageData";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    String name;

    @Column
    String type;

    @Lob
    @Column(name = "IMAGE_DATA")
    byte[] imageData;




}
