package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.entities.ImageData;
import com.example.MultiRubro.repositories.jpa.StorageJpaRepository;
import com.example.MultiRubro.services.StorageService;
import com.example.MultiRubro.utils.ImageUtils;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;

@Service
public class StorageServiceImp implements StorageService {

    @Autowired
    private StorageJpaRepository storageJpaRepository;
    private Optional<ImageData> byName;

    @Override
    @Transactional
    public String uploadImage(MultipartFile multipartFile) {
        try {
            // Check if the file is empty
            if (multipartFile.isEmpty()) {
                throw new IllegalArgumentException("File is empty");
            }

            // Compress the image
            byte[] compressedImageData;
            try {
                compressedImageData = ImageUtils.compressImage(multipartFile.getBytes());
            } catch (IOException e) {
                throw new RuntimeException("Error compressing image", e);
            }

            // Save the image data
            ImageData imageData;
            try {
                imageData = storageJpaRepository.save(ImageData.builder()
                        .name(multipartFile.getOriginalFilename())
                        .type(multipartFile.getContentType())
                        .imageData(compressedImageData).build());
            } catch (Exception e) {
                throw new RuntimeException("Error saving image data to repository", e);
            }

            // Return a success message or ID of the saved image
            return "Image uploaded successfully with ID: " + imageData.getId();
        } catch (IllegalArgumentException e) {
            // Handle specific cases like an empty file
            return "Failed to upload image: " + e.getMessage();
        } catch (RuntimeException e) {
            // Handle other runtime exceptions
            return "Failed to upload image: " + e.getMessage();
        }
    }

    @Override
    public byte[] downloadImage(String fileName) {

        Optional<ImageData> findByName = storageJpaRepository.findByName(fileName);
        return findByName.map(imageData -> ImageUtils.decompressImage(imageData.getImageData())).orElse(null);
    }

}
