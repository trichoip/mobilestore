package com.mobilestore.service.dto;

import java.io.Serializable;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

/**
 * A DTO for the {@link com.mobilestore.domain.Order} entity
 */
@Data
public class OrderDTO implements Serializable {
    private Long id;
    private Double totalMoney;
    private Integer totalQuantity;
    private Instant orderDate;
    private UserDTO user;
    private List<OrderDetailDTO> orderDetails = new ArrayList<>();
}