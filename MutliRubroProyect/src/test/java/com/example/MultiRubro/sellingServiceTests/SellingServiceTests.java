package com.example.MultiRubro.sellingServiceTests;

import com.example.MultiRubro.repositories.jpa.SellingEntityJpaRepository;
import com.example.MultiRubro.services.SellingService;
import com.example.MultiRubro.services.imp.SellingServiceImp;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(properties = {
        "app.url=http://localhost:8085",
        "app.dev-name=Developer Name",
        "app.dev-email=developer@example.com",
        "app.name=My Application",
        "app.desc=This is a description of my application.",
        "app.version=1.0.0"
})
@ExtendWith(MockitoExtension.class)
public class SellingServiceTests {


    @Mock
    private SellingEntityJpaRepository sellingEntityJpaRepository;

    @Mock
    private ModelMapper modelMapper;

    @InjectMocks
    private SellingServiceImp sellingService;



    @BeforeEach
    public void setUp(){
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testCreateSelling(){

    }
}
