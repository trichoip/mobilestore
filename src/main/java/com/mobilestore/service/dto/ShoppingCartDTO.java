package com.mobilestore.service.dto;

import com.mobilestore.domain.Product;
import com.mobilestore.domain.User;

import lombok.Data;

@Data
public class ShoppingCartDTO {

    private Long id;

    private ProductDTO product;

    private Integer quantity;

    private Double price;
}
