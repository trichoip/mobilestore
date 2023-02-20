package com.mobilestore.service.dto;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;

/**
 * A DTO for the {@link com.mobilestore.domain.OrderDetail} entity
 */
@Data
public class OrderDetailDTO implements Serializable {

    private Long id;
    @NotNull
    private ProductDTO product;
    @NotNull
    private OrderDTO order;
    private Integer quantity;
    private Double price;
}