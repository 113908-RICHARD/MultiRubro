package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.entities.BillEntity;
import com.example.MultiRubro.entities.SellingEntity;
import com.example.MultiRubro.models.Bill;
import com.example.MultiRubro.models.Selling;
import com.example.MultiRubro.repositories.jpa.SellingEntityJpaRepository;
import com.example.MultiRubro.services.SellingService;
import org.hibernate.sql.ast.tree.expression.Over;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SellingServiceImp implements SellingService {

    @Autowired
    private SellingEntityJpaRepository sellingEntityJpaRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public SellingEntity createSelling(SellingEntity sellingEntity) {
       return sellingEntityJpaRepository.save(sellingEntity);

    }

    @Override
    public List<Selling> getSellingsByBill(Long billId) {
        return null;
    }


    @Override
    public List<Selling> getSellings(){
        List<SellingEntity> sellingList = sellingEntityJpaRepository.findAll();
        List<Selling> sells = new ArrayList<>();

        for (SellingEntity sell :
                sellingList) {

            sells.add(modelMapper.map(sell,Selling.class));

        }
        return sells;
    }
}
