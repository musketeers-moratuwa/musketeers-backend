package com.musketeers.jewelrystore.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.ArrayList;
import java.util.List;

@Data
@Document(collection = "carts")
public class Cart {
    @Id
    private String id;
    private String userId;
    private List<CartItem> items = new ArrayList<>();
    
    @Data
    public static class CartItem {
        private String productId;
        private int quantity;
        private double price;
        private String name;
        private String imageUrl;
    }
}
