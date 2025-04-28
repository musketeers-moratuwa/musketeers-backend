package com.musketeers.jewelrystore.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.math.BigDecimal;

@Data
@Document(collection = "products")
public class Product {
    @Id
    private String id;
    
    private String name;
    private String description;
    private BigDecimal price;
    private String imageUrl;
    private String category;
    private Integer stockQuantity;
}
