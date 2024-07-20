package com.example.MultiRubro.services;

import lombok.Setter;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public interface StorageService {

    String uploadImage(MultipartFile multipartFile) throws IOException;
    byte[] downloadImage(String fileName);
}
