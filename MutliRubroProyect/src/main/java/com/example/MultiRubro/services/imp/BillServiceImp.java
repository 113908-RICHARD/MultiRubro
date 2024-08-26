package com.example.MultiRubro.services.imp;

import com.example.MultiRubro.Requests.CreateBillRequest;
import com.example.MultiRubro.Requests.SellingRequest;
import com.example.MultiRubro.Responses.BillResponse;
import com.example.MultiRubro.Responses.SellingResponse;
import com.example.MultiRubro.entities.BillEntity;
import com.example.MultiRubro.entities.ClientEntity;
import com.example.MultiRubro.entities.SellingEntity;
import com.example.MultiRubro.feignClients.ProductsFeignClient;
import com.example.MultiRubro.feignClients.feignModels.GenericResponse;
import com.example.MultiRubro.feignClients.feignModels.UpdateProductStockRequest;
import com.example.MultiRubro.models.Bill;
import com.example.MultiRubro.models.Client;
import com.example.MultiRubro.models.Selling;
import com.example.MultiRubro.publisherRabbitMQ.Publisher;
import com.example.MultiRubro.repositories.jpa.BillJpaRepository;
import com.example.MultiRubro.repositories.jpa.SellingEntityJpaRepository;
import com.example.MultiRubro.services.BillService;
import com.example.MultiRubro.services.ClientService;
import com.example.MultiRubro.services.SellingService;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.security.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class BillServiceImp implements BillService {


    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private BillJpaRepository billJpaRepository;

    @Autowired
    private ClientService clientService;

    @Autowired
    private SellingService sellingService;

    @Autowired
    private ProductsFeignClient feignClient;

    @Autowired
    Publisher publisher;

    @Override
    public BillResponse getBillById(Long id) {
        Optional<BillEntity> getById = billJpaRepository.getBillEntityById(id);
       List<BillEntity> billEntities = new ArrayList<>();
        if(getById.isEmpty()){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Not found. The user doesnt have bills created");
        }
        billEntities.add(getById.get());
        BillResponse response = convertEntityListToResponse(billEntities).get(0);
        return response;
    }

    @Override
    public List<BillResponse> getBillsByClient(String userName) {
        Client client = clientService.getClientByUser(userName);
        Optional<List<BillEntity>> billsByClientId = billJpaRepository.getBillEntityByClient_Id(client.getClientId());
        if(billsByClientId.isEmpty()){
            throw  new ResponseStatusException(HttpStatus.NOT_FOUND,("The client doesnt have bills created"));

        }


        return convertEntityListToResponse(billsByClientId.get());

    }
    public List<BillResponse> convertEntityListToResponse(List<BillEntity> billsEntities){
        modelMapper.typeMap(BillEntity.class, Bill.class)
                .addMappings(mapper -> mapper.map(BillEntity::getDate, Bill::setBillingDate));
        List<BillResponse> bills = new ArrayList<>();
        List<SellingResponse> sellingResponseList = new ArrayList<>();
        List<BillEntity> billEntities = billsEntities;
        for (BillEntity be :
                billEntities) {
            BillResponse billResponseItem = new BillResponse();

            billResponseItem.setSellingList(sellingResponseList);
            billResponseItem.setClientName(be.getClient().getName());
            billResponseItem.setBillingDate(be.getDate().toString());

            for (SellingEntity se :
                    be.getSellingList()) {
                SellingResponse sellingResponse = new SellingResponse();
                sellingResponse.setProductNumber(se.getProductId());
                sellingResponse.setQuantity(se.getQuantity());
                sellingResponse.setBillId(se.getBillId());
                sellingResponseList.add(sellingResponse);
            }
            bills.add(billResponseItem);
        }
        return bills;
    }
    @Override
    public List<BillResponse> getAllBills() {
        List<BillEntity> billEntities = billJpaRepository.findAll();
        return convertEntityListToResponse(billEntities);
    }

    @Transactional
    @Override
    public BillResponse createBill(CreateBillRequest request) {
        try {

            Date currentDate = Calendar.getInstance().getTime();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            // Format the current date to a string
            String formattedDate = dateFormat.format(currentDate);
            // Create a new bill entity
            BillEntity savedBill = saveBillEntity(request.getClientId(),currentDate);


            BillResponse response = new BillResponse();
            response.setSellingList(getSellingResponseList(request.getSellingList(),savedBill.getId()));
            response.setBillingDate(formattedDate);
            response.setClientName(clientService.getClient(request.getClientId()).getName());

            // Return the response
            return response;
        } catch (RuntimeException e) {
            // Roll back the transaction in case of error
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    private List<SellingResponse> getSellingResponseList( List<SellingRequest> sellingList, Long savedBill){
        List<SellingResponse> sellingResponseList = new ArrayList<>();

        for (SellingRequest sell : sellingList) {
            SellingEntity sellingEntity = new SellingEntity();
            sellingEntity.setBillId(savedBill);

            if(!checkProductStock(sell.getProductNumber(),sell.getQuantity())){
                throw new RuntimeException("there is not enough stock of the product "+sell.getProductNumber());
            }
            UpdateProductStockRequest updateProductStockRequest = UpdateProductStockRequest.builder()
                    .id(sell.getProductNumber())
                    .stock(sell.getQuantity())
                    .subtract(true).build();
            publisher.sendMessage(updateProductStockRequest);

            sellingEntity.setQuantity(sell.getQuantity());
            sellingEntity.setProductId(sell.getProductNumber());
            sellingEntity = sellingService.createSelling(sellingEntity);

            // Create and populate the selling response
            SellingResponse sellingResponse = new SellingResponse();
            sellingResponse.setProductNumber(sellingEntity.getProductId());
            sellingResponse.setQuantity(sellingEntity.getQuantity());
            sellingResponse.setBillId(savedBill);
            sellingResponseList.add(sellingResponse);

        }
        return sellingResponseList;
    }

    private BillEntity saveBillEntity(Long clientId,Date currentDate){
        BillEntity billToSave = new BillEntity();

        billToSave.setDate(currentDate);
        Client client = clientService.getClient(clientId);
        billToSave.setClient(modelMapper.map(client, ClientEntity.class));

        // Save the bill entity to obtain its ID
        return billJpaRepository.save(billToSave);
    }

    private Boolean checkProductStock(UUID productId, Integer quantity){
        GenericResponse<Integer> response = feignClient.getProductStockById(productId);
        if (!response.getStatus().equals(HttpStatus.OK)){
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR,response.getMessage(),null);
        }
        return response.getData() - quantity >= 0;
    }





}
