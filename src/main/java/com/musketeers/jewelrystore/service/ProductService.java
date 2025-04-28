package com.musketeers.jewelrystore.service;

import com.musketeers.jewelrystore.model.Product;
import com.musketeers.jewelrystore.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    @Autowired
    private final ProductRepository productRepository;

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public List<Product> getProductsByCategory(String category) {
        return productRepository.findByCategory(category);
    }

    public Product findById(Long id) {
        return productRepository.findById(id.toString())  // Convert Long to String
                .orElseThrow(() -> new RuntimeException("Product not found"));
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id.toString())
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + id));
    }
}
